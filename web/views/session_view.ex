defmodule ClinicApp.SessionView do
  use ClinicApp.Web, :view

  #TODO: Enviar id del paciente, level e historial(clinical_history_id)
  def render("user_login.json", %{user: user, clinical_history: clinical_history}) do
    %{user: render(ClinicApp.SessionView, "patient.json", %{user: user, clinical_history: clinical_history})}
  end

  def render("employee_login.json", %{employee: employee, level: level}) do
    %{user: render(ClinicApp.SessionView, "employee.json", %{employee: employee, level: level})}
  end

  def render("employee.json", %{employee: employee, level: level}) do
    %{id: employee.id,
     name: employee.name,
     level: level}
  end

  def render("patient.json", %{user: user, clinical_history: history}) do
    patient = user.patient
   %{patient_id: patient.id,
   level: String.trim(user.level),
  clinical_history_id: history.id} 
  end
end
