# Update Schedule

## Endpoint

PUT - api/v2/schedules
AUTH - Bearer Token

## Request

```json
{
  "status_id": 1,
  "doctor_id": 1,
  "start_datetime": "2025-11-08 15:30:00",
  "end_datetime": "2025-11-08 22:30:00"
}
```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Schedule Created Succesfully",
  "data": {
    "id": 1,
    "doctor_id": 1,
    "doctor": {
      "id": 1,
      "name": "Dr. Mg Mg",
      "speciality": "OG"
    },
    "status_id": 1,
    "status": {
      "id": 1,
      "name": "Pending"
    },
    "start_datetime": "2025-11-08 15:30:00",
    "end_datetime": "2025-11-08 22:30:00",
    "appointment_count": 23
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
