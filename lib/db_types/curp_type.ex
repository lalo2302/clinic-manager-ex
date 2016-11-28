defmodule ClinicApp.CurpType do
  @rule ~r/[A-Z][AEIOU][A-Z][A-Z][0-9][0-9][0-1][0-9][0-3][0-9][HM][A-Z][A-Z][A-Z][A-Z][A-Z][0-9A-Z][0-9]/

  def rule do
    @rule
  end

  def demo do
    "AAAA000000HAAAAA00"
  end
end
