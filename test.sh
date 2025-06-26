#!/bin/bash

mkdir -p episode
cd episode

# Create GraphQL query file
cat > episode-id-1.graphql <<EOF
query {
  episode(id: 1) {
    id
    name
    air_date
    episode
  }
}
EOF

# Fetch data and save to JSON file
curl -s -X POST https://rickandmortyapi.com/graphql \
  -H "Content-Type: application/json" \
  -d '{"query": "query { episode(id: 1) { id name air_date episode } }"}' \
  > episode-id-1-output.json
