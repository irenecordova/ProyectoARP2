/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [dbFlexoprint]    Script Date: 19/01/2018 6:26:49 ******/
CREATE DATABASE [dbFlexoprint]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbFlexoprint', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbFlexoprint.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbFlexoprint_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbFlexoprint_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbFlexoprint] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbFlexoprint].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbFlexoprint] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbFlexoprint] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbFlexoprint] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbFlexoprint] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbFlexoprint] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbFlexoprint] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbFlexoprint] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbFlexoprint] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbFlexoprint] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbFlexoprint] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbFlexoprint] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbFlexoprint] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbFlexoprint] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbFlexoprint] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbFlexoprint] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbFlexoprint] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbFlexoprint] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbFlexoprint] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbFlexoprint] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbFlexoprint] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbFlexoprint] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbFlexoprint] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbFlexoprint] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbFlexoprint] SET  MULTI_USER 
GO
ALTER DATABASE [dbFlexoprint] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbFlexoprint] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbFlexoprint] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbFlexoprint] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbFlexoprint] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbFlexoprint] SET QUERY_STORE = OFF
GO
USE [dbFlexoprint]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [dbFlexoprint]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[apellido] [varchar](40) NOT NULL,
	[direccion] [varchar](60) NULL,
	[telefono] [varchar](10) NULL,
	[email] [varchar](50) NULL,
	[cedula] [varchar](10) NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[idcolor] [int] IDENTITY(1,1) NOT NULL,
	[idetiqueta] [int] NULL,
	[codigoColor] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcolor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[iddetalle] [int] IDENTITY(1,1) NOT NULL,
	[idventa] [int] NOT NULL,
	[idetiqueta] [int] NOT NULL,
	[idempleado] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[preciounitario] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idempleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[apellido] [varchar](40) NOT NULL,
	[direccion] [varchar](60) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[email] [varchar](50) NULL,
	[cedula] [varchar](10) NOT NULL,
	[tipo] [int] NOT NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etiqueta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etiqueta](
	[idetiqueta] [int] IDENTITY(1,1) NOT NULL,
	[arte] [varchar](60) NULL,
	[precioventa] [decimal](18, 2) NOT NULL,
	[medidax] [decimal](18, 2) NULL,
	[mediday] [decimal](18, 2) NULL,
	[diametro] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idetiqueta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](40) NOT NULL,
	[password] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idventa] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NULL,
	[total] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[color]  WITH CHECK ADD  CONSTRAINT [FK_color_etiqueta] FOREIGN KEY([idetiqueta])
REFERENCES [dbo].[etiqueta] ([idetiqueta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[color] CHECK CONSTRAINT [FK_color_etiqueta]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[cliente] ([idcliente])
GO
/****** Object:  StoredProcedure [dbo].[editar_cliente]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_cliente]
	@idcliente int,
	@nombre varchar(40),
	@apellido varchar(40),
	@direccion varchar(60),  
	@telefono varchar(10),
	@email varchar(50),
	@cedula varchar(10)
AS
	UPDATE cliente SET nombre=@nombre, apellido=@apellido, direccion=@direccion, telefono=@telefono, email=@email, cedula=@cedula
	WHERE idcliente = @idcliente
GO
/****** Object:  StoredProcedure [dbo].[editar_color]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_color]
	@idcolor int,
	@idetiqueta int,
	@codigoColor varchar(60)
AS
	UPDATE color SET idetiqueta=@idetiqueta, codigoColor=@codigoColor
	WHERE idcolor = @idcolor
GO
/****** Object:  StoredProcedure [dbo].[editar_detalle]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_detalle]
	@iddetalle int,
	@idventa int,
	@idetiqueta int,
	@idempleado int,
	@cantidad int,
	@preciounitario decimal(18,2)
AS
	UPDATE detalle SET idventa=@idventa, idetiqueta=@idetiqueta, idempleado=@idempleado, cantidad=@cantidad, preciounitario=@preciounitario
	WHERE iddetalle=@iddetalle
GO
/****** Object:  StoredProcedure [dbo].[editar_detalleproducto]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_detalleproducto]
	@iddetalleproducto int,
	@idventa int,
	@idproducto int,
	@idempleado int,
	@cantidad int,
	@preciounitario decimal(18,2)
AS
	UPDATE detalle_producto SET idventa=@idventa, idproducto=@idproducto, idempleado=@idempleado, cantidad=@cantidad, preciounitario=@preciounitario
	WHERE iddetalleproducto=@iddetalleproducto
GO
/****** Object:  StoredProcedure [dbo].[editar_empleado]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_empleado]
	@idempleado int,
	@nombre varchar(40),
	@apellido varchar(40),
	@cedula varchar(10),
	@telefono varchar(10),
	@email varchar(50),
	@direccion varchar(60),  
	@tipo int
AS
	UPDATE empleado SET nombre=@nombre, apellido=@apellido, cedula=@cedula, telefono=@telefono, email=@email, direccion=@direccion, tipo=@tipo
	WHERE idempleado = @idempleado
GO
/****** Object:  StoredProcedure [dbo].[editar_etiqueta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_etiqueta]
	@idetiqueta int,
	@arte varchar(60),
	@precioventa decimal(18,2),
	@medidax decimal(18,2),
	@mediday decimal(18,2),
	@diametro decimal(18,2)
AS
	UPDATE etiqueta SET arte=@arte, precioventa=@precioventa, medidax=@medidax, mediday=@mediday, diametro=@diametro
	WHERE idetiqueta = @idetiqueta
GO
/****** Object:  StoredProcedure [dbo].[editar_producto]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_producto]
	@idproducto int,
	@descripcion varchar(100),
	@precioventa decimal(18,2),
	@stock int
AS
	UPDATE producto SET descripcion=@descripcion, precioventa=@precioventa, stock=@stock
	WHERE idproducto = @idproducto
GO
/****** Object:  StoredProcedure [dbo].[editar_usuario]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_usuario]
	@idusuario int,
	@nombre varchar(40),
	@password varchar(10)
AS
	UPDATE usuario SET usuario=@nombre, password=@password
	WHERE idusuario = @idusuario
GO
/****** Object:  StoredProcedure [dbo].[editar_venta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_venta]
	@idventa int,
	@idcliente int,
	@fecha date,
	@hora time,
	@total decimal(18,2)
AS
	UPDATE venta SET idcliente=@idcliente, fecha=@fecha, hora=@hora, total=@total
	WHERE idventa = @idventa
GO
/****** Object:  StoredProcedure [dbo].[eliminar_cliente]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_cliente]
	@idcliente int
AS
	DELETE FROM cliente WHERE idcliente = @idcliente
GO
/****** Object:  StoredProcedure [dbo].[eliminar_color]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_color]
	@idcolor int
AS
	DELETE FROM color WHERE idcolor = @idcolor
GO
/****** Object:  StoredProcedure [dbo].[eliminar_detalle]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_detalle]
@iddetalle int
AS
	DELETE FROM detalle WHERE iddetalle = @iddetalle
GO
/****** Object:  StoredProcedure [dbo].[eliminar_detalleproducto]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_detalleproducto]
@iddetalleproducto int
AS
	DELETE FROM detalle_producto WHERE iddetalleproducto = @iddetalleproducto
GO
/****** Object:  StoredProcedure [dbo].[eliminar_empleado]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_empleado]
	@idempleado int
AS
	DELETE FROM empleado WHERE idempleado = @idempleado 
GO
/****** Object:  StoredProcedure [dbo].[eliminar_etiqueta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_etiqueta]
	@idetiqueta int
AS
	DELETE FROM etiqueta WHERE idetiqueta = @idetiqueta 
GO
/****** Object:  StoredProcedure [dbo].[eliminar_producto]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_producto]
	@idproducto int
AS
	DELETE FROM producto WHERE idproducto = @idproducto
GO
/****** Object:  StoredProcedure [dbo].[eliminar_usuario]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_usuario]
	@idusuario int
AS
	DELETE FROM usuario WHERE idusuario = @idusuario
GO
/****** Object:  StoredProcedure [dbo].[eliminar_venta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[eliminar_venta]
	@idventa int
AS
	DELETE FROM venta WHERE idventa = @idventa
GO
/****** Object:  StoredProcedure [dbo].[ingresar_cliente]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_cliente]
@nombre varchar(40),
@apellido varchar(40),
@direccion varchar(60),  
@telefono varchar(10),
@email varchar(50),
@cedula varchar(10)
AS
	INSERT INTO cliente(nombre,apellido,direccion,telefono,email,cedula) 
			VALUES(@nombre, @apellido, @direccion, @telefono, @email, @cedula)
GO
/****** Object:  StoredProcedure [dbo].[ingresar_color]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_color]
	@idetiqueta int,
	@codigoColor varchar(60)
AS
	INSERT INTO color(idetiqueta, codigoColor)
			VALUES(@idetiqueta, @codigoColor)
GO
/****** Object:  StoredProcedure [dbo].[ingresar_detalle]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_detalle]
	@idventa int,
	@idetiqueta int,
	@idempleado int,
	@cantidad int,
	@preciounitario decimal(18,2)
AS
SET XACT_ABORT, NOCOUNT ON
   BEGIN TRY
      BEGIN TRANSACTION
		INSERT INTO detalle(idventa, idetiqueta, idempleado, cantidad, preciounitario)
			VALUES(@idventa, @idetiqueta, @idempleado, @cantidad, @preciounitario)
				UPDATE venta SET total = total + (@cantidad * @preciounitario)
		WHERE idventa = @idventa
      COMMIT TRANSACTION
   END TRY
   BEGIN CATCH
      IF @@trancount > 0 ROLLBACK TRANSACTION
      DECLARE @msg nvarchar(2048) = 'No se pudo completar la operacion' 
      RAISERROR (@msg, 16, 1)
      RETURN 55555
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ingresar_detalleproducto]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_detalleproducto]
	@idventa int,
	@idproducto int,
	@idempleado int,
	@cantidad int,
	@preciounitario decimal(18,2)
AS
SET XACT_ABORT, NOCOUNT ON
   BEGIN TRY
      BEGIN TRANSACTION
		INSERT INTO detalle_producto(idventa, idproducto, idempleado, cantidad, preciounitario)
			VALUES(@idventa, @idproducto, @idempleado, @cantidad, @preciounitario)
				UPDATE venta SET total = total + (@cantidad * @preciounitario)
		WHERE idventa = @idventa
      COMMIT TRANSACTION
   END TRY
   BEGIN CATCH
      IF @@trancount > 0 ROLLBACK TRANSACTION
      DECLARE @msg nvarchar(2048) = 'No se pudo completar la operacion' 
      RAISERROR (@msg, 16, 1)
      RETURN 55555
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ingresar_empleado]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_empleado]
	@nombre varchar(40),
	@apellido varchar(40),
	@cedula varchar(10),
	@telefono varchar(10),
	@email varchar(50),
	@direccion varchar(60),  
	@tipo int
AS
	INSERT INTO empleado(nombre,apellido,cedula,telefono,email,direccion,tipo) 
			VALUES(@nombre, @apellido, @cedula, @telefono, @email, @direccion, @tipo)
GO
/****** Object:  StoredProcedure [dbo].[ingresar_etiqueta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_etiqueta]
	@arte varchar(60),
	@precioventa decimal(18,2),
	@medidax decimal(18,2),
	@mediday decimal(18,2),
	@diametro decimal(18,2)
AS
	INSERT INTO etiqueta(arte,precioventa,medidax,mediday,diametro) 
			VALUES(@arte, @precioventa, @medidax, @mediday, @diametro)
GO
/****** Object:  StoredProcedure [dbo].[ingresar_producto]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_producto]
	@descripcion varchar(100),
	@precioventa decimal(18,2),
	@stock int 
AS
	INSERT INTO producto(descripcion,precioventa,stock) 
			VALUES (@descripcion,@precioventa,@stock)
GO
/****** Object:  StoredProcedure [dbo].[ingresar_usuario]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_usuario]
	@nombre varchar(40),
	@password varchar(10)
AS
	INSERT INTO usuario(usuario, password) 
			VALUES(@nombre, @password)
GO
/****** Object:  StoredProcedure [dbo].[ingresar_venta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ingresar_venta]
	@idcliente int,
	@fecha date,
	@total decimal(18,2)
AS
	INSERT INTO venta(idcliente, fecha, hora, total)
			VALUES(@idcliente, @fecha, null, @total)
GO
/****** Object:  StoredProcedure [dbo].[iniciar_sesion]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[iniciar_sesion]
	@usuario varchar(40),
	@password varchar(10)
AS
	SELECT * FROM usuario
	WHERE usuario=@usuario and password=@password
GO
/****** Object:  StoredProcedure [dbo].[mostrar_clientes]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_clientes]
AS
	SELECT * FROM cliente ORDER BY nombre
GO
/****** Object:  StoredProcedure [dbo].[mostrar_color]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[mostrar_color]
	@idetiqueta int
AS
	SELECT c.codigoColor, e.idetiqueta 
	FROM etiqueta e, color c
	WHERE e.idetiqueta = c.idetiqueta and @idetiqueta = e.idetiqueta
GO
/****** Object:  StoredProcedure [dbo].[mostrar_detalle]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_detalle]
	@idventa int
AS
	SELECT        dbo.detalle.iddetalle, dbo.detalle.idventa, dbo.detalle.idempleado, dbo.empleado.nombre, dbo.empleado.apellido, dbo.detalle.idetiqueta, dbo.etiqueta.arte, dbo.etiqueta.medidax, dbo.etiqueta.mediday, dbo.etiqueta.diametro,
                         dbo.detalle.cantidad, dbo.detalle.preciounitario
FROM            dbo.detalle INNER JOIN
                         dbo.empleado ON dbo.detalle.idempleado = dbo.empleado.idempleado INNER JOIN
                         dbo.etiqueta ON dbo.detalle.idetiqueta = dbo.etiqueta.idetiqueta
WHERE @idventa = dbo.detalle.idventa

GO
/****** Object:  StoredProcedure [dbo].[mostrar_detalleproducto]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_detalleproducto]
AS
	SELECT        dbo.detalle_producto.iddetalleproducto, dbo.detalle_producto.idventa, dbo.detalle_producto.idempleado, dbo.empleado.nombre, dbo.empleado.apellido, dbo.detalle_producto.idproducto, dbo.producto.descripcion, 
                         dbo.detalle_producto.cantidad, dbo.detalle_producto.preciounitario
FROM            dbo.detalle_producto INNER JOIN
                         dbo.empleado ON dbo.detalle_producto.idempleado = dbo.empleado.idempleado INNER JOIN
                         dbo.producto ON dbo.detalle_producto.idproducto = dbo.producto.idproducto
GO
/****** Object:  StoredProcedure [dbo].[mostrar_empleados]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_empleados]
AS
	SELECT * FROM empleado ORDER BY nombre
GO
/****** Object:  StoredProcedure [dbo].[mostrar_etiqueta]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_etiqueta]
AS
	SELECT * FROM etiqueta
GO
/****** Object:  StoredProcedure [dbo].[mostrar_productos]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_productos]
AS
	SELECT * FROM producto
GO
/****** Object:  StoredProcedure [dbo].[mostrar_usuarios]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_usuarios]
AS
	SELECT *
	FROM  usuario
GO
/****** Object:  StoredProcedure [dbo].[mostrar_ventas]    Script Date: 19/01/2018 6:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[mostrar_ventas]
AS
	SELECT        dbo.venta.idventa, dbo.venta.idcliente, dbo.cliente.nombre, dbo.cliente.apellido, dbo.venta.fecha, dbo.venta.hora, dbo.venta.total
FROM            dbo.cliente INNER JOIN
                         dbo.venta ON dbo.cliente.idcliente = dbo.venta.idcliente
GO
USE [master]
GO
ALTER DATABASE [dbFlexoprint] SET  READ_WRITE 
GO
