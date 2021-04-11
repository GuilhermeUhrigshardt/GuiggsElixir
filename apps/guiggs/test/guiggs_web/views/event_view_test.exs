defmodule GuiggsWeb.EventViewTest do
    use GuiggsWeb.ConnCase, async: true

    @tag current: true
    test "should convert a date to dd/MM/yyyy format" do
        assert DateTime.from_iso8601("2021-08-18T00:00:00Z")
        |> elem(1)
        |> GuiggsWeb.EventView.format_date
        == "18/8/2021"
    end
end