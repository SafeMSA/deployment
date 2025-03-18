for i in {1..1000}; do
  curl -s -X POST http://localhost:9091 \
    -H "Content-Type: application/json" \
    -d "{\"id\": $i, \"message\": \"Evacuate immediately!\"}" | \
    jq -r '"\(.name), \(.code)"'
  sleep 1
done
