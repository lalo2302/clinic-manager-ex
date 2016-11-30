defmodule ClinicApp.StockView do
  use ClinicApp.Web, :view
  
  def render("drugs_status.json", %{drugs: drugs}) do
    %{drugs: render_many(drugs, ClinicApp.StockView, "drug.json")}
  end

  def render("drug.json", %{stock: drug}) do
    %{id: drug.id,
     name: drug.name,
     quantity: drug.quantity}
  end
end
