defmodule ClinicApp.CreateController do
  use ClinicApp.Web, :controller

  def appointment(conn, _params) do
    text conn, "appointment"
  end

  def patient(conn, _params) do
    text conn, "patient"
  end

  def user(conn, _params) do
    text conn, "user"
  end

  def employee(conn, _params) do
    text conn, "employee"
  end

  def antecedent(conn, _params) do
    text conn, "antecedent"
  end

  def ailment(conn, _params) do
    text conn, "ailment"
  end

  def exploration(conn, _params) do
    text conn, "exploration"
  end

  def study(conn, _params) do
    text conn, "study"
  end
end
