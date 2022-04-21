#!/bin/bash
GOLANG_CONTAINER_ID=c3c2957e7880

# 项目
item=(
    user
    product
    order
    pay
)
# 项目子目录
itemChild=(
    rpc
    api
)
#docker exec -it $GOLANG_CONTAINER_ID /bin/bash -c 'cd service/order/rpc && go run order.go -f etc/order.yaml'

startServe(){
    for i in ${item[@]}  
        do
            for child in ${itemChild[@]}
                do
                    cmd="cd service/${i}/${child} && go run ${i}.go -f etc/${i}.yaml"
                    echo -e "\033[31m item:${i}/${child} \033[0m"
                    docker exec -it $GOLANG_CONTAINER_ID /bin/bash -c $cmd
                done
            
        done

}
startServe