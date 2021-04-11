defmodule GuiggsWeb.EventController do
    use GuiggsWeb, :controller

    def show(conn, %{"id" => id}) do
        event = Data.EventQueries.get_by_id(id)
        |> IO.inspect()
        
        render conn, "details.html", event: event
    end
end