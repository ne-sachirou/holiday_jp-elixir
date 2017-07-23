defmodule HolidayJp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :holiday_jp,
      version: "0.2.2",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      dialyzer: [
        ignore_warnings: "dialyzer.ignore-warnings",
      ],
      # Docs
      name: "HolidayJp",
      source_url: "https://github.com/ne-sachirou/holiday_jp-elixir",
      homepage_url: "https://hexdocs.pm/holiday_jp",
      docs: [
        main: "readme",
        extras: ["README.md"],
      ],
    ]
  end

  def application do
    [
      extra_applications: [],
      mod: {HolidayJp.Application, []},
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev},
      {:inner_cotton, github: "ne-sachirou/inner_cotton", only: [:dev, :test], runtime: false},
      {:relax_yaml, "~> 0.1", only: :dev},
    ]
  end

  defp description do
    """
    Japanese holiday.
    """
  end

  defp package do
    [
      licenses: ["GPL-3.0"],
      name: :holiday_jp,
      maintainers: ["ne_Sachirou <utakata.c4se@gmail.com>"],
      links: %{
        "GitHub": "https://github.com/ne-sachirou/holiday_jp-elixir",
      },
      files: ["LICENSE", "README.md", "mix.exs", "priv", "lib/holiday_jp.ex", "lib/holiday_jp"],
    ]
  end
end
