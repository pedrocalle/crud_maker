defmodule CrudMaker.Types do
  alias CrudMaker.{Entity, Validator, Service, Router}

  @spec handleOperation :: :ok | {:error, atom} | map
  def handleOperation() do
    IO.puts("\n\nDigite \"end\" para finalizar\n")
    columnName([])
  end

  def columnName(list) do
    column = String.trim(IO.gets("Nome da coluna:\n"))

    if column == "end" do
      moduleName(list)
    else
      columnType = String.trim(IO.gets("Tipo da coluna: (string|number|boolean|Date)\n"))

      (list ++ [%{:name => column, :type => columnType}])
      |> columnName()
    end
  end

  def moduleName(list) do
    moduleName = String.trim(IO.gets("\nDigite em camelCase ou PascalCase\nNome do modulo:\n"))
    Entity.writeColumn(moduleName, list)
    Validator.writeColumnCreate(moduleName, list)
    Service.writeColumn(moduleName, list)
    Router.writeFile(moduleName)
  end
end
