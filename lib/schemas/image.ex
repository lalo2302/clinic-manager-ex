defmodule ClinicApp.Image do
  use Ecto.Schema

  schema "image" do
    field :image, :binary

    belongs_to :study, ClinicApp.Study
  end
end
