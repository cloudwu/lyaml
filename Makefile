LIBYAML := \
 api.c \
 dumper.c \
 emitter.c \
 loader.c \
 parser.c \
 reader.c \
 scanner.c \
 writer.c

LYAML := \
 emitter.c \
 parser.c \
 scanner.c \
 yaml.c

LIBYAML_I := libyaml
LYAML_I := binding

LIBYAML_SRC := $(foreach v, $(LIBYAML), $(LIBYAML_I)/$(v))
LYAML_SRC := $(foreach v, $(LYAML), $(LYAML_I)/$(v))

LUA_I := -I/usr/local/include
LUA_LIB := -L/usr/local/bin -llua53

INC := -I$(LIBYAML_I) -I$(LYAML_I) $(LUA_I)

yaml.dll : $(LIBYAML_SRC) $(LYAML_SRC) 
	gcc -O2 --shared $(INC) -DYAML_DECLARE_STATIC -DHAVE_CONFIG_H $(LUA_LIB) -o $@ $^

clean :
	rm yaml.dll
