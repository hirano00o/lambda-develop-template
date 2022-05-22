package greeting

import (
	"context"
)

func Hello(_ context.Context) (string, error) {
	return "Hello world", nil
}
