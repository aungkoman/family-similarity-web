# Today Schedules API

## Endpoint

GET - api/v2/schedules/1/live
AUTH - Bearer Token

## Request

```json

```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Live Management",
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
    "appointment_count": 23,
    "appointments": [
      {
        "id": 1,
        "status_id": 1,
        "status": {
          "id": 1,
          "name": "Pending"
        },
        "token": 1,
        "patient_id": 1,
        "patient": {
          "id": 1,
          "name": "Mg Mg",
          "phone": "0912345678"
        },
        "updated_at": "2025-08-12 12:34:56"
      },
      {
        "id": 2,
        "status_id": 2,
        "status": {
          "id": 2,
          "name": "Arrived"
        },
        "token": 2,
        "patient_id": 1,
        "patient": {
          "id": 1,
          "name": "Ma Ma",
          "phone": "098789564612"
        },
        "updated_at": "2025-08-12 12:34:56"
      },
      {
        "id": 3,
        "status_id": 3,
        "status": {
          "id": 3,
          "name": "Consulting"
        },
        "token": 3,
        "patient_id": 3,
        "patient": {
          "id": 3,
          "name": "Min Min",
          "phone": "0985857456"
        },
        "updated_at": "2025-08-12 12:34:56"
      }
    ]
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
