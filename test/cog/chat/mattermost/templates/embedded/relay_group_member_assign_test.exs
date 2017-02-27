defmodule Cog.Chat.Mattermost.Templates.Embedded.RelayGroupMemberAssignTest do
  use Cog.TemplateCase

  test "relay-group-member-assign template" do
    data = %{"results" => [%{"name" => "testgroup",
                             "bundles_assigned" => ["bundle1",
                                                    "bundle2"]}]}

    expected = """
    Assigned bundle 'bundle1' to relay group 'testgroup'
    Assigned bundle 'bundle2' to relay group 'testgroup'
    """ |> String.strip()

    assert_rendered_template(:mattermost, :embedded, "relay-group-member-assign", data, expected)
  end
end
