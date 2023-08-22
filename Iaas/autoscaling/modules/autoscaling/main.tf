variable "vpc_id" {
  description = "ID of the VPC"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "ami_id" {
  description = "ID of the AMI"
}

variable "instance_type" {
  description = "Instance type for the autoscaling group"
}

variable "min_size" {
  description = "Minimum number of instances in the autoscaling group"
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the autoscaling group"
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances in the autoscaling group"
  default     = 2
}

variable "scale_out_cpu_threshold" {
  description = "CPU threshold for scaling out"
  default     = 70
}

variable "scale_in_cpu_threshold" {
  description = "CPU threshold for scaling in"
  default     = 30
}

variable "start_recurrence" {
  description = "Recurrence expression for starting instances (e.g., 'cron(0 9 * * ? *)')"
  type        = string
}

variable "stop_recurrence" {
  description = "Recurrence expression for stopping instances (e.g., 'cron(0 18 * * ? *)')"
  type        = string
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1c", "us-east-1d"]
}

resource "aws_launch_template" "template" {
  name          = "my-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"
    tags = {
      Environment = "production"
      Project     = "my-project"
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = "my-asg"
  #vpc_zone_identifier       = var.subnet_ids
  availability_zones = var.availability_zones
  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Environment"
    value               = "production"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = "my-project"
    propagate_at_launch = true
  }
}
#  scaling_policy {
#    policy_name           = "scale-out"
#    adjustment_type       = "ChangeInCapacity"
#    scaling_adjustment    = 1
#    cooldown              = 300
#
#    target_tracking_configuration {
#      predefined_metric_specification {
#        predefined_metric_type = "ASGAverageCPUUtilization"
#      }
#      target_value = var.scale_out_cpu_threshold
#    }
#  }

 # scaling_policy {
 #   policy_name           = "scale-in"
 #   adjustment_type       = "ChangeInCapacity"
 #   scaling_adjustment    = -1
 #   cooldown              = 300
 #   target_tracking_configuration {
 #     predefined_metric_specification {
 #       predefined_metric_type = "ASGAverageCPUUtilization"
 #     }
 #     target_value = var.scale_in_cpu_threshold
 #   }
 # }

#lifecycle {
#    create_before_destroy = true
#  }

#  scaling_policy {
#    name                   = "scale-out-policy"
#    adjustment_type        = "ChangeInCapacity"
#    scaling_adjustment     = 1
#    cooldown               = 300
#    policy_type            = "SimpleScaling"
#  }

#  scaling_policy {
#    name                   = "scale-in-policy"
#    adjustment_type        = "ChangeInCapacity"
#    scaling_adjustment     = -1
#    cooldown               = 300
#    policy_type            = "SimpleScaling"
#  }
#}

resource "aws_autoscaling_policy" "scale_out_policy" {
  name                   = "scale-out-policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 300
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scale_in_policy" {
  name                   = "scale-in-policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 300
  policy_type            = "SimpleScaling"
}
#}

resource "aws_autoscaling_schedule" "schedule_start" {
  scheduled_action_name  = "start-instances"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  recurrence             = var.start_recurrence
  autoscaling_group_name = aws_autoscaling_group.asg.name
}   
      
resource "aws_autoscaling_schedule" "schedule_stop" {
  scheduled_action_name  = "stop-instances"
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  recurrence             = var.stop_recurrence
  autoscaling_group_name = aws_autoscaling_group.asg.name
} 
