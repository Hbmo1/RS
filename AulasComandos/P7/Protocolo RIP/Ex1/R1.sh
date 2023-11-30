R1:

## ex1) Configurar IPs
IPV4:
R1#configure terminal
R1(config)#interface f0/0
R1(config-if)#ip address 192.10.10.1 255.255.255.0
R1(config-if)#no shutdown
R1(config-if)#exit
R1(config)#interface f0/1
R1(config-if)#ip address 192.30.30.1 255.255.255.0
R1(config-if)#no shutdown
R1(config-if)#exit
R1(config)#exit
R1#write

## ex2) Configurar RIPV1
R1(config)# router rip
R1(config-router)# network 192.10.10.0 # Rede diretamente ligada
R1(config-router)# network 192.30.30.0 # Rede diretamente ligada

## ex3) 
# Periodicidade de aproximadamente 40s
# Metric = 1 para em todos os RIP capturados, pois a distancia entre routers é sempre 1

## ex4) Desligar split-horizon (ligado by default)
R1(config)# interface f0/0
R1(config-if)# ip split-horizon     #Ligar split-horizon
R1(config-if)# no ip split-horizon  #Desligar split-horizon

## ex5.1) Visualizar RIP packets com porta f0/1 do R1 fechada
R1(config)# interface f0/0  
R1(config-if)# ip split-horizon     #Ligar novamente split-horizon

R1(config-if)# exit
R1(config)# interface f0/1
R1(config-if)# shutdown             #Desligar porta f0/1 (impedir conectividade com 192.30.30.0)
# O R1 envia um RIP sobre 192.30.30.0 com metric = 16 (inacessivel)
# Não são enviados mais RIP sobre 192.30.30.0.
# O R3 passa a anunciar a rede 192.30.30.0, com metric=2

## ex5.2) Repor porta f0/1 de R1
# O R3 deixa de anunciar a rede 192.30.30.0
# O R1 volta a anunciar essa rede


## Verificações
R1# show ip interface brief
R1# show ip route
R1# show ip arp
