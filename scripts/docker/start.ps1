docker run `
    --name replica_api `
    -v $pwd\:/usr/src/app `
    -p 7080:80 `
    -d `
    replica_api