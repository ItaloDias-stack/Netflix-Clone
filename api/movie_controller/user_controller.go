package movie_controller

import (
	"api/data"
	"api/models"
	"net/http"
	"fmt"
	"github.com/gin-gonic/gin"
)

func CreateUser(c *gin.Context) {
	var newUser models.User
	if err := c.ShouldBindJSON(&newUser); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	for _, valor := range data.Users {

		if newUser.Email == valor.Email {
			c.JSON(http.StatusUnauthorized, gin.H{
				"mensagem": "Já existe um usuário cadastrado com esse e-mail",
			})
			return
		} 

	}
	newUser.ID = len(data.Users)+1
	data.Users = append(data.Users, newUser)
	c.JSON(http.StatusCreated, gin.H{"status":newUser})
}

func GetAllUsers(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"users": data.Users})
}

func Login(c *gin.Context) {

	var newUser models.User
	if err := c.ShouldBindJSON(&newUser); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	var status bool = false
	// Verificar credenciais de login aqui
	for _, valor := range data.Users {
		fmt.Println("request", newUser.Email, " db", valor.Email)
		fmt.Println("request", newUser.Password, " db", valor.Password)
		if newUser.Email == valor.Email && newUser.Password == valor.Password {
			
			status=true;
		} else {
			
			status=false;
		}

	}
	if status{for _, valor := range data.Users {
		if newUser.Email == valor.Email{
			c.JSON(http.StatusOK, gin.H{
				"user": valor,
			})
		}
	}
		
	} else{
		c.JSON(http.StatusUnauthorized, gin.H{
			"mensagem": "Usuário ou senha incorretos",
		})
	}

}
