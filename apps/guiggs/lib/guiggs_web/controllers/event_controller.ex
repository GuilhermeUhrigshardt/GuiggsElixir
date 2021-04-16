defmodule GuiggsWeb.EventController do
    use GuiggsWeb, :controller

    plug GuiggsWeb.AuthorizedPlug, "Guilherme" when action in [:create]

    def list(conn, _params) do
        events = Data.EventQueries.get_all
        |> IO.inspect()

        render conn, "list.html", events: events
    end

    def show(conn, %{"id" => id}) do
        event = Data.EventQueries.get_by_id(id)
        |> IO.inspect()

        render conn, "details.html", event: event
    end

    def create(conn, %{errors: errors}) do
        render conn, "create.html", changeset: errors
    end

    def create(conn, _params) do
        changeset = Data.Events.changeset(%Data.Events{}, %{})
        render conn, "create.html", changeset: changeset
    end

    def add(conn, %{"events" => events}) do
        events = Map.update!(events, "date", fn d -> d <> ":00" end)

        changeset = Data.Events.changeset(%Data.Events{}, events)
        case Data.EventQueries.create changeset do
            {:ok, %{id: id}} -> redirect conn, to: Routes.event_path(conn, :show, id)
            {:error, reasons} -> create conn, %{errors: reasons}
        end
    end
end
