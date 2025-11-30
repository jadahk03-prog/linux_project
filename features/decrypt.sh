#!/bin/bash

function decrypt() {
    # 🚨 수정: BASH_SOURCE[0]를 사용하여 스크립트 파일 자체의 위치를 기반으로 프로젝트 루트를 계산합니다.
    # (features/ 폴더 위치에서 한 단계 위(프로젝트 루트)로 이동)
    SCRIPT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
    
    INPUT_PATH="$SCRIPT_ROOT/input.txt"
    OUTPUT_PATH="$SCRIPT_ROOT/output.txt"

    echo "복호화할 텍스트를 입력하세요:"
    read input

    # 입력 파일을 절대 경로에 저장
    echo "$input" > "$INPUT_PATH"

    # python 스크립트 실행 시 절대 경로 전달
    python3 features/cipher.py decrypt "$INPUT_PATH" "$OUTPUT_PATH"

    echo "✅ 복호화 완료! 결과는 $OUTPUT_PATH 에 저장되었습니다."
}