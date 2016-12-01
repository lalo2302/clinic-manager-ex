defmodule ClinicApp.CreateView do
  use ClinicApp.Web, :view

  def render("user.json", %{user: user}) do
    %{result: "true"}
  end

  def render("employee.json", %{id: id}) do
    %{id: id}
  end

  def render("antecedent.json", %{antecedent: antecedent}) do
    %{id: antecedent.id}
  end
end
