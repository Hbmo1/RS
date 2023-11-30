R3:

## ex1) Configurar IPs
R3#configure terminal
R3(config)#interface f0/0
R3(config-if)#ip address 192.10.10.3 255.255.255.0
R3(config-if)#no shutdown
R3(config-if)#exit
R3(config)#interface f0/1
R3(config-if)#ip address 192.20.20.3 255.255.255.0
R3(config-if)#no shutdown
R3(config-if)#exit
R3(config)#exit
R3#write

## ex2) Configurar RIPV1
R3(config)# router rip
R3(config-router)# network 192.10.10.0 # Rede diretamente ligada
R3(config-router)# network 192.20.20.0 # Rede diretamente ligada

## ex3) 
# Periodicidade de aproximadamente 40s
# Metric = 1 para em todos os RIP capturados, pois a distancia entre routers é sempre 1

## ex4) Desligar split-horizon (ligado by default)
R3(config)# interface f0/0
R3(config-if)# ip split-horizon     #Ligar split-horizon
R3(config-if)# no ip split-horizon  #Desligar split-horizon

## ex5.1) Visualizar RIP packets com porta do R1 fechada
R3(config)# interface f0/0  
R3(config-if)# ip split-horizon     #Ligar novamente split-horizon
# Em R1 é desativada a porta f0/1 (ver resto do exercicio em R1.sh)


## ex5.2)


## Verificações
R3# show ip interface brief
R3# show ip route
R3# show ip arp
