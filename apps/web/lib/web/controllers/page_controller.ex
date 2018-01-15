defmodule Ornia.Web.PageController do
  use Ornia.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
