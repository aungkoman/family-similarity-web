# Update Schedule

## Endpoint

PUT - api/v2/schedules/{id}
AUTH - Bearer Token


## Request

```json
{
  "status_id": 1,
}
```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Schedule Status Updated",
  "data": {
    "id": 1,
    "doctor_id": 1,
    "doctor": {
      "id": 1,
      "name": "Dr. Mg Mg",
      "speciality": "OG"
    },
    "time": "3:30 PM",
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
