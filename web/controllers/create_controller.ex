defmodule ClinicApp.CreateController do
  use ClinicApp.Web, :controller

  def appointment(conn, %{"id_patient" => patient_id, "date" => date, "status" => status, "id_doctor" =>doctor_id}) do
    text conn, "appointment"
  end

  def patient(conn, %{"name" => name, "last_name" => last_name, "date_of_birth" => date_of_birth, "gender" => gender, "curp" => curp, "rfc" => rfc, "address" => address, "email" => email, "phone" => phone}) do
    text conn, "patient"
  end

  # def user(conn, %{"id_patient" => patient_id, "username" => username, "password" => password, "level" => level}) do
  def patient_user(conn, %{"username" => username, "password" => password, "id_patient" => patient_id}) do
    changeset = ClinicApp.User.patient_changeset(%ClinicApp.User{}, %{username: username, password: password})
    
    case ClinicApp.Repo.insert(changeset) do
      {:ok, user} ->
        patient = ClinicApp.Repo.get(ClinicApp.Patient, patient_id)
        patient = %{ patient | user_id: user.id }
        case ClinicApp.Repo.update(patient) do
          {:ok, update} -> IO.puts "RELACION PACIENTE USUARIO HECHA"
          {:error, error} -> render(ClinicApp.ChangesetView, "error.json")
        end
        render(conn, "user.json", %{user: user})
      {:error, changeset} ->
        conn
        |> render(ClinicApp.ChangesetView, "error.json")
    end
  end

  def doctor_user(conn, %{"username" => username, "password" => password, "id_doctor" => doctor_id}) do
    changeset = ClinicApp.User.doctor_changeset(%ClinicApp.User{}, %{username: username, password: password})

    case ClinicApp.Repo.insert(changeset) do
      {:ok, user} ->
        doctor = ClinicApp.Repo.get(ClinicApp.Patient, doctor_id)
        doctor = %{ doctor | user_id: user.id }
        case ClinicApp.Repo.update(doctor) do
          {:ok, update} -> IO.puts "RELACION DOCTOR USUARIO HECHA"
          {:error, error} -> render(ClinicApp.ChangesetView, "error.json")
        end
        render(conn, "employee_login.json", %{employee: doctor, level: user.level})
      {:error, changeset} ->
        conn
        |> render(ClinicApp.ChangesetView, "error.json")
    end
  end

  def employee(conn, _params) do
    text conn, "employee"
  end

  def antecedent(conn, %{"id_history" => history_id, "type" => type, "name" => name, "description" => description}) do
    text conn, "antecedent"
  end

  def ailment(conn, %{"id_history" => history_id, "main_symptom" => main_symptom, "colateral_symptom" => colateral_symptom, "symptom_localization" => symptom_localization}) do
    text conn, "ailment"
  end

  def exploration(conn, %{"id_history" => history_id, "temperature" => temperature, "blood_pressure" => blood_pressure, "heart_rate" => heart_rate, "breathing_frec" => breathing_frec, "observations" => observations}) do
    text conn, "exploration"
  end

  def study(conn, %{"date" => date, "type" => type, "diagnosis" => diagnosis, "result" => result, "indications" => indications, "id_doctor" => doctor_id, "id_history" => history_id}) do
    text conn, "study"
  end
end
