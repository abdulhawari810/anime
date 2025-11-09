import Anime from "./AnimeModel.js";
import Episode from "./EpisodeModel.js";
import Schedule from "./Schedule.js";

Anime.hasMany(Episode, {
  foreignKey: "animeID",
  as: "episode",
  onDelete: "CASCADE",
});

Episode.belongsTo(Anime, {
  foreignKey: "animeID",
  as: "anime",
});

Anime.hasOne(Schedule, {
  foreignKey: "anime_key",
  as: "schedule",
  onDelete: "CASCADE",
});

export { Anime, Episode, Schedule };
