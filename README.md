# dsmithllc

## Usage

This repo is used to configure AWS accounts.

### New Account Checklist

* Enable Cloudtrail for all regions, s3, and Lambda.
* Enable AWS organzations on the master account and then enable organizations on other accounts.
* Create an admin group and policy from the master account to other accounts. [Instructions](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_access-cross-account-role)



### Templates/Stacks

route53-dsmithllc-com - dsmithllc.com domain setup and host record configuration.
