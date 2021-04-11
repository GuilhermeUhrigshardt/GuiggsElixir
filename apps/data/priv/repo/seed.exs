unless(Data.EventQueries.any) do
    Data.EventQueries.create(Data.Events.changeset(%Data.Events{}, %{date: "2021-08-18T00:00:00Z", title: "My birthday", location: "My house"}))
    Data.EventQueries.create(Data.Events.changeset(%Data.Events{}, %{date: "2021-12-07T00:00:00Z", title: "My sisters birthday", location: "Her house"}))
    Data.EventQueries.create(Data.Events.changeset(%Data.Events{}, %{date: "2022-01-20T00:00:00Z", title: "My moms birthday", location: "Her house"}))
    Data.EventQueries.create(Data.Events.changeset(%Data.Events{}, %{date: "2021-07-13T00:00:00Z", title: "My dads birthday", location: "His house"}))
end