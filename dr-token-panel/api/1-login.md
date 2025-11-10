# Login API

## Endpoint

POST - api/v2/login

## Request

```json
{
    "email" : "admin@drtoken.com.mm",
    "password" : "password"
}
```

## Response - Success - 200

```json
{
    "status" : true,
    "message" : "Login Success",
    "data" : {
        "id" : 1,
        "name" : "User Name",
        "email" : "admin@drtoken.com.mm",
        "role_id" : 1,
        "role" : {
            "id" : 1,
            "name" : "Admin"
        },
        "status_id" : 1,
        "status" : {
            "id" : 1,
            "name" : "Active"
        },
        "access_token" : "thisIsVeryLongAccessTokenJWT"
    }
}
```

### Response - Failure - Validation

```json
{
    "status" : true,
    "message" : "Email and Password do not match",
    "error" : {
        "email" : [
            "email is required",
            "email already existed in the system",
        ],
        "password" : [
            "password is required",
            "password should has at least one capital character"
        ]
    }
}
```
