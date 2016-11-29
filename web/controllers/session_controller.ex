defmodule ClinicApp.SessionController do
  use ClinicApp.Web, :controller

  def login(conn, _params) do
    text conn, "login"
  end
end
