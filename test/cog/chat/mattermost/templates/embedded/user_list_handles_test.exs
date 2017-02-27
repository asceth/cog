defmodule Cog.Chat.Mattermost.Templates.Embedded.UserListHandlesTest do
  use Cog.TemplateCase

  test "user-list-handles template" do
    data = %{"results" => [%{"username" => "cog",
                             "handle" => "cog",
                             "chat_provider" => %{"name" => "mattermost"}},
                           %{"username" => "sprocket",
                             "handle" => "spacely",
                             "chat_provider" => %{"name" => "mattermost"}},
                           %{"username" => "chetops",
                             "handle" => "ChetOps",
                             "chat_provider" => %{"name" => "hipchat"}}]}
    attachments = [
      """
      *Username:* cog
      *Handle:* @cog
      *Chat Provider:* mattermost
      """,
      """
      *Username:* sprocket
      *Handle:* @spacely
      *Chat Provider:* mattermost
      """,
      """
      *Username:* chetops
      *Handle:* @ChetOps
      *Chat Provider:* hipchat
      """,
    ] |> Enum.map(&String.rstrip/1)

    assert_rendered_template(:mattermost, :embedded, "user-list-handles", data, {"", attachments})
  end

end
