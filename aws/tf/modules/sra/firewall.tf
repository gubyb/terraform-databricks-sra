module "harden_firewall" {
  source = "./firewall"
  providers = {
    aws = aws
  }

  vpc_id                = module.vpc[0].vpc_id
  vpc_cidr_range        = var.vpc_cidr_range
  public_subnets_cidr   = ["10.0.29.0/26", "10.0.29.64/26", "10.0.29.128/26"]
  private_subnets_cidr  = module.vpc[0].private_subnets_cidr_blocks
  private_subnet_rt     = module.vpc[0].private_route_table_ids
  firewall_subnets_cidr = ["10.0.30.0/26", "10.0.30.64/26", "10.0.30.128/26"]
  firewall_allow_list   = [".databricks.com",".amazonaws.com",".pypi.org",".pythonhosted.org",".cran.r-project.org",".maven.org",".storage-download.googleapis.com",".spark-packages.org"]
  hive_metastore_fqdn   = "md15cf9e1wmjgny.cxg30ia2wqgj.eu-west-1.rds.amazonaws.com"
  availability_zones    = var.availability_zones
  region                = var.region
  resource_prefix       = var.resource_prefix

  depends_on = [module.databricks_mws_workspace]
}