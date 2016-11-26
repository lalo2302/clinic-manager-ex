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

    get "/login", SesionController, :login
    get "/drug/status", StockController, :status
    get "/drug", RetrieveController, :drug
    get "/appointment/existent", RetrieveController, :existent_appointment
    get "/appointment/day", RetrieveController, :show_day
    get "/appointment/:id", RetrieveController, :show_appointment
    get "/patient", RetrieveController, :all_patients
    get "/patient/:id/appointments", :show_patient_appointments
    get "/specialty", RetrieveController, :show_specialties
    get "/doctor", RetrieveController, :show_doctors
    get "/history", RetrieveController, :show_clinical_history
    get "/study/:id", RetrieveController, :show_study
    get "/clinic", RetrieveController, :show_clinics
    get "/study/list", RetrieveController, :study_list

    post "/drug/order", StockController, :place_order
    post "/appointment", CreateController, :appointment
    post "/patient", CreateController, :patient
    post "/user", CreateController, :user
    post "/employee", CreateController, :employee
    post "/antecedent", CreateController, :antecedent
    post "/ailment", CreateController, :ailment
    post "/exploration", CreateController, :exploration
    post "/study", CreateController, :study

    put "/appointment/rate", UpdateController, :rate_appointment
    put "/ailment/end", UpdateController, :end_ailment
  end

  # Other scopes may use custom stacks.
  # scope "/api", ClinicApp do
  #   pipe_through :api
  # end
end
