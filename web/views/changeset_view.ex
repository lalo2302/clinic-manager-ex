defmodule ClinicApp.ChangesetView do
  use ClinicApp.Web, :view

  def render("error.json", %{changeset: changeset}) do
    %{errors: changeset}
  end
end
