defmodule ClinicApp.AntecedentType do
  @types %{heredofamiliar: "heredofamiliar", patologico: "patologico", no_patologico: "no patologico"}

  def patologico do
    @types.patologico
  end

  def heredofamiliar do
    @types.heredofamiliar
  end

  def no_patologico do
    @types.no_patologico
  end

  def types do
    @types
  end

  def random do
    Enum.take_random(@types,1)
  end
end
