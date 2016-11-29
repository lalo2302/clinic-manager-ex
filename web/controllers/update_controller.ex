defmodule ClinicApp.UpdateController do
  use ClinicApp.Web, :controller

  def rate_appointment(conn, %{"id" => appointment_id}) do
    text conn, "rate appointment"
  end

  def end_ailment(conn, %{"id" => ailment_id}) do
    text conn, "end ailment"
  end
end
