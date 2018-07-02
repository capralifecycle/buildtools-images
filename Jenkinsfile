#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

buildtoolsBuildSingleDockerImage([
  dockerImage: '923402097046.dkr.ecr.eu-central-1.amazonaws.com/buildtools/maven-debian',
  dockerImageTag: '3.5.2-slim',
  testImageHook: { img ->
    stage('Test Docker image') {
      img.inside {
        sh 'mvn -v'
      }
    }
  },
])
