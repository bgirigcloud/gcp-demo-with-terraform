
project_id = "wise-ally-348408"


network           = "custom-vpc-tf"
subnetwork        = "10.1.0.0/24"
region            = "us-central1"
zone              = "us-central1-a"
health_check      = "lb_health_check"
instance_template = "ist_instance_template"
//service_account   = "testsraccountsformigwise-ally-348408"
target_pools = "test_public_target-pool"


