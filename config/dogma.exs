use Mix.Config
alias Dogma.Rule

config :dogma,
  rule_set: Dogma.RuleSet.All,
  exclude: [],
  override: [
    %Rule.LineLength{max_length: 160},
  ]
