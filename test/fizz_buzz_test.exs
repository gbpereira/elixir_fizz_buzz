defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      assertion = {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz, 11, :fizz, 13, 14, :fizzbuzz]}
      assert FizzBuzz.build("numbers.txt") == assertion
    end

    test "when an invalid file is provided, returns an error" do
      assert FizzBuzz.build("err.txt") == {:error, "Error reading the file: enoent"}
    end
  end
end
