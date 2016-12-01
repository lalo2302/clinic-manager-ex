defmodule ClinicApp.RetrieveController do
  use ClinicApp.Web, :controller
  import Ecto.Query, only: [from: 2]

  def show_drugs(conn, _params) do
    query = from d in ClinicApp.Drug,
            select: d
    drugs = ClinicApp.Repo.all(query)
    render(conn, "show_drugs.json", drugs: drugs)
  end

  def existent_appointments(conn, %{"date" => date, "id_doctor" => doctor_id}) do
    {:ok, myDate} = date <> " 00:00:00" |> Ecto.DateTime.cast
    {:ok, endDate} = date <> " 23:59:59" |> Ecto.DateTime.cast
    query = from a in ClinicApp.Appointment,
            where: a.date >= ^myDate,
            where: a.date < ^endDate,
            where: a.employee_id == ^doctor_id,
            select: a.date
    dates = ClinicApp.Repo.all(query)
    render("existent_appointments.json", dates: dates)
  end

  def show_appointment_day(conn, %{"date" => date, "id_doctor" => doctor_id}) do
    {:ok, my_date} = date <> " 00:00:00" |> Ecto.DateTime.cast
    {:ok, end_date} = date <> " 23:59:59" |> Ecto.DateTime.cast
    query = from a in ClinicApp.Appointment,
            where: a.date >= ^my_date,
            where: a.date < ^end_date,
            where: a.employee_id == ^doctor_id,
            preload: [:patient],
            select: a
    appointments = ClinicApp.Repo.all(query)
    render(conn, "appointment_day.json", appointments: appointments)
  end

  def show_appointment(conn, %{"id" => appointment_id}) do
    appointment = ClinicApp.Repo.get(ClinicApp.Appointment, appointment_id)
                  |> ClinicApp.Repo.preload(:patient)
                  |> ClinicApp.Repo.preload(:employee)
    render(conn, "appointment.json", appointment: appointment)
  end

  def all_patients(conn, _params) do
    query = from p in ClinicApp.Patient,
            preload: [:clinical_history],
            select: p
    patients = ClinicApp.Repo.all(query)
    render(conn, "patients.json", patients: patients)
  end

  #TODO: Registrar el id del historial
  def patient(conn, %{"id" => id}) do
    patient = ClinicApp.Repo.get(ClinicApp.Patient, id)
    render(conn, "patient.json", %{patient: patient})
  end

  def show_patient_past_appointments(conn, %{"id" => patient_id}) do
    date = Ecto.DateTime.utc
    query = from a in ClinicApp.Appointment,
            preload: [:employee],
            where: a.patient_id == ^patient_id,
            where: a.date < ^date,
            order_by: a.date,
            select: a

    appointments = ClinicApp.Repo.all(query)

    render(conn, "patient_appointments.json", %{appointments: appointments})
  end

  def show_patient_post_appointments(conn, %{"id" => patient_id}) do
    date = Ecto.DateTime.utc
    query = from a in ClinicApp.Appointment,
            preload: [:employee],
            where: a.patient_id == ^patient_id,
            where: a.date >= ^date,
            order_by: a.date,
            select: a

    appointments = ClinicApp.Repo.all(query)

    render(conn, "patient_appointments.json", %{appointments: appointments})
  end

  def show_specialties(conn, _params) do
    query = from s in ClinicApp.Specialty,
            select: s
    specialties = ClinicApp.Repo.all(query)
    render(conn, "specialties.json", specialties: specialties)
  end

  def show_doctors(conn, _params) do
    query = from d in ClinicApp.Employee,
            preload: [:specialty],
            where: d.job == "Doctor",
            select: d
    doctors = ClinicApp.Repo.all(query)
    render(conn, "doctors.json", doctors: doctors)
  end

  #TODO: Siempre que rollo con esto?
  def show_clinical_history(conn, %{"id_patient" => patient_id}) do
    patient = ClinicApp.Repo.get(ClinicApp.Patient, patient_id) |> ClinicApp.Repo.preload(:clinical_history)
    clinical_history = patient.clinical_history |> ClinicApp.Repo.preload(:ailments) |> ClinicApp.Repo.preload(:antecedents)
    ailments = clinical_history.ailments
    antecedents = clinical_history.antecedents
    last_exploration = ClinicApp.Repo.one(from x in ClinicApp.PhysicalExploration, where: x.clinical_history_id == ^clinical_history.id, order_by: [desc: x.inserted_at], limit: 1) 
    
    render(conn, "clinical_history.json", %{ailments: ailments, antecedents: antecedents, last_exploration: last_exploration})
  end

  #TODO: Solo tenemos un tipo
  def show_study(conn, %{"id" => study_id}) do
    query = from s in ClinicApp.Study,
            where: s.id == ^study_id,
            select: s
    study = ClinicApp.Repo.all(query)
    render(conn, "study.json", study: study)
  end

  def show_clinics(conn, _params) do
    query = from c in ClinicApp.Clinic,
            select: c
    clinics = ClinicApp.Repo.all(query)
    render(conn, "clinics.json", clinics: clinics)
  end

  #TODO: Solo tenemos 1 type
  def study_list(conn, %{"clinical_id" => history_id}) do
    query = from s in ClinicApp.Study,
            where: s.clinical_history_id == ^history_id,
            select: s
    studies = ClinicApp.Repo.all(query)
    render(conn, "study_list.json", studies: studies)
  end
end
