defmodule CrudMaker.Router do
  def writeFile(moduleName) do
    {:ok, content} = File.read("./files/routes/routes.txt")
    file = String.replace(content, "moduleName", moduleName)

    File.write(
      "../../Graciosa/backend-express/src/modules/golf/routes/#{moduleName}.routes.ts",
      file
    )
  end
end
