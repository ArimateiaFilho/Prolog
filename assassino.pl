%Fatos
%financeiro(Pessoa,Condição financeira).
% Pessoa rica ou pobre

financeiro(ben,pobre).
financeiro(beth,pobre).
financeiro(karen,rica).
financeiro(peter,pobre).
financeiro(hannah,rica).
financeiro(harry,rico).
financeiro(marie,pobre).
financeiro(adrian,rico).

%casal(Pessoa,Pessoa).
% Tem relacionamento

casal(anna,ben).
casal(ben,anna).

%excasal(Pessoa,Pessoa).
% Ja esteve em um relacionamento

excasal(ben,karen).
excasal(anna,peter).
excasal(peter,hannah).
excasal(hannah,harry).
excasal(harry,marie).
excasal(marie,adrian).
excasal(adrian,karen).

excasal(karen,ben).
excasal(peter,anna).
excasal(hannah,peter).
excasal(harry,hannah).
excasal(marie,harry).
excasal(adrian,marie).
excasal(karen,adrian).


%localizacao(Pessoa,Dia,Lugar).

localizacao(anna,quinta,ap).
localizacao(anna,sexta,ap).
localizacao(peter,segunda,compenhague).
localizacao(peter,terca,compenhague).
localizacao(peter,quarta,odensee).
localizacao(peter,quinta,compenhague).
localizacao(peter,sexta,ap).
localizacao(karen,segunda,odensee).
localizacao(karen,terca,odensee).
localizacao(karen,quarta,odensee).
localizacao(karen,quinta,compenhague).
localizacao(karen,sexta,flat).
localizacao(harry,segunda,ap).
localizacao(harry,terca,odensee).
localizacao(harry,quarta,ap).
localizacao(harry,quinta,ap).
localizacao(harry,sexta,ap).
localizacao(beth,segunda,ap).
localizacao(beth,terca,odensee).
localizacao(beth,quarta,odensee).
localizacao(beth,quinta,compenhague).
localizacao(beth,sexta,ap).
localizacao(adrian,segunda,ap).
localizacao(adrian,terca,ap).
localizacao(adrian,quarta,compenhague).
localizacao(adrian,quinta,ap).
localizacao(adrian,sexta,ap).
localizacao(hannah,terca,odensee).
localizacao(hannah,quarta,odensee).
localizacao(hannah,segunda,ap).
localizacao(hannah,quinta,ap).
localizacao(hannah,sexta,ap).
localizacao(ben,segunda,compenhague).
localizacao(ben,terca,compenhague).
localizacao(ben,quarta,odensee).
localizacao(ben,quinta,compenhague).
localizacao(ben,sexta,ap).
localizacao(marie,terca,compenhague).
localizacao(marie,quarta,compenhague).
localizacao(marie,quinta,compenhague).
localizacao(marie,segunda,ap).
localizacao(marie,sexta,ap).

%insano(Pessoa).
% Pessoa com insanidade

insano(adrian).
insano(marie).

%furto(Objeto,Pessoa,Onde,Quando).
% Alguem roubou um objeto de uma pessoa em algum lugar e em um determinado dia

furto(taco,ben,odensee,quinta).
furto(taco,ben,compenhague,quarta).
furto(martelo,anna,ap,quarta).
furto(martelo,anna,ap,quinta).
furto(chave,anna,compenhague,segunda).
furto(chave,anna,odensee,terca).
furto(dinheiro,anna,ap,eita).




% Regras

%ciumes(Pessoa).
% Pessoa X teve relacionamento com Y e Y teve relacionamento com anna

ciumes(X) :-
	excasal(X,Y),(excasal(anna,Y);casal(anna,Y)).

%arma(Pessoa)
% Pessoa X que estava no Local e dia do Furto da arma do crime

arma(X) :-
	(furto(taco,ben,L,D);furto(martelo,anna,L,D)),localizacao(X,D,L).

%furtochave(Pessoa).
% Pessoa X que estava no lugar e no dia do furto da chave de anna

furtochave(X) :-
	furto(chave,anna,L,D),localizacao(X,D,L).




%assasino(Pessoa).
% Pessoa que matou a anna

assassino(X) :-
	arma(X),furtochave(X),(insano(X);ciumes(X);financeiro(X,probre)).





