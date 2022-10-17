#!/usr/bin/env bash

PLAYS=playbooks
PROV=$PLAYS/provision
APPS=$PLAYS/applications

declare -a provArr=(
	"docker" 
	"portainer" 
	"watchtower"
	)

declare -a appArr=(
	"api-gateway" 
	"client-list" 
	"identity-provider"
	)

# Tasks Applications

echo 'applying provisions'

for i in "${provArr[@]}"
do
	ansible-playbook $PROV/$i.yml
done

# Tasks Provitions

echo 'applying applications'

for i in "${appArr[@]}"
do
	ansible-playbook $APPS/$i.yml
done