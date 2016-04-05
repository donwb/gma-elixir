defmodule Gma.Repo do
    use Ecto.Repo, otp_app: :gma
end

defmodule Home do
    @derive {Poison.Encoder, only: [:city, :image, :display_order]}
    use Ecto.Schema
    
    schema "homes" do
        field :city, :string
        field :image, :string
        field :display_order, :integer
    end

end
