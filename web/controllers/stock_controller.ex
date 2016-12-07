defmodule ClinicApp.StockController do
  use ClinicApp.Web, :controller
  import Ecto.Query

  def status(conn, _params) do
    query = from d in ClinicApp.Drug,
            where: d.quantity <= 10,
            select: d
    drugs = ClinicApp.Repo.all(query)
    if Enum.empty?(drugs) do
      json conn, %{result: false} 
    else
      render(conn, "drugs_status.json", %{drugs: drugs})
    end
  end

  def place_order(conn, %{"drugs" => params}) do
    wsdl_url = "IP OF SOAP SERVICE"
    action = "ACTION"
    parameters = [params[:name],params[:quantity]]

    Detergentex.call(wsdl_url, action, parameters)
  end
end
