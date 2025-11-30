find_path() {
    read -p "검색할 파일 이름을 입력하세요: " filename

    if [ -z "$filename" ]; then
        echo " 파일 이름을 입력해야 합니다."
        return 1
    fi

    echo "🔍 프로젝트 디렉토리에서 [$filename] 검색 중..."

    # 🚨 수정: find / (시스템 루트) 대신 find "$(pwd)" (현재 작업 디렉토리)부터 검색합니다.
    # 이렇게 해야 빠르고 정확하게 프로젝트 파일을 찾을 수 있습니다.
    results=$(find "$(pwd)" -type f -name "$filename" 2>/dev/null)

    if [ -z "$results" ]; then
        echo "파일을 찾을 수 없습니다: $filename"
        return 1
    fi

    echo "=== 검색된 절대 경로 ==="
    echo "$results"
}