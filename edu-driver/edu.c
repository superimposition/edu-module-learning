/*
 * edu.c - Main driver file for implementing QEMU edu driver
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/printk.h>

static int __init startup_module(void)
{
	pr_info("Hello world!\n");

	return 0;
}

static void __exit teardown_module(void)
{
	pr_info("Goodbye world!");
}

module_init(startup_module);
module_exit(teardown_module);

MODULE_LICENSE("GPL");
