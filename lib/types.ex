defmodule CrudMaker.Types do
  alias CrudMaker.{Entity, Validator, Service, Router}

  def handleOperation() do
    columnName([])
  end

  def columnName(list) do
    column = String.trim(IO.gets("Nome das coluna:\n"))

    if column == "end" do
      moduleName(list)
    else
      columnType = String.trim(IO.gets("Tipo das coluna:\n"))

      (list ++ [%{:name => column, :type => columnType}])
      |> columnName()
    end
  end

  def moduleName(list) do
    moduleName = String.trim(IO.gets("Nome do módulo:\n"))
    Entity.writeColumn(moduleName, list)
    Validator.writeColumnCreate(moduleName, list)
    Service.writeFile(moduleName)
    Router.writeFile(moduleName)
  end
end
