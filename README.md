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
| GET  | /login    | username, password | {"person_id":2,"level":"doctor","clinical_history_id":1} |
| GET  | /drug/status | NULL   | Drug[id, name, quantity] or false |
| GET  | /drug | NULL |{"drugs":[{"quantity":4,"price":90.0,"name":"drug","id":1}]} |
| GET  | /appointment/existent | date, id_doctor | {"appointments":[{"hour":"08:00:00"},{"hour":"09:00:00"}]} |
| GET  | /appointment/day | date=YYYY-MM-DD | {"appointments":[{"patient_name":"Lalo","id":3}]} |
| GET  | /appointment/:id | <-- | {"patients_name":"Lalo","doctors_name":"hola","date":"2016-11-29"} |
| GET  | /patient | NULL | {"patients":[{"name":"Lalo","id_clinic_history":1,"id":2}]} | 
| GET  | /patient/:id/appointments | id | {"appointments":[{"type":"primera vez","status":0,"satisfaction":null,"id":3,"doctors_name":"hola","date":"2016-11-29"}]} |
| GET  | /specialty | NULL | {"specialties":[{"opening_time":"08:08:08","name":"lalo","id":1,"extension":"hola","description":"hola","cost":18.89999962,"closing_time":"08:08:08"}]} |
| GET  | /doctor | NULL | {"doctors":[{"specialty":"lalo","name":"hola","id":5}]} |
| GET  | /history | id_patient | **preguntar cómo se va a consumir el historial. Solo se envia ultima ** |
| GET  | /study/:id  | <--  |  {"treatment":"study","result":"study","indications":"study","id":1,"diagosis":"study","date":"2016-01-11"} |
| GET  | /clinic | NULL |{"clinics":[{"phone":"clinicphone","opening_time":"open","open_days":"open","name":"clinic","manager":"clmanager","id":1,"email":"lalo@email.com","closing_time":"close","address":"clinicaddresss"}]} |
| GET  | /study/list | id_patient | {"studies":[{"id":1, "date":"YYYY-MM-DD", "type":"type"}]} |
| POST | /drug/order | **Preguntar a equipo de ale** | **Preguntar a equipo de ale** |
| POST | /appointment | id_patient, date, status, id_doctor | true or false |
| POST | /patient | name, last-name, date_of_birth, gender, curp, rfc, address, email, phone | true or false |
| POST | /user | id_patient, username, password, level | true or false |
| POST | /employee | **Preguntar a laura** | true or false |
| POST | /antecedent | id_history, type, name, description | true or false |
| POST | /ailment | id_history,main_symtopm, colateral_symptom, symptom_localization | true or false |
| POST | /exploration | id_history, temperature, blood_pressure, heart_rate, breathing_frec, observations | true or false |
| POST | /study | date, type, diagnosis, result, indications, treatment, id_doctor, id_history | true or false |
| PUT | /appointment/rate | id, rate | true or false |
| PUT | /ailment/end | id | true **or** false |

