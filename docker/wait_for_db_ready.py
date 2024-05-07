import os
import psycopg2
import time

env = os.environ
host = env.get('POSTGRES_HOST')
db = env.get('POSTGRES_NAME')
user = env.get('POSTGRES_USER')
pw = env.get('POSTGRES_PASS')
port = env.get('POSTGRES_PORT')

if host and db and user and pw:
    while True:
        print('.')
        try:
            psycopg2.connect(host=host, database=db, user=user, password=pw, port=port)
            break
        except Exception as e:
            print(e)
            time.sleep(0.5)
else:
    print('Missing env vars')
    print('Skipping db wait')
