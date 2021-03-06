defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  # The controller, uses pattern match with arrow like the next line
  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(conn)

  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Here is yout number #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
