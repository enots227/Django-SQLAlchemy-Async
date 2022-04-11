docker run `
    --name replica_api_interactive `
    -v $pwd\:/usr/src/app `
    -p 7080:80 `
    -it --entrypoint bash `
    replica_api