defmodule ClinicApp.CreateView do
  use ClinicApp.Web, :view

  def render("user.json", %{user: user}) do
    %{result: "true"}
  end
end
