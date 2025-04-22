# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pragmatic.Repo.insert!(%Pragmatic.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# alias Pragmatic.Athletes

alias Pragmatic.Athletes

names = [
  "Liam Johnson", "Emma Thompson", "Noah Williams", "Olivia Brown", "James Jones",
  "Ava Garcia", "Benjamin Martinez", "Sophia Anderson", "Lucas Lee", "Isabella Harris",
  "Henry Clark", "Mia Lewis", "Alexander Walker", "Charlotte Young", "Ethan Hall",
  "Amelia Allen", "Michael Wright", "Harper Scott", "Daniel Adams", "Evelyn Nelson",
  "Matthew Hill", "Abigail Green", "Joseph Baker", "Emily King", "David Turner",
  "Luna Phillips", "Logan Campbell", "Grace Mitchell", "Sebastian Carter", "Chloe Roberts",
  "Jackson Parker", "Zoe Evans", "Levi Edwards", "Scarlett Collins", "Jayden Stewart",
  "Victoria Sanchez", "Nathan Morris", "Riley Rogers", "Aaron Cook", "Ellie Reed",
  "Isaac Morgan", "Hannah Bailey", "Owen Rivera", "Lily Cooper", "Caleb Richardson",
  "Nora Cox", "Ryan Ward", "Layla Gray", "Christian Torres", "Avery Brooks"
]
statuses = [:training, :competing, :resting]

emoji_by_sport = %{
  "Track and Field" => "🏃‍♂️",
  "Cycling" => "🚴‍♂️",
  "Yoga" => "🧘‍♀️",
  "Swimming" => "🏊‍♀️",
  "Judo" => "🥋",
  "Boxing" => "🥊",
  "Skiing" => "🎿",
  "Tennis" => "🎾",
  "Football" => "⚽",
  "Basketball" => "🏀"
}

sports = Map.keys(emoji_by_sport)

Enum.each(1..50, fn _ ->
  sport = Enum.random(sports)

  attrs = %{
    name: Enum.random(names),
    status: Enum.random(statuses),
    sport: sport,
    emoji: emoji_by_sport[sport]
  }

  Athletes.create_athlete(attrs)
end)
