defmodule CrudMaker.Validator do
  def writeFile(columnsCreate, moduleName) do
    {:ok, content} = File.read("./files/validators/validator.txt")
    fields = Enum.join(columnsCreate, "\n")

    uModuleName = CrudMaker.Utils.upcaseFirst(moduleName)
    moduleName = CrudMaker.Utils.downcaseFirst(moduleName)

    file = String.replace(content, "uModuleName", uModuleName)

    finalFile = String.replace(file, "create", fields)
    exportFolder = "./export/#{moduleName}/validators"

    File.mkdir_p!(exportFolder)
    File.write("#{exportFolder}/#{uModuleName}Validator.ts", finalFile)
  end

  def writeColumnCreate(moduleName, list) do
    columns = []

    list
    |> Enum.map(fn elem ->
      columns ++ "\t#{elem[:name]}: yup.#{elem[:type]}().required(),"
    end)
    |> writeFile(moduleName)
  end
end
