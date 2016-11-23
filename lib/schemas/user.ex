defmodule ClinicApp.User do
  use Ecto.Schema

  schema "user" do
    field :username
    field :password
    field :access_level
  end
end
