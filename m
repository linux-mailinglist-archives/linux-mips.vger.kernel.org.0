Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101982F4E46
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 16:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbhAMPPC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 10:15:02 -0500
Received: from mout.gmx.net ([212.227.15.18]:46697 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbhAMPPB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 10:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610550806;
        bh=V2H1LQMFORpJ3T6RKLvfoJKZ/snyAYsiqh5441bb8M0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=beyjTFwbog9PcAPws51tsITMe7r/2iD6biAw71LRCXYK107F6gTNRvbsBXRPTIJpA
         HhVG0ZhKRLjZbkh54K/WqWjvWBfXuhd2ExPQIgHZkiu4+2ElHQTH01H++4P3FobO7A
         ER0sDf3M9Re/QztL+cOTZHKTRBEed04HIV4/CkPI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N3KTo-1jzncq0Rta-010NLP; Wed, 13
 Jan 2021 16:13:26 +0100
Date:   Wed, 13 Jan 2021 17:12:36 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org
Subject: [PATCH 4/6 v6] input: Add N64 controller driver
Message-Id: <20210113171236.c22d14ff656dba3d21910c45@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s/Q5eAR5yB2r0cnHgQgNVEapiWggeDm3m22VvyO64NrVM8Pd8M0
 ps6eFDLqO7q4dcH93WU8fv4oZBXQ26bAVUoDmYkv0MUcQFHD+FfG2TOYN/LcA+NueBO4Tal
 eNhl34Tgc9DHelq279ykIm/jZ4Vea1qL0Vy5TbHNUcNg+WNyAKSLqnj899kCDR5DnvaXhk7
 biyG+kKq+aW/85z7bLxtg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UYyUa50UhtU=:2phw2q0QiJFLABflJds36h
 49cqwL6szlM/7ECruWFEacRCDJw8t5ozJgfDpaYK5CV2GU3guj7dIh4YmZpcSS38SX/oJxosP
 1L6uPBdl48A7BMAoDsvDgoOzh5P3AdSLOxmEdHuTBz5k8aJo5RQS/jJ6BUKdF8DYvrXUuy8YH
 5W7iy7AsGPD9eaoRg76gGGfv9poSv+7ZcpJ0C3Zbox8OC+lKq6rNXQ2TN/G9uYVqyv3tUCAcD
 VJkw9LrlfqOXSk06YNMA4OuY4KpUxv3YEF7wi+i3kXw026KKMTBa35E0bOhdeHxLBcjrKmH5p
 GkuRUY2MCkXsEgEQF7DxYpJCOg4SYNI66i3Hrex2CdWCbzbap6wkOy2K/UOcBoi3X9ZmymJq8
 MP5hLsi2beMymKVZ0Ohuw0QDbZRoVWApvUmaxjiLiMX5GmLAUm+4cq/4UwBW1XSDVR9ts6p0S
 kYLg8ueR2pu/n7/pJNfmO0GC45Bh84g6pDxL1HrSioVdj2VRGmMIKlA+CDsMP1mipjzUxdb5k
 CM53TGOxWRYzZLDrhM5dewBpTtR/qCEgfZtSzLhHPF9H5fkdnSzV3mQRdTdpv42v8srHg7K6/
 veSoFzakcJbjRDCsWNPLaNbWleklfdMjvPlAcVaDGWU4Il9eZ8qxlYBXBOEs+arBV9XboHLe8
 86HI+mY+VA078ME6VhgvcsllIZlrOjEN69zVPpyAZ2xV43okDayu/1RO8X+ueLorLjAf7S7Vj
 DRJ0oYtOhgD5mxDlIN4kNBBou5O1IgEs/wrBSoL25FGhB/LRZE7UsMq2U69fjtt7Bog28ciEZ
 P6N1vLCzYxZra9qUPSeFV/e8DpBYKXfcL8n/sXp2M+Vc0QLdUXOR9GPlTp2kpwJSJRf7PMJax
 gCudQODQ/iOgoTmWSqGQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This adds support for the four built-in controller
ports on the Nintendo 64 console. The N64 controller
includes an analog stick, a d-pad, and several buttons.

No module support as the target has only 8mb ram.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 drivers/input/joystick/Kconfig  |   6 +
 drivers/input/joystick/Makefile |   2 +-
 drivers/input/joystick/n64joy.c | 345 +++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 352 insertions(+), 1 deletion(-)
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
index 0000000..e7650c5
=2D-- /dev/null
+++ b/drivers/input/joystick/n64joy.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for the four N64 controllers.
+ *
+ * Copyright (c) 2021 Lauri Kasanen
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
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+
+MODULE_AUTHOR("Lauri Kasanen <cand@gmx.com>");
+MODULE_DESCRIPTION("Driver for N64 controllers");
+MODULE_LICENSE("GPL");
+
+#define PIF_RAM 0x1fc007c0
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
+	u32 __iomem *reg_base;
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
+static void n64joy_write_reg(u32 __iomem *reg_base, const u8 reg, const u=
32 value)
+{
+	writel(value, reg_base + reg);
+}
+
+static u32 n64joy_read_reg(u32 __iomem *reg_base, const u8 reg)
+{
+	return readl(reg_base + reg);
+}
+
+static void n64joy_wait_si_dma(u32 __iomem *reg_base)
+{
+	while (n64joy_read_reg(reg_base, SI_STATUS_REG) &
+	       (SI_STATUS_DMA_BUSY | SI_STATUS_IO_BUSY))
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
+	n64joy_wait_si_dma(priv->reg_base);
+
+	barrier();
+	n64joy_write_reg(priv->reg_base, SI_DRAM_REG, virt_to_phys(in));
+	barrier();
+	n64joy_write_reg(priv->reg_base, SI_WRITE_REG, PIF_RAM);
+	barrier();
+
+	n64joy_wait_si_dma(priv->reg_base);
+
+	barrier();
+	n64joy_write_reg(priv->reg_base, SI_DRAM_REG, virt_to_phys(priv->si_buf)=
);
+	barrier();
+	n64joy_write_reg(priv->reg_base, SI_READ_REG, PIF_RAM);
+	barrier();
+
+	n64joy_wait_si_dma(priv->reg_base);
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
+/*
+ * The target device is embedded and RAM-constrained. We save RAM
+ * by initializing in __init code that gets dropped late in boot.
+ * For the same reason there is no module or unloading support.
+ */
+static int __init n64joy_probe(struct platform_device *pdev)
+{
+	const struct joydata *data;
+	struct resource *res;
+	struct n64joy_priv *priv;
+	struct input_dev *dev;
+	unsigned long len;
+	int err =3D 0;
+	u32 i, j, found =3D 0;
+
+	priv =3D kzalloc(sizeof(struct n64joy_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	mutex_init(&priv->n64joy_mutex);
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	len =3D res->end - res->start + 1;
+	priv->reg_base =3D ioremap(res->start, len);
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
+	iounmap(priv->reg_base);
+
+	for (i =3D 0; i < MAX_CONTROLLERS; i++) {
+		if (!priv->n64joy_dev[i])
+			continue;
+		input_unregister_device(priv->n64joy_dev[i]);
+	}
+	return err;
+}
+
+static struct platform_driver n64joy_driver =3D {
+	.driver =3D {
+		.name =3D "n64joy",
+	},
+};
+
+static int __init n64joy_init(void)
+{
+	return platform_driver_probe(&n64joy_driver, n64joy_probe);
+}
+
+module_init(n64joy_init);
=2D-
2.6.2

