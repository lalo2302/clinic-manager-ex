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

  @required_fields ~w(username password)
  @optional_field ~w()

  def patient_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> put_change(:level, ClinicApp.LevelType.patient)
    |> unique_constraint(:username, name: "UC_User_Name")
  end

  def doctor_changeset(model, params) do
    model
    |> cast(params, @required_fields)
    |> put_change(:level, ClinicApp.LevelType.doctor)
    |> unique_constraint(:username, name: "UC_User_Name")
  end

  defp unique_username(username) do
    
  end
end
