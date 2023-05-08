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
	Sinopse  string         `json:"sinopse"`
	Url      string         `json:"url"`
	Episodes []MovieEpisode `json:"episodes,omitempty"`
	Trailer  string         `json:"trailer"`
}

type User struct {
	ID       int    `json:"id"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
	Role     string `json:"role"`
}
