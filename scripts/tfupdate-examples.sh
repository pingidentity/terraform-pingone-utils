#!/usr/bin/env bash

tfupdate module -r -v $(cat .version) pingidentity/utils/pingone ./examples