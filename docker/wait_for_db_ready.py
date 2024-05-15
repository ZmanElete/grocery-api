import os
import psycopg2
import time

env = os.environ
host = env.get('POSTGRES_HOST', 'db')
db = env.get('POSTGRES_DB')
user = env.get('POSTGRES_USER')
pw = env.get('POSTGRES_PASSWORD')
port = env.get('POSTGRES_PORT', 5432)

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
