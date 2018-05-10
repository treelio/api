defmodule ApiWeb.PersonControllerTest do
  use ApiWeb.ConnCase

  alias Api.Lists
  alias Api.Lists.Person

  @create_attrs %{first_name: "Charlie"}
  @update_attrs %{first_name: "Paul"}
  @invalid_attrs %{first_name: "c"}

  def fixture(:person) do
    {:ok, person} = Lists.create_person(@create_attrs)
    person
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn = get(conn, person_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person" do
    test "renders person when data is valid", %{conn: conn} do
      conn = post(conn, person_path(conn, :create), person: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, person_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, person_path(conn, :create), person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person" do
    setup [:create_person]

    test "renders person when data is valid", %{conn: conn, person: %Person{id: id} = person} do
      conn = put(conn, person_path(conn, :update, person), person: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, person_path(conn, :show, id))
      assert json_response(conn, 200)["data"] == %{"id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, person: person} do
      conn = put(conn, person_path(conn, :update, person), person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person" do
    setup [:create_person]

    test "deletes chosen person", %{conn: conn, person: person} do
      conn = delete(conn, person_path(conn, :delete, person))
      assert response(conn, 204)

      assert_error_sent(404, fn ->
        get(conn, person_path(conn, :show, person))
      end)
    end
  end

  defp create_person(_) do
    person = fixture(:person)
    {:ok, person: person}
  end
end
