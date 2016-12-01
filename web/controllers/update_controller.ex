defmodule ClinicApp.UpdateController do
  use ClinicApp.Web, :controller

  def rate_appointment(conn, %{"id" => appointment_id, "satisfaction" => rate}) do
    appointment = ClinicApp.Repo.get(ClinicApp.Appointment, appointment_id)
    appointment = %{appointment | satisfaction: String.to_integer(rate)} 
    case ClinicApp.Repo.update(appointment) do
      {:ok, app} -> render(conn, "update.json", %{update: appointment})
      {:error, error} -> render(conn, ClinicApp.ChagesetView, "error.json", %{changeset: appointment})
    end
  end

  def end_ailment(conn, %{"id" => ailment_id}) do
    ailment = ClinicApp.Repo.get(ClinicApp.Ailment, ailment_id)
    ailment = %{ailment | end_date: Ecto.Date.utc }
    case ClinicApp.Repo.update(ailment) do
      {:ok, ail} -> render(conn, "update.json", %{update: ailment})
      {:error, error} -> render(conn, ClinicApp.ChangesetView, "error.json", %{changeset: ailment})
    end
  end
end
