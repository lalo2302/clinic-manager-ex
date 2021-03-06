# ClinicApp

To start your Phoenix app:

  * [How to install elixir v1.3](https://github.com/taylor/kiex)
  * [How to install phoenix](http://www.phoenixframework.org/docs/installation)
  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

# Definición de endpoints
| HTTP | Ruta      | Parámetros | Respuesta |
| :--: | :-------: | :--------: | :-------: |
| GET  | /login    | username, password | {"user":{"name":"hola","level":"doctor","id":5}} |
| GET  | /drug/status | NULL   | {"drugs":[{"quantity":4,"name":"drug","id":1},{"quantity":8,"name":"drug4","id":4}]} **or** {"result":false}%|
| GET  | /drug | NULL |{"drugs":[{"quantity":4,"price":90.0,"name":"drug","id":1}]} |
| GET  | /appointment/existent | date, id_doctor | {"appointments":[{"hour":"08:00:00"},{"hour":"09:00:00"}]} |
| GET  | /appointment/day | date=YYYY-MM-DD&id_doctor=5 | {"appointments":[{"patient_name":"Lalo","patient_id":2,"appointment_id":6},{"patient_name":"Lalo","patient_id":2,"appointment_id":7}]} |
| GET  | /appointment/:id | <-- | {"patients_name":"Lalo","doctors_name":"hola","date":"2016-11-29"} |
| GET  | /patient | NULL | {"patients":[{"name":"Lalo","id_clinic_history":1,"id":2}]} | 
| GET  | /patient/:id | <-- | {"patient":{"rfc":"AAAA000000000","phone":"218/484-7068","name":"Keon","last_name":"Hessel","gender":"M","email":"frances.vonrueden@yahoo.com","date_of_birth":"2016-11-30","curp":"AAAA000000HAAAAA00","clinical_history_id":1006,"address":"6083 Witting Squares"}} |
| GET  | /patient/:id/past/appointments | id | {"appointments":[{"type":"primera vez","status":0,"satisfaction":null,"id":3,"doctors_name":"hola","date":"2016-11-29"}]} |
| GET  | /patient/:id/post/appointments | id | {"appointments":[{"type":"primera vez","status":0,"satisfaction":null,"id":3,"doctors_name":"hola","date":"2016-11-29"}]} |
| GET  | /specialty | NULL | {"specialties":[{"opening_time":"08:08:08","name":"lalo","id":1,"extension":"hola","description":"hola","cost":18.89999962,"closing_time":"08:08:08"}]} |
| GET  | /doctor | NULL | {"doctors":[{"specialty":"lalo","name":"hola","id":5}]} |
| GET  | /specialty/:id/doctors | <-- |  |
| GET  | /history | id_patient | {"last_exploration":{"temperature":18.0,"observations":null,"heart_rate":17,"breathing_frec":17,"blood_pressure":17.0},"antecedents":[{"type":"patologico          ","name":"antecedent","description":"antecedent"}],"ailments":[{"symptom_location":"mucho dolor","main_symptom":"dolor","end_date":"2013-01-11","date_of_detection":"2016-01-29","colateral_symptom":"dolor"}]} |
| GET  | /study/:id  | <--  |  {"treatment":"study","result":"study","indications":"study","id":1,"diagosis":"study","date":"2016-01-11"} |
| GET  | /clinic | NULL |{"clinics":[{"phone":"clinicphone","opening_time":"open","open_days":"open","name":"clinic","manager":"clmanager","id":1,"email":"lalo@email.com","closing_time":"close","address":"clinicaddresss"}]} |
| GET  | /study/list | id_patient | {"studies":[{"id":1, "date":"YYYY-MM-DD", "type":"type"}]} |
| POST | /drug/order | {"drugs":{"name":"ejemplo", "quantity":10}} | **Preguntar a equipo de ale** |
| POST | /appointment | {"appointment":{"date":"2010-02-02 10:00:00","type":"rutina","patient_id":2,"employee_id":5}}| {"id":9}|
| POST | /patient | {"patient":{"name":"lalo","last_name":"lalo","date_of_birth":"2010-02-02","address":"calle","phone":"456456","gender":"M","curp":"AAAA000000HAAAAA00","rfc":"AAAA000000000","email":"lalo@lalo.com"}} | {"id":1013,"clinical_history_id":4}|
| POST | /patient/user | id_patient, username, password | {"result":"true"} |
| POST | /doctor/user | id_doctor, username, password | true or false |
| POST | /administrative/user | id_admin, username, password | true or false |
| POST | /employee | {"employee":{"name":"lalo","last_name":"lalo","date_birth":"2010-02-02","gender":"M","curp":"AAAA000000HAAAAA00","rfc":"AAAA000000000","address":"address","email":"lalo@lalo.com","phone":"4777867","profession":"doctor","job":"doctor","specialty_id":1}} | {"id":8} |
| POST | /antecedent | {"antecedent":{"name":"lalo","description":"descripcion","type":"heredofamiliar","clinical_history_id":"1"}}| {"id":10}|
| POST | /ailment | {"ailment":{"main_symptom":"enfermo","date_of_detection":"2016-02-02","symptom_location":"brazo","colateral_symptom":"enfermo","clinical_history_id":1}} | {"id":4} |
| POST | /exploration | {"exploration":{"temperature":17.0,"blood_pressure":17.0,"heart_rate":17,"breathing_frec":17,"observations":"lalala","clinical_history_id":"1"}} | {"id":1002}|
| POST | /study | {"study":{"date":"2010-02-02","diagnosis":"diagnostico","result":"resultado","indications":"indicaciones","treatment":"tratamiento","employee_id":5,"clinical_history_id":1}} | {"id":2} |
| PUT | /appointment/rate | id, rate | {"id":5} |
| PUT | /ailment/end | id | {"id":4}|

