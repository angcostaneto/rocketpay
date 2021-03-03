# User Schema
defmodule Rocketpay.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  # This is a varaible module, is like a global variable, and :something is called atons, there is a constant string
  @required_params [:name, :age, :email, :password, :nickname]

  # Binary id, means we gona use UUUID
  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :name, :string
    field :age, :string
    field :email, :string
    # This is virtual field, he only exists on schema but not on database
    field :password, :string
    field :password_hash, :string
    field :nickname, :string
  end

  # This is like validation
  # Map data and validate data
  def changeset(params) do
    # This %__MODULE__{} means, this is an empty struct
    %__MODULE__{}
    # Cast verify if all params was passed
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_number(:age, greater_than_or_equal: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:nickname])
    |> put_password_hash()
  end

  # _params, means this param is optional, like params = null
  # defp means that this is a private function
  # defp put_password_hash(_params) do
  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
