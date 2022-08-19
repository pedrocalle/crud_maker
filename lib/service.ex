defmodule CrudMaker.Service do
  def writeFile(columns, moduleName) do
    {:ok, content} = File.read("./files/service/service.txt")
    fields = Enum.join(columns, "\n")

    file = String.replace(content, "moduleName", moduleName)
    finalFile = String.replace(file, "fields", fields)

    File.write("./files/results/#{moduleName}Service.ts", finalFile)
  end

  def writeColumn(moduleName, list) do
    columns = []

    Enum.map(list, fn elem ->
      columns ++ "\t#{elem[:name]}: #{elem[:type]},"
    end)
    |> writeFile(moduleName)
  end
end
