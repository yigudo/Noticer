# README
## programa experimental (nao foi refatorado)
Gerencie seu banco de dados com o ruby console e crie listas que sao enviadas por email atraves do mailgun

o Model Tasks tem 3 dados

obj: objetivo da tarefa
cooldown: quantos dias ate a tarefa se repetir
done: tempo em que a tarefa foi feita

toda vez que o programa roda, o done recebe -1, e quando zera e' adicionado a lista do email a ser enviado e recebe o valor do cooldown, uma task pode ser criada com:

ruby c

taskin = Taskin.new(obj: 'limpar prateleiras', cooldown: 2, done: 2)
taskin.save

Pronto, com o comando Taskin.all ja conseguimos ver que nossos dados foram cadastrados, na nossa view(pagina index padrao) aparece uma lista com todas nossas tasks cadastradas.

crie sua mailgun api key e adicione um email aos permitidos e adicione no arquivo sender_controller.rb
