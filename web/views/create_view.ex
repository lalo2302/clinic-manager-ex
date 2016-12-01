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

  def render("ailment.json", %{ailment: ailment}) do
    %{id: ailment.id}
  end

  def render("exploration.json", %{exploration: exploration}) do
    %{id: exploration.id}
  end

  def render("appointment.json", %{appointment: appointment}) do
    %{id: appointment.id}
  end
end
