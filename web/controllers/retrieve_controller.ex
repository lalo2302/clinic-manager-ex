defmodule ClinicApp.RetrieveController do
  use ClinicApp.Web, :controller

  def drug(conn, _params) do
    text conn, "drug"
  end

  def existent_appointment(conn, _params) do
    text conn, "existent appointment"
  end

  def show_day(conn, _params) do
    text conn, "show day"
  end

  def show_appointment(conn, _params) do
    text conn, "show appointment"
  end

  def all_patients(conn, _params) do
    text conn, "all patients"
  end

  def show_patient_appointments(conn, _params) do
    text conn, "show patient appointments"
  end

  def show_specialties(conn, _params) do
    text conn, "show specialties"
  end

  def show_doctors(conn, _params) do
    text conn, "show doctors"
  end

  def show_clinical_history(conn, _params) do
    text conn, "show clinical history"
  end

  def show_study(conn, _params) do
    text conn, "show study"
  end

  def show_clinics(conn, _params) do
    text conn, "show clinics"
  end

  def study_list(conn, _params) do
    text conn, "study list"
  end
end
