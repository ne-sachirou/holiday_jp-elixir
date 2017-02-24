HolidayJp
==
Japanese holiday.

[![Hex.pm](https://img.shields.io/hexpm/v/holiday_jp.svg)](https://hex.pm/packages/holiday_jp)
[![Build Status](https://travis-ci.org/ne-sachirou/holiday_jp-elixir.svg?branch=master)](https://travis-ci.org/ne-sachirou/holiday_jp-elixir)

This is an Elixir port of [holiday-jp/holiday_jp-ruby](https://github.com/holiday-jp/holiday_jp-ruby), using holiday data of [holiday-jp/holiday_jp](https://github.com/holiday-jp/holiday_jp).

Installation
--
Add `holiday_jp` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:holiday_jp, "~> 0.2"}]
end
```

Add `holiday_jp` to your supervision tree in `mix.exs`.

```elixir
def applications do
  [applications: [:holiday_jp]]
end
```

And fetch dependencies.

```sh
mix deps.get
```

Usage
--
```elixir
iex> HolidayJp.between ~D[2016-03-01], ~D[2016-03-31]
[
  %HolidayJp.Holiday{date: ~D[2016-03-20], name: "春分の日", name_en: "Vernal Equinox Day", week: "日", week_en: "Sunday"},
  %HolidayJp.Holiday{date: ~D[2016-03-21], name: "振替休日", name_en: "Holiday in lieu", week: "月", week_en: "Monday"},
]

iex> HolidayJp.holiday? ~D[2017-01-02]
true

iex> HolidayJp.holiday? ~D[2016-01-02]
false

iex> HolidayJp.on ~D[2017-02-11]
[%HolidayJp.Holiday{date: ~D[2017-02-11], name: "建国記念の日", name_en: "National Foundation Day", week: "土", week_en: "Saturday"}]

iex> HolidayJp.on ~D[2017-02-13]
[]
```
