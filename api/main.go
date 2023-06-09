package main

import (
	"api/data"
	"api/models"
	"api/movie_controller"
	"fmt"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.Use(cors.Default())
	setupValues()
	// Endpoints
	r.GET("/movies", movie_controller.GetMovies)
	r.GET("/movies/:id", movie_controller.GetMovieById)
	r.POST("/movies", movie_controller.CreateMovie)
	r.PUT("/movies/:id", movie_controller.UpdateMovie)
	r.DELETE("/movies/:id", movie_controller.DeleteMovie)
	r.GET("/users/:id", movie_controller.GetUserById)
	r.POST("/users", movie_controller.CreateUser)
	r.GET("/users", movie_controller.GetAllUsers)
	r.POST("/login", movie_controller.Login)

	// Start server
	if err := r.Run("localhost:8081"); err != nil {
		fmt.Println("Error starting server:", err)
	}

}
func setupValues() {
	user1 := models.User{
		ID:       1,
		Name:     "João",
		Email:    "admin",
		Password: "admin",
		Role:     "admin",
	}
	user2 := models.User{
		ID:       2,
		Name:     "Italo",
		Email:    "italo@gmail.com",
		Password: "123456789",
		Role:     "user",
	}
	data.Users = append(data.Users, user1, user2)

	filme1 := models.Movie{
		ID:       1,
		Title:    "The Shawshank Redemption",
		Director: "Frank Darabont",
		Year:     1994,
		Sinopse:  "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
		Url:      "https://hbomax-images.warnermediacdn.com/images/GX5NuhwXHx52ywgEAAAEP/tileburnedin?size=1280x720&partner=hbomaxcom&v=0af45a9d7fda37098a6c1363fd5c65e3&host=art-gallery.api.hbo.com&language=en-us&w=1280",
		Trailer:  "1LlBAn71FWlCgnQd4HIyjyuakPSKEf4Ck",
	}
	filme2 := models.Movie{
		ID:       2,
		Title:    "The Godfather",
		Director: "Francis Ford Coppola",
		Year:     1972,
		Sinopse:  "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
		Url:      "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
		Trailer:  "1lYM4--O7swN7fJMkH2ACiSTDgPom7dZg",
	}
	filme3 := models.Movie{
		ID:       3,
		Title:    "The Dark Knight",
		Director: "Christopher Nolan",
		Year:     2008,
		Sinopse:  "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
		Url:      "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg",
		Trailer:  "1gwOESn7x42iaWpV_1wIbv3ged0q5Dph4",
	}
	filme4 := models.Movie{
		ID:       4,
		Title:    "The Godfather: Part II",
		Director: "Francis Ford Coppola",
		Year:     1974,
		Sinopse:  "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
		Url:      "https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
		Trailer:  "10-7iCxjgGmEZnV4tcAAhdNthRoprtc1n",
	}
	filme5 := models.Movie{
		ID:       5,
		Title:    "12 Angry Men",
		Director: "Sidney Lumet",
		Year:     1957,
		Sinopse:  "A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.",
		Url:      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/12_Angry_Men_%281957_film_poster%29.jpg/800px-12_Angry_Men_%281957_film_poster%29.jpg",
		Trailer:  "156MTVZUySrcqK9pGW-47fGBdnI33xB-1",
	}
	filme6 := models.Movie{
		ID:       6,
		Title:    "Schindler's List",
		Director: "Steven Spielberg",
		Year:     1993,
		Sinopse:  "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
		Url:      "https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
		Trailer:  "1z5Qgixht-E-Yg4QVRwXsU4oxyYf6-hu9",
	}
	filme7 := models.Movie{
		ID:       7,
		Title:    "The Lord of the Rings: The Return of the King",
		Director: "Peter Jackson",
		Year:     2003,
		Sinopse:  "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
		Url:      "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg",
		Trailer:  "1xmUcUWcDvsMvxIKY-a3MBLWbVgJUBaxZ",
	}
	filme8 := models.Movie{
		ID:       8,
		Title:    "Pulp Fiction",
		Director: "Quentin Tarantino",
		Year:     1994,
		Sinopse:  "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
		Url:      "https://m.media-amazon.com/images/M/MV5BMTc5Njg5Njg2MV5BMl5BanBnXkFtZTgwMjAwMzg5MTE@._V1_.jpg",
		Trailer:  "126KgiA6lrbKi1Kk85AhTtJjzXpCMmpbm",
	}
	filme9 := models.Movie{
		ID:       9,
		Title:    "The Good, the Bad and the Ugly",
		Director: "Sergio Leone",
		Year:     1966,
		Sinopse:  "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.",
		Url:      "https://m.media-amazon.com/images/I/91BDDsP0clL._RI_.jpg",
		Trailer:  "13ZlQ6RQgLJc1YamV7pRIwouCQWYBOjPN",
	}
	filme10 := models.Movie{
		ID:       10,
		Title:    "Infiesto",
		Director: "Patxi Amezcua",
		Year:     2023,
		Sinopse:  "Amid the challenges of the coronavirus pandemic, a pair of detectives goes after those responsible for a series of sinister events.",
		Url:      "https://m.media-amazon.com/images/M/MV5BYTk2YjBkYWUtNmYxNS00M2Q5LTkyN2MtYzA0NDMwMTlkNDA0XkEyXkFqcGdeQXVyMTA0MjU0Ng@@._V1_.jpg",
		Trailer:  "1dp3m5h4R3YOTIUq_OUImzhWRTmjl3pVk",
	}
	filme11 := models.Movie{
		ID:       11,
		Title:    "Everything Everywhere All at Once",
		Director: "Daniel Scheinert, Daniel Kwan",
		Year:     2022,
		Sinopse:  "When an interdimensional rupture unravels reality, an unlikely hero must channel her newfound powers to fight bizarre and bewildering dangers from the multiverse as the fate of the world hangs in the balance.",
		Url:      "https://image.tmdb.org/t/p/original/8z93FvxClC5GIq7OLyN0MaOohQB.jpg",
		Trailer:  "1Ebds-KXpN6CRQCEYdIb0TeTvHb7goT3Z",
	}
	filme12 := models.Movie{
		ID:       12,
		Title:    "The Silence of the Lambs",
		Director: "Jonathan Demme",
		Year:     1991,
		Sinopse:  "A young man must be given the help of an imprisoned, manipulative cannibalistic killer to help capture another serial killer, a madman who preys on his victims.",
		Url:      "https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_.jpg",
		Trailer:  "1hIeKNKZEMa8WPDfDDlx40AKoleDT0q28",
	}

	data.Movies = append(data.Movies, filme1, filme2, filme3, filme4, filme5, filme6, filme7, filme8, filme9, filme10, filme11, filme12)
}
