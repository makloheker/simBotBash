#!/bin/bash
# yahh yang pake windows g bisa ya? install wsl dlu dek

send_request() {
    local input_text=$1
    response=$(curl -s -X POST "https://api.simsimi.vn/v1/simtalk" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "text=${input_text}&lc=id")
    echo $response
}

parse_response() {
    local response=$1
    message=$(echo $response | jq -r '.message')
    echo $message
}

while true; do
    echo -n "you>: "
    read input_text

    if [[ "$input_text" == "exit" || "$input_text" == "quit" || "$input_text" == "keluar" || "$input_text" == "murtad" ]]; then
        echo "yahh logout deh :( ..."
        break
    fi
    
    response=$(send_request "$input_text")
    message=$(parse_response "$response")
    echo "bot>: $message"
done
