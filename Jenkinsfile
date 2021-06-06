#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

def tools = [
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-8-alpine.Dockerfile',
    dockerImageTag: '3-jdk-8-alpine',
    additionalTags: ['latest'],
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/alpine-release
        # We explicitly approve updates of Alpine to know what is going on.
        grep "^3\\.13\\." /etc/alpine-release
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"1\\.8\\."
      '''
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-8-debian.Dockerfile',
    dockerImageTag: '3-jdk-8-debian',
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/debian_version
        # We explicitly approve updates of Debian to know what is going on.
        grep "^10\\.9\\$" /etc/debian_version
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"1\\.8\\."
      '''
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-11-alpine.Dockerfile',
    dockerImageTag: '3-jdk-11-alpine',
    additionalTags: ['latest'],
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/alpine-release
        # We explicitly approve updates of Alpine to know what is going on.
        grep "^3\\.13\\." /etc/alpine-release
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"11\\.0\\."
      '''
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-11-debian.Dockerfile',
    dockerImageTag: '3-jdk-11-debian',
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/debian_version
        # We explicitly approve updates of Debian to know what is going on.
        grep "^10\\.9\\$" /etc/debian_version
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"11\\.0\\."
      '''
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
  // Deprecated. Use one of the specific versions. Keeping for backward compatibility.
  [
    name: 'node',
    dockerfile: 'node/12-alpine.Dockerfile',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/11-alpine.Dockerfile',
    dockerImageTag: '11-alpine',
  ],
  [
    name: 'node',
    dockerfile: 'node/12-alpine.Dockerfile',
    dockerImageTag: '12-alpine',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/14.Dockerfile',
    dockerImageTag: '14',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/14-browsers.Dockerfile',
    dockerImageTag: '14-browsers',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/16.Dockerfile',
    dockerImageTag: '16',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/16-browsers.Dockerfile',
    dockerImageTag: '16-browsers',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'python',
    dockerfile: 'python/3.Dockerfile',
    dockerImageTag: '3',
    testImageHook: {
      sh 'python -V'
      sh 'pip -V'
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
        stage("Checkout source") {
          checkout scm
        }

        // Separate cache for each tool
        def lastImageId = dockerPullCacheImage(dockerImageRepo, tool.name)

        def img
        stage("Build image") {
          def args = ""
          if (params.docker_skip_cache) {
            args = " --no-cache"
          }

          img = docker.build(
            "$dockerImageRepo:$dockerImageTag",
            "-f $dockerfile --cache-from $lastImageId$args $path"
          )
        }

        // Hook for running tests
        if (testImageHook != null) {
          stage("Test image") {
            img.inside {
              testImageHook()
            }
          }
        }

        def isSameImage = dockerPushCacheImage(img, lastImageId, tool.name)

        if (env.BRANCH_NAME == 'master' && !isSameImage) {
          stage("Push image") {
            echo 'Pushing docker image'
            img.push(dockerImageTag)
            additionalTags.each {
              img.push(it)
            }
            def age = getAgeFirstLayer(img)
            slackNotify message: "New Docker image available: $dockerImageRepo:$dockerImageTag (age first layer: $age)"
          }
        }
      }
    }
  }

  parallel branches
}

def getAgeFirstLayer(image) {
  return sh([
    returnStdout: true,
    script: "docker history '${image.id}' --format '{{.CreatedSince}}' | tail -1"
  ]).trim()
}
