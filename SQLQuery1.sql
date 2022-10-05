create database DBBUEAN
go

use DBBUEAN
go

create table libros(
   codigo int identity,
   titulo varchar(40),
   autor varchar(30),
   editorial varchar(20),
   precio decimal(5,2),
   cantidad smallint,
   primary key(codigo)
  )  ;
go

create proc sp_listar_libros
as
select * from libros order by codigo
go

create proc sp_buscar_libros
@titulo varchar(40)
as
select * from libros where titulo like @titulo + '%'
go

create proc sp_mantenimiento_clientes
@codigo int,
@titulo varchar(40),
@autor varchar(30),
@editorial varchar(20),
@precio decimal(5,2),
@cantidad smallint,
@accion varchar(100) output
as
if (@accion='1')
begin
	declare @codnuevo varchar(5), @codmax varchar(5)
	set @codmax = (select max(codigo) from libros)
	set @codmax = isnull(@codmax,'0')
	set @codnuevo = @codmax
	insert into libros(codigo,titulo,autor,editorial,precio,cantidad)
	values(@codnuevo,@titulo,@autor,@editorial,@precio,@cantidad)
	set @accion='Se genero el código: ' +@codnuevo
end
else if (@accion='2')
begin
	update libros set titulo=@titulo, autor=@autor ,editorial=@editorial,precio=@precio, cantidad=@cantidad  where codigo=@codigo
	set @accion='Se modifico el código: ' +@codigo
end
else if (@accion='3')
begin
	delete from libros where codigo=@codigo
	set @accion='Se borro el código: ' +@codigo
end
go

	
