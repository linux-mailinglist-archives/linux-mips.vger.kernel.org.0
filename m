Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEE33B43D7
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 14:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhFYNB4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Jun 2021 09:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhFYNBo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Jun 2021 09:01:44 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73BBC061146
        for <linux-mips@vger.kernel.org>; Fri, 25 Jun 2021 05:59:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1476:ce84:e216:add8])
        by michel.telenet-ops.be with bizsmtp
        id MQzD2500P2B1U9906QzDHz; Fri, 25 Jun 2021 14:59:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQO-003TMK-SL; Fri, 25 Jun 2021 14:59:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQN-004sQn-L2; Fri, 25 Jun 2021 14:59:11 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 08/18] auxdisplay: linedisp: Add support for changing scroll rate
Date:   Fri, 25 Jun 2021 14:58:52 +0200
Message-Id: <20210625125902.1162428-9-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625125902.1162428-1-geert@linux-m68k.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If the message to display is longer than the number of characters that
the display can show, the message will be scrolled.  Currently the
scroll rate is fixed, moving every 500 ms.

Add support for changing the scroll rate through a "scroll_step_ms"
device attribute in sysfs.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - No changes.
---
 drivers/auxdisplay/line-display.c | 37 +++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-display.c
index 3f35199bc39f511f..03e7f104aa1add32 100644
--- a/drivers/auxdisplay/line-display.c
+++ b/drivers/auxdisplay/line-display.c
@@ -19,6 +19,8 @@
 
 #include "line-display.h"
 
+#define DEFAULT_SCROLL_RATE	(HZ / 2)
+
 /**
  * linedisp_scroll() - scroll the display by a character
  * @t: really a pointer to the private data structure
@@ -50,7 +52,7 @@ static void linedisp_scroll(struct timer_list *t)
 	linedisp->scroll_pos %= linedisp->message_len;
 
 	/* rearm the timer */
-	if (linedisp->message_len > num_chars)
+	if (linedisp->message_len > num_chars && linedisp->scroll_rate)
 		mod_timer(&linedisp->timer, jiffies + linedisp->scroll_rate);
 }
 
@@ -149,8 +151,39 @@ static ssize_t message_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(message);
 
+static ssize_t scroll_step_ms_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct linedisp *linedisp = container_of(dev, struct linedisp, dev);
+
+	return sysfs_emit(buf, "%u\n", jiffies_to_msecs(linedisp->scroll_rate));
+}
+
+static ssize_t scroll_step_ms_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct linedisp *linedisp = container_of(dev, struct linedisp, dev);
+	unsigned int ms;
+
+	if (kstrtouint(buf, 10, &ms) != 0)
+		return -EINVAL;
+
+	linedisp->scroll_rate = msecs_to_jiffies(ms);
+	if (linedisp->message && linedisp->message_len > linedisp->num_chars) {
+		del_timer_sync(&linedisp->timer);
+		if (linedisp->scroll_rate)
+			linedisp_scroll(&linedisp->timer);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(scroll_step_ms);
+
 static struct attribute *linedisp_attrs[] = {
 	&dev_attr_message.attr,
+	&dev_attr_scroll_step_ms.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(linedisp);
@@ -182,7 +215,7 @@ int linedisp_register(struct linedisp *linedisp, struct device *parent,
 	linedisp->update = update;
 	linedisp->buf = buf;
 	linedisp->num_chars = num_chars;
-	linedisp->scroll_rate = HZ / 2;
+	linedisp->scroll_rate = DEFAULT_SCROLL_RATE;
 
 	device_initialize(&linedisp->dev);
 	dev_set_name(&linedisp->dev, "linedisp.%lu",
-- 
2.25.1

