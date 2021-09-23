initResult=$(vault operator init -format=json -key-shares=1 -key-threshold=1)

echo $initResult | jq  > data.json

echo $(cat data.json | jq -r '.unseal_keys_b64[0]')| xargs -I % vault operator unseal %
