defmodule CrudMaker.Utils do
  def upcaseFirst(<<first::utf8, rest::binary>>) do
    String.upcase(<<first::utf8>>) <> rest
  end

  def downcaseFirst(<<first::utf8, rest::binary>>) do
    String.downcase(<<first::utf8>>) <> rest
  end

  def snakeCase(string) do
    Macro.underscore(string)
  end
end
