defmodule RlfTest do
  use ExUnit.Case

  test "compress" do
    assert Rlf.compress("JJJTTWPPMMMMYYYYYYYYYVVVVVV") == "3J2T1W2P4M9Y6V"
  end
end
