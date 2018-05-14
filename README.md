AWS S3 CDN SSL S3 Static Website Terraform module
================================================

### About:

A Terraform Module to deploy an ACM SSL certificate, S3 Bucket configured to host a Static HTML website, a Cloudfront Distribution in front providing geo cacheing and SSL Certificate termination and HTTP monitoring via StatusCake. A very cost effective, and fast way to host static HTML/CSS/Javascript based sites on AWS with no server upkeep.

*Currently, this module only supports subdomains, but I will be extending the use of this module to support top level domains soon*

#### These types of resources are supported:

* [Route53](https://www.terraform.io/docs/providers/aws/r/route53_record.html)
* [S3 Bucket](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html)
* [ACM Request](https://www.terraform.io/docs/providers/aws/d/acm_certificate.html)
* [Cloudfront Distribution](https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html) 
* [StatusCake Monitoring](https://www.terraform.io/docs/providers/statuscake/index.html)


Example Usage:
-

### Backend Config: 

```
provider "aws" {
  region = "us-east-1" /* AWS doesn't support ACM certificates from any other region than US-EAST-1 for Cloudfront CDN SSL's. Reccomend not changing this. */
}

provider "statuscake" {
  username = "<statuscake username>" /* Get this from your Status Cake Account */
  apikey   = "<statuscake APIkey>" /* Get this from your Status Cake Account */
}

/* Conifugre your remote state (optional, but recommended) */

terraform {
  backend "s3" {
    bucket = "<S3 Bucket>"
    key    = "<filename.tfstate>"
    region = "us-east-1" /* AWS doesn't support ACM certificates from any other region than US-EAST-1 for Cloudfront CDN SSL's. Reccomend not changing this. */
  }
}

```

### Module Example Usage:


```
module "s3-site" {
  source = "<git-url>"
  domain   = ".example.com" /* Your domain here */
  zoneid = "<Route53 Hosted Zone ID>" 
  name = "<subdomain>" /* Required */
}

```

Known Issues/Limitations
------------------------

Currently, this module supports only subdomains and not top level domains. I will be working to add this functionality in the future.

Author
------------------------

Module written by @danmerron-sig.
Module Support: dan@dpmerron.co.uk
