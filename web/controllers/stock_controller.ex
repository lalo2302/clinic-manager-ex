defmodule ClinicApp.StockController do
  use ClinicApp.Web, :controller
  import Ecto.Query

  def status(conn, _params) do
    query = from d in ClinicApp.Drug,
            where: d.quantity <= 10,
            select: d
    drugs = ClinicApp.Repo.all(query)
    if is_nil(drugs) do
      text conn, "false"
    else
      render(conn, "drugs_status.json", %{drugs: drugs})
    end
  end

  def place_order(conn, _params) do
    text conn, "place order"
  end
end
