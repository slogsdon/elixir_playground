defmodule ElixirPlayground.SecureRandom do
  @moduledoc """
  Ruby-like SecureRandom module.

  See original: https://gist.github.com/Myuzu/7367461.
 
  ## Examples
 
      iex> SecureRandom.base64
      "xhTcitKZI8YiLGzUNLD+HQ=="
 
      iex> SecureRandom.urlsafe_base64(4)
      "pLSVJw"
 
  """
 
  @default_length 16
 
  @doc """
  Returns random Base64 encoded string.
 
  ## Examples
    
      iex> SecureRandom.base64
      "rm/JfqH8Y+Jd7m5SHTHJoA=="
 
      iex> SecureRandom.base64(8)
      "2yDtUyQ5Xws="
 
  """
  def base64(n \\ @default_length) when is_integer n do
    random_bytes(n)
    |> :base64.encode_to_string
    |> to_string
  end
 
  @doc """
  Returns random urlsafe Base64 encoded string.
 
  ## Examples
 
      iex> SecureRandom.urlsafe_base64
      "xYQcVfWuq6THMY_ZVmG0mA"
 
      iex> SecureRandom.urlsafe_base64(8)
      "8cN__l-6wNw"
 
  """
  def urlsafe_base64(n \\ @default_length) when is_integer n do
    random_bytes(n)
    |> :base64.encode_to_string
    |> to_string
    |> String.replace(~r/[\n\=]/, "")
    |> String.replace(~r/\+/, "-")
    |> String.replace(~r/\//, "_")
  end
 
  @doc """
  Returns random hex string.
  
  ## Examples
 
      iex> SecureRandom.hex
      "c3d3b6cdab81a7382fbbae33407b3272"
 
      iex> SecureRandom.hex(8)
      "125583e32b698259"
 
  """
  def hex(n \\ @default_length) when is_integer n do
    random_bytes(n)
    |> bitstring_to_list
    |> Enum.map(fn (x) -> integer_to_binary(x, 16) end)
    |> Enum.join
    |> String.downcase
  end
 
  @doc """
  Returns UUID v4. Not implemented yet.
  """
  def uuid do
    raise NotImplemented
  end
 
  @doc """
  Returns random number.
 
  ## Examples
 
      iex> SecureRandom.random_number
      0.11301116455519611
 
      iex> SecureRandom.random_number(42)
      31
 
      iex> SecureRandom.random_number(14, 42)
      18
 
      iex> SecureRandom.random_number(14..42)
      28
 
  """
  def random_number do
    :random.seed({:crypto.rand_uniform(1, 99999), :crypto.rand_uniform(1, 99999), :crypto.rand_uniform(1, 99999)})
    :random.uniform
  end
 
  def random_number(x) when is_integer x do
    :crypto.rand_uniform(1, x)
  end
 
  def random_number(range) when is_range range do
    :crypto.rand_uniform(Range.first(range), Range.last(range))
  end
 
  def random_number(x, y) when is_integer(x) and is_integer(y) do
    :crypto.rand_uniform(x, y)
  end
 
  @doc """
  Returns random bytes.
  
  ## Examples
 
      iex> SecureRandom.random_bytes
      <<202, 104, 227, 197, 25, 7, 132, 73, 92, 186, 242, 13, 170, 115, 135, 7>>
 
      iex> SecureRandom.random_bytes(8)
      <<231, 123, 252, 174, 156, 112, 15, 29>>
 
  """
  def random_bytes(n \\ @default_length) when is_integer n do
    :crypto.strong_rand_bytes(n)
  end
end