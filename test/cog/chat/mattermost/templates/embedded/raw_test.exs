defmodule Cog.Chat.Mattermost.Templates.Embedded.RawTest do
  use Cog.TemplateCase

  test "raw renders properly even when the return contains a body tag" do
    data = %{"results" => [%{"body" => ["bar"]}]}
    expected = """
    ```[
      {
        "body": [
          "bar"
        ]
      }
    ]```
    """ |> String.strip
    assert_rendered_template(:mattermost, :embedded, "raw", data, expected)
  end

  test "raw renders properly" do
    data = %{"results" => [%{"foo" => "bar"}]}
    expected = """
    ```[
      {
        "foo": "bar"
      }
    ]```
    """ |> String.strip
    assert_rendered_template(:mattermost, :common, "raw", data, expected)
  end

end
