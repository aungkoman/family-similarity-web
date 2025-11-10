# Doctor Listing API

## Endpoint

GET - api/v2/doctors
AUTH - Bearer Token
Parameters

page = 1
clinic_id = 1
status_id = 1

## Request

```json

```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Doctor List Success",
  "data": [
    {
      "id": 1,
      "name": "Dr. Mg Mg",
      "speciality": "OG",
      "status_id": 1,
      "status": {
        "id": 1,
        "name": "Active"
      },
      "weekly_schedule_count" : 1
    },
    {
      "id": 1,
      "name": "Dr. May Thu",
      "speciality": "GP",
      "status_id": 2,
      "status": {
        "id": 2,
        "name": "InActive"
      },
      "weekly_schedule_count" : 2
    }
  ],
  "pagination": {
    "total": 120,
    "per_page": 20,
    "current_page": 2,
    "last_page": 21
  }
}
```

### Response - Failure - Validation

```json
{
  "status": true,
  "message": "Unexpected error occured"
}
```
