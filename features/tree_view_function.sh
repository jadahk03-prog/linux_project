#!/bin/bash

function tree_view_function() {

    echo " 1. 디렉터리 트리 출력 및 목표 파일 시각화 "


    # 'tree' 명령어 존재 여부 확인
    if ! command -v tree &> /dev/null; then
        echo "오류: 'tree' 명령어를 찾을 수 없습니다. (설치 필요)"
        return 1
    fi

    read -p " 시각화할 목표 파일명을 입력하세요 (없으면 Enter): " TARGET_FILE
    
    if [[ -z "$TARGET_FILE" ]]; then
        tree -a 
    else
        echo "### 목표 파일 시각화: >>> ${TARGET_FILE} <<<"
        # tree 명령 결과를 sed를 이용해 목표 파일명 시각화
        tree -a | sed "s/\([^/]*\)${TARGET_FILE}$/\1>>> ${TARGET_FILE} <<</"
    fi
}
