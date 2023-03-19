from cryptography.fernet import Fernet

with open('lol.txt', 'rb') as f:
    key = f.read()

fernet = Fernet(key)

with open('encrypted_code.py', 'rb') as f:
    encrypted_code = f.read()

code = fernet.decrypt(encrypted_code)

exec(code)
