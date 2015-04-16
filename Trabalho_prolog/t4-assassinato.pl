

% RELACIONAMENTOS ENTRE OS ENVOLVIDOS

relacionamento(bernardo,anita).
relacionamento(bernardo,caren).
relacionamento(pedro,anita).
relacionamento(pedro,alice).
relacionamento(henrique,alice).
relacionamento(henrique,maria).
relacionamento(adriano,maria).
relacionamento(adriano,caren).

% SITUAÇÃO FINANCEIRA DE CADA ENVOLVIDO

pobre(bernardo).
pobre(bia).
pobre(maria).
pobre(pedro).
rico(adriano).
rico(alice).
rico(caren).
rico(henrique).

% PERSONAGENS CONSIDERADOS INSANOS

insano(adriano).
insano(maria).

% MOTIVOS PARA COMETER O CRIME 

motivo(ciumes).
motivo(insanidade).
motivo(dinheiro).

% MODOS DE ACESSO AO APARTAMENTO

acesso(roubou_a_arma).
acesso(roubou_a_chave).
acesso(estava_no_apartamento).

% FERRAMENTAS USADAS NO CRIME

ferramenta(bastao_baseball).
ferramenta(martelo).

%					FATOS

fatos(adriano,apartamento,segunda).
fatos(adriano,apartamento,terca).
fatos(adriano,santa_maria,quarta).
fatos(adriano,apartamento,quinta).
fatos(adriano,apartamento,sexta).

fatos(alice,apartamento,segunda).
fatos(alice,porto_alegre,terca).
fatos(alice,porto_alegre,quarta).
fatos(alice,apartamento,quinta).
fatos(alice,apartamento,sexta).

fatos(bernardo,santa_maria,segunda).
fatos(bernardo,santa_maria,terca).
fatos(bernardo,porto_alegre,quarta).
fatos(bernardo,santa_maria,quinta).
fatos(bernardo,apartamento,sexta).

fatos(bia,apartamento,segunda).
fatos(bia,porto_alegre,terca).
fatos(bia,porto_alegre,quarta).
fatos(bia,santa_maria,quinta).
fatos(bia,apartamento,sexta).

fatos(caren,porto_alegre,segunda).
fatos(caren,porto_alegre,terca).
fatos(caren,porto_alegre,quarta).
fatos(caren,santa_maria,quinta).
fatos(caren,apartamento,sexta).

fatos(henrique,apartamento,segunda).
fatos(henrique,porto_alegre,terca).
fatos(henrique,apartamento,quarta).
fatos(henrique,apartamento,quinta).
fatos(henrique,apartamento,sexta).

fatos(maria,apartamento,segunda).
fatos(maria,santa_maria,terca).
fatos(maria,santa_maria,quarta).
fatos(maria,santa_maria,quinta).
fatos(maria,apartamento,sexta).

fatos(pedro,santa_maria,segunda).
fatos(pedro,santa_maria,terca).
fatos(pedro,porto_alegre,quarta).
fatos(pedro,santa_maria,quinta).
fatos(pedro,apartamento,sexta).

roubo_chave(X) :- fatos(X,santa_maria,quarta) ; fatos(X,porto_alegre,terca).
roubo_ferramenta(X) :- fatos(X,porto_alegre,quinta) ; fatos(X,apartamento,quarta) ; fatos(X,apartamento,quinta).

suspeito(X) :- roubo_chave(X) , roubo_ferramenta(X).

