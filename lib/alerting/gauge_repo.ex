defmodule Alerting.GaugeRepo do
  def new, do: %{}
  def put(repo, k, v), do: Map.put(repo, k, v)
  def get(repo, k), do: repo[k]
end
