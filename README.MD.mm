Usage:

Backend Config: 

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

Module Usage: 

```
module "s3-site" {
  source = "<git-url>"
  domain   = ".example.com" /* Your domain here */
  zoneid = "<Route53 Hosted Zone ID>" 
  name = "<subdomain>" /* Required */
}

```