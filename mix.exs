defmodule SpandexPhoenix.MixProject do
  use Mix.Project

  @source_url "https://github.com/coingaming/spandex_phoenix"

  def project do
    [
      app: :spandex_phoenix,
      version: version(),
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: compilers(Mix.env()),
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test, "coveralls.circle": :test]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp version do
    case File.read("VERSION") do
      {:ok, v} -> String.trim(v)
      {:error, _} -> "0.0.0-development"
    end
  end

  defp package do
    [
      description: "Tools for integrating Phoenix with Spandex.",
      organization: "coingaming",
      name: :spandex_phoenix,
      maintainers: ["Greg Mefford"],
      licenses: ["MIT"],
      files: ["lib", "mix.exs", "README.md", "LICENSE.md", "CHANGELOG.md", "VERSION"],
      links: %{
        "Changelog" => "https://hexdocs.pm/spandex_phoenix/changelog.html",
        "GitHub" => @source_url,
        "Sponsor" => "https://github.com/sponsors/GregMefford"
      }
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp compilers(:test), do: [:phoenix] ++ Mix.compilers()
  defp compilers(_), do: Mix.compilers()

  defp docs do
    [
      extras: [
        "CHANGELOG.md",
        {:"LICENSE.md", [title: "License"]},
        {:"README.md", [title: "Overview"]}
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{version()}",
      formatters: ["html"]
    ]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.14", only: :test},
      {:ex_doc, "~> 0.25", only: :dev},
      {:jason, "~> 1.0", only: [:dev, :test]},
      {:optimal, "~> 0.3"},
      {:phoenix, "~> 1.0", optional: true},
      {:phoenix_html, "~> 3.0", only: [:dev, :test]},
      {:plug, "~> 1.3"},
      {:spandex, "~> 2.2 or ~> 3.0"},
      {:telemetry, "~> 0.4 or ~> 1.0", optional: true}
    ]
  end
end
