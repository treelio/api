defmodule Api.ListsTest do
  use Api.DataCase

  alias Api.Lists

  describe "lists" do
    alias Api.Lists.List

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Lists.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Lists.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Lists.create_list(@valid_attrs)
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, list} = Lists.update_list(list, @update_attrs)
      assert %List{} = list
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_list(list, @invalid_attrs)
      assert list == Lists.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Lists.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Lists.change_list(list)
    end
  end

  describe "items" do
    alias Api.Lists.Item

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Lists.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Lists.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Lists.create_item(@valid_attrs)
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Lists.update_item(item, @update_attrs)
      assert %Item{} = item
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_item(item, @invalid_attrs)
      assert item == Lists.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Lists.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Lists.change_item(item)
    end
  end

  describe "list_items" do
    alias Api.Lists.ListItem

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def list_item_fixture(attrs \\ %{}) do
      {:ok, list_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_list_item()

      list_item
    end

    test "list_list_items/0 returns all list_items" do
      list_item = list_item_fixture()
      assert Lists.list_list_items() == [list_item]
    end

    test "get_list_item!/1 returns the list_item with given id" do
      list_item = list_item_fixture()
      assert Lists.get_list_item!(list_item.id) == list_item
    end

    test "create_list_item/1 with valid data creates a list_item" do
      assert {:ok, %ListItem{} = list_item} = Lists.create_list_item(@valid_attrs)
    end

    test "create_list_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_list_item(@invalid_attrs)
    end

    test "update_list_item/2 with valid data updates the list_item" do
      list_item = list_item_fixture()
      assert {:ok, list_item} = Lists.update_list_item(list_item, @update_attrs)
      assert %ListItem{} = list_item
    end

    test "update_list_item/2 with invalid data returns error changeset" do
      list_item = list_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_list_item(list_item, @invalid_attrs)
      assert list_item == Lists.get_list_item!(list_item.id)
    end

    test "delete_list_item/1 deletes the list_item" do
      list_item = list_item_fixture()
      assert {:ok, %ListItem{}} = Lists.delete_list_item(list_item)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_list_item!(list_item.id) end
    end

    test "change_list_item/1 returns a list_item changeset" do
      list_item = list_item_fixture()
      assert %Ecto.Changeset{} = Lists.change_list_item(list_item)
    end
  end

  describe "persons" do
    alias Api.Lists.Person

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Lists.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Lists.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Lists.create_person(@valid_attrs)
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, person} = Lists.update_person(person, @update_attrs)
      assert %Person{} = person
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_person(person, @invalid_attrs)
      assert person == Lists.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Lists.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Lists.change_person(person)
    end
  end
end
