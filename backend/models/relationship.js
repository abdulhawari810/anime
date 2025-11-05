import Anime from "./AnimeModel.js";
import Episode from "./EpisodeModel.js";

Anime.hasMany(Episode, {
    foreignKey: 'animeID',
    as: 'episode',
    onDelete: 'CASCADE' 
});

Episode.belongsTo(Anime, {
    foreignKey: 'animeID',
    as: 'anime'
});

export {Anime, Episode};