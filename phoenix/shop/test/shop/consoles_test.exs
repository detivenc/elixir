defmodule Shop.ConsolesTest do
  use Shop.DataCase

  alias Shop.Consoles

  describe "consoles" do
    alias Shop.Consoles.Console

    import Shop.ConsolesFixtures

    @invalid_attrs %{name: nil, price: nil}

    test "list_consoles/0 returns all consoles" do
      console = console_fixture()
      assert Consoles.list_consoles() == [console]
    end

    test "get_console!/1 returns the console with given id" do
      console = console_fixture()
      assert Consoles.get_console!(console.id) == console
    end

    test "create_console/1 with valid data creates a console" do
      valid_attrs = %{name: "some name", price: 42}

      assert {:ok, %Console{} = console} = Consoles.create_console(valid_attrs)
      assert console.name == "some name"
      assert console.price == 42
    end

    test "create_console/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Consoles.create_console(@invalid_attrs)
    end

    test "update_console/2 with valid data updates the console" do
      console = console_fixture()
      update_attrs = %{name: "some updated name", price: 43}

      assert {:ok, %Console{} = console} = Consoles.update_console(console, update_attrs)
      assert console.name == "some updated name"
      assert console.price == 43
    end

    test "update_console/2 with invalid data returns error changeset" do
      console = console_fixture()
      assert {:error, %Ecto.Changeset{}} = Consoles.update_console(console, @invalid_attrs)
      assert console == Consoles.get_console!(console.id)
    end

    test "delete_console/1 deletes the console" do
      console = console_fixture()
      assert {:ok, %Console{}} = Consoles.delete_console(console)
      assert_raise Ecto.NoResultsError, fn -> Consoles.get_console!(console.id) end
    end

    test "change_console/1 returns a console changeset" do
      console = console_fixture()
      assert %Ecto.Changeset{} = Consoles.change_console(console)
    end
  end
end
