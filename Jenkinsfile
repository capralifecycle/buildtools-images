#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

def dockerImageName = '923402097046.dkr.ecr.eu-central-1.amazonaws.com/buildtools/sonar-scanner'

buildConfig([
  githubUrl: 'https://github.com/capralifecycle/sonar-scanner-docker/',
  jobProperties: [
    pipelineTriggers([
      // Build a new version every night so we keep up to date with upstream changes
      cron('H H(2-6) * * *'),
    ]),
  ],
  slack: [
    channel: '#cals-dev-info',
    teamDomain: 'cals-capra',
  ],
]) {
  dockerNode {
    stage('Checkout source') {
      checkout scm
    }

    def img
    def lastImageId = dockerPullCacheImage(dockerImageName)

    stage('Build Docker image') {
      img = docker.build(dockerImageName, "--cache-from $dockerImageName:$lastImageId --pull .")
    }

    stage('Test Docker image') {
      img.inside {
        sh 'sonar-scanner -v'
      }
    }

    def isSameImage = dockerPushCacheImage(img, lastImageId)

    if (env.BRANCH_NAME == 'master' && !isSameImage) {
      stage('Push Docker image') {
        img.push('latest')
      }
    }
  }
}
