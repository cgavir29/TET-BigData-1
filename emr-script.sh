#!/bin/sh
aws emr create-cluster --auto-scaling-role EMR_AutoScaling_DefaultRole --termination-protected --applications Name=Hadoop Name=Hive Name=Hue Name=Spark Name=Zeppelin Name=Tez Name=TensorFlow Name=Livy Name=Oozie Name=Sqoop --ebs-root-volume-size 10 --ec2-attributes '{"KeyName":"tet-bd","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-0364fc904eac174b9","EmrManagedSlaveSecurityGroup":"sg-0d7090cc97576a5b1","EmrManagedMasterSecurityGroup":"sg-0e38d44e7bcd07443"}' --service-role EMR_DefaultRole --enable-debugging --release-label emr-5.27.0 --log-uri 's3n://aws-logs-170888352581-us-east-1/elasticmapreduce/' --name 'tet-emr-2' --instance-groups '[{"InstanceCount":2,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,"VolumeType":"gp2"},"VolumesPerInstance":2}]},"InstanceGroupType":"CORE","InstanceType":"m4.xlarge","Name":"Core - 2"},{"InstanceCount":1,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,"VolumeType":"gp2"},"VolumesPerInstance":2}]},"InstanceGroupType":"MASTER","InstanceType":"m4.xlarge","Name":"Master - 1"}]' --scale-down-behavior TERMINATE_AT_TASK_COMPLETION --region us-east-1
