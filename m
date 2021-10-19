Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDE14338A4
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 16:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhJSOrs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 10:47:48 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:52170 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbhJSOrq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 10:47:46 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4HYc3t28QdzMqqKF
        for <linux-mips@vger.kernel.org>; Tue, 19 Oct 2021 16:45:30 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by baptiste.telenet-ops.be with bizsmtp
        id 7qlT2600L12AN0U01qlTN1; Tue, 19 Oct 2021 16:45:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMp-006B4V-FF; Tue, 19 Oct 2021 16:45:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMn-00FAB5-NZ; Tue, 19 Oct 2021 16:45:25 +0200
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
Subject: [PATCH v8 08/21] auxdisplay: linedisp: Add support for changing scroll rate
Date:   Tue, 19 Oct 2021 16:45:07 +0200
Message-Id: <20211019144520.3613926-9-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
References: <20211019144520.3613926-1-geert@linux-m68k.org>
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
v8:
  - No changes,

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

