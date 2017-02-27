defmodule Cog.Chat.Mattermost.Templates.Embedded.PermissionCreateTest do
  use Cog.TemplateCase

  test "permission-create template" do
    data = %{"results" => [%{"bundle" => "site", "name" => "foo"}]}
    expected = "Created permission 'site:foo'"
    assert_rendered_template(:mattermost, :embedded, "permission-create", data, expected)
  end

  test "permission-create template with multiple inputs" do
    data = %{"results" => [%{"bundle" => "site", "name" => "foo"},
                           %{"bundle" => "site", "name" => "bar"},
                           %{"bundle" => "site", "name" => "baz"}]}
    expected = """
    Created permission 'site:foo'
    Created permission 'site:bar'
    Created permission 'site:baz'
    """ |> String.strip

    assert_rendered_template(:mattermost, :embedded, "permission-create", data, expected)
  end

end
