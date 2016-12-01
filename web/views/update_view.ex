defmodule ClinicApp.UpdateView do
  use ClinicApp.Web, :view

  def render("update.json", %{update: update}) do
    %{id: update.id}
  end
end
