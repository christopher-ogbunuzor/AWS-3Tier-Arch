resource "aws_autoscaling_schedule" "example" {
  scheduled_action_name  = "myASGSchedulingpolicy"
  desired_capacity       = 3
  end_time               = "2024-01-18T18:32:00Z"
  max_size               = 10
  min_size               = 1
  start_time             = "2024-01-18T18:30:00Z"
  #   trigger daily at 8am -- > "0 8 * * *"

  recurrence             = "*/1 * * * *"   #   trigger every 1mins
  autoscaling_group_name = aws_autoscaling_group.asg-2.name
}

resource "aws_autoscaling_schedule" "return2BAU" {
  scheduled_action_name  = "BAUmyASGSchedulingpolicy"
  desired_capacity       = 2
  #  end_time               = "2024-01-18T18:25:00Z"

    # ASG min,max,desired capacities do not return 
    # to how it was before scaling action so this policy is required
    # with no endtime as i want this to be default

  max_size               = 4
  min_size               = 2
  start_time             = "2024-01-18T18:34:00Z"
  autoscaling_group_name = aws_autoscaling_group.asg-2.name
}