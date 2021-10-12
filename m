Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015B942AC83
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 20:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhJLSxG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 14:53:06 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:59998 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbhJLSxF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 14:53:05 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4HTPjg02sRzMqgM6
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 20:45:11 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by baptiste.telenet-ops.be with bizsmtp
        id 56ZW260090KW32a016ZWZ1; Tue, 12 Oct 2021 20:33:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMag-004RTn-3r; Tue, 12 Oct 2021 20:33:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMaf-002j5T-Mg; Tue, 12 Oct 2021 20:33:29 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v7 03/21] auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
Date:   Tue, 12 Oct 2021 20:33:09 +0200
Message-Id: <20211012183327.649865-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012183327.649865-1-geert@linux-m68k.org>
References: <20211012183327.649865-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While writing an empty string to a device attribute is a no-op, and thus
does not need explicit safeguards, the user can still write a single
newline to an attribute file:

    echo > .../message

If that happens, img_ascii_lcd_display() trims the newline, yielding an
empty string, and causing an infinite loop in img_ascii_lcd_scroll().

Fix this by adding a check for empty strings.  Clear the display in case
one is encountered.

Fixes: 0cad855fbd083ee5 ("auxdisplay: img-ascii-lcd: driver for simple ASCII LCD displays")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Untested with img-ascii-lcd, but triggered with my initial version of
linedisp.

v7:
  - No changes,

v6:
  - No changes,

v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - No changes.
---
 drivers/auxdisplay/img-ascii-lcd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index 1cce409ce5cacbc8..e33ce0151cdfd150 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -280,6 +280,16 @@ static int img_ascii_lcd_display(struct img_ascii_lcd_ctx *ctx,
 	if (msg[count - 1] == '\n')
 		count--;
 
+	if (!count) {
+		/* clear the LCD */
+		devm_kfree(&ctx->pdev->dev, ctx->message);
+		ctx->message = NULL;
+		ctx->message_len = 0;
+		memset(ctx->curr, ' ', ctx->cfg->num_chars);
+		ctx->cfg->update(ctx);
+		return 0;
+	}
+
 	new_msg = devm_kmalloc(&ctx->pdev->dev, count + 1, GFP_KERNEL);
 	if (!new_msg)
 		return -ENOMEM;
-- 
2.25.1

