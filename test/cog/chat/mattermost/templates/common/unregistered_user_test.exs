defmodule Cog.Chat.Mattermost.Templates.Common.UnregisteredUserTest do
  use Cog.TemplateCase

  test "unregistered_user renders properly with user creators" do
    data = %{"handle" => "nobody",
             "mention_name" => "@nobody",
             "display_name" => "Mattermost",
             "user_creators" => ["@larry", "@moe", "@curly"]}
    expected = """
    @nobody: I'm terribly sorry, but either I don't have a Cog account for you, or your Mattermost chat handle has not been registered. Currently, only registered users can interact with me.


    You'll need to ask a Cog administrator to fix this situation and to register your Mattermost handle.


    The following users can help you right here in chat:


    @larry
    @moe
    @curly
    """ |> String.strip
    assert_rendered_template(:mattermost, :common, "unregistered-user", data, expected)
  end

  test "unregistered_user renders properly without user creators" do
    data = %{"handle" => "nobody",
             "mention_name" => "@nobody",
             "display_name" => "Mattermost",
             "user_creators" => []}
    expected = """
    @nobody: I'm terribly sorry, but either I don't have a Cog account for you, or your Mattermost chat handle has not been registered. Currently, only registered users can interact with me.


    You'll need to ask a Cog administrator to fix this situation and to register your Mattermost handle.
    """ |> String.strip
    assert_rendered_template(:mattermost, :common, "unregistered-user", data, expected)
  end


end
