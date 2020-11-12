Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D7D2B0134
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 09:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgKLIaQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 03:30:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58324 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725898AbgKLIaQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 03:30:16 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxStCK8qxf7noMAA--.18155S2;
        Thu, 12 Nov 2020 16:30:03 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>
Subject: [PATCH] MIPS: Loongson64: Add read_persistent_clock64()
Date:   Thu, 12 Nov 2020 16:29:53 +0800
Message-Id: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxStCK8qxf7noMAA--.18155S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWkXF1ftrW7XFyDJw1rXrb_yoWrGr4kp3
        y3Aas8tw4Y9r1xZrWSya4kWw13Gr95Gry2qFWSqa4Yy3Z5Jw1UJrs7KryUtr4UJF1vqayq
        gFyrW3y3uanrAwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0yxRDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add read_persistent_clock64() to read the time from the battery backed
persistent clock. With this patch, we can fix the wrong time issue due
to the system clock is not consistent with hardware clock after resume
from sleep state S3 (suspend to RAM), at the same time, the system time
can be right instead of "Thu Jan 1 08:00:00 CST 1970" without rtc driver.

start_kernel()
  timekeeping_init()
    read_persistent_wall_and_boot_offset()
      read_persistent_clock64()

timekeeping_resume()
  read_persistent_clock64()

timekeeping_suspend()
  read_persistent_clock64()

Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/mach-loongson64/loongson.h | 20 +++++++++++++++++
 arch/mips/loongson64/time.c                      | 28 +++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
index fde1b75..448289e 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson.h
@@ -238,4 +238,24 @@ extern u64 loongson_freqctrl[MAX_PACKAGES];
 #define LOONGSON_PCIMAP_WIN(WIN, ADDR)	\
 	((((ADDR)>>26) & LOONGSON_PCIMAP_PCIMAP_LO0) << ((WIN)*6))
 
+/* LS7A RTC */
+#define LS7A_MISC_REG_BASE		0x10080000
+#define LS7A_RTC_ADDR_OFFSET		0x50100
+#define LS7A_RTC_SYS_TOYREAD0_OFFSET	0x2c
+#define LS7A_RTC_SYS_TOYREAD1_OFFSET	0x30
+#define LS7A_RTC_REG_BASE		(LS7A_MISC_REG_BASE + LS7A_RTC_ADDR_OFFSET)
+#define LS7A_RTC_SYS_TOYREAD0_ADDR	(LS7A_RTC_REG_BASE + LS7A_RTC_SYS_TOYREAD0_OFFSET)
+#define LS7A_RTC_SYS_TOYREAD1_ADDR	(LS7A_RTC_REG_BASE + LS7A_RTC_SYS_TOYREAD1_OFFSET)
+#define LS7A_RTC_TOY_MON_MASK		GENMASK(31, 26)
+#define LS7A_RTC_TOY_MON_SHIFT		26
+#define LS7A_RTC_TOY_DAY_MASK		GENMASK(25, 21)
+#define LS7A_RTC_TOY_DAY_SHIFT		21
+#define LS7A_RTC_TOY_HOUR_MASK		GENMASK(20, 16)
+#define LS7A_RTC_TOY_HOUR_SHIFT		16
+#define LS7A_RTC_TOY_MIN_MASK		GENMASK(15, 10)
+#define LS7A_RTC_TOY_MIN_SHIFT		10
+#define LS7A_RTC_TOY_SEC_MASK		GENMASK(9, 4)
+#define LS7A_RTC_TOY_SEC_SHIFT		4
+#define LS7A_RTC_YEAR_BASE		1900
+
 #endif /* __ASM_MACH_LOONGSON64_LOONGSON_H */
diff --git a/arch/mips/loongson64/time.c b/arch/mips/loongson64/time.c
index 91e842b..7f3095546 100644
--- a/arch/mips/loongson64/time.c
+++ b/arch/mips/loongson64/time.c
@@ -9,7 +9,7 @@
 
 #include <asm/time.h>
 #include <asm/hpet.h>
-
+#include <asm/mc146818-time.h>
 #include <loongson.h>
 
 void __init plat_time_init(void)
@@ -21,3 +21,29 @@ void __init plat_time_init(void)
 	setup_hpet_timer();
 #endif
 }
+
+static time64_t ls7a_get_rtc_time(void)
+{
+	unsigned int year, mon, day, hour, min, sec;
+	unsigned int value;
+
+	value = readl((void __iomem *)TO_UNCAC(LS7A_RTC_SYS_TOYREAD0_ADDR));
+	sec = (value & LS7A_RTC_TOY_SEC_MASK) >> LS7A_RTC_TOY_SEC_SHIFT;
+	min = (value & LS7A_RTC_TOY_MIN_MASK) >> LS7A_RTC_TOY_MIN_SHIFT;
+	hour = (value & LS7A_RTC_TOY_HOUR_MASK) >> LS7A_RTC_TOY_HOUR_SHIFT;
+	day = (value & LS7A_RTC_TOY_DAY_MASK) >> LS7A_RTC_TOY_DAY_SHIFT;
+	mon = (value & LS7A_RTC_TOY_MON_MASK) >> LS7A_RTC_TOY_MON_SHIFT;
+	year = readl((void __iomem *)TO_UNCAC(LS7A_RTC_SYS_TOYREAD1_ADDR));
+
+	return mktime64(year + LS7A_RTC_YEAR_BASE, mon, day, hour, min, sec);
+}
+
+void read_persistent_clock64(struct timespec64 *ts)
+{
+	if (loongson_sysconf.bridgetype == LS7A)
+		ts->tv_sec = ls7a_get_rtc_time();
+	else
+		ts->tv_sec = mc146818_get_cmos_time();
+
+	ts->tv_nsec = 0;
+}
-- 
2.1.0

