defmodule ClinicApp.SessionController do
  use ClinicApp.Web, :controller
  import Ecto.Query, only: [from: 2]

  def login(conn, %{"username" => username, "password" => password}) do
    query = from u in ClinicApp.User,
            where: u.username == ^username,
            where: u.password == ^password,
            preload: [:patient],
            preload: [:employee],
            select: u
    user = hd(ClinicApp.Repo.all(query))
    unless is_nil(user.patient) do
      clinical_history = get_clinical_history(user: user)
      render(conn, "user_login.json", %{user: user, clinical_history: clinical_history})
    else
      render(conn, "employee_login.json", %{employee: user.employee, level: user.level})
    end
  end

  defp get_clinical_history(user: user) do
    patient = user.patient
    clinical_history = ClinicApp.Repo.get_by(ClinicApp.ClinicalHistory, patient_id: patient.id)
    clinical_history 
  end
end
