defmodule Cog.Chat.Mattermost.Templates.Embedded.GroupRoleAddTest do
  use Cog.TemplateCase

  test "group-role-add template" do
    data = %{"results" => [%{"name" => "testgroup",
                             "roles_added" => ["role1",
                                               "role2"]}]}

    expected = """
    Added role 'role1' to group 'testgroup'
    Added role 'role2' to group 'testgroup'
    """ |> String.strip()

    assert_rendered_template(:mattermost, :embedded, "group-role-add", data, expected)
  end
end
