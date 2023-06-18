// This Pipeline has not been tested.

pipeline {
    agent any
    stages {
        stage('Checkout SVN repo'){
            steps {
                cleanWs()
                script {
                    svn_url = "URL to svn repo"
                    svn_credentials = "some_token"
                }
                checkout([$class: 'SubversionSCM',
                    additionalCredentials: [],
                    excludedCommitMessages: '',
                    excludedRegions: '',
                    excludedRevprop: '',
                    excludedUsers: '',
                    filterChangelog: false,
                    ignoreDirPropChanges: false,
                    includedRegions: '',
                    locations: [[
                        cancelProcessOnExternalsFail: true,
                        credentialsId: "$svn_credentials",
                        depthOption: 'infinity',
                        ignoreExternalsOption: true,
                        local: "svn_repo_tmp",
                        remote: "$svn_url"]],
                        quietOperation: true,
                        workspaceUpdater: [$class: 'UpdateUpdater']
                ])
            }
        }
        stage('Clone Git repo into the SVN repo'){
            steps {
                script {
                    git_url = "URL to git repo"
                    git_credentials = "some_token"
                }
                dir('svn_repo_tmp/git-code') {
                    checkout([$class: 'GitSCM', 
                        branches: [[name: '*/master']],
                        doGenerateSubmoduleConfigurations: false, 
                        extensions: [], 
                        submoduleCfg: [], 
                        userRemoteConfigs: [[
                            credentialsId: "$git_credentials", 
                            url: "$git_url"
                        ]]
                    ])
                }
            }
        }
        stage('Build') {
            steps {
                dir('svn_repo_tmp') {
                    sh 'make install'
                }
            }
        }
        stage('Test'){
            steps {
                dir('svn_repo_tmp') {
                    sh 'make test'
                }
            }
        }
        stage('Push to Git repo') {
            steps {
                dir('svn_repo_tmp/git-code') {
                    script {
                        git_commit_message = "Automated commit by Jenkins pipeline"
                    }
                    sh 'git add .'
                    sh "git commit -m '${git_commit_message}'"
                    sh 'git push'
                }
            }
        }
    }
    post {
        always {
            script {
                // In a real world case, I would do this different. I don't like the non indented block.
                // And I would add some fancy coloring to the mail. Probably using HTML.
                currentBuild.result = currentBuild.result ?: 'SUCCESS' 
                emailext (
                    to: 'email@example.com',
                    subject: "Jenkins Job '${env.JOB_NAME}' Build #${env.BUILD_NUMBER} ${currentBuild.result}",
                    body: """
The build, test, and push stages have completed. Here are the details:

Job Name: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Build Status: ${currentBuild.result}
Git Commit: ${GIT_COMMIT}

Please check the console output at ${env.BUILD_URL} to view the full results.
""",
                    mimeType: 'text/plain'
                )
            }
            cleanWs()
        }
    }
}