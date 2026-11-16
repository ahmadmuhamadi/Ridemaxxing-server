package auth

type Service struct {
	jwtSecret string
}

func NewService(jwtSecret string) *Service {
	return &Service{jwtSecret: jwtSecret}
}
