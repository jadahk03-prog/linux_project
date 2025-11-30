import sys

def caesar(text, shift):
    result = ""
    for ch in text:
        if ch.isalpha():
            base = ord('A') if ch.isupper() else ord('a')
            result += chr((ord(ch) - base + shift) % 26 + base)
        else:
            result += ch
    return result


# 파라미터: 암호화/복호화, input.txt, output.txt
mode = sys.argv[1]       # encrypt / decrypt
input_path = sys.argv[2]
output_path = sys.argv[3]

with open(input_path, "r") as f:
    data = f.read()

# encrypt → shift +3 / decrypt → shift -3
shift = 3 if mode == "encrypt" else -3

result = caesar(data, shift)

with open(output_path, "w") as f:
    f.write(result)

print("Done.")
