defmodule ClinicApp.Clinic do
  use Ecto.Schema

  schema "clinic" do
    field :name
    field :address
    field :phone
    field :manager
    field :email
    field :open_time
    field :close_time
    field :open_days

    has_many :clinical_histories, ClinicApp.ClinicalHistory
  end
end
