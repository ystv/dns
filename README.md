# YSTV DNS

This repository contains [Terraform](https://developer.hashicorp.com/terraform) configurations for YSTV's DNS records.

## Repo Layout

The records are declared in the `.tf` files named after each type of record:

- `a.tf`
- `aaaa.tf`
- `caa.tf`
- `cname.tf`
- `mx.tf`
- `srv.tf`
- `txt.tf`

The two files `main.tf` and `variables.tf` are used for various other bits of configuration. There's also a nix flake because why not.

## Backend

As declared in `main.tf`, this terraform config is set up to use YSTV's [Consul](https://developer.hashicorp.com/consul) as a storage backend for the state files, definitely because we had great reasons for choosing it over all the other options, and definitely **not** because it greatly simplified the amount of work needed to set it up.
