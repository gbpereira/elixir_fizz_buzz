defmodule FizzBuzz do
  def hello do
    :world
  end

  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}) do
    res = String.trim_trailing(result)
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_number/1)

    {:ok, res}
  end

  def handle_file_read({:error, err}), do: {:error, "Error reading the file: #{err}"}

  def convert_and_evaluate_number(number) do
    number
    |> String.to_integer()
    |> eval_number()
  end

  def eval_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  def eval_number(number) when rem(number, 3) == 0, do: :fizz
  def eval_number(number) when rem(number, 5) == 0, do: :buzz
  def eval_number(number), do: number
end
