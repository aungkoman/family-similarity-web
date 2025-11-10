# Update Schedule

## Endpoint

POST - api/v2/doctors
AUTH - Bearer Token

clinic_id should get from Bearer Token if logged in user is clinic owner

## Request

```json
{
  "clinic_id": 1,
  "status_id": 1,
  "name": "Doctor Name Created",
  "speciality": "Created Speciality",
  "weekly_schedules": [
    {
      "id": 0,
      "weekday": "Sunday",
      "start_time": "6 PM",
      "end_time": "9 PM"
    }
    {
      "id": 0, // this mean new weekly schedule
      "weekday": "Wednesday",
      "start_time": "9 AM",
      "end_time": "11 AM"
    }
  ]
}
```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Doctor Info Created",
  "data": {
    "id": 1,
    "name": "Dr. Mg Mg",
    "speciality": "OG",
    "status_id": 1,
    "status": {
      "id": 1,
      "name": "Active"
    },
    "weekly_schedule_count": 2,
    "weekly_schedules": [
      {
        "id": 1,
        "weekday": "Sunday",
        "start_time": "6 PM",
        "end_time": "9 PM"
      },
      {
        "id": 2,
        "weekday": "Wednesday",
        "start_time": "9 AM",
        "end_time": "11 AM"
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
