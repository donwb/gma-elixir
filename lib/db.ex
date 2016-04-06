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

defmodule Meta do
    @derive {Poison.Encoder, only: [:title, :tagline, :footer]}
    use Ecto.Schema
    
    schema "meta" do
        field :title, :string
        field :tagline, :string
        field :footer, :string
    end
end

