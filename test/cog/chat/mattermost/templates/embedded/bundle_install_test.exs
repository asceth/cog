defmodule Cog.Chat.Mattermost.Templates.Embedded.BundleInstallTest do
  use Cog.TemplateCase

  test "bundle-info template" do
    data = %{"results" => [%{"name" => "heroku",
                             "versions" => [%{"version" => "0.0.4"}]}]}

    expected = "Installed bundle 'heroku' version '0.0.4'"

    assert_rendered_template(:mattermost, :embedded, "bundle-install", data, expected)
  end

end
