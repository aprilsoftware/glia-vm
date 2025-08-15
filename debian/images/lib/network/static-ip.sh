#!/bin/bash
#
# Copyright (C) 2023 April Software S.A.
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
cat <<EOF > /etc/network/interfaces.d/enp1s0
auto enp1s0
iface enp1s0 inet static
	address ${VM_IP}
	netmask 255.255.255.0
	gateway ${VM_GATEWAY}
EOF

echo "${VM_IP}    ${VM_HOSTNAME}.${VM_DOMAIN} ${VM_HOSTNAME}" >> /etc/hosts