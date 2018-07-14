#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

def tools = [
  [
    name: 'aws-cli',
  ],
  [
    name: 'ecs-deploy',
  ],
  [
    name: 'maven',
    dockerImageTag: '3-alpine',
    testImageHook: { img ->
      img.inside {
        sh 'mvn -v'
      }
    },
  ],
  [
    name: 'maven-debian',
    dockerImageTag: '3.5.2-slim',
    testImageHook: { img ->
      img.inside {
        sh 'mvn -v'
      }
    },
  ],
  [
    name: 'serverless',
  ],
  [
    name: 'sonar-scanner',
    testImageHook: { img ->
      img.inside {
        sh 'sonar-scanner -v'
      }
    },
  ],
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
        def img = docker.build("$dockerImageRepo:$dockerImageTag", "--cache-from $lastImageId$args --pull ${tool.name}")

        // Hook for running tests
        if (testImageHook != null) {
          testImageHook(img)
        }

        def isSameImage = dockerPushCacheImage(img, lastImageId, tool.name)

        if (env.BRANCH_NAME == 'master' && !isSameImage) {
          echo 'Pushing docker image'
          img.push(dockerImageTag)
          slackNotify message: "New Docker image available: $dockerImageRepo:$dockerImageTag"
        }
      }
    }
  }

  parallel branches
}
