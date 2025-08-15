#!/bin/bash
#
# Copyright (C) 2024 April Software S.A.
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
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
            --packages ${PACKAGES}

    $1/deployvm --path ${BUILD_PATH} \
            --name ${VM_NAME} \
            --host ${KVM_HOST} \
            --pool ${VM_POOL} \
            --vcpus ${VM_VCPUS} \
            --memory ${VM_MEMORY} \
            --network ${VM_NETWORK} \
            --delete-image
}
