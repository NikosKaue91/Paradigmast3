% Trabalho 4: Desvendando um mistério em Prolog
% Nome: Nikollas Kaue Soares Gomes
% Santa Maria, 22 de abril de 2015

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

% VÍTIMA DA HISTÓRIA.

vitima(anita).

% CIUMES. condição para haver ciumes: se em dois casais, um dos membros do casal for em comum com relacionamento antigo de anita, a vitima.

ciumes(Z) :- relacionamento(X, anita), relacionamento(X, Z).

% MOTIVOS DO CRIME - nesta parte coloquei condições dos suspeitos de cometerem o crime, no caso há 3: ciumes, no qual verifiquei os relaccionamentos e comum de todos com anita; 
% pobre, no qual os individus que são pobres, a pprincipio são suspeitos nesta categoria, e insanidade!

motivo(X) :- ciumes(X); pobre(X); insano(X).

% MODOS DE ACESSO AO APARTAMENTO

roubo_arma(X) :- fatos(X,porto_alegre,quinta) ; fatos(X,santa_maria,quarta) ; fatos(X,apartamento,quarta) ; fatos(X,apartamento,quinta).
roubo_chave(X) :- fatos(X,santa_maria,segunda) ; fatos(X,porto_alegre,terca).
estava_apartamento(X) :- fatos(X,apartamento,quinta) ; fatos(X,apartamento,sexta).

% ACESSO. condições para ter havido acesso ao apartamento no dia do crime, alem das possiveis armas que foam usadas. 
% As datas dos roubos das chaves e armas acusam o suspeito.

acesso(X) :- roubo_arma(X), roubo_chave(X), estava_apartamento(X).

% 	FERRAMENTAS USADAS NO CRIME

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


% função final para achar  assassino, ouco diferente da proposta no enunciado!

assassino(X) :- acesso(X) , motivo(X).


