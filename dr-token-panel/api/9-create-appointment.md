# Create New Appointment

## Endpoint

POST - api/v2/appointments
AUTH - Bearer Token

## Request

```json
{
  "status_id": 1,
  "token" : 1,
  "patient_id" : 0, // existing patient | new patient
  "patient_name" : "Patient Name",
  "patient_phone" : "0912346578"
}
```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Appointment Status Created",
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
