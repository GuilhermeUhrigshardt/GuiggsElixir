defmodule GuiggsWeb.EventView do
    use GuiggsWeb, :view

    def format_date(date) do
        "#{date.day}/#{date.month}/#{date.year}"
    end
end