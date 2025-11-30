#!/bin/bash

function tree_view_function() {
    echo " 1. 디렉터리 트리 출력 및 목표 파일 시각화      "

    # 🚨 tree 명령어 대신 find와 sed 조합을 사용합니다.
    # 'tree' 명령어 존재 여부 확인 로직을 제거하고 바로 실행합니다.
    
    read -p " 시각화할 목표 파일명을 입력하세요 (없으면 Enter): " TARGET_FILE
    
    echo " 현재 디렉토리 구조:"
    echo "--------------------------------------------------------"

    # find와 sed를 이용해 트리 구조 출력
    TREE_OUTPUT=$(find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g')

    if [[ -z "$TARGET_FILE" ]]; then
        echo "$TREE_OUTPUT"
    else
        # 목표 파일이 있을 경우 시각화하여 출력
        echo "$TREE_OUTPUT" | sed "s/\([^/]*\)${TARGET_FILE}$/\1>>> ${TARGET_FILE} <<</"
        echo " 목표 파일: >>> ${TARGET_FILE} <<<"
    fi
    echo "--------------------------------------------------------"
}