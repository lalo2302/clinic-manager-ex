defmodule ClinicApp.CreateController do
  use ClinicApp.Web, :controller

  def appointment(conn, %{"appointment" => params}) do
    changeset = ClinicApp.Appointment.changeset(%ClinicApp.Appointment{}, params)

    case ClinicApp.Repo.insert(changeset) do
      {:ok, appointment} -> render(conn, "appointment.json", %{appointment: appointment})
      {:error, changeset} -> render(conn, ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
    end 
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
          {:error, error} -> render(ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
        end
        render(conn, "user.json", %{user: user})
      {:error, changeset} ->
        conn
        |> render(ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
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
          {:error, error} -> render(conn, ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
        end
        render(conn, "employee_login.json", %{employee: doctor, level: user.level})
      {:error, changeset} ->
        conn
        |> render(ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
    end
  end

  def employee(conn, %{"employee" => params}) do

    changeset = ClinicApp.Employee.changeset(%ClinicApp.Employee{}, params)

    case ClinicApp.Repo.insert(changeset) do
      {:ok, employee} ->
        render(conn, "employee.json", %{id: employee.id})
      {:error, error} -> render(conn, ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
    end
  end

  def antecedent(conn, %{"antecedent" => params}) do

    changeset = ClinicApp.Antecedent.changeset(%ClinicApp.Antecedent{}, params)

    case ClinicApp.Repo.insert(changeset) do
      {:ok, antecedent} ->
        render(conn, "antecedent.json", %{antecedent: antecedent})
      {:error, error} -> render(conn, ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
    end
  end

  def ailment(conn, %{"ailment" => params}) do
    changeset = ClinicApp.Ailment.insert_changeset(%ClinicApp.Ailment{}, params)

    case ClinicApp.Repo.insert(changeset) do
      {:ok, ailment} -> render(conn, "ailment.json", %{ailment: ailment})
      {:error, changeset} -> render(conn, ClinicApp.ChagesetView, "error.json", %{changeset: changeset})
    end
  end

  def exploration(conn, %{"exploration" => params}) do
    changeset = ClinicApp.PhysicalExploration.changeset(%ClinicApp.PhysicalExploration{}, params)

    case ClinicApp.Repo.insert(changeset) do
    {:ok, exploration} -> render(conn, "exploration.json", %{exploration: exploration})
    {:error, changeset} -> 
     render(conn, ClinicApp.ChangesetView, "error.json", %{changeset: changeset})
    end
  end

  def study(conn, %{"date" => date, "type" => type, "diagnosis" => diagnosis, "result" => result, "indications" => indications, "id_doctor" => doctor_id, "id_history" => history_id}) do
    text conn, "study"
  end
end
