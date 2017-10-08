## Introduction

This is a Docker container which includes everything needed to run `duplicity` backed to an AWS S3 bucket with a `duplicity-backup.sh` wrapper. 

* http://duplicity.nongnu.org/
* https://github.com/zertrin/duplicity-backup.sh


## Configuration

Create an IAM user with permissions to access the bucket you wish to backup to (see `cf-template.yaml` for a cloudformation template that creates both a bucket and a user). 

Save configuration to a file called `secrets.env`

```
DEST=s3://$s3endpoint/$bucketname/$keyprefix
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
```

## Run

Assuming Docker

```bash
docker run \
  --env-file=./secrets.env \ 
  -v ${FILES_TO_BACKUP}:/localfiles \
  -v ${LOGGING_FOLDER}:/logs \
  -ti bazwilliams/duplicity-backup
```