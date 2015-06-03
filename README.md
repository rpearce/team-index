# team-index
Hacked together API and index page for a team's reference.

## API
### GET /members.json
```bash
$ curl http://localhost:4567/members.json
```

### POST /members
```bash
$ curl -i -X POST \
 -d 'first_name=Jane&last_name=Goodall&image_uri=http://www.foo.bar/image.jpg' \
 http://localhost:4567/members
```

### POST /members.json
```bash
$ curl -i -H "Content-Type: application/json" -X POST \
  -d
'{"first_name":"Jane","last_name":"Goodall","image_uri":"http://www.foo.bar/image.jpg"}' \
  http://localhost:4567/members.json
```

### DELETE /members
```bash
$ curl -i -X DELETE \
  -d "first_name=Jane&last_name=Goodall" \
  http://localhost:4567/members
```

### DELETE /members.json
```bash
$ curl -H "Content-Type: application/json" -X DELETE \
  -d '{"first_name":"Jane","last_name":"Goodall"}' \
  http://localhost:4567/members.json
```

## Installation

### Full setup
```bash
$ make
```

### Create DB
```bash
$ make db_create
```

### Create members table
```bash
$ make db_create_members
```

### Drop DB
```bash
$ make db_drop
```
