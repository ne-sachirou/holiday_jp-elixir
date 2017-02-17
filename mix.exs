defmodule HolidayJp.Mixfile do
  use Mix.Project

  def project do
    [app: :holiday_jp,
     version: "0.1.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps(),
     # Docs
     name: "HolidayJp",
     source_url: "https://github.com/ne-sachirou/holiday_jp-elixir",
     homepage_url: "https://hexdocs.pm/holiday_jp",
     docs: [main: "HolidayJp"]]
  end

  def application do
    [
      extra_applications: [],
      mod: {HolidayJp.Application, []}
    ]
  end

  defp deps do
    [
      {:dogma, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.14", only: :dev},
      {:yaml_elixir, "~> 1.3", only: :dev},
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
      files: [
        "lib",
        "LICENSE",
        "mix.exs",
        "priv",
        "README.md",
      ],
    ]
  end
end
