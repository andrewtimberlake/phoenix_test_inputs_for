defmodule PhoenixTestInputsForWeb.TestLive do
  use PhoenixTestInputsForWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>PhoenixTestInputsFor</h1>
    </div>
    """
  end
end
