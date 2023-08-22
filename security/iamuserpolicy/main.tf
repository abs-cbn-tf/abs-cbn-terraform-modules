#module "iam" {
#  source         = "./modules/iam"
#  iam_policies   = var.iam_policies
#  iam_user_name = var.iam_user_name
#}

module "iam_user" {
  source            = "./modules/iam_user"
  iam_user_name     = var.iam_user_name
  iam_policies      = var.iam_policies
    env = var.env
    project = var.project
    foo = var.foo
  
    # Add more tags as needed
  }



module "iam_user2" {
  source            = "./modules/iam_user"
  iam_user_name     = var.iam_user_name2
  iam_policies      = var.iam_policies2
    env = var.env1
    project = var.project1
    foo = var.foo1

}
