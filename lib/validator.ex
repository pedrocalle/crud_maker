defmodule CrudMaker.Validator do
  def writeFile(columnsUpdate, columnsCreate, moduleName) do
    {:ok, content} = File.read("./files/validators/validator.txt")
    fields = Enum.join(columnsCreate, "\n")
    fieldsUpdate = Enum.join(columnsUpdate, "\n")

    file = String.replace(content, "ModuleName", moduleName)
    fileCreate = String.replace(file, "CREATE", fields)
    fileUpdate = String.replace(fileCreate, "UPDATE", fieldsUpdate)

    File.write(
      "../../Graciosa/backend-express/src/modules/golf/validators/#{moduleName}.ts",
      fileUpdate
    )
  end

  def writeColumnCreate(moduleName, list) do
    columns = []

    list
    |> Enum.map(fn elem ->
      columns ++ "\t#{elem[:name]}: yup.#{elem[:type]}().required(),"
    end)
    |> writeColumnUpdate(moduleName, list)
  end

  def writeColumnUpdate(columnsCreate, moduleName, list) do
    columns = []

    list
    |> Enum.map(fn elem ->
      columns ++ "\t#{elem[:name]}: yup.#{elem[:type]}(),"
    end)
    |> writeFile(columnsCreate, moduleName)
  end
end
