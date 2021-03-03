defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  # There is a method up and down, like laravel
  def change do
    create table :users do
      add :name, :string
      add :age, :string
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
