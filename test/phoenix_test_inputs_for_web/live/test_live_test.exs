defmodule PhoenixTestInputsForWeb.TestLiveTest do
  use PhoenixTestInputsForWeb.ConnCase

  import PhoenixTest

  test "add items", %{conn: conn} do
    conn
    |> visit("/test")
    |> assert_has("h1", text: "PhoenixTestInputsFor")
    |> check("add more")
    |> fill_in("[name='model[items][0][name]']", "Name", with: "Item 1")
    |> check("add more")
    |> fill_in("[name='model[items][1][name]']", "Name", with: "Item 2")
    |> check("add more")
    |> fill_in("[name='model[items][2][name]']", "Name", with: "Item 3")
    |> submit()
  end
end
