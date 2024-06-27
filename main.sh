#!/bin/bash
# yahh yang pake windows g bisa ya? install wsl dlu dek

sendRequest() {
    local inputText=$1
    response=$(curl -s -X POST "https://api.simsimi.vn/v1/simtalk" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "text=${inputText}&lc=id")
    echo $response
}

parseResponse() {
    local response=$1
    message=$(echo $response | jq -r '.message')
    echo $message
}

while true; do
    echo -n "you>: "
    read inputText

    if [[ "$inputText" == "exit" || "$inputText" == "quit" || "$inputText" == "keluar" || "$inputText" == "murtad" ]]; then
        echo "yahh logout deh :( ..."
        break
    fi
    
    response=$(sendRequest "$inputText")
    message=$(parseResponse "$response")
    echo "bot>: $message"
done
