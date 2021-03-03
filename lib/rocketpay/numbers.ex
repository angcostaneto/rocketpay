defmodule Rocketpay.Numbers do

  def sum_from_file(filename) do
    # This is one way
    # file = File.read("#{filename}.csv")
    # handle_file(file)
    # Another way
    # In pipe function, First line is always the first argument
    # And he is always passed as first arguments
    # In the functions on next lines
    "#{filename}.csv"
    |> File.read()
    |> handle_file()

  end

  # This is like if and else, but using pattern matching
  # defp handle_file({:ok, file}), do: file
  # defp handle_file({:error, _reason}), do: {:error, "Invalid File!"}
  defp handle_file({:ok, result}) do
    result =
        result
        |> String.split(",")
        # Stream only executes when is necessary, he is a lazy operator
        |> Stream.map(fn number -> String.to_integer(number) end)
        |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid File!"}}
  
end