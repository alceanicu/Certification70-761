
select
*
from Produto

insert Produto (Nome)
output inserted.Id, inserted.Nome
values ('Mesa')

update Produto
set Id = 3
output inserted.Nome
where Id is null

delete from Produto
output deleted.Id
where Nome = 'Mesa'