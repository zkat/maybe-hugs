defmodule Cutie do

  @spec hug(%{}) :: String
  def hug(cutie) do
    if cutie[:accepts] do
      cutie[:name] <> " accepts hug!"
    else
      cutie[:name] <> " does not accept hug!"
    end
  end

end
