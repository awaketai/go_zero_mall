package logic

import (
	"context"

	"mall/service/product/model"
	"mall/service/product/rpc/internal/svc"
	"mall/service/product/rpc/product"

	"github.com/zeromicro/go-zero/core/logx"
	"google.golang.org/grpc/status"
)

type DeatilLogic struct {
	ctx    context.Context
	svcCtx *svc.ServiceContext
	logx.Logger
}

func NewDeatilLogic(ctx context.Context, svcCtx *svc.ServiceContext) *DeatilLogic {
	return &DeatilLogic{
		ctx:    ctx,
		svcCtx: svcCtx,
		Logger: logx.WithContext(ctx),
	}
}

func (l *DeatilLogic) Deatil(in *product.DetailRequest) (*product.DeatilResponse, error) {
	// todo: add your logic here and delete this line
	res, err := l.svcCtx.ProductModel.FindOne(in.Id)
	if err != nil {
		if err == model.ErrNotFound {
			return nil, status.Error(500, "产品不存在")
		}
		return nil, status.Error(100, err.Error())
	}

	return &product.DeatilResponse{
		Id:     res.Id,
		Name:   res.Name,
		Desc:   res.Name,
		Stock:  res.Stock,
		Amount: res.Amount,
		Staus:  res.Status,
	}, nil
}
