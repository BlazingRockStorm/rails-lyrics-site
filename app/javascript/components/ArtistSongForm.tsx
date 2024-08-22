import React, { useState } from 'react';

interface ArtistSongProps {
  id: number;
  artist_id: number;
  song_id: number;
  artist_type: string;
}

const ArtistSongForm = ({ initialArtistSongs = [] }) => {
  const [artistSongs, setArtistSongs] = useState(initialArtistSongs);

  const handleAddArtistSong = () => {
    setArtistSongs([...artistSongs, { artistId: '', artistType: '' }]);
  };

  const handleRemoveArtistSong = (index) => {
    const updatedArtistSongs = [...artistSongs];
    updatedArtistSongs.splice(index, 1);
    setArtistSongs(updatedArtistSongs);
  };

  const handleArtistChange = (event, index) => {
    const updatedArtistSongs = [...artistSongs];
    updatedArtistSongs[index] = {
      ...updatedArtistSongs[index],
      [event.target.name]: event.target.value,
    };
    setArtistSongs(updatedArtistSongs);
  };

  return (
    <div>
      {artistSongs.map((artistSong, index) => (
        <div key={index} className="mb-3">
          <label htmlFor={`artist_id_${index}`} className="form-label">
            Artist
          </label>
          <select
            id={`artist_id_${index}`}
            name="artistId"
            className="form-control"
            value={artistSong.artistId}
            onChange={(event) => handleArtistChange(event, index)}
          >
            <option value="">-- Select Artist --</option>
            {Artist.all.map((artist) => (
              <option key={artist.id} value={artist.id}>
                {artist.name}
              </option>
            ))}
          </select>
          <label htmlFor={`artist_type_${index}`} className="form-label">
            Artist Type
          </label>
          <select
            id={`artist_type_${index}`}
            name="artistType"
            className="form-control"
            value={artistSong.artistType}
            onChange={(event) => handleArtistChange(event, index)}
          >
            <option value="">-- Select Type --</option>
            <option value="main">Main</option>
            <option value="featuring">Featuring</option>
          </select>
          {index > 0 && (
            <button
              type="button"
              className="btn btn-secondary mb-3"
              onClick={() => handleRemoveArtistSong(index)}
            >
              Remove Featuring Artist
            </button>
          )}
        </div>
      ))}
      <button
        type="button"
        className="btn btn-link mb-3"
        onClick={handleAddArtistSong}
      >
        Add Featuring Artist
      </button>
    </div>
  );
};

export default ArtistSongForm;