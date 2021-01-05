Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA772EB546
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 23:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbhAEWQK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 17:16:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbhAEWQJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jan 2021 17:16:09 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A92CC061574;
        Tue,  5 Jan 2021 14:15:29 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id e2so483884plt.12;
        Tue, 05 Jan 2021 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d70pmQAkUqAzxUKmnpL5+2ZZVE1TsxjThgE1k8mr87c=;
        b=iMHGAzYZ+Vqb77VxCUxggZGRC1gLiZBccBsWtUooWAkNkOgqlAx6L+BHUAsjDFzflk
         iqpycHHe7rZpvu83TqcW/6H/3MaIzT7+HPajoqSIZAe15p/w1AtREukrh23/muQtCc8L
         h2kKRcnF/O/rpdfbjs5hJmLVNqnT2Dsap8FVAMJKJNtr0Iw1bS7I7iAJZ5LUhOof1sH2
         mGG/W+B8hQYtBCD8hZyL3dJZZcIP8dHxKR8C0n+z9fJ5DPgmMlJsHeidl+Gt7Lbz18cl
         0fs8kd+cNqcY5aNIEggiIDdbFghebEyUt7ZwPoZLTw8v6Bq4pX6+dV230k7mtVRhyLBv
         zUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d70pmQAkUqAzxUKmnpL5+2ZZVE1TsxjThgE1k8mr87c=;
        b=mZsBY5ejH4exHtVRkFmpSECZ1BtCeN01jGsm4tORUwff1UaZRd7p602r1qkAtSHkSR
         1slhps/EY3iO6UWDSuf1F+jENqsxfR6Uz4fxwWliVI0rjMOqcB+zOP9zobG9fPfA1v+h
         Z3FsA4ktI/AmFeCLf9n2cRE3GzNPPd5YrSx4ZuqD3yPFKTjNb9gdlC1NlIYvhH2qUWBp
         XfVR6+9E/o77IgqbsBaneUHM9ItaoJrW0cJ5Lpbj0pawyN4AI2wb11kWTF0SyAUKX+Kz
         FOeGCCufy/hPzpSY/rBFf0l87ISFsAD/MvzYROS3FdNncY1N/beYNmt76rYO0ilUpM5Y
         5acw==
X-Gm-Message-State: AOAM530+NAws1vQkV3yl31pRzDLegsYRw4zVSvdIF0zC63ATNZCkgt2b
        dlXbC5eJm5Kxnc5HX0kQzQFjY8/KlMc=
X-Google-Smtp-Source: ABdhPJwyPM3seuJgiWFAK/MsmAEjesPfrJq74j3KCK98Jo5lfjQfUz7pU6P1a1YWH77NmuJkOuTbzg==
X-Received: by 2002:a17:902:e9d2:b029:db:d4f6:b581 with SMTP id 18-20020a170902e9d2b02900dbd4f6b581mr1482725plk.34.1609884928858;
        Tue, 05 Jan 2021 14:15:28 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z23sm348040pfj.143.2021.01.05.14.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 14:15:28 -0800 (PST)
Date:   Tue, 5 Jan 2021 14:15:25 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 4/6] input: Add N64 controller driver
Message-ID: <X/Tk/ZrqyPlGriiZ@google.com>
References: <20210104154811.ced3a894cddc4d309827307c@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104154811.ced3a894cddc4d309827307c@gmx.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lauri,

On Mon, Jan 04, 2021 at 03:48:11PM +0200, Lauri Kasanen wrote:
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  drivers/input/joystick/Kconfig  |   6 +
>  drivers/input/joystick/Makefile |   2 +-
>  drivers/input/joystick/n64joy.c | 300 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/input/joystick/n64joy.c
> 
> input folks: rest of the series is on linux-mips. Being mips-specific,
> not sure which tree this should go to.
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index b080f0c..e1a8128 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -382,4 +382,10 @@ config JOYSTICK_FSIA6B
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called fsia6b.
> 
> +config JOYSTICK_N64
> +	bool "N64 controller"
> +	depends on MACH_NINTENDO64
> +	help
> +	  Support for the four N64 controllers.
> +

"To compile this driver as a module..."

>  endif
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index 58232b3..31d720c 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_JOYSTICK_INTERACT)		+= interact.o
>  obj-$(CONFIG_JOYSTICK_JOYDUMP)		+= joydump.o
>  obj-$(CONFIG_JOYSTICK_MAGELLAN)		+= magellan.o
>  obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
> +obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
>  obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
> @@ -37,4 +38,3 @@ obj-$(CONFIG_JOYSTICK_WARRIOR)		+= warrior.o
>  obj-$(CONFIG_JOYSTICK_WALKERA0701)	+= walkera0701.o
>  obj-$(CONFIG_JOYSTICK_XPAD)		+= xpad.o
>  obj-$(CONFIG_JOYSTICK_ZHENHUA)		+= zhenhua.o
> -
> diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
> new file mode 100644
> index 0000000..477a4f7
> --- /dev/null
> +++ b/drivers/input/joystick/n64joy.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Support for the four N64 controllers.
> + *
> + * Copyright (c) 2020 Lauri Kasanen
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/limits.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/timer.h>
> +
> +#include <asm/addrspace.h>
> +#include <asm/io.h>
> +
> +MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
> +MODULE_DESCRIPTION("Driver for N64 controllers");
> +MODULE_LICENSE("GPL");
> +
> +#define PIF_RAM 0x1fc007c0
> +#define REG_BASE ((u32 *) TO_UNCAC(0x4800000))
> +
> +#define SI_DRAM_REG 0
> +#define SI_READ_REG 1
> +#define SI_WRITE_REG 4
> +#define SI_STATUS_REG 6
> +
> +#define SI_STATUS_DMA_BUSY  (1 << 0)

BIT(0)

> +#define SI_STATUS_IO_BUSY   (1 << 1)

BIT(1)

> +
> +#define N64_CONTROLLER_ID 0x0500
> +
> +static struct input_dev *n64joy_dev[4];

Use a #define for 4 please.

> +static const char *n64joy_phys[4] = {
> +	"n64joy/port0",
> +	"n64joy/port1",
> +	"n64joy/port2",
> +	"n64joy/port3",
> +};
> +
> +static u8 n64joy_opened;
> +static DEFINE_MUTEX(n64joy_mutex);
> +static struct timer_list timer;
> +
> +static u64 si_buf[8] ____cacheline_aligned;

Even though this is a singleton device, I would prefer if we defined a
device structure and put these data items there, instead of having
module-globals.

> +
> +struct joydata {
> +	unsigned: 16; // unused
> +	unsigned err: 2;
> +	unsigned: 14; // unused
> +
> +	union {
> +		u32 data;
> +
> +		struct {
> +			unsigned a: 1;
> +			unsigned b: 1;
> +			unsigned z: 1;
> +			unsigned start: 1;
> +			unsigned up: 1;
> +			unsigned down: 1;
> +			unsigned left: 1;
> +			unsigned right: 1;
> +			unsigned: 2; // unused
> +			unsigned l: 1;
> +			unsigned r: 1;
> +			unsigned c_up: 1;
> +			unsigned c_down: 1;
> +			unsigned c_left: 1;
> +			unsigned c_right: 1;
> +			signed x: 8;
> +			signed y: 8;
> +		};
> +	};
> +};
> +
> +static void n64joy_write_reg(const u8 reg, const u32 value)
> +{
> +	__raw_writel(value, REG_BASE + reg);
> +}
> +
> +static u32 n64joy_read_reg(const u8 reg)
> +{
> +	return __raw_readl(REG_BASE + reg);
> +}
> +
> +static void n64joy_wait_si_dma(void)
> +{
> +	while (n64joy_read_reg(SI_STATUS_REG) & (SI_STATUS_DMA_BUSY | SI_STATUS_IO_BUSY))
> +		;

This will give a warning if compiled with -Wempty-body (W=1). Can you
either add braces, or maybe we should have somethng like cpu_relax()
here?

> +}
> +
> +static void n64joy_exec_pif(const u64 in[8])
> +{
> +	unsigned long flags;
> +
> +	dma_cache_wback_inv((unsigned long) in, 8 * 8);
> +	dma_cache_inv((unsigned long) si_buf, 8 * 8);
> +
> +	local_irq_save(flags);
> +
> +	n64joy_wait_si_dma();
> +
> +	barrier();
> +	n64joy_write_reg(SI_DRAM_REG, virt_to_phys(in));
> +	barrier();
> +	n64joy_write_reg(SI_WRITE_REG, PIF_RAM);
> +	barrier();
> +
> +	n64joy_wait_si_dma();
> +
> +	barrier();
> +	n64joy_write_reg(SI_DRAM_REG, virt_to_phys(si_buf));
> +	barrier();
> +	n64joy_write_reg(SI_READ_REG, PIF_RAM);
> +	barrier();
> +
> +	n64joy_wait_si_dma();
> +
> +	local_irq_restore(flags);
> +}
> +
> +static const u64 polldata[] ____cacheline_aligned = {
> +	0xff010401ffffffff,
> +	0xff010401ffffffff,
> +	0xff010401ffffffff,
> +	0xff010401ffffffff,
> +	0xfe00000000000000,
> +	0,
> +	0,
> +	1
> +};
> +
> +static void n64joy_poll(struct timer_list *t)
> +{
> +	const struct joydata *data;
> +	u32 i;
> +
> +	n64joy_exec_pif(polldata);
> +
> +	data = (struct joydata *) si_buf;
> +
> +	for (i = 0; i < 4; i++) {
> +		if (!n64joy_dev[i])
> +			continue;
> +
> +		// d-pad
> +		input_report_key(n64joy_dev[i], BTN_DPAD_UP, data[i].up);
> +		input_report_key(n64joy_dev[i], BTN_DPAD_DOWN, data[i].down);
> +		input_report_key(n64joy_dev[i], BTN_DPAD_LEFT, data[i].left);
> +		input_report_key(n64joy_dev[i], BTN_DPAD_RIGHT, data[i].right);
> +
> +		// c buttons
> +		input_report_key(n64joy_dev[i], BTN_FORWARD, data[i].c_up);
> +		input_report_key(n64joy_dev[i], BTN_BACK, data[i].c_down);
> +		input_report_key(n64joy_dev[i], BTN_LEFT, data[i].c_left);
> +		input_report_key(n64joy_dev[i], BTN_RIGHT, data[i].c_right);
> +
> +		// matching buttons
> +		input_report_key(n64joy_dev[i], BTN_START, data[i].start);
> +		input_report_key(n64joy_dev[i], BTN_Z, data[i].z);
> +
> +		// remaining ones: a, b, l, r
> +		input_report_key(n64joy_dev[i], BTN_0, data[i].a);
> +		input_report_key(n64joy_dev[i], BTN_1, data[i].b);
> +		input_report_key(n64joy_dev[i], BTN_2, data[i].l);
> +		input_report_key(n64joy_dev[i], BTN_3, data[i].r);
> +
> +		input_report_abs(n64joy_dev[i], ABS_X, data[i].x);
> +		input_report_abs(n64joy_dev[i], ABS_Y, data[i].y);
> +
> +		input_sync(n64joy_dev[i]);
> +	}
> +
> +	mod_timer(&timer, jiffies + msecs_to_jiffies(16));
> +}
> +
> +static int n64joy_open(struct input_dev *dev)
> +{
> +	int err;
> +
> +	err = mutex_lock_interruptible(&n64joy_mutex);
> +	if (err)
> +		return err;
> +
> +	if (!n64joy_opened) {
> +		// Could use the vblank irq, but it's not important if the poll
> +		// point slightly changes.
> +		timer_setup(&timer, n64joy_poll, 0);
> +		mod_timer(&timer, jiffies + msecs_to_jiffies(16));
> +	}
> +
> +	n64joy_opened++;
> +
> +	mutex_unlock(&n64joy_mutex);
> +	return err;
> +}
> +
> +static void n64joy_close(struct input_dev *dev)
> +{
> +	mutex_lock(&n64joy_mutex);
> +	if (!--n64joy_opened)
> +		del_timer_sync(&timer);
> +	mutex_unlock(&n64joy_mutex);
> +}
> +
> +static const u64 __initconst scandata[] ____cacheline_aligned = {
> +	0xff010300ffffffff,
> +	0xff010300ffffffff,
> +	0xff010300ffffffff,
> +	0xff010300ffffffff,
> +	0xfe00000000000000,
> +	0,
> +	0,
> +	1
> +};
> +
> +static int __init n64joy_init(void)
> +{
> +	const struct joydata *data;
> +	int err = 0;
> +	u32 i, j, found = 0;
> +
> +	// The controllers are not hotpluggable, so we can scan in init
> +	n64joy_exec_pif(scandata);
> +
> +	data = (struct joydata *) si_buf;
> +
> +	memset(n64joy_dev, 0, 4 * sizeof(void *));
> +
> +	for (i = 0; i < 4; i++) {
> +		if (!data[i].err && data[i].data >> 16 == N64_CONTROLLER_ID) {
> +			found++;
> +
> +			n64joy_dev[i] = input_allocate_device();
> +			if (!n64joy_dev[i]) {
> +				err = -ENOMEM;
> +				goto fail;
> +			}
> +
> +			n64joy_dev[i]->name = "N64 controller";
> +			n64joy_dev[i]->phys = n64joy_phys[i];
> +			n64joy_dev[i]->id.bustype = BUS_HOST;
> +			n64joy_dev[i]->id.vendor = 0;
> +			n64joy_dev[i]->id.product = data[i].data >> 16;
> +			n64joy_dev[i]->id.version = 0;
> +
> +			n64joy_dev[i]->open = n64joy_open;
> +			n64joy_dev[i]->close = n64joy_close;
> +
> +			n64joy_dev[i]->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);

If you switch keys set up to input_set_capability() you would not need
this.

> +			n64joy_dev[i]->absbit[0] = BIT_MASK(ABS_X) | BIT_MASK(ABS_Y);

This is not needed as you are using input_set_abs_params().

> +
> +			// d-pad
> +			n64joy_dev[i]->keybit[BIT_WORD(BTN_DPAD_UP)] = BIT_MASK(BTN_DPAD_UP) |
> +				BIT_MASK(BTN_DPAD_DOWN) | BIT_MASK(BTN_DPAD_LEFT) |
> +				BIT_MASK(BTN_DPAD_RIGHT);
> +			// c buttons
> +			n64joy_dev[i]->keybit[BIT_WORD(BTN_LEFT)] |= BIT_MASK(BTN_LEFT) |
> +				BIT_MASK(BTN_RIGHT) | BIT_MASK(BTN_FORWARD) | BIT_MASK(BTN_BACK);
> +			// matching buttons
> +			n64joy_dev[i]->keybit[BIT_WORD(BTN_GAMEPAD)] |= BIT_MASK(BTN_START) |
> +				BIT_MASK(BTN_Z);
> +			// remaining ones: a, b, l, r
> +			n64joy_dev[i]->keybit[BIT_WORD(BTN_0)] |= BIT_MASK(BTN_0) |
> +				BIT_MASK(BTN_1) | BIT_MASK(BTN_2) | BIT_MASK(BTN_3);
> +
> +			for (j = 0; j < 2; j++) {
> +				input_set_abs_params(n64joy_dev[i], ABS_X + j,
> +						     S8_MIN, S8_MAX, 0, 0);
> +			}
> +
> +			err = input_register_device(n64joy_dev[i]);
> +			if (err) {
> +				input_free_device(n64joy_dev[i]);
> +				goto fail;
> +			}
> +		}
> +	}
> +
> +	pr_info("n64joy: %u controller(s) connected\n", found);

Please define

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

and you will not need to specify prefixes on individual messages.

> +
> +	if (!found)
> +		return -ENODEV;
> +
> +	return 0;
> +fail:
> +	for (i = 0; i < 4; i++) {
> +		if (!n64joy_dev[i])
> +			continue;
> +		input_unregister_device(n64joy_dev[i]);
> +	}
> +	return err;
> +}
> +
> +module_init(n64joy_init);

No option to unload the driver?

Thanks.

-- 
Dmitry
