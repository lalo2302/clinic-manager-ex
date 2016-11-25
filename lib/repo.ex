defmodule ClinicApp.Repo do
  use Ecto.Repo,
  otp_app: :clinic_app,
  adapter: Tds.Ecto
end
