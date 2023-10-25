function modinclude(filename)
    modname = gensym()
    @eval module $modname
      include($filename)
    end
end

function main()
  println("Starting to run notebooks ...")
  ipynb_files = filter(contains(r".jl$"), readdir("./jlexamples"; join=true))
  println("Checking: $ipynb_files")
  for f in ipynb_files
      println("Running $f ...")
      modinclude(f)
      println("$f OK")
  end
end

main()
