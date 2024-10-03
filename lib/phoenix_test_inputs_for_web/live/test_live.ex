defmodule PhoenixTestInputsForWeb.TestLive do
  use PhoenixTestInputsForWeb, :live_view

  defmodule Item do
    use Ecto.Schema
    import Ecto.Changeset

    embedded_schema do
      field :name, :string
    end

    def changeset(model, params \\ %{}) do
      model
      |> cast(params, [:name])
      |> validate_required([:name])
    end
  end

  defmodule Model do
    use Ecto.Schema
    import Ecto.Changeset

    embedded_schema do
      embeds_many :items, Item
    end

    def changeset(model, params \\ %{}) do
      model
      |> cast(params, [])
      |> cast_embed(:items, sort_param: :items_sort, drop_param: :items_drop)
    end
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, :form, to_form(Model.changeset(%Model{})))
    {:ok, socket}
  end

  def handle_event("validate", params, socket) do
    changeset = Model.changeset(%Model{}, params["model"])
    IO.inspect(changeset, label: "changeset")
    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def handle_event("save", params, socket) do
    changeset = Model.changeset(%Model{}, params["model"])
    {:noreply, assign(socket, :form, to_form(changeset))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>PhoenixTestInputsFor</h1>

      <.form for={@form} phx-change="validate" phx-submit="save">
        <.inputs_for :let={item} field={@form[:items]}>
          <input type="hidden" name="model[items_sort][]" value={item.index} />
          <.input field={item[:name]} label="Name" />
        </.inputs_for>
        <label>
          <input type="checkbox" class="hidden" name="model[items_sort][]" value="new" /> add more
        </label>
        <.button>Submit</.button>
      </.form>
    </div>
    """
  end
end
