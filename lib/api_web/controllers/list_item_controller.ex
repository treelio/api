defmodule ApiWeb.ListItemController do
  use ApiWeb, :controller

  alias Api.Lists
  alias Api.Lists.ListItem

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    list_items = Lists.list_list_items()
    render(conn, "index.json", list_items: list_items)
  end

  def create(conn, %{"list_item" => list_item_params}) do
    with {:ok, %ListItem{} = list_item} <- Lists.create_list_item(list_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", list_item_path(conn, :show, list_item))
      |> render("show.json", list_item: list_item)
    end
  end

  def show(conn, %{"id" => id}) do
    list_item = Lists.get_list_item!(id)
    render(conn, "show.json", list_item: list_item)
  end

  def update(conn, %{"id" => id, "list_item" => list_item_params}) do
    list_item = Lists.get_list_item!(id)

    with {:ok, %ListItem{} = list_item} <- Lists.update_list_item(list_item, list_item_params) do
      render(conn, "show.json", list_item: list_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    list_item = Lists.get_list_item!(id)
    with {:ok, %ListItem{}} <- Lists.delete_list_item(list_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
