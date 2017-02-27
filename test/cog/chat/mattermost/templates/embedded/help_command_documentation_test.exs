defmodule Cog.Chat.Mattermost.Templates.Embedded.HelpCommandDocumentationTest do
  use Cog.TemplateCase

  test "help-command-documentation template" do
    data = %{"results" => [%{"documentation" => "big ol' doc string"}]}
    expected = """
    ```big ol' doc string```
    """ |> String.strip
    assert_rendered_template(:mattermost, :embedded, "help-command-documentation", data, expected)
  end
end
