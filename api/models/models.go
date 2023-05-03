package models

type MovieEpisode struct {
	ID       int    `json:"id"`
	Title    string `json:"title"`
	Director string `json:"director"`
	Season   int    `json:"season"`
	Number   int    `json:"number"`
}

type Movie struct {
	ID       int            `json:"id"`
	Title    string         `json:"title"`
	Director string         `json:"director"`
	Year     int            `json:"year"`
	Episodes []MovieEpisode `json:"episodes,omitempty"`
}