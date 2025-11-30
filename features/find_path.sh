#!/bin/bash

find_path() {
    read -p "검색할 파일 이름을 입력하세요: " filename

    if [ -z "$filename" ]; then
        echo "파일 이름을 입력해야 합니다."
        return 1
    fi

    echo "검색 중... 잠시만 기다려주세요."

    results=$(find / -type f -name "$filename" 2>/dev/null)

    if [ -z "$results" ]; then
        echo "파일을 찾을 수 없습니다: $filename"
        return 1
    fi

    echo "=== 검색된 절대 경로 ==="
    echo "$results"
}
