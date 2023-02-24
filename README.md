AWS OpenSearch Snapshots Manager
===

`aws-ossm` is a CLI tool created in python3 to simplify creation and management of S3 repositories for ElasticSearch on AWS.

Install:

```sh
python3 -m pip install aws-ossm
```

Explore:
```
aws-ossm -h

usage: aws-ossm [-h] [-e ENDPOINT] [-k | --insecure | --no-insecure] {repo-add,repo-list,snap-list,snap-save,snap-load} ...

Add snapshots repository on S3 bucket to ElasticSearch

positional arguments:
  {repo-add,repo-list,snap-list,snap-save,snap-load}
    repo-add            Register snapshots repository on S3
    repo-list           List registered repositories
    snap-list           List snapshots
    snap-save           Create snapshot
    snap-load           Restore snapshot

options:
  -h, --help            show this help message and exit
  -e ENDPOINT, --endpoint ENDPOINT
                        ElasticSearch endpoint. Default: https://127.0.0.1:8443
  -k, --insecure, --no-insecure
                        Disable SSL verification
```

Add repository:
*Note: you will need a role and a bucket created before with [official guide][guide]*
```sh
aws-ossm aws-ossm repo-add my-repo-name '{
  "settings": {
    "bucket": "my-bucket-name",
    "region": "eu-central-1",
    "role_arn": "arn:aws:iam::938198577290:role/TheSnapshotRole"
  },
  "type": "s3"
}'
```

Take and restore snapshots:
```sh
aws-ossm aws-ossm snap-save my-repo-name my-snapshot
aws-ossm aws-ossm snap-load my-repo-name my-snapshot
```

[guide]: https://docs.aws.amazon.com/opensearch-service/latest/developerguide/managedomains-snapshots.html
