defmodule Ornia.WebWeb.PageController do
  use Ornia.WebWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
