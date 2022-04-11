param (
    [string]$no_cache = $false
 )

 if ($no_cache) {
    docker build . `
        -t replica_api `
        --no-cache
 } else {
    docker build . `
        -t replica_api
 }

