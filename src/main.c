#include <mruby.h>
#include <mruby/irep.h>

#include "main_rb_bin.h"

int main(void)
{
  mrb_state *mrb;
  mrb = mrb_open();
  mrb_load_irep(mrb, main_rb_bin);
  mrb_close(mrb);
  return 0;
}
