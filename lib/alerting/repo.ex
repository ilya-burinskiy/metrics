defmodule Alerting.Repo do
  use Ecto.Repo,
    otp_app: :alerting,
    adapter: Ecto.Adapters.Postgres
end
