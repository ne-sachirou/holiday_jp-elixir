defmodule HolidayJpTest do
  use ExUnit.Case
  doctest HolidayJp

  describe "HolidayJp.between/2" do
    test "it returns holidays in Japan between the start<= and <=the last" do
      expected = [
        %HolidayJp.Holiday{date: ~D[2017-01-01], name: "元日", name_en: "New Year's Day", week: "日", week_en: "Sunday"},
        %HolidayJp.Holiday{date: ~D[2017-01-02], name: "振替休日", name_en: "Holiday in lieu", week: "月", week_en: "Monday"},
        %HolidayJp.Holiday{date: ~D[2017-01-09], name: "成人の日", name_en: "Coming of Age Day", week: "月", week_en: "Monday"},
        %HolidayJp.Holiday{date: ~D[2017-02-11], name: "建国記念の日", name_en: "National Foundation Day", week: "土", week_en: "Saturday"},
        %HolidayJp.Holiday{date: ~D[2017-03-20], name: "春分の日", name_en: "Vernal Equinox Day", week: "月", week_en: "Monday"},
        %HolidayJp.Holiday{date: ~D[2017-04-29], name: "昭和の日", name_en: "Showa Day", week: "土", week_en: "Saturday"},
        %HolidayJp.Holiday{date: ~D[2017-05-03], name: "憲法記念日", name_en: "Constitution Memorial Day", week: "水", week_en: "Wednesday"},
        %HolidayJp.Holiday{date: ~D[2017-05-04], name: "みどりの日", name_en: "Greenery Day", week: "木", week_en: "Thursday"},
        %HolidayJp.Holiday{date: ~D[2017-05-05], name: "こどもの日", name_en: "Children's Day", week: "金", week_en: "Friday"},
        %HolidayJp.Holiday{date: ~D[2017-07-17], name: "海の日", name_en: "Marine Day", week: "月", week_en: "Monday"},
        %HolidayJp.Holiday{date: ~D[2017-08-11], name: "山の日", name_en: "Mountain Day", week: "金", week_en: "Friday"},
        %HolidayJp.Holiday{date: ~D[2017-09-18], name: "敬老の日", name_en: "Respect for the Aged Day", week: "月", week_en: "Monday"},
        %HolidayJp.Holiday{date: ~D[2017-09-23], name: "秋分の日", name_en: "Autumnal Equinox Day", week: "土", week_en: "Saturday"},
        %HolidayJp.Holiday{date: ~D[2017-10-09], name: "体育の日", name_en: "Health and Sports Day", week: "月", week_en: "Monday"},
        %HolidayJp.Holiday{date: ~D[2017-11-03], name: "文化の日", name_en: "National Culture Day", week: "金", week_en: "Friday"},
        %HolidayJp.Holiday{date: ~D[2017-11-23], name: "勤労感謝の日", name_en: "Labor Thanksgiving Day", week: "木", week_en: "Thursday"},
        %HolidayJp.Holiday{date: ~D[2017-12-23], name: "天皇誕生日", name_en: "Emperor's Birthday", week: "土", week_en: "Saturday"},
      ]
      assert HolidayJp.between(~D[2017-01-01], ~D[2017-12-31]) === expected
    end
  end

  describe "HolidayJp.holiday?/1" do
    test "it is true when the date is a holiday in Japan" do
      assert HolidayJp.holiday?(~D[2017-01-01])
      assert HolidayJp.holiday?(~D[2017-01-02])
      assert HolidayJp.holiday?(~D[2017-01-09])
      assert HolidayJp.holiday?(~D[2017-02-11])
      assert HolidayJp.holiday?(~D[2017-03-20])
      assert HolidayJp.holiday?(~D[2017-04-29])
      assert HolidayJp.holiday?(~D[2017-05-03])
      assert HolidayJp.holiday?(~D[2017-05-04])
      assert HolidayJp.holiday?(~D[2017-05-05])
      assert HolidayJp.holiday?(~D[2017-07-17])
      assert HolidayJp.holiday?(~D[2017-08-11])
      assert HolidayJp.holiday?(~D[2017-09-18])
      assert HolidayJp.holiday?(~D[2017-09-23])
      assert HolidayJp.holiday?(~D[2017-10-09])
      assert HolidayJp.holiday?(~D[2017-11-03])
      assert HolidayJp.holiday?(~D[2017-11-23])
      assert HolidayJp.holiday?(~D[2017-12-23])
    end

    test "it isn't true when the date isn't a holiday in Japan" do
      refute HolidayJp.holiday?(~D[2017-01-03])
      refute HolidayJp.holiday?(~D[2017-01-08])
      refute HolidayJp.holiday?(~D[2017-01-10])
      refute HolidayJp.holiday?(~D[2017-02-12])
      refute HolidayJp.holiday?(~D[2017-03-19])
      refute HolidayJp.holiday?(~D[2017-03-21])
      refute HolidayJp.holiday?(~D[2017-04-28])
      refute HolidayJp.holiday?(~D[2017-04-30])
      refute HolidayJp.holiday?(~D[2017-05-02])
      refute HolidayJp.holiday?(~D[2017-05-06])
      refute HolidayJp.holiday?(~D[2017-07-16])
      refute HolidayJp.holiday?(~D[2017-07-18])
      refute HolidayJp.holiday?(~D[2017-08-10])
      refute HolidayJp.holiday?(~D[2017-08-12])
      refute HolidayJp.holiday?(~D[2017-09-17])
      refute HolidayJp.holiday?(~D[2017-09-19])
      refute HolidayJp.holiday?(~D[2017-09-22])
      refute HolidayJp.holiday?(~D[2017-09-24])
      refute HolidayJp.holiday?(~D[2017-10-08])
      refute HolidayJp.holiday?(~D[2017-10-10])
      refute HolidayJp.holiday?(~D[2017-11-02])
      refute HolidayJp.holiday?(~D[2017-11-04])
      refute HolidayJp.holiday?(~D[2017-11-22])
      refute HolidayJp.holiday?(~D[2017-11-24])
      refute HolidayJp.holiday?(~D[2017-12-22])
      refute HolidayJp.holiday?(~D[2017-12-24])
    end
  end
end
