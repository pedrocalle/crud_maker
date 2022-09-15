defmodule CrudMaker.Entity do
  def writeFile(columns, moduleName) do
    {:ok, content} = File.read("./files/entity/entity.txt")
    fields = Enum.join(columns, "\n")

    file = String.replace(content, "moduleName", moduleName)
    finalFile = String.replace(file, "entityColumns", fields)

    File.write(
      "../../Graciosa/backend-express/src/modules/golf/entities/#{moduleName}.entity.ts",
      finalFile
    )
  end

  def writeColumn(moduleName, list) do
    columns = []

    Enum.map(list, fn elem ->
      columns ++ "\t@Column()\r\n\t#{elem[:name]}: #{elem[:type]};\n\r"
    end)
    |> writeFile(moduleName)
  end
end
