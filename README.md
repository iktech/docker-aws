# Docker in container with preinstalled AWS Client
This image was created specificly to be used in the Jenkins CI/CD pipelines when image that is build as part of the pipeline should be pushed to the Elastic Container Registry.

Due to the way ECR authentication works AWS Client is required to login to the registry with docker.

As a prerequisite you have to mount a two files `/root/.aws/config` and `/root/.aws/credentials` to the image. Here is the example content of config file:
```
[default]
region = eu-west-1
output = json
```
And here is the example of the credentials file:
```
[default]
aws_access_key_id = <key ID>
aws_secret_access_key = <secret key>
```

Before image can be pushed run the following command in the pipeline:
`$(aws ecr get-login --no-include-email --region eu-west-1)`

The above command runs `docker login` command with the correct credentials behind the scene.