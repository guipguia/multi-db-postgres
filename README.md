# Forked from

https://github.com/mrts/docker-postgresql-multiple-databases

Just with small modifications and update postgres version

# Default image

```
docker pull guipguia/multi-pg-database:16.2-alpine3.19
```

# Creating image your self

If you want to have another version of postgres, you can change the dockerfile and build it again.

```Use buildx to build it for different platforms
docker buildx build --platform=linux/amd64,linux/arm64 --push -t guipguia/multi-pg-database:16.2-alpine3.19 .
```

# SSL mode for Postgres

Modify the certificate information inside the script

```
# Certificate subject information
COUNTRY="US"
STATE="California"
CITY="San Francisco"
ORGANIZATION="My Company"
ORG_UNIT="IT Department"
COMMON_NAME="localhost"
```

```Allow script to execute
chmod +x scripts/gen-cert.sh
```

```Run script
./scripts/gen-cert.sh
```
