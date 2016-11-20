defmodule LinearRegression.Functions do
  def fit(data_set_x, data_set_y) do
    m = slope(data_set_x, data_set_y)
    c = intercept(data_set_x, data_set_y, m)

    {m, c}
  end

  defp slope(data_set_x, data_set_y) do
    mean_x = mean(data_set_x)
    mean_y = mean(data_set_y)

    numerator = (mean_x * mean_y) - mean(multiply(data_set_x, data_set_y))
    denominator = (mean_x * mean_x) - mean(multiply(data_set_x, data_set_x))

    numerator / denominator
  end

  defp intercept(data_set_x, data_set_y, slope) do
    mean(data_set_y) - slope * mean(data_set_x)
  end

  defp mean(data_set) do
    sum(data_set) / count(data_set)
  end

  defp sum(data_set) do
    Enum.sum(data_set)
  end

  defp count(data_set) do
    Enum.count(data_set)
  end

  defp multiply(data_set_x, data_set_y) do
    data_set_x
    |> Enum.zip(data_set_y)
    |> Enum.map(fn ({a, b}) -> a * b end)
  end
end
