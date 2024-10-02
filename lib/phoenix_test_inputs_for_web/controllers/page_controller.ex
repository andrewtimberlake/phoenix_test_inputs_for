defmodule PhoenixTestInputsForWeb.PageController do
  use PhoenixTestInputsForWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
