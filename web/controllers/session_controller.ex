defmodule ClinicApp.SessionController do
  use ClinicApp.Web, :controller
  import Ecto.Query, only: [from: 2]

  def login(conn, %{"username" => username, "password" => password}) do
    query = from u in ClinicApp.User,
            where: u.username == ^username,
            where: u.password == ^password,
            preload: [:patient],
            select: u
    user = hd(ClinicApp.Repo.all(query))
    clinical_history = get_clinical_history(user: user)
    render(conn, "login.json", %{user: user, clinical_history: clinical_history})
  end

  defp get_clinical_history(user: user) do
    patient = user.patient
    clinical_history = ClinicApp.Repo.get_by(ClinicApp.ClinicalHistory, patient_id: patient.id)
    clinical_history 
  end
end
