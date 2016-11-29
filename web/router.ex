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

    get "/drug/status", StockController, :status
    #POST stock
    get "/drug/order", StockController, :place_order

    get "/login", SessionController, :login

    get "/drug", RetrieveController, :drug
    get "/appointment/existent", RetrieveController, :existent_appointment
    get "/appointment/day", RetrieveController, :show_day
    get "/appointment/:id", RetrieveController, :show_appointment
    get "/patient", RetrieveController, :all_patients
    get "/patient/:id/appointments", RetrieveController, :show_patient_appointments
    get "/specialty", RetrieveController, :show_specialties
    get "/doctor", RetrieveController, :show_doctors
    get "/history", RetrieveController, :show_clinical_history
    get "/study/:id", RetrieveController, :show_study
    get "/clinic", RetrieveController, :show_clinics
    get "/study/list", RetrieveController, :study_list

    # POST
    get "/appointment", ClinicApp.CreateController, :appointment
    get "/patient", CreateController, :patient
    get "/user", CreateController, :user
    get "/employee", CreateController, :employee
    get "/antecedent", CreateController, :antecedent
    get "/ailment", CreateController, :ailment
    get "/exploration", CreateController, :exploration
    get "/study", CreateController, :study

    # PATCH
    patch "/appointment/rate", UpdateController, :rate_appointment
    patch "/ailment/end", UpdateController, :end_ailment
  end

  # Other scopes may use custom stacks.
  # scope "/api", ClinicApp do
  #   pipe_through :api
  # end
end
