#!/bin/bash
#
# Copyright (C) 2024 April Software S.A.
#
# This work is licensed under the GNU GPLv3 or later.
# See the LICENSE file in the top-level directory.
#

deploy()
{
    $1/buildvm --path ${BUILD_PATH} \
            --name ${VM_NAME} \
            --release ${OS_RELEASE} \
            --domain ${VM_DOMAIN} \
            --hostname ${VM_HOSTNAME} \
            --ip ${VM_IP} \
            --gateway ${VM_GATEWAY} \
            --nameserver ${VM_NAMESERVER} \
            --size ${VM_SIZE} \
            --modules ${MODULES}

    $1/deployvm --path ${BUILD_PATH} \
            --name ${VM_NAME} \
            --host ${KVM_HOST} \
            --destination ${VM_DESTINATION} \
            --vcpus ${VM_VCPUS} \
            --memory ${VM_MEMORY} \
            --network ${VM_NETWORK} \
            --delete-image
}
