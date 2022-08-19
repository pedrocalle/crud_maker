defmodule CrudMaker.Validator do
  def writeFile(columnsUpdate, columnsCreate, moduleName) do
    {:ok, content} = File.read("./files/validators/validator.txt")
    fields = Enum.join(columnsCreate, "\n")
    fieldsUpdate = Enum.join(columnsUpdate, "\n")

    file = String.replace(content, "ModuleName", moduleName)
    IO.inspect(file)
    fileCreate = String.replace(file, "create", fields)
    fileUpdate = String.replace(fileCreate, "update", fieldsUpdate)

    File.write("./files/results/#{moduleName}.ts", fileUpdate)
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
