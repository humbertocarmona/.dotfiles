function pipup --description 'pip update all'
    pip list -o --format=json | jq '.[]|.name' | xargs -n 1 pip install -U
end
