module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}
module "ecs" {
  source = "./modules/ecs"
  security_group = module.sg.security_group
  pub_sub1 = module.vpc.pub_sub1
  public_subnet2 = module.vpc.public_subnet2
  cloudwatch_lg_name = module.cloudwatch.cloudwatch_lg
  # container_image = "fitnesshero"
  cloudific_tg = module.alb.cloudific_tg
}

module "alb" {
  source = "./modules/alb"
  security_groups = module.sg.security_group
  vpc_id = module.vpc.vpc_id
  subnet1 = module.vpc.pub_sub1
  subnet2 = module.vpc.public_subnet2
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  cluster_name = module.ecs.Cluster_name
  svc_name = module.ecs.svc_name
  cloudific_ecs_alert = module.sns.cloudific_alerts
}