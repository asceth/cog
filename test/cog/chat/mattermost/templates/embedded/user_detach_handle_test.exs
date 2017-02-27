defmodule Cog.Chat.Mattermost.Templates.Embedded.UserDetachHandleTest do
  use Cog.TemplateCase

  test "user-detach-handle template" do
    data = %{"results" => [%{"chat_provider" => %{"name" => "Mattermost"},
                             "username" => "cog"}]}
    expected = "Removed Mattermost handle from Cog user 'cog'"
    assert_rendered_template(:mattermost, :embedded, "user-detach-handle", data, expected)
  end

  test "user-detach-handle template with multiple inputs" do
    data = %{"results" => [%{"chat_provider" => %{"name" => "Mattermost"},
                             "username" => "cog"},
                           %{"chat_provider" => %{"name" => "Mattermost"},
                             "username" => "sprocket"},
                           %{"chat_provider" => %{"name" => "Mattermost"},
                             "username" => "herman"}]}
    expected = """
    Removed Mattermost handle from Cog user 'cog'
    Removed Mattermost handle from Cog user 'sprocket'
    Removed Mattermost handle from Cog user 'herman'
    """ |> String.strip

    assert_rendered_template(:mattermost, :embedded, "user-detach-handle", data, expected)
  end

end
