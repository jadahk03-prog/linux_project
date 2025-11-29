#!/bin/bash

# 복호화할 문장을 입력받기
echo "복호화할 텍스트를 입력하세요:"
read input

# 입력 저장
echo "$input" > input.txt

# python 실행
python3 cipher.py decrypt input.txt output.txt

echo "복호화 완료! 결과는 output.txt 파일에 저장되었습니다."
