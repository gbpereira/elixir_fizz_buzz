defmodule FizzBuzz do
  @moduledoc """
  Documentation for `FizzBuzz`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FizzBuzz.hello()
      :world

  """
  def hello do
    :world
  end

  # def build(file_name) do
  #   case File.read(file_name) do
  #     {:ok, result} -> result
  #     {:error, err} -> err
  #   end
  # end

  # def build(file_name) do
  #   file = File.read(file_name)
  #   handle_file_read(file)
  # end

  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  # def handle_file_read({:ok, result}), do: result
  # def handle_file_read({:ok, result}) do
  #   string = String.trim_trailing(result)
  #   list = String.split(string, ",")

  #   Enum.map(list, &String.to_integer/1)
  # end
  def handle_file_read({:ok, result}) do
    String.trim_trailing(result)
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_number/1)
  end

  def handle_file_read({:error, err}), do: "Error reading the file: #{err}"

  def convert_and_evaluate_number(number) do
    # n = String.to_integer(number)
    # eval_number(n)

    number
    |> String.to_integer()
    |> eval_number()
  end

  def eval_number(number) when rem(number, 3) == 0, do: :fizz
  def eval_number(number) when rem(number, 5) == 0, do: :buzz
  def eval_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  def eval_number(number), do: number
end
