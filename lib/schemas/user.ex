defmodule ClinicApp.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username
    field :password
    field :level

    has_one :patient, ClinicApp.Patient
    has_one :employee, ClinicApp.Employee
  end

  @optional_field ~w()

  def patient_changeset(model, params) do
    required_params = ~w(username password)
    model
    |> cast(params, required_params)
    |> put_change(:level, ClinicApp.LevelType.patient)
    |> unique_constraint(:username, name: "UC_User_Name")
  end

  def doctor_changeset(model, params) do
    required_params = ~w(username password)
    model
    |> cast(params, required_params)
    |> put_change(:level, ClinicApp.LevelType.doctor)
    |> unique_constraint(:username, name: "UC_User_Name")
  end

  def admin_changeset(model, params) do
    required_params = ~w(username password)
    model
    |> cast(params, required_params)
    |> put_change(:level, ClinicApp.LevelType.administrative)
    |> unique_constraint(:username, name: "UC_User_Name")
  end
end
