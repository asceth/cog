defmodule Integration.MattermostThreadsTest do
  use ExUnit.Case

  setup_all do
    mattermost_config = Application.get_env(:cog, Cog.Chat.Mattermost.Provider)
    mattermost_config_with_threads = Keyword.put(mattermost_config, :enable_threaded_response, true)
    Application.put_env(:cog, Cog.Chat.Mattermost.Provider, mattermost_config_with_threads)

    {:ok, %{mattermost_config: mattermost_config}}
  end

  use Cog.Test.Support.ProviderCase, provider: :mattermost, force: true

  setup_all %{mattermost_config: mattermost_config} do
    on_exit(fn ->
      Application.put_env(:cog, Cog.Chat.Mattermost.Provider, mattermost_config)
    end)
  end

  @user "botci"
  @bot "deckard"
  @ci_room "ci_bot_testing"

  setup do
    user = user(@user)
    |> with_chat_handle_for("mattermost")

    {:ok, client} = ChatClient.new()
    {:ok, %{client: client, user: user}}
  end

  test "messages are threaded based on the original message", %{user: user, client: client} do
    user |> with_permission("operable:echo")
    {:ok, reply} = ChatClient.chat_wait!(client, [room: @ci_room, message: "@#{@bot} operable:echo test", reply_from: @bot])
    refute reply.thread_ts == nil
  end

  test "messages redirected to another room or dm are not threaded", %{user: user, client: client} do
    user |> with_permission("operable:echo")
    {:ok, reply} = ChatClient.chat_wait!(client, [room: @ci_room, message: "@#{@bot} operable:echo test > #ci_bot_redirect_tests", reply_from: @bot])
    assert reply.thread_ts == nil
  end
end
