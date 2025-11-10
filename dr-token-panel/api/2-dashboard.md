# Login API

## Endpoint

GET - api/v2/dashboard
AUTH - Bearer Token

## Request

```json

```

## Response - Success - 200

```json
{
    "status" : true,
    "message" : "Dashboard Information for 26 Sep 3:00 PM",
    "data" : {
        "clinic" : {
            "id" : 1,
            "name" : "Mt. Everest Clinic",
            "description" : "Special Clinic"
        },
        "dashboard_all" : {
            "doctors" : 12,
            "patients" : 125,
            "schedules" : 1234,
        },
        "dashboard_today" : {
            "doctors" : 5,
            "patients" : 85,
            "schedules" : 5,
        }
    }
}
```

### Response - Failure - Validation

```json
{
    "status" : true,
    "message" : "Dashboard information is not available"
}
```
