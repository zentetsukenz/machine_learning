defmodule LinearRegression.Server do
  use GenServer

  def init(:ok) do
    {:ok, %{slope: nil, intercept: nil}}
  end

  def handle_cast({:fit, data_set}, state) do
    {data_set_x, data_set_y} = data_set
    {slope, intercept} = LinearRegression.Functions.fit(data_set_x, data_set_y)
    {:noreply, %{state | slope: slope, intercept: intercept}}
  end

  def handle_call({:predict, x}, _from, state) do
    %{slope: slope, intercept: intercept} = state
    {:reply, slope * x + intercept, state}
  end
end
