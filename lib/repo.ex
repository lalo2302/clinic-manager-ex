defmodule ClinicApp.Repo do
  use Ecto.Repo,
  otp_app: :clinic_app,
  adapter: Tds.Ecto

  def after_connect(conn) do
      Tds.Ecto.Connection.query(conn, "SET LANGUAGE English", [], [])
  end
end
