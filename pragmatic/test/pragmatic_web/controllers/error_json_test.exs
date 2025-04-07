defmodule PragmaticWeb.ErrorJSONTest do
  use PragmaticWeb.ConnCase, async: true

  test "renders 404" do
    assert PragmaticWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PragmaticWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Errordddddddd"}}
  end
end
