defmodule Issuesex.CLI do
  @default_count 5

  @moduledoc

  def run(argv) do
    parse_args(argv)
  end

  @doc

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolen],
                                     aliases:  [ h:    :help  ])
    case parse do

    { [ help: true ], _, _ }            -> :help
    { _,  [ user, project, count ], _ } -> { user, project,
                                             String.to_integer(count) }
    { _,  [ user, project ],        _ } -> { user, project, @default_count }
    _                                   -> :help
    end
  end
end
