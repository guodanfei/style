SHELL=/bin/bash
OUTPUT=./output
OBJS_PATH=$(OUTPUT)
SRCS_PATH=./
SRCS =
SRCS  =./source/fun0.c
SRCS +=./source/fun1.c
SRCS +=./source/main.c 

VERSION		=1.00
CC			=gcc
LINK.cc		=g++
ARFLAGS		=rv
DEBUG		=-DUSE_DEBUG -DVERSION
CFLAGS		=-Wall
INCS		=-I./include
LIB_NAMES	=-lfun_a -lfun_so
LIB_PATH	=-L./lib
OBJS		=$(patsubst %.c, ${OBJS_PATH}/%.o, $(SRCS))
TARGET		=app

#links
$(TARGET):$(OBJS)
	@mkdir -p output
	$(CC) $(OBJS) $(LIB_PATH) $(LIB_NAMES) -o output/$(TARGET)$(VERSION)
#	@rm -rf $(OBJ)

#compile
${OBJS_PATH}/%.o: ${SRCS_PATH}/%.c
	@echo - Building $<
	@$(CC) -E $(CFLAGS) $(CMACRO) $(INCS) -o $@.i -c $<
	@$(CC) $(INCS) $(DEBUG) -c $(CFLAGS) $< -o $@

$(OBJS_PATH)/%.d: $(SRCS_PATH)/%.c
	@echo - build $@;set -e; $(CC) $(CFLAGS) $(CMACRO) $(INCS) -MM $< > $@.$$$$; \
	sed -e 's,\($*\)\.o[:]*,$(OBJS_PATH)/\1.o $@ : ,g' < $@.$$$$ > $@; \
	sed -e "s,$(patsubst %.d,%.o,$(notdir $@)):,$(patsubst %.d,%.o,$@) $@ :,g" < $@.$$$$ > $@; \
#	rm -f $@.$$$$

-include $(OBJS_PATH)/$(OBJS:.o=.d)

.PHONY:clean
clean:
	@echo "Remove linked and compiled files......"
	rm -rf $(OBJ) $(TARGET) output
