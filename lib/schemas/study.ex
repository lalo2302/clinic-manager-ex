defmodule ClinicApp.Study do
  use Ecto.Schema

  schema "study" do
    field :date, Ecto.Date
    field :diagnosis
    field :result
    field :indications
    field :treatment

    belongs_to :clinical_history, ClinicApp.ClinicalHistory
    belongs_to :employee, ClinicApp.Employee

    has_many :images, ClinicApp.Image
  end
end
