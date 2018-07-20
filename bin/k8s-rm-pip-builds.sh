#!/usr/bin/env bash

DEPLOYMENT=$1

for p in $(kubectl get pods -o jsonpath="{.items[*].metadata.name}"|tr -s '[[:space:]]' '\n' | cut -f1 -d' '|sort|uniq| grep ^${DEPLOYMENT}- | cut -f 1 -d ' '); do
	echo $p `kubectl exec -it $p /usr/bin/find -- /tmp -name "pip-build-*" -exec rm -rf {} \;`
done
