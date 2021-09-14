Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A613640B157
	for <lists+linux-mips@lfdr.de>; Tue, 14 Sep 2021 16:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbhINOkj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 10:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234438AbhINOkS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Sep 2021 10:40:18 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DE7C0613AF
        for <linux-mips@vger.kernel.org>; Tue, 14 Sep 2021 07:38:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
        by laurent.telenet-ops.be with bizsmtp
        id tqeg2500U2aSKa101qegEA; Tue, 14 Sep 2021 16:38:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a4-004VGk-3G; Tue, 14 Sep 2021 16:38:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a2-0028yN-J2; Tue, 14 Sep 2021 16:38:38 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v6 05/19] auxdisplay: img-ascii-lcd: Convert device attribute to sysfs_emit()
Date:   Tue, 14 Sep 2021 16:38:21 +0200
Message-Id: <20210914143835.511051-6-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914143835.511051-1-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the "message" device attribute from sprintf() to sysfs_emit(),
as the latter is aware of the PAGE_SIZE buffer.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
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
 drivers/auxdisplay/img-ascii-lcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index 2b6e41ec57544faa..2b5640b638900a90 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -326,7 +326,7 @@ static ssize_t message_show(struct device *dev, struct device_attribute *attr,
 {
 	struct img_ascii_lcd_ctx *ctx = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%s\n", ctx->message);
+	return sysfs_emit(buf, "%s\n", ctx->message);
 }
 
 /**
-- 
2.25.1

