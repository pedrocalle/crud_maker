defmodule CrudMaker.Router do
  def writeFile(moduleName) do
    try do
      {:ok, content} = File.read("./files/routes/routes.txt")

      uModuleName = CrudMaker.Utils.upcaseFirst(moduleName)
      module_name = CrudMaker.Utils.snakeCase(moduleName)
      moduleName = CrudMaker.Utils.downcaseFirst(moduleName)

      file = String.replace(content, "module_name", module_name)
      file = String.replace(file, "uModuleName", uModuleName)
      file = String.replace(file, "moduleName", moduleName)

      exportFolder = "./export/#{moduleName}/routes"

      File.mkdir_p!(exportFolder)
      File.write("#{exportFolder}/#{module_name}.routes.ts", file)
    rescue
      e in RuntimeError -> e
    end
  end
end
