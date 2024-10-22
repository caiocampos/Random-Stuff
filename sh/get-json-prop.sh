curl -s 'https://swapi.dev/api/people/1?format=json' | {
    read body
    jq .name <<< "$body"
}
