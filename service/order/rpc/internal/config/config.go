package config

import (
	"github.com/zeromicro/go-zero/core/stores/cache"
	"github.com/zeromicro/go-zero/zrpc"
)

type Config struct {
	zrpc.RpcServerConf

	Mysql struct {
		DataSourcde string
	}

	CacheRedis cache.CacheConf

	UserRpc    zrpc.RpcClientConf
	ProductRpc zrpc.RpcClientConf
}
