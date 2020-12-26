Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742422E2CF0
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 04:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgLZD0m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 22:26:42 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:55703 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725973AbgLZD0m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 22:26:42 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8FE2758039C;
        Fri, 25 Dec 2020 22:25:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 25 Dec 2020 22:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=M
        i6dxAL7B+C6KIpFqqn6Sx75CVNkxhm5Bl0CxbnL6vU=; b=JgT8FKZ8F+bHnfQpH
        JDi/ftKZ8BlzRI20QqpFuas2lWKf57+0sA0II0/rGhGnc8QdZ/SSl5QOE+6XIukq
        skY9oZA6bkbDof89gLU9pO3Wu8O0GRKZnnMSWKRZk37Oi2oi+DPboGBlacKXYP+0
        6AvY2cxyRPIAfM18/JGKtyze/u/QLIYsN5S7imZTRNCM4E+MwUM7aKUo7lUTtsaQ
        qsIrkINtw7jrmqmDMy4HgZNztPDlD15/pySLBzaF5piOSEkUirvEOxK3xcPQZj8q
        Ho6Hs/riQRZntmLxGO8NJrHaoWQ2ypLkoxxt2m42Fe1qADTvkZfV8TDDQNO1rHrz
        NI18A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Mi6dxAL7B+C6KIpFqqn6Sx75CVNkxhm5Bl0CxbnL6
        vU=; b=WdZ6LTDVASzMI2vCx6eb+ns5Z+AgASdCQdWMzjldT6001MYlweU5EyptX
        IFeHEZq9OXbyhDajkxqHgCVWaUE9hLxSU7O0WISckusdUwEwYMcxZWobuxKcgH2j
        Gx7W1snyxwhFBsUhYOe1LIYvHEG/bsyLJvx2KqdghmEd5EQXXwchxMcOWrWwfz3F
        FmFHCt8efnbYt80EOMtFATAfMnzQIjms69vHzrIOnm07GTSRBp+u5OtwKua9PD8w
        ZK4/57OopluMdBM5w6nEN96kx2MvRwMEcbdxspm9pNiaNxi+oV2IBpSItGE3hqCY
        qPd9AlYUnmKHI68xaeseU2XDnB8vQ==
X-ME-Sender: <xms:Qq3mX9ewlvoREn5UG4yKeo9TX9UEd9Tz_L5JEVTpup8kWwl4OIhE6A>
    <xme:Qq3mX7ORNNXrY8qBvn80mCJxhm64ZtvZXjpzFLLHk7Bu2bwOQAmYR4OScE7ro7xOp
    -ILQXUyZ8QWVpktbGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdduvddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecukfhppeeghedrfeefrdeh
    tddrvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Qq3mX2gzrYRuTNYhzDbKwR9uuOWDX35Rp__ycpVO9l2llLsS7lqNxw>
    <xmx:Qq3mX2-_sfJdKHnFUZ0W6bvLRuE9WoRxDv_3spZEkaa7w8VI53Yong>
    <xmx:Qq3mX5sARADuqoESXiScUsE1ZNAYmW8LS5VT4-1K9dVu5JKZXAdDeA>
    <xmx:Qq3mX-4n6M3gX3fp0NDpaUStbxzOHabnONRb9gytVmafskAiWLUI3KZ-Xss>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2A3A71080057;
        Fri, 25 Dec 2020 22:25:52 -0500 (EST)
Subject: Re: [PATCH 4/6] input: Add N64 controller driver
To:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
References: <20201225190115.efa38e5a0107bec09f993ed6@gmx.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c1d5fdff-cfee-5252-a9f4-7ea6806a1113@flygoat.com>
Date:   Sat, 26 Dec 2020 11:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201225190115.efa38e5a0107bec09f993ed6@gmx.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2020/12/26 ÉÏÎç1:01, Lauri Kasanen Ð´µÀ:
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>   drivers/input/joystick/Kconfig  |   6 +
>   drivers/input/joystick/Makefile |   2 +-
>   drivers/input/joystick/n64joy.c | 300 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 307 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/input/joystick/n64joy.c
>
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index b080f0c..b5098fb 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -382,4 +382,10 @@ config JOYSTICK_FSIA6B
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called fsia6b.
>
> +config JOYSTICK_N64
> +	bool "N64 controller"
> +	depends on MIPS_N64
> +	help
> +	  Support for the four N64 controllers.
> +
>   endif
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index 58232b3..31d720c 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_JOYSTICK_INTERACT)		+= interact.o
>   obj-$(CONFIG_JOYSTICK_JOYDUMP)		+= joydump.o
>   obj-$(CONFIG_JOYSTICK_MAGELLAN)		+= magellan.o
>   obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
> +obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
>   obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
>   obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
>   obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
> @@ -37,4 +38,3 @@ obj-$(CONFIG_JOYSTICK_WARRIOR)		+= warrior.o
>   obj-$(CONFIG_JOYSTICK_WALKERA0701)	+= walkera0701.o
>   obj-$(CONFIG_JOYSTICK_XPAD)		+= xpad.o
>   obj-$(CONFIG_JOYSTICK_ZHENHUA)		+= zhenhua.o
> -
> diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
> new file mode 100644
> index 0000000..fbf3686
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
> +#define REG_BASE ((u32 *) CKSEG1ADDR(0xa4800000))

0xa4800000 sounds like a KSEG1 addr, I think phys should be 0x14800000?
For driver it is common to use ioremap, or at least TO_UNCAC.

Thanks.

- Jiaxun

> +
> +#define SI_DRAM_REG 0
> +#define SI_READ_REG 1
> +#define SI_WRITE_REG 4
> +#define SI_STATUS_REG 6
> +
> +#define SI_STATUS_DMA_BUSY  (1 << 0)
> +#define SI_STATUS_IO_BUSY   (1 << 1)
> +
> +#define N64_CONTROLLER_ID 0x0500
> +
> +static struct input_dev *n64joy_dev[4];
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
> +			n64joy_dev[i]->absbit[0] = BIT_MASK(ABS_X) | BIT_MASK(ABS_Y);
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
> --
> 2.6.2
>

