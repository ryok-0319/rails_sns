env.GITHUB_REPO = 'git@github.com:FiNCDeveloper/rails_sns.git'

env.APP_NAME = env.JOB_NAME.split(/\//)[1]
env.BRANCH_NAME_ESCAPE = env.JOB_NAME.split(/\//)[2]

env.STAGING_DEPLOY_BRANCH = 'deploy/staging'
env.PRODUCTION_DEPLOY_BRANCH = 'deploy/production'

env.SLACK_CANNEL = '#times_kubota'

env.ECS_TASK_NAME_PREFIX = 'RailsSns'
env.ECS_CONTAINER_NAME = env.APP_NAME

env.SSH_PORT='8023'
env.ANALYTICS_SSH_PORT='8024'
env.ANALYTICS_RUBOCOP='true'
env.DEPLOY_CONTAINER_SSH_PORT='8025'

env.TIME_ZONE='utc'

Date date= new Date()
env.DATE_TAG = date.format("yyyyMMddHHmmss")

env.MIGRATE_TYPE='migration'

env.HAS_INTERNAL='false'

env.BUILD_TOOLS_ABSOLUTE_PATH = '/home/finc/build_script/v2/master/'
env.PRODUCTION_BUILD_TOOLS_ABSOLUTE_PATH = '/home/finc/build_script/v2/master/'

env.SKIP_TEST = 'false'

env.DOCKERFILE_EXISTS = 'true'
env.BUILD_DOCKER_IMAGE='true'

// PATH need last /
if (env.BUILD_TOOLS_ABSOLUTE_PATH.charAt(env.BUILD_TOOLS_ABSOLUTE_PATH.length()-1)!='/') {
  env.BUILD_TOOLS_ABSOLUTE_PATH = env.BUILD_TOOLS_ABSOLUTE_PATH + '/'
}
if (env.PRODUCTION_BUILD_TOOLS_ABSOLUTE_PATH.charAt(env.PRODUCTION_BUILD_TOOLS_ABSOLUTE_PATH.length()-1)!='/') {
  env.PRODUCTION_BUILD_TOOLS_ABSOLUTE_PATH = env.PRODUCTION_BUILD_TOOLS_ABSOLUTE_PATH + '/'
}

try {
  node('docker-slave-v2') {
    stage 'Post to slack'
    slackSend channel: env.SLACK_CANNEL, failOnError: true, message: "Started ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", teamDomain: 'finc', token: 'WsXhb7wvZgvs8OAbIrtnmv7G'

    stage 'Checkout from github'
    git branch: env.BRANCH_NAME, credentialsId: 'adb4feb7-2b77-4007-a99c-218194fad175', url: env.GITHUB_REPO

    stage 'Build & Deploy'
    sh (env.BUILD_TOOLS_ABSOLUTE_PATH + 'bin/please-pass-this-build-god')

    stage 'Post to slack'
    slackSend color: 'good', channel: env.SLACK_CANNEL, failOnError: true, message: "Completed ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", teamDomain: 'finc', token: 'WsXhb7wvZgvs8OAbIrtnmv7G'
  }
} catch(e) {
  slackSend color: 'danger', channel: env.SLACK_CANNEL, failOnError: true, message: "Failed ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)", teamDomain: 'finc', token: 'WsXhb7wvZgvs8OAbIrtnmv7G'
  throw e
}
