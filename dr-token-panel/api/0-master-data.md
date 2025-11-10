# Master Data


## Endpoint

GET - api/v2/master

## Request

```json

```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Master Data",
  "data": [
    {
        "name" : "Schedule Status",
        "data" : [
            { "id" : 1, "name" : "Pending"},
            { "id" : 2, "name" : "Arrived"},
            { "id" : 3, "name" : "Depart"},
            { "id" : 4, "name" : "Canceled"},
        ]
    },
    {
        "name" : "Appointment Status",
        "data" : [
            { "id" : 1, "name" : "Pending"},
            { "id" : 2, "name" : "Arrived"},
            { "id" : 3, "name" : "Depart"},
            { "id" : 4, "name" : "Canceled"},
        ]
    },
    {
        "name" : "Doctor Status",
        "data" : [
            { "id" : 1, "name" : "Active"},
            { "id" : 2, "name" : "In Active"}
        ]
    },
  ]
}
```

### Response - Failure - Validation

```json
{
  "status": true,
  "message": "Unexpected error occured"
}
```
