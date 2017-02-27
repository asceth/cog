defmodule Cog.Chat.Mattermost.Templates.Embedded.UserAttachHandleTest do
  use Cog.TemplateCase

  test "user-attach-handle template" do
    data = %{"results" => [%{"chat_provider" => %{"name" => "Mattermost"},
                             "handle" => "cog",
                             "username" => "cog"}]}
    expected = "Attached Mattermost handle @cog to Cog user 'cog'"
    assert_rendered_template(:mattermost, :embedded, "user-attach-handle", data, expected)
  end

  test "user-attach-handle template with multiple inputs" do
    data = %{"results" => [%{"chat_provider" => %{"name" => "Mattermost"},
                             "handle" => "cog",
                             "username" => "cog"},
                           %{"chat_provider" => %{"name" => "Mattermost"},
                             "handle" => "sprocket",
                             "username" => "sprocket"},
                           %{"chat_provider" => %{"name" => "Mattermost"},
                             "handle" => "gear",
                             "username" => "herman"}]}
    expected = """
    Attached Mattermost handle @cog to Cog user 'cog'
    Attached Mattermost handle @sprocket to Cog user 'sprocket'
    Attached Mattermost handle @gear to Cog user 'herman'
    """ |> String.strip

    assert_rendered_template(:mattermost, :embedded, "user-attach-handle", data, expected)
  end

end
