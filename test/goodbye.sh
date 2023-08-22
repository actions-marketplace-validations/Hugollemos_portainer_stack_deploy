#!/bin/bash
URL=$API_URL
API_KEY=$API_KEY
FILE_PATH=$stack
name=$name

# Faz a solicitação GET e armazena a resposta em uma variável
response=$(curl -s -X GET "$URL" -H "X-API-Key: $API_KEY" --insecure)

# Verifica se a stack está criada
if echo "$response" | jq -e '.[] | select(.Name == "'"$name"'")' > /dev/null; then

  # Extrai o valor do campo "Name" usando jq
  name=$(echo "$response" | jq -r '.[] | select(.Name == "'"$name"'") | .Name')

  # Imprime o nome da stack
  echo "A Stack chamada $name está criada."

  # Obtém o ID da stack
  id=$(echo "$response" | jq -r '.[] | select(.Name == "'"$name"'") | .Id')
  
  # Imprime o ID da stack
  echo "Obtendo ID da stack: $id"
  
  # Monta a URL para a exclusão
  DELETE_URL="$URL/$id"
  
  # Faz a solicitação DELETE para atualizar a stack
  curl -X DELETE "$DELETE_URL" \
  -H "X-API-Key: $API_KEY" \
  -F "type=2" \
  -F "method=file" \
  -F "file=@$FILE_PATH" \
  -F "endpointId=2" \
  -F "Name="$name" 

  echo "Stack deletada. ID: $id"
  echo "stop 6 sec"
  sleep 6
  echo "CRIANDO A STACK $name"

  response=$(curl -s -X POST "$URL" \
  -H "X-API-Key: $API_KEY" \
  -F "type=2" \
  -F "method=file" \
  -F "file=@$FILE_PATH" \
  -F "endpointId=2" \
  -F "Name="$name" )

  # Imprimir a resposta da requisição 
  echo "Resposta da solicitação POST: $response"

  # Extrair o valor do campo "Id" da nova stack usando jq
  id=$(echo "$response" | jq -r '.Id')

  # Imprimir o valor do Id
  echo "Nova Stack criada. Id: $id"
else
  echo "Nenhuma Stack da aplicação encontrada."
  echo "CRIANDO A NOVA STACK"

  response=$(curl -s -X POST "$URL" \
  -H "X-API-Key: $API_KEY" \
  -F "type=2" \
  -F "method=file" \
  -F "file=@$FILE_PATH" \
  -F "endpointId=2" \
  -F "Name="$name" )

  # Imprimir a resposta da requisição 
  echo "Resposta da solicitação POST: $response"

  # Extrair o valor do campo "Id" da nova stack usando jq
  id=$(echo "$response" | jq -r '.Id')

  # Imprimir o valor do Id
  echo "Nova Stack criada. Id: $id"
fi