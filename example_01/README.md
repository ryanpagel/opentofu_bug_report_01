# opentofu_bug_report_01

## To reproduce the error

```bash
tofu init -var-file=test.tfvars

tofu test -var-file=test.tfvars
```

Produces the following error message:

```
tests/default.tftest.hcl... fail
  run "default"... fail
╷
│ Error: Provider instance not present
│ 
│ To work with aws_s3_bucket.this["us-east-1"] its original provider instance at provider["registry.opentofu.org/hashicorp/aws"].by_region["us-east-1"] is required, but it has been removed. This occurs when an element is removed from the provider configuration's for_each collection while objects created by
│ that the associated provider instance still exist in the state. Re-add the for_each element to destroy aws_s3_bucket.this["us-east-1"], after which you can remove the provider configuration again.
│ 
│ This is commonly caused by using the same for_each collection both for a resource (or its containing module) and its associated provider configuration. To successfully remove an instance of a resource it must be possible to remove the corresponding element from the resource's for_each collection while
│ retaining the corresponding element in the provider's for_each collection.
╵

Failure! 0 passed, 1 failed.
```

