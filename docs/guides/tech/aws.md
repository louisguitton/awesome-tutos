# AWS Guide

#### AWS CLI configuration
When using Amazon S3 to store data, a simple method of managing AWS access is to set your access keys to environment variables. However, managing mutiple sets of keys on a single machine (e.g. when working on multiple projects) it is best to use a [credentials file](https://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html), typically located in `~/.aws/credentials`. A typical file might look like:
```
[default]
aws_access_key_id=myaccesskey
aws_secret_access_key=mysecretkey

[another_project]
aws_access_key_id=myprojectaccesskey
aws_secret_access_key=myprojectsecretkey
```
You can add the profile name when initialising a project; assuming no applicable environment variables are set, the profile credentials will be used be default.
