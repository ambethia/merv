#include <stdlib.h>
#include <mruby.h>
#include <mruby/irep.h>

#include "merv_bin.h"

int main(void)
{
  mrb_state *mrb;
  mrb = mrb_open();
  mrb_load_irep(mrb, merv_bin);
  if (mrb->exc) {
    mrb_print_error(mrb);
  }
  mrb_close(mrb);
  return 0;
}
