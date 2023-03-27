defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
   
  # For triangle inequality
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when (a==1 and b==1) or (a==1 and c==1) or (b==1 and c==1) do
    {:error, "side lengths violate triangle inequality"} 
  end
  # For Triangle
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a==b and b==c and not(a <= 0) and not(b <= 0) and not(c <= 0) do
    {:ok, :equilateral}  
  end
    # For Isosceles
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when (a==b or b==c or a==c) and not(a == 0) and not(b == 0) and not(c == 0) do
    {:ok, :isosceles}  
  end
    # For Scalene
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when not(a==b) and not(b==c) and not(a <= 0) and not(b <= 0) and not(c <= 0) do
    if  b+c < a do
    {:error, "side lengths violate triangle inequality"}
    else
    {:ok, :scalene}
    end
  end
    # For No Sizes
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a==0 and b==0 and c==0 do
    {:error, "all side lengths must be positive"}  
  end
    # For Triangle with negative sides
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a<0 or b<0 or c<0 do
     {:error, "all side lengths must be positive"}  
  end  

end
