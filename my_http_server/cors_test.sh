# Symulacja żądania z innego origin
curl -X OPTIONS \
-H “Origin: http://localhost:3000” \
-H “Access-Control-Request-Method: GET” \
-v http://localhost:8000
