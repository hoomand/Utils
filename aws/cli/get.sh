#!/usr/bin/env bash

usage () {
	echo "$0 runningInstances|help"
	echo "This script is meant to be a quick cheat sheet for aws cli to run most useful commands by just passing the right argument to it. It doesn't support changing profiles and other options for now, but I might improve it later :)"
	exit 1
}

if [[ $# != 1 ]]
then
	usage
fi

case "$1" in
	"runningInstances")
		aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,PublicDnsName]' --filters Name=instance-state-name,Values=running --output text
		;;
	"regions")
		aws ec2 describe-regions --query 'Regions[*].{Region:RegionName}' --output text
		;;
	*)
		usage
		;;
esac

