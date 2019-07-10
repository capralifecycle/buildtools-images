#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

def tools = [
  [
    name: 'aws-cli',
    testImageHook: {
      sh 'aws --version'
    },
  ],
  [
    name: 'ecs-deploy',
    testImageHook: {
      sh 'ecs-deploy --version'
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-8-alpine.Dockerfile',
    dockerImageTag: '3-jdk-8-alpine',
    additionalTags: ['latest'],
    testImageHook: {
      sh 'mvn -v'
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-8-debian.Dockerfile',
    dockerImageTag: '3-jdk-8-debian',
    testImageHook: {
      sh 'mvn -v'
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-11-alpine.Dockerfile',
    dockerImageTag: '3-jdk-11-alpine',
    additionalTags: ['latest'],
    testImageHook: {
      sh 'mvn -v'
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-11-debian.Dockerfile',
    dockerImageTag: '3-jdk-11-debian',
    testImageHook: {
      sh 'mvn -v'
    },
  ],
  [
    name: 'serverless',
    testImageHook: {
      sh '''
        export HOME=/tmp
        serverless --version
      '''
    },
  ],
  [
    name: 'sonar-scanner',
    testImageHook: {
      sh 'sonar-scanner -v'
    },
  ],
  [
    name: 'node',
    testImageHook: {
      sh 'npm -v'
    }
  ]
]

def jobProperties = [
  parameters([
    // Add parameter so we can build without using cached image layers.
    // This forces plugins to be reinstalled to their latest version.
    booleanParam(
      defaultValue: false,
      description: 'Force build without Docker cache',
      name: 'docker_skip_cache'
    ),
  ]),
]

if (env.BRANCH_NAME == 'master') {
  jobProperties << pipelineTriggers([
    // Build a new version every night so we keep up to date with upstream changes
    cron('H H(2-6) * * *'),
  ])
}

buildConfig([
  jobProperties: jobProperties,
  slack: [
    channel: '#cals-dev-info',
    teamDomain: 'cals-capra',
  ],
]) {
  // Plan parallel steps
  def branches = [:]
  tools.each { tool ->
    def dockerImageRepo = "923402097046.dkr.ecr.eu-central-1.amazonaws.com/buildtools/tool/${tool.name}"
    def dockerImageTag = tool.dockerImageTag ?: 'latest'
    def additionalTags = tool.additionalTags ?: []
    def path = tool.path ?: tool.name
    def dockerfile = tool.dockerfile ?: "$path/Dockerfile"

    branches["$tool.name-$dockerImageTag"] = {
      def testImageHook = tool.testImageHook

      // Run every parallel step in a separate node to restrict resources.
      // (Jenkins will control queuing.)
      dockerNode {
        checkout scm

        // Separate cache for each tool
        def lastImageId = dockerPullCacheImage(dockerImageRepo, tool.name)

        def args = ""
        if (params.docker_skip_cache) {
          args = " --no-cache"
        }
        def img = docker.build(
          "$dockerImageRepo:$dockerImageTag",
          "-f $dockerfile --cache-from $lastImageId$args --pull $path"
        )

        // Hook for running tests
        if (testImageHook != null) {
          img.inside {
            testImageHook()
          }
        }

        def isSameImage = dockerPushCacheImage(img, lastImageId, tool.name)

        if (env.BRANCH_NAME == 'master' && !isSameImage) {
          echo 'Pushing docker image'
          img.push(dockerImageTag)
          additionalTags.each {
            img.push(it)
          }
          slackNotify message: "New Docker image available: $dockerImageRepo:$dockerImageTag"
        }
      }
    }
  }

  parallel branches
}
