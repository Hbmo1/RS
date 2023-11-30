R2:

## ex1) Configurar IPs
IPV4:
R2#configure terminal
R2(config)#interface f0/0
R2(config-if)#ip address 192.30.30.2 255.255.255.0
R2(config-if)#no shutdown
R2(config-if)#exit
R2(config)#interface f0/1
R2(config-if)#ip address 192.20.20.2 255.255.255.0
R2(config-if)#no shutdown
R2(config-if)#exit
R2(config)#exit
R2#write

## ex2) Configurar RIPV1
R2(config)# router rip
R2(config-router)# network 192.20.20.0 # Rede diretamente ligada
R2(config-router)# network 192.30.30.0 # Rede diretamente ligada

## ex3) 
# Periodicidade de aproximadamente 40s
# Metric = 1 para em todos os RIP capturados, pois a distancia entre routers é sempre 1

## Verificações
R2# show ip interface brief
R2# show ip route
R2# show ip arp
