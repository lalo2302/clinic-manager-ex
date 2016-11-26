defmodule ClinicApp.Router do
  use ClinicApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ClinicApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/login", ClinicApp.SesionController, :login
    get "/drug/status", ClinicApp.StockController, :status
    get "/drug", ClinicApp.RetrieveController, :drug
    get "/appointment/existent", ClinicApp.RetrieveController, :existent_appointment
    get "/appointment/day", ClinicApp.RetrieveController, :show_day
    get "/appointment/:id", ClinicApp.RetrieveController, :show_appointment
    get "/patient", ClinicApp.RetrieveController, :all_patients
    get "/patient/:id/appointments", ClinicApp.RetrieveController, :show_patient_appointments
    get "/specialty", ClinicApp.RetrieveController, :show_specialties
    get "/doctor", ClinicApp.RetrieveController, :show_doctors
    get "/history", ClinicApp.RetrieveController, :show_clinical_history
    get "/study/:id", ClinicApp.RetrieveController, :show_study
    get "/clinic", ClinicApp.RetrieveController, :show_clinics
    get "/study/list", ClinicApp.RetrieveController, :study_list

    post "/drug/order", ClinicApp.StockController, :place_order
    post "/appointment", ClinicApp.CreateController, :appointment
    post "/patient", ClinicApp.CreateController, :patient
    post "/user", ClinicApp.CreateController, :user
    post "/employee", ClinicApp.CreateController, :employee
    post "/antecedent", ClinicApp.CreateController, :antecedent
    post "/ailment", ClinicApp.CreateController, :ailment
    post "/exploration", ClinicApp.CreateController, :exploration
    post "/study", ClinicApp.CreateController, :study

    put "/appointment/rate", ClinicApp.UpdateController, :rate_appointment
    put "/ailment/end", ClinicApp.UpdateController, :end_ailment
  end

  # Other scopes may use custom stacks.
  # scope "/api", ClinicApp do
  #   pipe_through :api
  # end
end
