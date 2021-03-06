defmodule Rocketpay.NumbersTest do
  # Every tests is necessary to use the following module
  use ExUnit.Case

  # Alias for module that will be tested
  alias Rocketpay.Numbers

  # name of function with slash and numbers of arguments
  describe "sum_from_file/1" do
    test "When there is a file with given name, return the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "When there is no file with given name, return the sum of numbers" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Invalid File!"}}

      assert response == expected_response
    end
  end
end