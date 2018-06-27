defmodule ApiWeb.PersonController do
  use ApiWeb, :controller

  alias Api.Lists
  alias Api.Lists.Person

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    persons = Lists.list_persons()
    render(conn, "index.json", persons: persons)
  end

  def create(conn, %{"person" => person_params}) do
    with {:ok, %Person{} = person} <- Lists.create_person(person_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", person_path(conn, :show, person))
      |> render("show.json", person: person)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Lists.get_person!(id)
    render(conn, "show.json", person: person)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Lists.get_person!(id)

    with {:ok, %Person{} = person} <- Lists.update_person(person, person_params) do
      render(conn, "show.json", person: person)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Lists.get_person!(id)
    with {:ok, %Person{}} <- Lists.delete_person(person) do
      send_resp(conn, :no_content, "")
    end
  end
end
