#!groovy

@Library('katsdpjenkins') _
katsdp.killOldJobs()
katsdp.setDependencies(['ska-sa/katsdpdockerbase/master',
                        'ska-sa/katsdpservices/master'])
katsdp.standardBuild(
    docker_venv: true,
    push_external: true)
katsdp.mail('sdpdev+katsdprfi@ska.ac.za')
