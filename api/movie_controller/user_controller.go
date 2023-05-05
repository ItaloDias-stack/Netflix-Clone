package movie_controller

import (
	"api/data"
	"api/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func CreateUser(c *gin.Context) {
	var newUser models.User
	if err := c.ShouldBindJSON(&newUser); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	data.Users = append(data.Users, newUser)
	c.JSON(http.StatusCreated, gin.H{"status": "User created successfully"})
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

	// Verificar credenciais de login aqui
	for _, valor := range data.Users {

		if newUser.Email == valor.Email && newUser.Password == valor.Password {
			c.JSON(http.StatusOK, gin.H{
				"mensagem": "Login realizado com sucesso!",
			})
		} else {
			c.JSON(http.StatusUnauthorized, gin.H{
				"mensagem": "Usuário ou senha incorretos",
			})
		}

	}

}
