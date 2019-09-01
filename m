Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D91A4A31
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbfIAPtZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:49:25 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57652 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIAPtZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:49:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 41B1B402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8EPAOYVubZGx for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:49:23 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8994F3FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:23 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:49:23 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 035/120] MIPS: PS2: SCMD: Set system command for the
 real-time clock (RTC)
Message-ID: <71881f4e6c2e1552c338fe532e80963df060fa51.1567326213.git.noring@nocrew.org>
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
universal time (UTC). Tools such as hwclock should therefore set the
clock in the UTC timescale.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/scmd.h |  4 ++
 arch/mips/ps2/scmd.c                  | 53 +++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/scmd.h b/arch/mips/include/asm/mach-ps2/scmd.h
index 352a921181b6..3ca106ec7da4 100644
--- a/arch/mips/include/asm/mach-ps2/scmd.h
+++ b/arch/mips/include/asm/mach-ps2/scmd.h
@@ -22,11 +22,13 @@
 /**
  * enum scmd_cmd - system commands
  * @scmd_cmd_read_rtc: read the real-time clock (RTC)
+ * @scmd_cmd_write_rtc: set the real-time clock (RTC)
  * @scmd_cmd_power_off: power off the system
  * @scmd_cmd_read_machine_name: read machine name
  */
 enum scmd_cmd {
 	scmd_cmd_read_rtc = 8,
+	scmd_cmd_write_rtc = 9,
 	scmd_cmd_power_off = 15,
 	scmd_cmd_read_machine_name = 23,
 };
@@ -49,4 +51,6 @@ struct scmd_machine_name scmd_read_machine_name(void);
 
 int scmd_read_rtc(time64_t *t);
 
+int scmd_set_rtc(time64_t t);
+
 #endif /* __ASM_MACH_PS2_SCMD_H */
diff --git a/arch/mips/ps2/scmd.c b/arch/mips/ps2/scmd.c
index 34f0fe36bd3d..a9efb0e0a76e 100644
--- a/arch/mips/ps2/scmd.c
+++ b/arch/mips/ps2/scmd.c
@@ -321,6 +321,59 @@ int scmd_read_rtc(time64_t *t)
 }
 EXPORT_SYMBOL_GPL(scmd_read_rtc);
 
+/**
+ * scmd_set_rtc - system command to set the real-time clock (RTC)
+ * @t: the time to set
+ *
+ * The hardware clock is designed to keep Japan standard time (JST), regardless
+ * of the region of the machine. This is adjusted in the driver so that the
+ * clock to the kernel appears to be kept in coordinated universal time (UTC).
+ * Tools such as hwclock should therefore set the clock in the UTC timescale.
+
+ * Context: sleep
+ * Return: 0 on success, else a negative error number
+ */
+int scmd_set_rtc(time64_t t)
+{
+	struct __attribute__ ((packed)) {
+		u8 second;
+		u8 minute;
+		u8 hour;
+		u8 pad;
+		u8 day;
+		u8 month;
+		u8 year;
+	} rtc = { };
+	struct rtc_time tm;
+	u8 status;
+	int err;
+
+	rtc_time_to_tm(t + UTC_TO_JST, &tm);
+	rtc.second = bin2bcd(tm.tm_sec);
+	rtc.minute = bin2bcd(tm.tm_min);
+	rtc.hour   = bin2bcd(tm.tm_hour);
+	rtc.day    = bin2bcd(tm.tm_mday);
+	rtc.month  = bin2bcd(tm.tm_mon + 1);
+	rtc.year   = bin2bcd(tm.tm_year - 100);
+
+	BUILD_BUG_ON(sizeof(rtc) != 7);
+	err = scmd(scmd_cmd_write_rtc, &rtc, sizeof(rtc),
+		&status, sizeof(status));
+	if (err < 0) {
+		pr_debug("%s: Write failed with %d\n", __func__, err);
+		return err;
+	}
+
+	if (status != 0) {
+		pr_debug("%s: Invalid result with status 0x%x\n",
+			__func__, status);
+		return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(scmd_set_rtc);
+
 MODULE_DESCRIPTION("PlayStation 2 system commands");
 MODULE_AUTHOR("Fredrik Noring");
 MODULE_LICENSE("GPL");
-- 
2.21.0

