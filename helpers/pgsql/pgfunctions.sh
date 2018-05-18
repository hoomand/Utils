#! /bin/bash
#
# pgfunctions.sh
# Copyright (C) 2018 hoomand <hoomand@gmail.com>
# Courtesy of https://gist.github.com/davehughes/2a0c3acc310d001530be
#
# Distributed under terms of the MIT license.
#

export PGPASSFILE=~/.pgpass                                                      
PG_CONNECT_SCRIPT=~/Code/Utils/helpers/pgsql/pgpass.py                                       

function pg-connect () {                                                         
    PSQL_COMMAND=$($PG_CONNECT_SCRIPT print-connection-command $1)               
    echo "pg-connect($1, $PSQL_COMMAND)"                                         
    sh -c "$PSQL_COMMAND"                                                        
}                                                                                

function pg-list () {                                                            
    $PG_CONNECT_SCRIPT list                                                      
}           

