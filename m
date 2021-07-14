Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BAB3C86E1
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 17:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239821AbhGNPOp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jul 2021 11:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239776AbhGNPOm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jul 2021 11:14:42 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4A5C0613AA
        for <linux-mips@vger.kernel.org>; Wed, 14 Jul 2021 08:11:42 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
        by andre.telenet-ops.be with bizsmtp
        id V3Bf250024sai0K013BfMq; Wed, 14 Jul 2021 17:11:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXy-001ARH-P3; Wed, 14 Jul 2021 17:11:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXx-00Acfi-AE; Wed, 14 Jul 2021 17:11:37 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 06/19] auxdisplay: Extract character line display core support
Date:   Wed, 14 Jul 2021 17:11:17 +0200
Message-Id: <20210714151130.2531831-7-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714151130.2531831-1-geert@linux-m68k.org>
References: <20210714151130.2531831-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Extract the character line display core support from the simple ASCII
LCD driver for the MIPS Boston, Malta & SEAD3 development boards into
its own subdriver, so it can be reused for other displays.

As this moves the "message" device attribute in sysfs in a "linedisp.N"
subdirectory, a symlink is added to preserve backwards compatibility.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Changes to img-ascii-lcd.c are untested due to lack of hardware.
The backwards compatibility symlink has been tested by adding similar
code to drivers/auxdisplay/ht16k33.c.

v3:
  - Use compat_only_sysfs_link_entry_to_kobj() instead of cooking our
    own helper on top of kernfs_create_link(),

v2:
  - Drop "select LINEDISP" from HT16K33 symbol,
  - Add backwards compatibility symlink.
---
 drivers/auxdisplay/Kconfig         |   7 +
 drivers/auxdisplay/Makefile        |   1 +
 drivers/auxdisplay/img-ascii-lcd.c | 204 ++++---------------------
 drivers/auxdisplay/line-display.c  | 231 +++++++++++++++++++++++++++++
 drivers/auxdisplay/line-display.h  |  43 ++++++
 5 files changed, 312 insertions(+), 174 deletions(-)
 create mode 100644 drivers/auxdisplay/line-display.c
 create mode 100644 drivers/auxdisplay/line-display.h

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 1509cb74705a30ad..b41fdc5f7bf72a1b 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -25,6 +25,12 @@ config CHARLCD
 	  This is some character LCD core interface that multiple drivers can
 	  use.
 
+config LINEDISP
+	tristate "Character line display core support" if COMPILE_TEST
+	help
+	  This is the core support for single-line character displays, to be
+	  selected by drivers that use it.
+
 config HD44780_COMMON
 	tristate "Common functions for HD44780 (and compatibles) LCD displays" if COMPILE_TEST
 	select CHARLCD
@@ -155,6 +161,7 @@ config IMG_ASCII_LCD
 	depends on HAS_IOMEM
 	default y if MIPS_MALTA
 	select MFD_SYSCON
+	select LINEDISP
 	help
 	  Enable this to support the simple ASCII LCD displays found on
 	  development boards such as the MIPS Boston, MIPS Malta & MIPS SEAD3
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index 307771027c893a5b..6968ed4d3f0a8930 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_HD44780)		+= hd44780.o
 obj-$(CONFIG_HT16K33)		+= ht16k33.o
 obj-$(CONFIG_PARPORT_PANEL)	+= panel.o
 obj-$(CONFIG_LCD2S)		+= lcd2s.o
+obj-$(CONFIG_LINEDISP)		+= line-display.o
diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index 2b5640b638900a90..fa23e415f260ec56 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -4,7 +4,6 @@
  * Author: Paul Burton <paul.burton@mips.com>
  */
 
-#include <generated/utsrelease.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
@@ -14,7 +13,8 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/sysfs.h>
+
+#include "line-display.h"
 
 struct img_ascii_lcd_ctx;
 
@@ -27,36 +27,26 @@ struct img_ascii_lcd_ctx;
 struct img_ascii_lcd_config {
 	unsigned int num_chars;
 	bool external_regmap;
-	void (*update)(struct img_ascii_lcd_ctx *ctx);
+	void (*update)(struct linedisp *linedisp);
 };
 
 /**
  * struct img_ascii_lcd_ctx - Private data structure
- * @pdev: the ASCII LCD platform device
  * @base: the base address of the LCD registers
  * @regmap: the regmap through which LCD registers are accessed
  * @offset: the offset within regmap to the start of the LCD registers
  * @cfg: pointer to the LCD model configuration
- * @message: the full message to display or scroll on the LCD
- * @message_len: the length of the @message string
- * @scroll_pos: index of the first character of @message currently displayed
- * @scroll_rate: scroll interval in jiffies
- * @timer: timer used to implement scrolling
+ * @linedisp: line display structure
  * @curr: the string currently displayed on the LCD
  */
 struct img_ascii_lcd_ctx {
-	struct platform_device *pdev;
 	union {
 		void __iomem *base;
 		struct regmap *regmap;
 	};
 	u32 offset;
 	const struct img_ascii_lcd_config *cfg;
-	char *message;
-	unsigned int message_len;
-	unsigned int scroll_pos;
-	unsigned int scroll_rate;
-	struct timer_list timer;
+	struct linedisp linedisp;
 	char curr[] __aligned(8);
 };
 
@@ -64,8 +54,10 @@ struct img_ascii_lcd_ctx {
  * MIPS Boston development board
  */
 
-static void boston_update(struct img_ascii_lcd_ctx *ctx)
+static void boston_update(struct linedisp *linedisp)
 {
+	struct img_ascii_lcd_ctx *ctx =
+		container_of(linedisp, struct img_ascii_lcd_ctx, linedisp);
 	ulong val;
 
 #if BITS_PER_LONG == 64
@@ -90,12 +82,14 @@ static struct img_ascii_lcd_config boston_config = {
  * MIPS Malta development board
  */
 
-static void malta_update(struct img_ascii_lcd_ctx *ctx)
+static void malta_update(struct linedisp *linedisp)
 {
+	struct img_ascii_lcd_ctx *ctx =
+		container_of(linedisp, struct img_ascii_lcd_ctx, linedisp);
 	unsigned int i;
 	int err = 0;
 
-	for (i = 0; i < ctx->cfg->num_chars; i++) {
+	for (i = 0; i < linedisp->num_chars; i++) {
 		err = regmap_write(ctx->regmap,
 				   ctx->offset + (i * 8), ctx->curr[i]);
 		if (err)
@@ -173,12 +167,14 @@ static int sead3_wait_lcd_idle(struct img_ascii_lcd_ctx *ctx)
 	return 0;
 }
 
-static void sead3_update(struct img_ascii_lcd_ctx *ctx)
+static void sead3_update(struct linedisp *linedisp)
 {
+	struct img_ascii_lcd_ctx *ctx =
+		container_of(linedisp, struct img_ascii_lcd_ctx, linedisp);
 	unsigned int i;
 	int err = 0;
 
-	for (i = 0; i < ctx->cfg->num_chars; i++) {
+	for (i = 0; i < linedisp->num_chars; i++) {
 		err = sead3_wait_lcd_idle(ctx);
 		if (err)
 			break;
@@ -218,140 +214,6 @@ static const struct of_device_id img_ascii_lcd_matches[] = {
 };
 MODULE_DEVICE_TABLE(of, img_ascii_lcd_matches);
 
-/**
- * img_ascii_lcd_scroll() - scroll the display by a character
- * @t: really a pointer to the private data structure
- *
- * Scroll the current message along the LCD by one character, rearming the
- * timer if required.
- */
-static void img_ascii_lcd_scroll(struct timer_list *t)
-{
-	struct img_ascii_lcd_ctx *ctx = from_timer(ctx, t, timer);
-	unsigned int i, ch = ctx->scroll_pos;
-	unsigned int num_chars = ctx->cfg->num_chars;
-
-	/* update the current message string */
-	for (i = 0; i < num_chars;) {
-		/* copy as many characters from the string as possible */
-		for (; i < num_chars && ch < ctx->message_len; i++, ch++)
-			ctx->curr[i] = ctx->message[ch];
-
-		/* wrap around to the start of the string */
-		ch = 0;
-	}
-
-	/* update the LCD */
-	ctx->cfg->update(ctx);
-
-	/* move on to the next character */
-	ctx->scroll_pos++;
-	ctx->scroll_pos %= ctx->message_len;
-
-	/* rearm the timer */
-	if (ctx->message_len > ctx->cfg->num_chars)
-		mod_timer(&ctx->timer, jiffies + ctx->scroll_rate);
-}
-
-/**
- * img_ascii_lcd_display() - set the message to be displayed
- * @ctx: pointer to the private data structure
- * @msg: the message to display
- * @count: length of msg, or -1
- *
- * Display a new message @msg on the LCD. @msg can be longer than the number of
- * characters the LCD can display, in which case it will begin scrolling across
- * the LCD display.
- *
- * Return: 0 on success, -ENOMEM on memory allocation failure
- */
-static int img_ascii_lcd_display(struct img_ascii_lcd_ctx *ctx,
-			     const char *msg, ssize_t count)
-{
-	char *new_msg;
-
-	/* stop the scroll timer */
-	del_timer_sync(&ctx->timer);
-
-	if (count == -1)
-		count = strlen(msg);
-
-	/* if the string ends with a newline, trim it */
-	if (msg[count - 1] == '\n')
-		count--;
-
-	if (!count) {
-		/* clear the LCD */
-		devm_kfree(&ctx->pdev->dev, ctx->message);
-		ctx->message = NULL;
-		ctx->message_len = 0;
-		memset(ctx->curr, ' ', ctx->cfg->num_chars);
-		ctx->cfg->update(ctx);
-		return 0;
-	}
-
-	new_msg = devm_kmalloc(&ctx->pdev->dev, count + 1, GFP_KERNEL);
-	if (!new_msg)
-		return -ENOMEM;
-
-	memcpy(new_msg, msg, count);
-	new_msg[count] = 0;
-
-	if (ctx->message)
-		devm_kfree(&ctx->pdev->dev, ctx->message);
-
-	ctx->message = new_msg;
-	ctx->message_len = count;
-	ctx->scroll_pos = 0;
-
-	/* update the LCD */
-	img_ascii_lcd_scroll(&ctx->timer);
-
-	return 0;
-}
-
-/**
- * message_show() - read message via sysfs
- * @dev: the LCD device
- * @attr: the LCD message attribute
- * @buf: the buffer to read the message into
- *
- * Read the current message being displayed or scrolled across the LCD display
- * into @buf, for reads from sysfs.
- *
- * Return: the number of characters written to @buf
- */
-static ssize_t message_show(struct device *dev, struct device_attribute *attr,
-			    char *buf)
-{
-	struct img_ascii_lcd_ctx *ctx = dev_get_drvdata(dev);
-
-	return sysfs_emit(buf, "%s\n", ctx->message);
-}
-
-/**
- * message_store() - write a new message via sysfs
- * @dev: the LCD device
- * @attr: the LCD message attribute
- * @buf: the buffer containing the new message
- * @count: the size of the message in @buf
- *
- * Write a new message to display or scroll across the LCD display from sysfs.
- *
- * Return: the size of the message on success, else -ERRNO
- */
-static ssize_t message_store(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
-{
-	struct img_ascii_lcd_ctx *ctx = dev_get_drvdata(dev);
-	int err;
-
-	err = img_ascii_lcd_display(ctx, buf, count);
-	return err ?: count;
-}
-
-static DEVICE_ATTR_RW(message);
-
 /**
  * img_ascii_lcd_probe() - probe an LCD display device
  * @pdev: the LCD platform device
@@ -391,29 +253,23 @@ static int img_ascii_lcd_probe(struct platform_device *pdev)
 			return PTR_ERR(ctx->base);
 	}
 
-	ctx->pdev = pdev;
-	ctx->cfg = cfg;
-	ctx->message = NULL;
-	ctx->scroll_pos = 0;
-	ctx->scroll_rate = HZ / 2;
-
-	/* initialise a timer for scrolling the message */
-	timer_setup(&ctx->timer, img_ascii_lcd_scroll, 0);
-
-	platform_set_drvdata(pdev, ctx);
-
-	/* display a default message */
-	err = img_ascii_lcd_display(ctx, "Linux " UTS_RELEASE "       ", -1);
+	err = linedisp_register(&ctx->linedisp, dev, cfg->num_chars, ctx->curr,
+				cfg->update);
 	if (err)
-		goto out_del_timer;
+		return err;
 
-	err = device_create_file(dev, &dev_attr_message);
+	/* for backwards compatibility */
+	err = compat_only_sysfs_link_entry_to_kobj(&dev->kobj,
+						   &ctx->linedisp.dev.kobj,
+						   "message", NULL);
 	if (err)
-		goto out_del_timer;
+		goto err_unregister;
 
+	platform_set_drvdata(pdev, ctx);
 	return 0;
-out_del_timer:
-	del_timer_sync(&ctx->timer);
+
+err_unregister:
+	linedisp_unregister(&ctx->linedisp);
 	return err;
 }
 
@@ -430,8 +286,8 @@ static int img_ascii_lcd_remove(struct platform_device *pdev)
 {
 	struct img_ascii_lcd_ctx *ctx = platform_get_drvdata(pdev);
 
-	device_remove_file(&pdev->dev, &dev_attr_message);
-	del_timer_sync(&ctx->timer);
+	sysfs_remove_link(&pdev->dev.kobj, "message");
+	linedisp_unregister(&ctx->linedisp);
 	return 0;
 }
 
diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-display.c
new file mode 100644
index 0000000000000000..4b97c20ac0b381ee
--- /dev/null
+++ b/drivers/auxdisplay/line-display.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Character line display core support
+ *
+ * Copyright (C) 2016 Imagination Technologies
+ * Author: Paul Burton <paul.burton@mips.com>
+ *
+ * Copyright (C) 2021 Glider bv
+ */
+
+#include <generated/utsrelease.h>
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/timer.h>
+
+#include "line-display.h"
+
+/**
+ * linedisp_scroll() - scroll the display by a character
+ * @t: really a pointer to the private data structure
+ *
+ * Scroll the current message along the display by one character, rearming the
+ * timer if required.
+ */
+static void linedisp_scroll(struct timer_list *t)
+{
+	struct linedisp *linedisp = from_timer(linedisp, t, timer);
+	unsigned int i, ch = linedisp->scroll_pos;
+	unsigned int num_chars = linedisp->num_chars;
+
+	/* update the current message string */
+	for (i = 0; i < num_chars;) {
+		/* copy as many characters from the string as possible */
+		for (; i < num_chars && ch < linedisp->message_len; i++, ch++)
+			linedisp->buf[i] = linedisp->message[ch];
+
+		/* wrap around to the start of the string */
+		ch = 0;
+	}
+
+	/* update the display */
+	linedisp->update(linedisp);
+
+	/* move on to the next character */
+	linedisp->scroll_pos++;
+	linedisp->scroll_pos %= linedisp->message_len;
+
+	/* rearm the timer */
+	if (linedisp->message_len > num_chars)
+		mod_timer(&linedisp->timer, jiffies + linedisp->scroll_rate);
+}
+
+/**
+ * linedisp_display() - set the message to be displayed
+ * @linedisp: pointer to the private data structure
+ * @msg: the message to display
+ * @count: length of msg, or -1
+ *
+ * Display a new message @msg on the display. @msg can be longer than the
+ * number of characters the display can display, in which case it will begin
+ * scrolling across the display.
+ *
+ * Return: 0 on success, -ENOMEM on memory allocation failure
+ */
+static int linedisp_display(struct linedisp *linedisp, const char *msg,
+			    ssize_t count)
+{
+	char *new_msg;
+
+	/* stop the scroll timer */
+	del_timer_sync(&linedisp->timer);
+
+	if (count == -1)
+		count = strlen(msg);
+
+	/* if the string ends with a newline, trim it */
+	if (msg[count - 1] == '\n')
+		count--;
+
+	if (!count) {
+		/* Clear the display */
+		kfree(linedisp->message);
+		linedisp->message = NULL;
+		linedisp->message_len = 0;
+		memset(linedisp->buf, ' ', linedisp->num_chars);
+		linedisp->update(linedisp);
+		return 0;
+	}
+
+	new_msg = kmalloc(count + 1, GFP_KERNEL);
+	if (!new_msg)
+		return -ENOMEM;
+
+	memcpy(new_msg, msg, count);
+	new_msg[count] = 0;
+
+	kfree(linedisp->message);
+
+	linedisp->message = new_msg;
+	linedisp->message_len = count;
+	linedisp->scroll_pos = 0;
+
+	/* update the display */
+	linedisp_scroll(&linedisp->timer);
+
+	return 0;
+}
+
+/**
+ * message_show() - read message via sysfs
+ * @dev: the display device
+ * @attr: the display message attribute
+ * @buf: the buffer to read the message into
+ *
+ * Read the current message being displayed or scrolled across the display into
+ * @buf, for reads from sysfs.
+ *
+ * Return: the number of characters written to @buf
+ */
+static ssize_t message_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct linedisp *linedisp = container_of(dev, struct linedisp, dev);
+
+	return sysfs_emit(buf, "%s\n", linedisp->message);
+}
+
+/**
+ * message_store() - write a new message via sysfs
+ * @dev: the display device
+ * @attr: the display message attribute
+ * @buf: the buffer containing the new message
+ * @count: the size of the message in @buf
+ *
+ * Write a new message to display or scroll across the display from sysfs.
+ *
+ * Return: the size of the message on success, else -ERRNO
+ */
+static ssize_t message_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct linedisp *linedisp = container_of(dev, struct linedisp, dev);
+	int err;
+
+	err = linedisp_display(linedisp, buf, count);
+	return err ?: count;
+}
+
+static DEVICE_ATTR_RW(message);
+
+static struct attribute *linedisp_attrs[] = {
+	&dev_attr_message.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(linedisp);
+
+static const struct device_type linedisp_type = {
+	.groups	= linedisp_groups,
+};
+
+/**
+ * linedisp_register - register a character line display
+ * @linedisp: pointer to character line display structure
+ * @parent: parent device
+ * @num_chars: the number of characters that can be displayed
+ * @buf: pointer to a buffer that can hold @num_chars characters
+ * @update: Function called to update the display.  This must not sleep!
+ *
+ * Return: zero on success, else a negative error code.
+ */
+int linedisp_register(struct linedisp *linedisp, struct device *parent,
+		      unsigned int num_chars, char *buf,
+		      void (*update)(struct linedisp *linedisp))
+{
+	static atomic_t linedisp_id = ATOMIC_INIT(-1);
+	int err;
+
+	memset(linedisp, 0, sizeof(*linedisp));
+	linedisp->dev.parent = parent;
+	linedisp->dev.type = &linedisp_type;
+	linedisp->update = update;
+	linedisp->buf = buf;
+	linedisp->num_chars = num_chars;
+	linedisp->scroll_rate = HZ / 2;
+
+	device_initialize(&linedisp->dev);
+	dev_set_name(&linedisp->dev, "linedisp.%lu",
+		     (unsigned long)atomic_inc_return(&linedisp_id));
+
+	/* initialise a timer for scrolling the message */
+	timer_setup(&linedisp->timer, linedisp_scroll, 0);
+
+	err = device_add(&linedisp->dev);
+	if (err)
+		goto out_del_timer;
+
+	/* display a default message */
+	err = linedisp_display(linedisp, "Linux " UTS_RELEASE "       ", -1);
+	if (err)
+		goto out_del_dev;
+
+	return 0;
+
+out_del_dev:
+	device_del(&linedisp->dev);
+out_del_timer:
+	del_timer_sync(&linedisp->timer);
+	put_device(&linedisp->dev);
+	return err;
+}
+EXPORT_SYMBOL_GPL(linedisp_register);
+
+/**
+ * linedisp_unregister - unregister a character line display
+ * @linedisp: pointer to character line display structure registered previously
+ *	      with linedisp_register()
+ */
+void linedisp_unregister(struct linedisp *linedisp)
+{
+	device_del(&linedisp->dev);
+	del_timer_sync(&linedisp->timer);
+	kfree(linedisp->message);
+	put_device(&linedisp->dev);
+}
+EXPORT_SYMBOL_GPL(linedisp_unregister);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/auxdisplay/line-display.h b/drivers/auxdisplay/line-display.h
new file mode 100644
index 0000000000000000..0f5891d34c485871
--- /dev/null
+++ b/drivers/auxdisplay/line-display.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Character line display core support
+ *
+ * Copyright (C) 2016 Imagination Technologies
+ * Author: Paul Burton <paul.burton@mips.com>
+ *
+ * Copyright (C) 2021 Glider bv
+ */
+
+#ifndef _LINEDISP_H
+#define _LINEDISP_H
+
+/**
+ * struct linedisp - character line display private data structure
+ * @dev: the line display device
+ * @timer: timer used to implement scrolling
+ * @update: function called to update the display
+ * @buf: pointer to the buffer for the string currently displayed
+ * @message: the full message to display or scroll on the display
+ * @num_chars: the number of characters that can be displayed
+ * @message_len: the length of the @message string
+ * @scroll_pos: index of the first character of @message currently displayed
+ * @scroll_rate: scroll interval in jiffies
+ */
+struct linedisp {
+	struct device dev;
+	struct timer_list timer;
+	void (*update)(struct linedisp *linedisp);
+	char *buf;
+	char *message;
+	unsigned int num_chars;
+	unsigned int message_len;
+	unsigned int scroll_pos;
+	unsigned int scroll_rate;
+};
+
+int linedisp_register(struct linedisp *linedisp, struct device *parent,
+		      unsigned int num_chars, char *buf,
+		      void (*update)(struct linedisp *linedisp));
+void linedisp_unregister(struct linedisp *linedisp);
+
+#endif /* LINEDISP_H */
-- 
2.25.1

