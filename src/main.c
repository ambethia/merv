#include <stdlib.h>
#include <pthread.h>
#include <mruby.h>
#include <mruby/irep.h>

#include "merv_bin.h"

int main(void)
{
  mrb_state *mrb;
  mrb = mrb_open();

  mrb_load_irep(mrb, merv_bin);

  // merv = Merv.new
  // merv.run
  struct RClass *Merv = mrb_class_get(mrb, "Merv");
  mrb_value merv = mrb_class_new_instance(mrb, 0, NULL, Merv);
  mrb_funcall(mrb, merv, "run", 0, NULL);

  if (mrb->exc) {
    mrb_print_error(mrb);
  }

  mrb_close(mrb);
  return 0;
}
