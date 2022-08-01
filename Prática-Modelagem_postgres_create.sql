CREATE TABLE "public.usuario" (
	"id" serial NOT NULL,
	"nome" varchar(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL,
	CONSTRAINT "usuario_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produto" (
	"id" serial NOT NULL,
	"nome" varchar(50) NOT NULL,
	"preço" DECIMAL NOT NULL,
	"fotos" tsvector NOT NULL,
	"categoria" varchar(50) NOT NULL,
	"tamanho" varchar(5) NOT NULL,
	CONSTRAINT "produto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.compra" (
	"id" serial NOT NULL,
	"idProduto" tsvector NOT NULL,
	"idUsuario" integer NOT NULL,
	"estado" varchar(50) NOT NULL,
	"data" DATE NOT NULL,
	"idEndereco" integer NOT NULL,
	CONSTRAINT "compra_pk" PRIMARY KEY ("id","idProduto","idUsuario","idEndereco")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.endereço" (
	"id" serial NOT NULL,
	"idUsuario" integer NOT NULL,
	"cidade" varchar(50) NOT NULL,
	"estado" varchar(50) NOT NULL,
	"bairro" varchar(50) NOT NULL,
	"rua" varchar(50) NOT NULL,
	"numero" integer NOT NULL,
	"complemento" TEXT NOT NULL,
	CONSTRAINT "endereço_pk" PRIMARY KEY ("id","idUsuario")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "compra" ADD CONSTRAINT "compra_fk0" FOREIGN KEY ("idProduto") REFERENCES "produto"("id");
ALTER TABLE "compra" ADD CONSTRAINT "compra_fk1" FOREIGN KEY ("idUsuario") REFERENCES "usuario"("id");
ALTER TABLE "compra" ADD CONSTRAINT "compra_fk2" FOREIGN KEY ("idEndereco") REFERENCES "endereço"("id");

ALTER TABLE "endereço" ADD CONSTRAINT "endereço_fk0" FOREIGN KEY ("idUsuario") REFERENCES "usuario"("id");





