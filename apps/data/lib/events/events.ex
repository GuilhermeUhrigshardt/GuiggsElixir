defmodule Data.Events do
    use Ecto.Schema

    import Ecto.Changeset

    schema "events" do
        field :title, :string
        field :location, :string
        field :date, :utc_datetime
        field :description, :string

        timestamps()
    end

    @required_fields ~w(title location date)a
    @optional_fields ~w(description)a

    def changeset(event, params \\ %{}) do
        event
        |> cast(params, @required_fields ++ @optional_fields)
        |> validate_required(@required_fields)
        |> validate_change(:date, &must_be_future/2)
    end

    defp must_be_future(_, date) do
        Date.compare(date, DateTime.utc_now)
        |> get_error
    end

    defp get_error(:lt), do: [date: "Cannot be in the past"]
    defp get_error(_), do: []
end