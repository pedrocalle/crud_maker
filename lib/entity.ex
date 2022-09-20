defmodule CrudMaker.Entity do
  def writeFile(columns, moduleName) do
    {:ok, content} = File.read("./files/entity/entity.txt")
    fields = Enum.join(columns, "\n")

    uModuleName = CrudMaker.Utils.upcaseFirst(moduleName)
    module_name = CrudMaker.Utils.snakeCase(moduleName)
    moduleName = CrudMaker.Utils.downcaseFirst(moduleName)

    file = String.replace(content, "uModuleName", uModuleName)
    file = String.replace(file, "module_name", module_name)

    finalFile = String.replace(file, "entityColumns", fields)

    exportFolder = "./export/#{moduleName}/entities"
    File.mkdir_p!(exportFolder)
    File.write("#{exportFolder}/#{module_name}.entity.ts", finalFile)
  end

  def writeColumn(moduleName, list) do
    columns = []

    Enum.map(list, fn elem ->
      columns ++ "\t@Column()\r\n\t#{elem[:name]}: #{elem[:type]};\n\r"
    end)
    |> writeFile(moduleName)
  end
end
