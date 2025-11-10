# Doctor Detail API

## Endpoint

GET - api/v2/doctors/{id}
AUTH - Bearer Token

currently this is schedule between Doctor and this clinic.

Doctor can have multiple schedules across multiple clinic.
Backend API Need to consider filtering to show respective clinic x doctor 's weekly schedule.

## Request

```json

```

## Response - Success - 200

```json
{
  "status": true,
  "message": "Doctor Detail Success",
  "data": {
    "id": 1,
    "name": "Dr. Mg Mg",
    "speciality": "OG",
    "status_id": 1,
    "status": {
      "id": 1,
      "name": "Active"
    },
    "weekly_schedule_count": 1,
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
    ],
    // နောက်ဆုံး schedule (၁၀) ခုလောက်ပြပေးရင် ရပြီ 
    "schedules": [
      {
        "id": 1,
        "status_id": 1,
        "status": {
          "id": 1,
          "name": "Pending"
        },
        "start_datetime": "2025-11-08 15:30:00",
        "end_datetime": "2025-11-08 22:30:00",
        "appointment_count": 23
      },
      {
        "id": 2,
        "status_id": 1,
        "status": {
          "id": 1,
          "name": "Pending"
        },
        "start_datetime": "2025-11-08 15:30:00",
        "end_datetime": "2025-11-08 22:30:00",
        "appointment_count": 23
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
