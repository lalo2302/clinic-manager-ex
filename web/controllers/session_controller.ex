defmodule ClinicApp.SessionController do
  use ClinicApp.Web, :controller

  def login(conn, %{"username" => username, "password" => password}) do
    text conn, "login"
  end
end
