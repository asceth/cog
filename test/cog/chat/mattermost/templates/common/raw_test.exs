defmodule Cog.Chat.Mattermost.Templates.Common.RawTest do
  use Cog.TemplateCase

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
