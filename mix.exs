defmodule HolidayJp.Mixfile do
  use Mix.Project

  def project do
    [app: :holiday_jp,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
      extra_applications: [:yaml_elixir],
      mod: {HolidayJp.Application, []}
    ]
  end

  defp deps do
    [{:yaml_elixir, "~> 1.3"}]
  end
end
