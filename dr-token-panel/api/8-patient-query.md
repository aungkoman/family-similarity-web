# Create New Appointment

## Endpoint

GET - api/v2/patient
AUTH - Bearer Token
Parameters - 

phone = 0912346587

## Request

```json

```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Patient Info Success",
  "data": {
    "id": 1,
    "name": "Patient Name",
    "phone": "091324687"
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
