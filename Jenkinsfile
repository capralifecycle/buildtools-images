#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

def dockerImageName = '923402097046.dkr.ecr.eu-central-1.amazonaws.com/cchange/frontend-builder/cchange-aws-cli'

buildConfig([
  jobProperties: [
    pipelineTriggers([
      // Build a new version every night so we keep up to date with upstream changes
      cron('H H(2-6) * * *'),
    ]),
  ],
  githubUrl: 'https://github.com/capralifecycle/cchange-frontend-build-docker/',
  slack: [
    channel: '#cchange-dev-info',
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

    def isSameImage = dockerPushCacheImage(img, lastImageId)

    if (env.BRANCH_NAME == 'master' && !isSameImage) {
      stage('Push Docker image') {
        def tagName = sh([
          returnStdout: true,
          script: 'date +%Y%m%d-%H%M'
        ]).trim() + '-' + env.BUILD_NUMBER

        img.push(tagName)
        img.push('latest')

        slackNotify message: "New Docker image available: cchange-frontend-builder:$tagName"
      }
    }
  }
}
