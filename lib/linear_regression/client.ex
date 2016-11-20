defmodule LinearRegression.Client do
  def start_link do
    GenServer.start_link(LinearRegression.Server, :ok, [])
  end

  def fit(pid, data_set) do
    GenServer.cast(pid, {:fit, data_set})
  end

  def predict(pid, x) do
    GenServer.call(pid, {:predict, x})
  end
end
