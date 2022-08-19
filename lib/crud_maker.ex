defmodule CrudMaker do
  alias CrudMaker.Types

  def build() do
    IO.inspect("CrudMaker")
    Types.handleOperation()
  end
end
