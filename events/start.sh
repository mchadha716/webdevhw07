#!/bin/bash

export MIX_ENV=prod
export PORT=4798

CFGD=$(readlink -f ~/.config/events)

if [ ! -e "$CFGD/base" ]; then
    echo "run deploy first"
    exit 1
fi

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

_build/prod/rel/event_manager/bin/event_manager start

# export SECRET_KEY_BASE=W68eso5YQOlbtvSNUR50N/HDWj6IaEhAwMR3LtzuBEQAefwYVbX84bvoTA7XtiGi
# export MIX_ENV=prod
# export PORT=4798
# export NODEBIN='pwd'/assets/node_modules/.bin
# export PATH="$PATH:$NODEBIN"
# export DATABASE_URL=ecto://"events":aiNg8tuSee3k@localhost/events_db

# _build/prod/rel/events/bin/events start
