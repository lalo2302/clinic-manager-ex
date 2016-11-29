defmodule ClinicApp.RetrieveController do
  use ClinicApp.Web, :controller

  def show_drugs(conn, _params) do
    text conn, "show drugs"
  end

  def existent_appointment(conn, %{"date" => date, "id_doctor" => doctor_id}) do
    text conn, "existent appointment"
  end

  def show_appointment_day(conn, %{"date" => date}) do
    text conn, "show appointment day"
  end

  def show_appointment(conn, %{"id" => appointment_id}) do
    text conn, "show appointment"
  end

  def all_patients(conn, _params) do
    text conn, "all patients"
  end

  def show_patient_appointments(conn, %{"id" => patient_id}) do
    text conn, "show patient appointments"
  end

  def show_specialties(conn, _params) do
    text conn, "show specialties"
  end

  def show_doctors(conn, _params) do
    text conn, "show doctors"
  end

  def show_clinical_history(conn, %{"id_patient" => patient_id}) do
    text conn, "show clinical history"
  end

  def show_study(conn, %{"id" => study_id}) do
    text conn, "show study"
  end

  def show_clinics(conn, _params) do
    text conn, "show clinics"
  end

  def study_list(conn, %{"id_patient" => patient_id}) do
    text conn, "study list"
  end
end
