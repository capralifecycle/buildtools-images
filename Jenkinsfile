#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

def tools = [
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-8-alpine.Dockerfile',
    imageTag: '3-jdk-8-alpine',
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/alpine-release
        # We explicitly approve updates of Alpine to know what is going on.
        grep "^3\\.15\\." /etc/alpine-release
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"1\\.8\\."
      '''
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-8-debian.Dockerfile',
    imageTag: '3-jdk-8-debian',
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/debian_version
        # We explicitly approve updates of Debian to know what is going on.
        grep "^11\\.5\\$" /etc/debian_version
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"1\\.8\\."
      '''
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-11-alpine.Dockerfile',
    imageTag: '3-jdk-11-alpine',
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/alpine-release
        # We explicitly approve updates of Alpine to know what is going on.
        grep "^3\\.15\\." /etc/alpine-release
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"11\\.0\\."
      '''
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-11-debian.Dockerfile',
    imageTag: '3-jdk-11-debian',
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/debian_version
        # We explicitly approve updates of Debian to know what is going on.
        grep "^11\\.6\\$" /etc/debian_version
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"11\\.0\\."
      '''
    },
  ],
  [
    name: 'maven',
    dockerfile: 'maven/3-jdk-17-debian.Dockerfile',
    imageTag: '3-jdk-17-debian',
    testImageHook: {
      sh '''
        mvn -v
        cat /etc/debian_version
        # We explicitly approve updates of Debian to know what is going on.
        grep "^11\\.6\\$" /etc/debian_version
        test -e "$JAVA_HOME/bin/javac"
        java -version 2>&1 | grep "openjdk version \\"17"
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
  [
    name: 'node',
    dockerfile: 'node/12-alpine.Dockerfile',
    imageTag: '12-alpine',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/14.Dockerfile',
    imageTag: '14',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/14-browsers.Dockerfile',
    imageTag: '14-browsers',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/16.Dockerfile',
    imageTag: '16',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/16-browsers.Dockerfile',
    imageTag: '16-browsers',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/18.Dockerfile',
    imageTag: '18',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'node',
    dockerfile: 'node/18-browsers.Dockerfile',
    imageTag: '18-browsers',
    testImageHook: {
      sh 'node -v'
      sh 'npm -v'
    },
  ],
  [
    name: 'python',
    dockerfile: 'python/3.Dockerfile',
    imageTag: '3',
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
    booleanParam(
      defaultValue: false,
      description: 'Publish images to ECR Public with a custom tag for testing purposes (e.g., from non-master branch)',
      name: 'dev_publish'
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
    // This is the old repo we previously used. Now we only use it to keep
    // an image cache, to avoid mixing the cache with the actual images in the
    // public repo.
    def cacheImageRepo = "923402097046.dkr.ecr.eu-central-1.amazonaws.com/buildtools/tool/${tool.name}"
    def publicImageRepo = "public.ecr.aws/z8l5l4v4/buildtools/tool/${tool.name}"

    def imageTag = tool.imageTag ?: 'latest'
    def additionalImageTags = tool.additionalImageTags ?: []
    def path = tool.path ?: tool.name
    def dockerfile = tool.dockerfile ?: "$path/Dockerfile"
    def cacheId = "${tool.name}-${imageTag}"

    branches["$tool.name-$imageTag"] = {
      def testImageHook = tool.testImageHook

      // Run every parallel step in a separate node to restrict resources.
      // (Jenkins will control queuing.)
      dockerNode {
        stage("Checkout source") {
          checkout scm
        }

        // Separate cache for each tool
        def lastImageId = dockerPullCacheImage(cacheImageRepo, cacheId)

        def builtImage = "buildtools/${tool.name}/${imageTag}"
        stage("Build image") {
          def args = ""
          if (params.docker_skip_cache) {
            args = " --no-cache"
          }

          sh "docker build -t $builtImage -f $dockerfile --cache-from $lastImageId$args $path"
        }

        // Hook for running tests
        if (testImageHook != null) {
          stage("Test image") {
            docker.image(builtImage).inside {
              testImageHook()
            }
          }
        }

        sh "docker tag $builtImage $cacheImageRepo"
        def cacheImg = docker.image(cacheImageRepo)
        def isSameImage = dockerPushCacheImage(cacheImg, lastImageId, cacheId)

        if (env.BRANCH_NAME == 'master' && !isSameImage) {
          stage("Push image to public ECR") {
            // Login to public ECR. This must be done against us-east-1.
            // Implicitly uses role provided to slave container.
            sh '(set +x; aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/z8l5l4v4)'

            push(builtImage, "$publicImageRepo:$imageTag")
            additionalImageTags.each {
              push(builtImage, "$publicImageRepo:$it")
            }
            def age = getAgeFirstLayer(builtImage)
            slackNotify message: "New container image available: $publicImageRepo:$imageTag (age first layer: $age)"
          }
        } else if (params.dev_publish) {
          stage("Push development image to public ECR") {
            // Login to public ECR. This must be done against us-east-1.
            // Implicitly uses role provided to slave container.
            sh '(set +x; aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/z8l5l4v4)'

            push(builtImage, "$publicImageRepo:ci-dev-$imageTag")
          }
        }
      }
    }
  }

  parallel branches
}

def getAgeFirstLayer(imageName) {
  return sh([
    returnStdout: true,
    script: "docker history '${imageName}' --format '{{.CreatedSince}}' | tail -1"
  ]).trim()
}

def push(sourceName, targetName) {
  sh "docker tag $sourceName $targetName"
  sh "docker push $targetName"
}
