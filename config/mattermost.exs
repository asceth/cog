use Mix.Config
import Cog.Config.Helpers

config :cog, Cog.Chat.Mattermost.Provider,
  incoming_api_token: System.get_env("MATTERMOST_API_INCOMING_TOKEN"),
  outgoing_api_token: System.get_env("MATTERMOST_API_OUTGOING_TOKEN"),
  enable_threaded_response: ensure_boolean(System.get_env("MATTERMOST_ENABLE_THREADED_RESPONSES"))
