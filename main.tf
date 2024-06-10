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
  # container_image = "fitnesshero"
}

# output "ecs_task_definition_arn" {
#   description = "The ARN of the ECS task definition from the module"
#   value       = module.ecs.task_definition_arn
# }