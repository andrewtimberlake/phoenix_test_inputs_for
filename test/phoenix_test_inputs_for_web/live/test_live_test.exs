defmodule PhoenixTestInputsForWeb.TestLiveTest do
  use PhoenixTestInputsForWeb.ConnCase

  import PhoenixTest

  test "displays the home page", %{conn: conn} do
    conn
    |> visit("/test")
    |> assert_has("h1", text: "PhoenixTestInputsFor")
  end
end
