defmodule Issues.GithubIssues do
  @user_agent  [ {"User-agent", "chansuke"} ]

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def handle_response({ :ok, %{status_code: 200, body: body}}) do
    { :ok,    body }
  end

  def handle_response({ ___, %{status_code: ___, body: body}}) do
    { :error,    body }
  end
end
