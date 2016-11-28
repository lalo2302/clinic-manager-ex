# TODO: ASK FOR HOW THIS WILL BE CONSUMED
defmodule ClinicApp.ClinicalHistory do
  use Ecto.Schema

  schema "ClinicalHistory" do

    belongs_to :clinic, ClinicApp.Clinic
    belongs_to :patient, ClinicApp.Patient

    has_many :antecedents, ClinicApp.Antecedent
    has_many :ailments, ClinicApp.Ailment
    has_many :physical_explorations, ClinicApp.PhysicalExploration
    has_many :studies, ClinicApp.Study
  end
end
