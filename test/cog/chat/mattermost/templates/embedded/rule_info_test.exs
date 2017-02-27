defmodule Cog.Chat.Mattermost.Templates.Embedded.RuleInfoTest do
  use Cog.TemplateCase

  test "rule-info template" do
    data = %{"results" => [%{"command" => "foo:foo",
                             "rule" => "when command is foo:foo allow",
                             "id" => "123"}]}
    expected = """
    *ID:* 123
    *Rule:*

    ```when command is foo:foo allow```
    """ |> String.strip

    assert_rendered_template(:mattermost, :embedded, "rule-info", data, {expected, []})
  end
end
