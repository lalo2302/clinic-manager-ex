defmodule ClinicApp.Study do
  use Ecto.Schema

  schema "study" do
    field :date, :date
    field :diagnosis
    field :result
    field :indications
    field :treatment
  end
end
