Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0E1A4A30
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbfIAPtP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:49:15 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41572 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbfIAPtP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:49:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 96DA83F65F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2dew-xyZBJdb for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:49:12 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id AF57E3F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:12 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:49:12 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 034/120] MIPS: PS2: SCMD: Read system command for the
 real-time clock (RTC)
Message-ID: <4e98b54efcb9e5fd27c5dee2bcdbc77b2c9f444b.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The hardware clock is designed to keep Japan standard time (JST),
regardless of the region of the machine. This is adjusted in the driver
so that the clock to the kernel appears to be kept in coordinated
universal time (UTC). Tools such as hwclock should therefore read the
clock in the UTC timescale.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/scmd.h |  5 +++
 arch/mips/ps2/scmd.c                  | 55 +++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/scmd.h b/arch/mips/include/asm/mach-ps2/scmd.h
index 2389b937eec0..352a921181b6 100644
--- a/arch/mips/include/asm/mach-ps2/scmd.h
+++ b/arch/mips/include/asm/mach-ps2/scmd.h
@@ -8,6 +8,7 @@
 #ifndef __ASM_MACH_PS2_SCMD_H
 #define __ASM_MACH_PS2_SCMD_H
 
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #define SCMD_COMMAND	0x1f402016
@@ -20,10 +21,12 @@
 
 /**
  * enum scmd_cmd - system commands
+ * @scmd_cmd_read_rtc: read the real-time clock (RTC)
  * @scmd_cmd_power_off: power off the system
  * @scmd_cmd_read_machine_name: read machine name
  */
 enum scmd_cmd {
+	scmd_cmd_read_rtc = 8,
 	scmd_cmd_power_off = 15,
 	scmd_cmd_read_machine_name = 23,
 };
@@ -44,4 +47,6 @@ struct scmd_machine_name {
 
 struct scmd_machine_name scmd_read_machine_name(void);
 
+int scmd_read_rtc(time64_t *t);
+
 #endif /* __ASM_MACH_PS2_SCMD_H */
diff --git a/arch/mips/ps2/scmd.c b/arch/mips/ps2/scmd.c
index aecd4f35e312..34f0fe36bd3d 100644
--- a/arch/mips/ps2/scmd.c
+++ b/arch/mips/ps2/scmd.c
@@ -13,8 +13,14 @@
 #include <linux/sched.h>
 #include <linux/sched/signal.h>
 
+#include <linux/bcd.h>
+#include <linux/rtc.h>
+
 #include <asm/mach-ps2/scmd.h>
 
+#define UTC_TO_JST (9*60*60)		/* UTC to Japan standard time */
+#define JST_TO_UTC (-UTC_TO_JST)	/* Japan standard time to UTC */
+
 /**
  * completed - poll for condition to happen, or timeout
  * @condition: function to poll for condition
@@ -266,6 +272,55 @@ struct scmd_machine_name scmd_read_machine_name(void)
 }
 EXPORT_SYMBOL_GPL(scmd_read_machine_name);
 
+/**
+ * scmd_read_rtc - system command to read the real-time clock (RTC)
+ * @t: pointer to store the time on a successful reading
+ *
+ * The hardware clock is designed to keep Japan standard time (JST), regardless
+ * of the region of the machine. This is adjusted in the driver so that the
+ * clock to the kernel appears to be kept in coordinated universal time (UTC).
+ * Tools such as hwclock should therefore read the clock in the UTC timescale.
+ *
+ * Context: sleep
+ * Return: 0 on success, else a negative error number
+ */
+int scmd_read_rtc(time64_t *t)
+{
+	struct __attribute__ ((packed)) {
+		u8 status;
+		u8 second;
+		u8 minute;
+		u8 hour;
+		u8 pad;
+		u8 day;
+		u8 month;
+		u8 year;
+	} rtc;
+	int err;
+
+	BUILD_BUG_ON(sizeof(rtc) != 8);
+	err = scmd(scmd_cmd_read_rtc, NULL, 0, &rtc, sizeof(rtc));
+	if (err < 0) {
+		pr_debug("%s: Read failed with %d at 0\n", __func__, err);
+		return err;
+	}
+	if (rtc.status != 0) {
+		pr_debug("%s: Invalid result with status 0x%x\n",
+			__func__, rtc.status);
+		return -EIO;
+	}
+
+	*t = mktime64(bcd2bin(rtc.year) + 2000,
+		      bcd2bin(rtc.month),
+		      bcd2bin(rtc.day),
+		      bcd2bin(rtc.hour),
+		      bcd2bin(rtc.minute),
+		      bcd2bin(rtc.second)) + JST_TO_UTC;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(scmd_read_rtc);
+
 MODULE_DESCRIPTION("PlayStation 2 system commands");
 MODULE_AUTHOR("Fredrik Noring");
 MODULE_LICENSE("GPL");
-- 
2.21.0

