for i in {1..200}; do
  response=$(curl -s -X POST http://localhost:9091 \
    -H "Content-Type: application/json" \
    -d "{\"message\": \"Evacuate immediately!\"}")
  
  echo "$response" | jq -r '"\(.id), \(.status)"'
  sleep 5
done
