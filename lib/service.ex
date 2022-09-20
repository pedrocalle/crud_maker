defmodule CrudMaker.Service do
  def writeFile(columns, moduleName) do
    {:ok, content} = File.read("./files/service/service.txt")

    uModuleName = CrudMaker.Utils.upcaseFirst(moduleName)
    module_name = CrudMaker.Utils.snakeCase(moduleName)
    moduleName = CrudMaker.Utils.downcaseFirst(moduleName)

    file = String.replace(content, "module_name", module_name)
    file = String.replace(file, "uModuleName", uModuleName)
    finalFile = String.replace(file, "moduleName", moduleName)

    exportFolder = "./export/#{moduleName}/services"

    File.mkdir_p!(exportFolder)
    File.write("#{exportFolder}/#{uModuleName}Service.ts",finalFile)
  end

  def writeColumn(moduleName, list) do
    columns = []

    Enum.map(list, fn elem ->
      columns ++ "\t#{elem[:name]}: #{elem[:type]},"
    end)
    |> writeFile(moduleName)
  end
end
