#!/bin/bash

function git_log_analyzer_function() {
    echo " 4. 깃 로그 분석 (커밋 횟수, 콜라보 명단)       "

    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo " 오류: 현재 디렉터리는 Git 저장소가 아닙니다."
        echo "   Git 저장소 내에서 실행해야 합니다."
        return 1
    fi
    
    TOTAL_COMMITS=$(git rev-list --count HEAD)
    echo "총 커밋 수: ${TOTAL_COMMITS}개"

    echo ""
    echo "### 콜라보레이터 명단 및 커밋 순위 ###"
    
    git log --format='%aN' | \
    sort | \
    uniq -c | \
    sort -nr | \
    awk '{printf "  [%4s회] %s\n", $1, $2}'
    
    echo "------------------------------------------------"
}
