defmodule ClinicApp.UpdateController do
  use ClinicApp.Web, :controller

  def rate_appointment(conn, _params) do
    text conn, "rate appointment"
  end

  def end_ailment(conn, _params) do
    text conn, "end ailment"
  end
end
