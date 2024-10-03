defmodule PhoenixTestInputsForWeb.TestLiveTest do
  use PhoenixTestInputsForWeb.ConnCase

  import PhoenixTest

  test "add items", %{conn: conn} do
    conn
    |> visit("/test")
    |> assert_has("h1", text: "PhoenixTestInputsFor")
    |> check("add more")
    |> fill_in("model[items][0][name]", with: "Item 1")
    |> check("add more")
    |> fill_in("model[items][1][name]", with: "Item 2")
    |> check("add more")
    |> fill_in("model[items][2][name]", with: "Item 3")
    |> submit()
  end
end
