# Update Appointment Status

## Endpoint

PUT - api/v2/appointments/{id}
AUTH - Bearer Token

## Request

```json
{
  "status_id": 1,
  "token" : 1
}
```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Appointment Status Updated",
  "data": {
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
