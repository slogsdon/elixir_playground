defmodule ElixirPlayground.Repos.Main.Migrations.CreateSnippet do
  use Ecto.Migration

  def up do
    """
    CREATE TABLE "snippet" (
      "id" serial PRIMARY KEY,
      "key" character varying(40) NOT NULL,
      "snippet" text NOT NULL,
      "created_at" timestamp without time zone NOT NULL
    );
    """
  end

  def down do
    """
    DROP TABLE "snippet";
    """
  end
end
