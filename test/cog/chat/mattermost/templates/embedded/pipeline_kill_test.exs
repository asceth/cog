defmodule Cog.Chat.Mattermost.Templates.Embedded.PipelineKillTest do

  use Cog.TemplateCase

  test "pipeline-kill template" do

    data = %{"results" => [
              %{"killed_text" => "echo 'Dead, Jim!'"}
            ]}

    expected = "Pipelines killed: echo 'Dead, Jim!'"

    assert_rendered_template(:mattermost, :embedded, "pipeline-kill", data, expected)
  end
end
