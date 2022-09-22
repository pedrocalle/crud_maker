defmodule CrudMaker.Service do
  def writeFile(moduleName) do
    {:ok, content} = File.read("./files/service/service.txt")

    file = String.replace(content, "moduleName", moduleName)

    File.write(
      "../../Graciosa/backend-express/src/modules/golf/services/#{moduleName}Service.ts",
      file
    )
  end
end
