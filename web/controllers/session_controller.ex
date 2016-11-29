defmodule ClinicApp.SessionController do
  use ClinicApp.Web, :controller

  def login(conn, %{"username" => username, "password" => password}) do
    user = ClinicApp.User
          |> ClinicApp.Repo.get_by(%{username: username, password: password})
    json conn, %{level: user.level}
  end
end
