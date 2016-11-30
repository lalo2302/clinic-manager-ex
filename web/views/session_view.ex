defmodule ClinicApp.SessionView do
  use ClinicApp.Web, :view

  #TODO: Enviar id del paciente, level e historial(clinical_history_id)
  def render("login.json", %{user: user, clinical_history: clinical_history}) do
    patient = user.patient
    %{person_id: patient.id,
     level: String.trim(user.level),
      clinical_history_id: clinical_history.id}
  end
end
