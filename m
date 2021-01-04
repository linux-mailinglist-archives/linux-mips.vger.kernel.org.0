Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF812E964C
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 14:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbhADNsK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 08:48:10 -0500
Received: from mout.gmx.net ([212.227.15.15]:49137 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbhADNsI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 08:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609767993;
        bh=Ps2UI3hai1euXkSADfSbCtM1X7/CHjhU4zDFMCxSNWk=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=R8CRE7ey7P0shuiJ1Yab8jzRnp3IrQqQZcrZJ25j0K8YR9yc6aa5h13bxqT+puU0I
         A1DGQk6qWPdq3GBJwz+Ixq143QROTDB3LtqpkU9ku5nbZXPPY6n1TQoQpacdCz2vaV
         z/AxFp7xxQfTxTaozFqPbleETaJmTaIUijbk17LE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1McYCl-1kQNIC13tt-00cvOq; Mon, 04
 Jan 2021 14:46:33 +0100
Date:   Mon, 4 Jan 2021 15:48:11 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org
Subject: [PATCH 4/6] input: Add N64 controller driver
Message-Id: <20210104154811.ced3a894cddc4d309827307c@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bH2j6ody6wedHUCOw/jhz+FO5QkqoJh/LrL1xvzvyJlJf+ttPSd
 lMX+liEweien1N3xePLgOHbTAd0TMod6SImN66NjXbbkzu0LuVXK+dQU3KIFSAeiklN8DhD
 0uytiMmEoVT2urkiZqYzPM0JfxPE4g7gSDR8vyXbBS0w7PrxvIy4SSWrI9cIU/bdxTCqv+N
 g49ulxJUhDryXtHvgda2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:06JiRpPuHHQ=:h+JrRdDk4lR296d5QBO646
 YsmzIgBzXM1lnYmDmMiPJohIGszL5vO6MaAwTrJJhiRi/FYJRniZvjUUEFVFBylVdkuyVSvLv
 jN1X+1RPlpDr7IP6xxc6MOwJO1yv7x45K3ZgWrdbiV4ocv3xHXSEjwGx6iLQawtsvWxsskctd
 MlHxTgWxfZQ/Ib82sy4Fuovexx8VtrgktU8xsgpLcuW/du6pdqN8MeuDD+zXdjnwkrsZJ8iNr
 cgD6u5/6tYUXSqP1rgqgmiEtQohNHHeprEAbrt7HoMa3GLi/lgXS4b44d2jr11KrQKI/qV/6N
 dAlFemQvdmrH6yl8HosrQqFcaP88utMzQ8soHTvFP8vA/TZqX4Smd8ptVE0cioxGdCrFQkqdj
 UC4eMdJP4q5/fFgW+pCUOQo4in4GMxBCXbSD8JzYOdwS9aqJP7p1jV0rI2lv7/8vUCmjUcjyf
 4Uu0exHloPXA4rakt/c5XJdx0umue6IolkqlEsGBayXEsvwvFnUvxf60Yz6ZQKxA8BW4znnzP
 R6FROHxWPajYmMZyhqOiqv8y9n+GqhbFuD0eu2mWlVe93jXo/WiB8Q3gxuElVlJnZspXWRM0e
 bpHi9rzGa1LaUPs3Oe3PxmGAxTrF0haERmSo+cLRSDn9JmBTCrLqpJhPnH+lmspjZ527Q9Rr6
 hZYEeNjXBvfRgqdFFvQZRDq3nWayX4VonCm7V6aX/39w51LAMrOus/JbK7ceykI1ZxqOVMrNG
 A3Kgo3pzLEv78uiUOAwbmYNE1hThY87c5ZmyogrDPGklexA58jxTfX8NO6M5dbYJV8NPIsBTK
 YyD4TEYjrU403xGPfWfnhc/BxqnN4e47y/JkqDjCD3lU6An6dqzRKMlGmElQBEklWEC3okN2Y
 ByDcWFs211WoMWYDpxxg==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 drivers/input/joystick/Kconfig  |   6 +
 drivers/input/joystick/Makefile |   2 +-
 drivers/input/joystick/n64joy.c | 300 +++++++++++++++++++++++++++++++++++=
+++++
 3 files changed, 307 insertions(+), 1 deletion(-)
 create mode 100644 drivers/input/joystick/n64joy.c

input folks: rest of the series is on linux-mips. Being mips-specific,
not sure which tree this should go to.

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
index 0000000..477a4f7
=2D-- /dev/null
+++ b/drivers/input/joystick/n64joy.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for the four N64 controllers.
+ *
+ * Copyright (c) 2020 Lauri Kasanen
+ */
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/limits.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
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
+#define SI_STATUS_DMA_BUSY  (1 << 0)
+#define SI_STATUS_IO_BUSY   (1 << 1)
+
+#define N64_CONTROLLER_ID 0x0500
+
+static struct input_dev *n64joy_dev[4];
+static const char *n64joy_phys[4] =3D {
+	"n64joy/port0",
+	"n64joy/port1",
+	"n64joy/port2",
+	"n64joy/port3",
+};
+
+static u8 n64joy_opened;
+static DEFINE_MUTEX(n64joy_mutex);
+static struct timer_list timer;
+
+static u64 si_buf[8] ____cacheline_aligned;
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
+		;
+}
+
+static void n64joy_exec_pif(const u64 in[8])
+{
+	unsigned long flags;
+
+	dma_cache_wback_inv((unsigned long) in, 8 * 8);
+	dma_cache_inv((unsigned long) si_buf, 8 * 8);
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
+	n64joy_write_reg(SI_DRAM_REG, virt_to_phys(si_buf));
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
+	u32 i;
+
+	n64joy_exec_pif(polldata);
+
+	data =3D (struct joydata *) si_buf;
+
+	for (i =3D 0; i < 4; i++) {
+		if (!n64joy_dev[i])
+			continue;
+
+		// d-pad
+		input_report_key(n64joy_dev[i], BTN_DPAD_UP, data[i].up);
+		input_report_key(n64joy_dev[i], BTN_DPAD_DOWN, data[i].down);
+		input_report_key(n64joy_dev[i], BTN_DPAD_LEFT, data[i].left);
+		input_report_key(n64joy_dev[i], BTN_DPAD_RIGHT, data[i].right);
+
+		// c buttons
+		input_report_key(n64joy_dev[i], BTN_FORWARD, data[i].c_up);
+		input_report_key(n64joy_dev[i], BTN_BACK, data[i].c_down);
+		input_report_key(n64joy_dev[i], BTN_LEFT, data[i].c_left);
+		input_report_key(n64joy_dev[i], BTN_RIGHT, data[i].c_right);
+
+		// matching buttons
+		input_report_key(n64joy_dev[i], BTN_START, data[i].start);
+		input_report_key(n64joy_dev[i], BTN_Z, data[i].z);
+
+		// remaining ones: a, b, l, r
+		input_report_key(n64joy_dev[i], BTN_0, data[i].a);
+		input_report_key(n64joy_dev[i], BTN_1, data[i].b);
+		input_report_key(n64joy_dev[i], BTN_2, data[i].l);
+		input_report_key(n64joy_dev[i], BTN_3, data[i].r);
+
+		input_report_abs(n64joy_dev[i], ABS_X, data[i].x);
+		input_report_abs(n64joy_dev[i], ABS_Y, data[i].y);
+
+		input_sync(n64joy_dev[i]);
+	}
+
+	mod_timer(&timer, jiffies + msecs_to_jiffies(16));
+}
+
+static int n64joy_open(struct input_dev *dev)
+{
+	int err;
+
+	err =3D mutex_lock_interruptible(&n64joy_mutex);
+	if (err)
+		return err;
+
+	if (!n64joy_opened) {
+		// Could use the vblank irq, but it's not important if the poll
+		// point slightly changes.
+		timer_setup(&timer, n64joy_poll, 0);
+		mod_timer(&timer, jiffies + msecs_to_jiffies(16));
+	}
+
+	n64joy_opened++;
+
+	mutex_unlock(&n64joy_mutex);
+	return err;
+}
+
+static void n64joy_close(struct input_dev *dev)
+{
+	mutex_lock(&n64joy_mutex);
+	if (!--n64joy_opened)
+		del_timer_sync(&timer);
+	mutex_unlock(&n64joy_mutex);
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
+	int err =3D 0;
+	u32 i, j, found =3D 0;
+
+	// The controllers are not hotpluggable, so we can scan in init
+	n64joy_exec_pif(scandata);
+
+	data =3D (struct joydata *) si_buf;
+
+	memset(n64joy_dev, 0, 4 * sizeof(void *));
+
+	for (i =3D 0; i < 4; i++) {
+		if (!data[i].err && data[i].data >> 16 =3D=3D N64_CONTROLLER_ID) {
+			found++;
+
+			n64joy_dev[i] =3D input_allocate_device();
+			if (!n64joy_dev[i]) {
+				err =3D -ENOMEM;
+				goto fail;
+			}
+
+			n64joy_dev[i]->name =3D "N64 controller";
+			n64joy_dev[i]->phys =3D n64joy_phys[i];
+			n64joy_dev[i]->id.bustype =3D BUS_HOST;
+			n64joy_dev[i]->id.vendor =3D 0;
+			n64joy_dev[i]->id.product =3D data[i].data >> 16;
+			n64joy_dev[i]->id.version =3D 0;
+
+			n64joy_dev[i]->open =3D n64joy_open;
+			n64joy_dev[i]->close =3D n64joy_close;
+
+			n64joy_dev[i]->evbit[0] =3D BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
+			n64joy_dev[i]->absbit[0] =3D BIT_MASK(ABS_X) | BIT_MASK(ABS_Y);
+
+			// d-pad
+			n64joy_dev[i]->keybit[BIT_WORD(BTN_DPAD_UP)] =3D BIT_MASK(BTN_DPAD_UP)=
 |
+				BIT_MASK(BTN_DPAD_DOWN) | BIT_MASK(BTN_DPAD_LEFT) |
+				BIT_MASK(BTN_DPAD_RIGHT);
+			// c buttons
+			n64joy_dev[i]->keybit[BIT_WORD(BTN_LEFT)] |=3D BIT_MASK(BTN_LEFT) |
+				BIT_MASK(BTN_RIGHT) | BIT_MASK(BTN_FORWARD) | BIT_MASK(BTN_BACK);
+			// matching buttons
+			n64joy_dev[i]->keybit[BIT_WORD(BTN_GAMEPAD)] |=3D BIT_MASK(BTN_START) =
|
+				BIT_MASK(BTN_Z);
+			// remaining ones: a, b, l, r
+			n64joy_dev[i]->keybit[BIT_WORD(BTN_0)] |=3D BIT_MASK(BTN_0) |
+				BIT_MASK(BTN_1) | BIT_MASK(BTN_2) | BIT_MASK(BTN_3);
+
+			for (j =3D 0; j < 2; j++) {
+				input_set_abs_params(n64joy_dev[i], ABS_X + j,
+						     S8_MIN, S8_MAX, 0, 0);
+			}
+
+			err =3D input_register_device(n64joy_dev[i]);
+			if (err) {
+				input_free_device(n64joy_dev[i]);
+				goto fail;
+			}
+		}
+	}
+
+	pr_info("n64joy: %u controller(s) connected\n", found);
+
+	if (!found)
+		return -ENODEV;
+
+	return 0;
+fail:
+	for (i =3D 0; i < 4; i++) {
+		if (!n64joy_dev[i])
+			continue;
+		input_unregister_device(n64joy_dev[i]);
+	}
+	return err;
+}
+
+module_init(n64joy_init);
=2D-
2.6.2

