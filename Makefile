# contrib/pgbench/Makefile

PGFILEDESC = "pgbench - a simple program for running benchmark tests"
PGAPPICON = win32

PROGRAM = pgbench
OBJS	= pgbench.o

PG_CPPFLAGS = -I$(libpq_srcdir)
PG_LIBS = $(libpq_pgport) $(PTHREAD_LIBS)

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

ifneq ($(PORTNAME), win32)
override CFLAGS += $(PTHREAD_CFLAGS)
endif
