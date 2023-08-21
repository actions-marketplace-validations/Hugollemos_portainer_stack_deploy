#!/bin/bash
URL=$API_URL
API_KEY=$API_KEY
FILE_PATH=$stack

response=$(curl -s -X GET $URL -H "X-API-Key: $API_KEY" --insecure)

# Verifica se a stack com nome "ubuntu" está criada
if echo "$response" | jq -e '.[] | select(.Name == "front")' > /dev/null; then
  # Extrai o valor do campo "Name" da resposta usando jq
  name=$(echo "$response" | jq -r '.[] | select(.Name == "front") | .Name')

  # Imprime o nome da stack
  echo "A Stack chamada $name está criada. Nome: $name"

  # Extrai o valor do campo "Id" da resposta usando jq
  id=$(echo "$response" | jq -r '.[] | select(.Name == "front") | .Id')

  # Imprime o ID da stack
  echo "Obtendo ID da stack: $id"
else
  echo "Nenhuma Stack com nome $name encontrada."
fi