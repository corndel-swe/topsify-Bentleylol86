.mode json

SELECT artists.name AS artist_name, COUNT(tracks.explicit) AS explicit_track_count
FROM artists
INNER JOIN albums ON artists.id = albums.artist_id
INNER JOIN tracks ON albums.id = tracks.album_id
WHERE tracks.explicit = 1
GROUP BY artists.id, artists.name
HAVING COUNT(tracks.explicit) > 0
ORDER BY explicit_track_count DESC;
