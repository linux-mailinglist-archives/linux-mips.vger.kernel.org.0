Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C2D42AC6C
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 20:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbhJLSut (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 14:50:49 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:47032 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234576AbhJLSup (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 14:50:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4HTPZv1VmlzMr2Ys
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 20:39:19 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by albert.telenet-ops.be with bizsmtp
        id 56ZY260070KW32a066ZYkd; Tue, 12 Oct 2021 20:33:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMah-004RU2-NL; Tue, 12 Oct 2021 20:33:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMaf-002j6H-W8; Tue, 12 Oct 2021 20:33:30 +0200
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
Subject: [PATCH v7 10/21] auxdisplay: ht16k33: Fix frame buffer device blanking
Date:   Tue, 12 Oct 2021 20:33:16 +0200
Message-Id: <20211012183327.649865-11-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012183327.649865-1-geert@linux-m68k.org>
References: <20211012183327.649865-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As the ht16k33 frame buffer sub-driver does not register an
fb_ops.fb_blank() handler, blanking does not work:

    $ echo 1 > /sys/class/graphics/fb0/blank
    sh: write error: Invalid argument

Fix this by providing a handler that always returns zero, to make sure
blank events will be sent to the actual device handling the backlight.

Reported-by: Robin van der Gracht <robin@protonic.nl>
Suggested-by: Robin van der Gracht <robin@protonic.nl>
Fixes: 8992da44c6805d53 ("auxdisplay: ht16k33: Driver for LED controller")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v7:
  - New.
---
 drivers/auxdisplay/ht16k33.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 2b630e194570f6e5..ed5808349990782c 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -219,6 +219,15 @@ static const struct backlight_ops ht16k33_bl_ops = {
 	.check_fb	= ht16k33_bl_check_fb,
 };
 
+/*
+ * Blank events will be passed to the actual device handling the backlight when
+ * we return zero here.
+ */
+static int ht16k33_blank(int blank, struct fb_info *info)
+{
+	return 0;
+}
+
 static int ht16k33_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct ht16k33_priv *priv = info->par;
@@ -231,6 +240,7 @@ static const struct fb_ops ht16k33_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_read = fb_sys_read,
 	.fb_write = fb_sys_write,
+	.fb_blank = ht16k33_blank,
 	.fb_fillrect = sys_fillrect,
 	.fb_copyarea = sys_copyarea,
 	.fb_imageblit = sys_imageblit,
-- 
2.25.1

