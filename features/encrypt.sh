#!/bin/bash

# 사용자 입력 받기
function encrypt() {
echo "암호화할 영어 문장을 입력하세요:"
read input

# 입력을 txt 파일로 저장
echo "$input" > input.txt

# python 스크립트 실행
python3 cipher.py encrypt input.txt output.txt

echo "암호화 완료! 결과는 output.txt 파일에 저장되었습니다."
}
