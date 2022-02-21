# erlang
f = List.to_string(:io_lib.format("~.2f", [1.3456]))
IO.puts(is_bitstring(f))

# elixir
path = System.get_env("PATH")
IO.puts(path)

file_ext = Path.extname("ModulesAndFunctions-7.exs")
IO.puts(file_ext)

process_current_cwd = File.cwd!()
# |> self()
IO.puts(process_current_cwd)

{user, _} = System.cmd("whoami", [])
IO.puts(user)
