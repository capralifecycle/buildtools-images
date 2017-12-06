#!/usr/bin/env groovy

// See https://github.com/capralifecycle/jenkins-pipeline-library
@Library('cals') _

def dockerImageName = '923402097046.dkr.ecr.eu-central-1.amazonaws.com/buildtools/maven-debian'

buildConfig([
  jobProperties: [
    pipelineTriggers([
      // Build a new version every night so we keep up to date with upstream changes
      cron('H H(2-6) * * *'),
    ]),
  ],
  githubUrl: 'https://github.com/capralifecycle/maven-debian-docker/',
  slack: [
    channel: '#cals-dev-info',
    teamDomain: 'cals-capra',
  ],
]) {
  dockerNode {
    checkout scm

    def img
    def lastImageId = dockerPullCacheImage(dockerImageName)

    stage('Build Docker image') {
      img = docker.build(dockerImageName, "--cache-from $dockerImageName:$lastImageId --pull .")
    }

    stage('Test Docker image') {
      img.inside {
        sh 'mvn -v'
      }
    }

    def isSameImage = dockerPushCacheImage(img, lastImageId)

    if (env.BRANCH_NAME == 'master' && !isSameImage) {
      stage('Push Docker image') {
        def tagName = '3.5.2-slim'
        img.push(tagName)
        slackNotify message: "New Docker image available: $dockerImageName:$tagName"
      }
    }
  }
}
