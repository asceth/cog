defmodule Cog.Chat.Mattermost.Templates.Embedded.GroupRename do
  use Cog.TemplateCase

  test "group-rename template" do
    data = %{"results" => [%{"old_name" => "foo",
                             "name" => "bar"}]}

    expected = "Renamed group 'foo' to 'bar'"

    assert_rendered_template(:mattermost, :embedded, "group-rename", data, expected)
  end

end
