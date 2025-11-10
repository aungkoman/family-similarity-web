# Today Schedules API

## Endpoint

GET - api/v2/schedules/today
AUTH - Bearer Token

## Request

```json

```

## Response - Success - 200

```json
{
    "status" : true,
    "message" : "Dashboard Information for 26 Sep 3:00 PM",
    "data" : [
        {
            "id" : 1,
            "doctor_id" : 1,
            "doctor" : {
                "id" : 1,
                "name" : "Dr. Mg Mg",
                "speciality" : "OG"
            },
            "time" : "3:30 PM",
            "status_id" : 1,
            "status" : {
                "id" : 1,
                "name" : "Pending"
            },
            "start_datetime" : "2025-11-08 15:30:00",
            "end_datetime" : "2025-11-08 22:30:00",
            "appointment_count" : 23
        },
        {
            "id" : 2,
            "doctor_id" : 2,
            "doctor" : {
                "id" : 1,
                "name" : "Dr. Aye San",
                "speciality" : "Cardiologist"
            },
            "time" : "7:00 PM",
            "status_id" : 1,
            "status" : {
                "id" : 1,
                "name" : "Pending"
            },
            "start_datetime" : "2025-11-08 19:00:00",
            "end_datetime" : "2025-11-08 21:00:00",
            "appointment_count" : 23
        }
    ]
}
```

### Response - Failure - Validation

```json
{
    "status" : true,
    "message" : "Unexpected error occured"
}
```
