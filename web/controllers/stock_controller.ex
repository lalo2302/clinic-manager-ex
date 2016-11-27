defmodule ClinicApp.StockController do
  use ClinicApp.Web, :controller

  def status(conn, _params) do
    text conn, "status"
  end

  def place_order(conn, _params) do
    text conn, "place order"
  end
end
