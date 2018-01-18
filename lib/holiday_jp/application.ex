defmodule HolidayJp.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(HolidayJp.Holidays, [])
    ]

    opts = [strategy: :one_for_one, name: SampleSup.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
