Return-Path: <linux-mips+bounces-9801-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEBDB0309E
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 12:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ECB9189CE02
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AA11F0994;
	Sun, 13 Jul 2025 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="IFmjmHO8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780DF26CE06
	for <linux-mips@vger.kernel.org>; Sun, 13 Jul 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752401123; cv=none; b=uwJelIsIfWDvesABen7L4BG3cvPzh8DkK8dECfGZeJ+//ddEEla3vy3FSO0LrXSJg2nn7jcU8Dtr4uEhi1mGqJbIbci5FzXQcO+eqKi/IJ0hZoNDDdMD1cIv9BruwjaaR1n4gXNL8/fw1EWGrih5SEmym4vkIWLrh7Bi11O2LAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752401123; c=relaxed/simple;
	bh=/m+Qn4S8CSqAgH1lay/ClaiwyL1dVIt+1DQaNgVs/C4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H5N1jDAPCJA5ExRYybtMus4b+nF3ogYz7G3BwkT3+BG3jQd/4u7lvgr/Ey1b304h1pUeFrghGb5sKjK5mAKzY95T9T8DkR33mrVj3ZEfEKoTt58wlUQjJx5PDKypKZiRMomrUPCmyXTcdZFcWf4lky3WDIoVvFnqqrU7XTbqXA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=IFmjmHO8; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 14171 invoked from network); 13 Jul 2025 12:05:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1752401118; bh=MF8ytLN/BbToIpz/pBQARxU6UxyIbhKyRL05/LXFktU=;
          h=From:To:Cc:Subject;
          b=IFmjmHO8himavzE3dPt/Ar5qcMjwsvtD6PVEzht6eagLSujlNxwgCzyv3KZmU/IzH
           4SoLbmh3cCdq+/mqVkPkgXkM2bVe2tWiprkkWUOVL2jcKZPCon7naErDY63lqxbMJs
           80r719t9W+tdBmJvhaggnQPMjd7ZjUBM8RBVtllEsG6/Favy7l7Zd9qo/gAnbYICh7
           9JdpC7HzTkXTfIl+eLm0aaRreuRX58crmY4C4MUcWJxYLFCMVr3uGXetH3o1ydd9KW
           6xfsx10teibzlYSOiQoOpnwCrQYYiikErX2uFTxRYoz/ZHtYpeBmWi/alYS1L5rOxm
           pNw/G8Zx8FMJw==
Received: from apn-78-30-72-196.dynamic.gprs.plus.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[78.30.72.196])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <jiaxun.yang@flygoat.com>; 13 Jul 2025 12:05:17 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-mips@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH 4/4] mips/malta,loongson2ef: use generic mc146818_get_time function
Date: Sun, 13 Jul 2025 12:04:34 +0200
Message-Id: <20250713100434.699843-5-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250713100434.699843-1-mat.jonczyk@o2.pl>
References: <20250713100434.699843-1-mat.jonczyk@o2.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: 0691116a5ee72dc9a9861e7c07af7e24
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [4VNB]                               

mc146818_get_cmos_time() is now mostly equivalent to mc146818_get_time()
from drivers/rtc/rtc-mc146818-lib.c, with the latter using a more
advanced algorithm (which checks the UIP bit in the CMOS). The Malta
and Loongson2ef platforms, the only users of mc146818_get_cmos_time()
have RTC devices that should be MC146818 compatible.

So, rewrite mc146818_get_cmos_time() in a way that uses
mc146818_get_time() and add CONFIG_RTC_MC146818_LIB as a dependency of
CONFIG_MIPS_MALTA and CONFIG_CPU_LOONGSON2EF.

The should be safe as:

- malta_defconfig already uses a standard RTC CMOS driver
  (CONFIG_RTC_DRV_CMOS=y). The Malta board has an Intel 82371EB (PIIX4E)
  south bridge with the CMOS RTC, so should work correctly with the
  modification,

- Loongson2e and 2f apparently use the VIA686B south bridge and the AMD
  CS5536 south bridge respectively (at least according to Kconfig). I
  have checked datasheets of both and these appear to be MC146818
  software compatible.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

--

Tested only in an emulator for Malta.
---
 arch/mips/Kconfig                     |  2 ++
 arch/mips/include/asm/mc146818-time.h | 34 ++++++---------------------
 2 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1e48184ecf1e..4df5589b3d35 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -563,6 +563,7 @@ config MIPS_MALTA
 	select MIPS_L1_CACHE_SHIFT_6
 	select MIPS_MSC
 	select PCI_GT64XXX_PCI0
+	select RTC_MC146818_LIB
 	select SMP_UP if SMP
 	select SWAP_IO_SPACE
 	select SYS_HAS_CPU_MIPS32_R1
@@ -1837,6 +1838,7 @@ config CPU_LOONGSON2EF
 	select CPU_SUPPORTS_64BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
+	select RTC_MC146818_LIB
 
 config CPU_LOONGSON32
 	bool
diff --git a/arch/mips/include/asm/mc146818-time.h b/arch/mips/include/asm/mc146818-time.h
index 4e07914e94e6..ac52a30b4161 100644
--- a/arch/mips/include/asm/mc146818-time.h
+++ b/arch/mips/include/asm/mc146818-time.h
@@ -8,41 +8,21 @@
 #ifndef __ASM_MC146818_TIME_H
 #define __ASM_MC146818_TIME_H
 
-#include <linux/bcd.h>
 #include <linux/mc146818rtc.h>
 #include <linux/time.h>
 
+#ifdef CONFIG_RTC_MC146818_LIB
 static inline time64_t mc146818_get_cmos_time(void)
 {
-	unsigned int year, mon, day, hour, min, sec;
-	unsigned long flags;
+	struct rtc_time tm;
 
-	spin_lock_irqsave(&rtc_lock, flags);
-
-	do {
-		sec = CMOS_READ(RTC_SECONDS);
-		min = CMOS_READ(RTC_MINUTES);
-		hour = CMOS_READ(RTC_HOURS);
-		day = CMOS_READ(RTC_DAY_OF_MONTH);
-		mon = CMOS_READ(RTC_MONTH);
-		year = CMOS_READ(RTC_YEAR);
-	} while (sec != CMOS_READ(RTC_SECONDS));
-
-	if (!(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
-		sec = bcd2bin(sec);
-		min = bcd2bin(min);
-		hour = bcd2bin(hour);
-		day = bcd2bin(day);
-		mon = bcd2bin(mon);
-		year = bcd2bin(year);
+	if (mc146818_get_time(&tm, 1000)) {
+		pr_err("Unable to read current time from RTC\n");
+		return 0;
 	}
-	spin_unlock_irqrestore(&rtc_lock, flags);
-	if (year < 70)
-		year += 2000;
-	else
-		year += 1900;
 
-	return mktime64(year, mon, day, hour, min, sec);
+	return rtc_tm_to_time64(&tm);
 }
+#endif /* CONFIG_RTC_MC146818_LIB */
 
 #endif /* __ASM_MC146818_TIME_H */
-- 
2.25.1


