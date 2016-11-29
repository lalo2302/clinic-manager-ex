defmodule ClinicApp.RetrieveController do
  use ClinicApp.Web, :controller
  import Ecto.Query, only: [from: 2]

  def show_drugs(conn, _params) do
    query = from d in ClinicApp.Drug,
            select: d
    drugs = ClinicApp.Repo.all(query)
    render(conn, "show_drugs.json", drugs: drugs)
  end

  #TODO: make returning hours
  def existent_appointments(conn, %{"date" => date, "id_doctor" => doctor_id}) do
    query = from a in ClinicApp.Appointment,
            preload: [:employee],
            where: a.date == ^date,
            where: a.employee_id == ^doctor_id,
            select: a
    appointments = ClinicApp.Repo.all(query)
    render(conn, "existent_appointments.json", appointments: appointments)
  end

  def show_appointment_day(conn, %{"date" => date}) do
    ecto_date = Ecto.Date.cast(date)
    query = from a in ClinicApp.Appointment,
            preload: [:patient],
            where: a.date == ^date,
            select: a
    appointments = ClinicApp.Repo.all(query)
    render(conn, "appointment_day.json", appointments: appointments)
  end

  #TODO: para que necesitamos la espcielidad?
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

  def show_patient_appointments(conn, %{"id" => patient_id}) do
    query = from a in ClinicApp.Appointment,
            preload: [:employee],
            where: a.patient_id == ^patient_id,
            select: a
    appointments = ClinicApp.Repo.all(query)
    render(conn, "patient_appointments.json", appointments: appointments)
  end

  def show_specialties(conn, _params) do
    query = from s in ClinicApp.Specialty,
            select: s
    specialties = ClinicApp.Repo.all(query)
    render(conn, "specialties.json", specialties: specialties)
  end

  #TODO: Como vamos a saber los empleados qué tipo son?
  def show_doctors(conn, _params) do
    text conn, "show doctors"
  end

  #TODO: Siempre que rollo con esto?
  def show_clinical_history(conn, %{"id_patient" => patient_id}) do
    text conn, "show clinical history"
  end

  #TODO: No lleva type
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

  #TODO: mejor que se envie el id del historial
  #TODO: el estudio no tiene type, envio el diagnostico, o le metemos type
  def study_list(conn, %{"clinical_id" => history_id}) do
    query = from s in ClinicApp.Study,
            where: s.clinical_history_id == ^history_id,
            select: s
    studies = ClinicApp.Repo.all(query)
    render(conn, "study_list.json", studies: studies)
  end
end
