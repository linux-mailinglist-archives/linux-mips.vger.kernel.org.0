Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4574A2EBCE2
	for <lists+linux-mips@lfdr.de>; Wed,  6 Jan 2021 11:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbhAFK7u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 05:59:50 -0500
Received: from mout.gmx.net ([212.227.17.21]:60769 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbhAFK7t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 Jan 2021 05:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609930694;
        bh=dfy7db4EWW+bJy9LK1v4GWL2G4wdgGW16e1kYvKDVBE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=dNa3aZAXbGElyWJOdIe4huZMC0XWMPxp3lZCIW9j33c1YmrIvhhYvKSeVo0b+A0ws
         uqbLAbIwHGmagLdqMQNZ7b4fAAX6eUPhTV+tfsj0+v3XdLJaEe+W+M9M7yGlY1sVD2
         AOooDq+a+Ps57mzFk7++f23iHmGdhALOd3A7vsmE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MIdeX-1kiXfX1qMP-00EdOE; Wed, 06
 Jan 2021 11:58:14 +0100
Date:   Wed, 6 Jan 2021 12:59:53 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org
Subject: [PATCH 4/6 v2] input: Add N64 controller driver
Message-Id: <20210106125953.5d2759c5dedf8025a3cf9b0e@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GsAW43rbwGjwAh+XlwVqY8Ttu1/axKY3dPcr3HZnY7qUPFaiCtg
 r080+whg/ME8C5ouua/qMlTi8iw2ldZ3MQU2Dx4g98GGWhqe4sk9dELlKQNdKdSDSB2Y0Oj
 Jyebgp6r4KObekON3wMQ6CDInR7KOp4Mx/lv23qlQIaVNCSQ6siDtb1Vm2/AIMk7/EKqkcq
 6WpcjwChml86nrjyeKXSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CZKEpLgvsZg=:l7U2Cub++uBYye0Wjc02UM
 XZBnLdMRHjh2JPSIFqDxqta6djUxqnlSlQgRZTGGKQE5tW6fAbQ80C0zhMWR3wRmUTJL+FBy5
 U/j3ks2MVp9LP6RBTWIdp7l+/PjCM8b6NzRAwZAu2pIZR+JiuvI8kHrUcK6jIgF+8sIJWaV32
 bn0sYunvnebI32EqEHpt8IeVrUni8TT06lGEzPViJO+fZ23Kh53QC7kerRWOFUN6sG27C+hxA
 SmnV3sCM+qkfKOsl9rV1vEBiR+GhpRnKLu90ofGQRcZ6Annt4qQbwJR9shUNzWViBePvJjWdy
 hc9Jx7+5XL0kOAJ0DLOJdzOcOC4BEdpJYeHoPRkuoyK/o6dWdeHhiVUBw8PWurapJWwGxBMAd
 6tZ9eMbmFRu5mmnQOJ4mR6fItNa9K/RhSmmRB0xtCcuT52zy3W8ehGPYvgo+fZbLt4fMu/upE
 1cjCTbdvq8nD9fcn7+VRBeRHq0SOImDnhjUx5qdPgCXObLIMpVZy/rNvPhny1RqkRl5KX2Isc
 GFp5BVMZWn2v2/j9TKr9mRoN43sPxj7pt4jHqxlrTyGJWRGCRDrJh+8HINU34gY+O+sE7fsUd
 uEkohpc+DwwIiuULuxhqGbrz62Eyz5UkEcQI4tYzjxgpLkUmVbBuKIrZ1/iGef8cYcAtuNXij
 2RECQGS6wNVmqVSDA5eN6yANq1CkhXeD8NYHXDloBkf96m6WWY1oQFRcrMbz/9sok1SoH6niX
 41y2PmHUED+RqPlfI5Yx59GsyBfD9C4STfABzt6262ze6W/s4pFMwGeRsDnT8K2HAM9TM+1gC
 TPP1iMabjB79OV/IsqMwGfaNRqAKG/5e9w7gG7sXGcyc9usRRtWSEIkiwRkhP/kRqoHEcq04C
 iJUniKTB8N4QDCRtRXuA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds support for the four built-in controller
ports on the Nintendo 64 console. The N64 controller
includes an analog stick, a d-pad, and several buttons.

No module support as the target has only 8mb ram.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--

v2:
BIT()
define 4
use a dev struct
cpu_relax
bit-setting helpers
pr_fmt

 drivers/input/joystick/Kconfig  |   6 +
 drivers/input/joystick/Makefile |   2 +-
 drivers/input/joystick/n64joy.c | 322 +++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 329 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/joystick/n64joy.c

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconf=
ig
index b080f0c..e1a8128 100644
=2D-- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -382,4 +382,10 @@ config JOYSTICK_FSIA6B
 	  To compile this driver as a module, choose M here: the
 	  module will be called fsia6b.

+config JOYSTICK_N64
+	bool "N64 controller"
+	depends on MACH_NINTENDO64
+	help
+	  Support for the four N64 controllers.
+
 endif
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Make=
file
index 58232b3..31d720c 100644
=2D-- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_JOYSTICK_INTERACT)		+=3D interact.o
 obj-$(CONFIG_JOYSTICK_JOYDUMP)		+=3D joydump.o
 obj-$(CONFIG_JOYSTICK_MAGELLAN)		+=3D magellan.o
 obj-$(CONFIG_JOYSTICK_MAPLE)		+=3D maplecontrol.o
+obj-$(CONFIG_JOYSTICK_N64)		+=3D n64joy.o
 obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+=3D psxpad-spi.o
 obj-$(CONFIG_JOYSTICK_PXRC)		+=3D pxrc.o
 obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+=3D sidewinder.o
@@ -37,4 +38,3 @@ obj-$(CONFIG_JOYSTICK_WARRIOR)		+=3D warrior.o
 obj-$(CONFIG_JOYSTICK_WALKERA0701)	+=3D walkera0701.o
 obj-$(CONFIG_JOYSTICK_XPAD)		+=3D xpad.o
 obj-$(CONFIG_JOYSTICK_ZHENHUA)		+=3D zhenhua.o
-
diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64j=
oy.c
new file mode 100644
index 0000000..dcb4857
=2D-- /dev/null
+++ b/drivers/input/joystick/n64joy.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for the four N64 controllers.
+ *
+ * Copyright (c) 2020 Lauri Kasanen
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/limits.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+
+#include <asm/addrspace.h>
+#include <asm/io.h>
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("Driver for N64 controllers");
+MODULE_LICENSE("GPL");
+
+#define PIF_RAM 0x1fc007c0
+#define REG_BASE ((u32 *) TO_UNCAC(0x4800000))
+
+#define SI_DRAM_REG 0
+#define SI_READ_REG 1
+#define SI_WRITE_REG 4
+#define SI_STATUS_REG 6
+
+#define SI_STATUS_DMA_BUSY  BIT(0)
+#define SI_STATUS_IO_BUSY   BIT(1)
+
+#define N64_CONTROLLER_ID 0x0500
+
+#define MAX_CONTROLLERS 4
+
+static const char *n64joy_phys[MAX_CONTROLLERS] =3D {
+	"n64joy/port0",
+	"n64joy/port1",
+	"n64joy/port2",
+	"n64joy/port3",
+};
+
+struct n64joy_priv {
+	u64 si_buf[8] ____cacheline_aligned;
+	struct timer_list timer;
+	struct mutex n64joy_mutex;
+	struct input_dev *n64joy_dev[MAX_CONTROLLERS];
+	u8 n64joy_opened;
+};
+
+struct joydata {
+	unsigned: 16; // unused
+	unsigned err: 2;
+	unsigned: 14; // unused
+
+	union {
+		u32 data;
+
+		struct {
+			unsigned a: 1;
+			unsigned b: 1;
+			unsigned z: 1;
+			unsigned start: 1;
+			unsigned up: 1;
+			unsigned down: 1;
+			unsigned left: 1;
+			unsigned right: 1;
+			unsigned: 2; // unused
+			unsigned l: 1;
+			unsigned r: 1;
+			unsigned c_up: 1;
+			unsigned c_down: 1;
+			unsigned c_left: 1;
+			unsigned c_right: 1;
+			signed x: 8;
+			signed y: 8;
+		};
+	};
+};
+
+static void n64joy_write_reg(const u8 reg, const u32 value)
+{
+	__raw_writel(value, REG_BASE + reg);
+}
+
+static u32 n64joy_read_reg(const u8 reg)
+{
+	return __raw_readl(REG_BASE + reg);
+}
+
+static void n64joy_wait_si_dma(void)
+{
+	while (n64joy_read_reg(SI_STATUS_REG) & (SI_STATUS_DMA_BUSY | SI_STATUS_=
IO_BUSY))
+		cpu_relax();
+}
+
+static void n64joy_exec_pif(struct n64joy_priv *priv, const u64 in[8])
+{
+	unsigned long flags;
+
+	dma_cache_wback_inv((unsigned long) in, 8 * 8);
+	dma_cache_inv((unsigned long) priv->si_buf, 8 * 8);
+
+	local_irq_save(flags);
+
+	n64joy_wait_si_dma();
+
+	barrier();
+	n64joy_write_reg(SI_DRAM_REG, virt_to_phys(in));
+	barrier();
+	n64joy_write_reg(SI_WRITE_REG, PIF_RAM);
+	barrier();
+
+	n64joy_wait_si_dma();
+
+	barrier();
+	n64joy_write_reg(SI_DRAM_REG, virt_to_phys(priv->si_buf));
+	barrier();
+	n64joy_write_reg(SI_READ_REG, PIF_RAM);
+	barrier();
+
+	n64joy_wait_si_dma();
+
+	local_irq_restore(flags);
+}
+
+static const u64 polldata[] ____cacheline_aligned =3D {
+	0xff010401ffffffff,
+	0xff010401ffffffff,
+	0xff010401ffffffff,
+	0xff010401ffffffff,
+	0xfe00000000000000,
+	0,
+	0,
+	1
+};
+
+static void n64joy_poll(struct timer_list *t)
+{
+	const struct joydata *data;
+	struct n64joy_priv *priv =3D container_of(t, struct n64joy_priv, timer);
+	struct input_dev *dev;
+	u32 i;
+
+	n64joy_exec_pif(priv, polldata);
+
+	data =3D (struct joydata *) priv->si_buf;
+
+	for (i =3D 0; i < MAX_CONTROLLERS; i++) {
+		if (!priv->n64joy_dev[i])
+			continue;
+
+		dev =3D priv->n64joy_dev[i];
+
+		// d-pad
+		input_report_key(dev, BTN_DPAD_UP, data[i].up);
+		input_report_key(dev, BTN_DPAD_DOWN, data[i].down);
+		input_report_key(dev, BTN_DPAD_LEFT, data[i].left);
+		input_report_key(dev, BTN_DPAD_RIGHT, data[i].right);
+
+		// c buttons
+		input_report_key(dev, BTN_FORWARD, data[i].c_up);
+		input_report_key(dev, BTN_BACK, data[i].c_down);
+		input_report_key(dev, BTN_LEFT, data[i].c_left);
+		input_report_key(dev, BTN_RIGHT, data[i].c_right);
+
+		// matching buttons
+		input_report_key(dev, BTN_START, data[i].start);
+		input_report_key(dev, BTN_Z, data[i].z);
+
+		// remaining ones: a, b, l, r
+		input_report_key(dev, BTN_0, data[i].a);
+		input_report_key(dev, BTN_1, data[i].b);
+		input_report_key(dev, BTN_2, data[i].l);
+		input_report_key(dev, BTN_3, data[i].r);
+
+		input_report_abs(dev, ABS_X, data[i].x);
+		input_report_abs(dev, ABS_Y, data[i].y);
+
+		input_sync(dev);
+	}
+
+	mod_timer(&priv->timer, jiffies + msecs_to_jiffies(16));
+}
+
+static int n64joy_open(struct input_dev *dev)
+{
+	struct n64joy_priv *priv =3D input_get_drvdata(dev);
+	int err;
+
+	err =3D mutex_lock_interruptible(&priv->n64joy_mutex);
+	if (err)
+		return err;
+
+	if (!priv->n64joy_opened) {
+		// Could use the vblank irq, but it's not important if the poll
+		// point slightly changes.
+		timer_setup(&priv->timer, n64joy_poll, 0);
+		mod_timer(&priv->timer, jiffies + msecs_to_jiffies(16));
+	}
+
+	priv->n64joy_opened++;
+
+	mutex_unlock(&priv->n64joy_mutex);
+	return err;
+}
+
+static void n64joy_close(struct input_dev *dev)
+{
+	struct n64joy_priv *priv =3D input_get_drvdata(dev);
+
+	mutex_lock(&priv->n64joy_mutex);
+	if (!--priv->n64joy_opened)
+		del_timer_sync(&priv->timer);
+	mutex_unlock(&priv->n64joy_mutex);
+}
+
+static const u64 __initconst scandata[] ____cacheline_aligned =3D {
+	0xff010300ffffffff,
+	0xff010300ffffffff,
+	0xff010300ffffffff,
+	0xff010300ffffffff,
+	0xfe00000000000000,
+	0,
+	0,
+	1
+};
+
+static int __init n64joy_init(void)
+{
+	const struct joydata *data;
+	struct n64joy_priv *priv;
+	struct input_dev *dev;
+	int err =3D 0;
+	u32 i, j, found =3D 0;
+
+	priv =3D kzalloc(sizeof(struct n64joy_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	mutex_init(&priv->n64joy_mutex);
+
+	// The controllers are not hotpluggable, so we can scan in init
+	n64joy_exec_pif(priv, scandata);
+
+	data =3D (struct joydata *) priv->si_buf;
+
+	for (i =3D 0; i < MAX_CONTROLLERS; i++) {
+		if (!data[i].err && data[i].data >> 16 =3D=3D N64_CONTROLLER_ID) {
+			found++;
+
+			dev =3D priv->n64joy_dev[i] =3D input_allocate_device();
+			if (!priv->n64joy_dev[i]) {
+				err =3D -ENOMEM;
+				goto fail;
+			}
+
+			input_set_drvdata(dev, priv);
+
+			dev->name =3D "N64 controller";
+			dev->phys =3D n64joy_phys[i];
+			dev->id.bustype =3D BUS_HOST;
+			dev->id.vendor =3D 0;
+			dev->id.product =3D data[i].data >> 16;
+			dev->id.version =3D 0;
+
+			dev->open =3D n64joy_open;
+			dev->close =3D n64joy_close;
+
+			// d-pad
+			input_set_capability(dev, EV_KEY, BTN_DPAD_UP);
+			input_set_capability(dev, EV_KEY, BTN_DPAD_DOWN);
+			input_set_capability(dev, EV_KEY, BTN_DPAD_LEFT);
+			input_set_capability(dev, EV_KEY, BTN_DPAD_RIGHT);
+			// c buttons
+			input_set_capability(dev, EV_KEY, BTN_LEFT);
+			input_set_capability(dev, EV_KEY, BTN_RIGHT);
+			input_set_capability(dev, EV_KEY, BTN_FORWARD);
+			input_set_capability(dev, EV_KEY, BTN_BACK);
+			// matching buttons
+			input_set_capability(dev, EV_KEY, BTN_START);
+			input_set_capability(dev, EV_KEY, BTN_Z);
+			// remaining ones: a, b, l, r
+			input_set_capability(dev, EV_KEY, BTN_0);
+			input_set_capability(dev, EV_KEY, BTN_1);
+			input_set_capability(dev, EV_KEY, BTN_2);
+			input_set_capability(dev, EV_KEY, BTN_3);
+
+			for (j =3D 0; j < 2; j++) {
+				input_set_abs_params(dev, ABS_X + j,
+						     S8_MIN, S8_MAX, 0, 0);
+			}
+
+			err =3D input_register_device(dev);
+			if (err) {
+				input_free_device(dev);
+				goto fail;
+			}
+		}
+	}
+
+	pr_info("%u controller(s) connected\n", found);
+
+	if (!found)
+		return -ENODEV;
+
+	return 0;
+fail:
+	for (i =3D 0; i < MAX_CONTROLLERS; i++) {
+		if (!priv->n64joy_dev[i])
+			continue;
+		input_unregister_device(priv->n64joy_dev[i]);
+	}
+	return err;
+}
+
+module_init(n64joy_init);
=2D-
2.6.2

