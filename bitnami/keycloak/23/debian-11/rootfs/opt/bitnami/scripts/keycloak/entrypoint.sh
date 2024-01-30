#!/bin/bash
# Copyright VMware, Inc.
# SPDX-License-Identifier: APACHE-2.0

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace # Uncomment this line for debugging purposes

# Move config files from template directory 
cp -puR /opt/bitnami/keycloak/temp-conf/* /opt/bitnami/keycloak/conf/
cp -puR /opt/bitnami/keycloak/lib/temp-quarkus/* /opt/bitnami/keycloak/lib/quarkus/
cp -puR /opt/bitnami/keycloak/temp-providers/* /opt/bitnami/keycloak/providers/
cp -puR /opt/bitnami/keycloak/temp-themes/* /opt/bitnami/keycloak/themes/

# Load libraries
. /opt/bitnami/scripts/libbitnami.sh
. /opt/bitnami/scripts/liblog.sh
. /opt/bitnami/scripts/libkeycloak.sh

# Load keycloak environment variables
. /opt/bitnami/scripts/keycloak-env.sh

print_welcome_page

if [[ "$*" = *"/opt/bitnami/scripts/keycloak/run.sh"* ]]; then
    info "** Starting keycloak setup **"
    /opt/bitnami/scripts/keycloak/setup.sh
    info "** keycloak setup finished! **"
fi

echo ""
exec "$@"
