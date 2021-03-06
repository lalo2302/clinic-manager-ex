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
    pipe_through :api # Use the default browser stack

    get "/", PageController, :index

    get "/login", SessionController, :login

    get "/drug/status", StockController, :status
    post "/drug/order", StockController, :place_order

    get "/drug", RetrieveController, :show_drugs
    get "/appointment/existent", RetrieveController, :existent_appointments
    get "/appointment/day", RetrieveController, :show_appointment_day
    get "/appointment/:id", RetrieveController, :show_appointment
    get "/patient", RetrieveController, :all_patients
    get "/patient/:id", RetrieveController, :patient
    get "/patient/:id/past/appointments", RetrieveController, :show_patient_past_appointments
    get "/patient/:id/post/appointments", RetrieveController, :show_patient_post_appointments
    get "/specialty", RetrieveController, :show_specialties
    get "/doctor", RetrieveController, :show_doctors
    get "/history", RetrieveController, :show_clinical_history
    get "/study/:id", RetrieveController, :show_study
    get "/clinic", RetrieveController, :show_clinics
    get "/study/list/:clinical_id", RetrieveController, :study_list

    # POST
    post "/appointment", CreateController, :appointment
    post "/patient", CreateController, :patient
    post "/doctor/user", CreateController, :doctor_user
    post "/administrative/user", CreateController, :admin_user
    post "/patient/user", CreateController, :patient_user
    post "/employee", CreateController, :employee
    post "/antecedent", CreateController, :antecedent
    post "/ailment", CreateController, :ailment
    post "/exploration", CreateController, :exploration
    post "/study", CreateController, :study

    # PATCH
    get "/appointment/:id/rate", UpdateController, :rate_appointment
    put "/ailment/end", UpdateController, :end_ailment
  end

  # Other scopes may use custom stacks.
  # scope "/api", ClinicApp do
  #   pipe_through :api
  # end
end
