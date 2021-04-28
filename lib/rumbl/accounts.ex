defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context
  """
  alias Rumbl.Repo
  alias Rumbl.Accounts.User

  # def list_users do
  #   [
  #     %User{id: "1", name: "Salvador", username: "saherla"},
  #     %User{id: "2", name: "Payton", username: "pay"},
  #     %User{id: "3", name: "Yaren", username: "yaren"},
  #   ]
  # end

  def get_user(id) do
    # Enum.find(list_users(), fn user -> user.id == id end)
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    # Enum.find(list_users(), fn user ->
    #   Enum.all?(params, fn {key, val} -> Map.get(user, key) == val end)
    # end)
    Repo.get_by(User, params)
  end

  def list_users do
    Repo.all(User)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def change_registration(%User{} = user, params) do
    User.registration_changeset(user, params)
  end

  def register_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end
end