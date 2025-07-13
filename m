Return-Path: <linux-mips+bounces-9798-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2503B03097
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 12:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CD633BC3B8
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341AA1DC198;
	Sun, 13 Jul 2025 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="za9OXL79"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25130100
	for <linux-mips@vger.kernel.org>; Sun, 13 Jul 2025 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752401117; cv=none; b=qVjqYCmjk+NXQPK34QPGiwWskbjZtnSj2LJy4R6u8ROf0gya4g5v8pJS/v3nEHK0bCaEUC4/2nOwIyYDiVchK0g3RepMbznNwylJTFcQxhWOcCpdIIWN8Hv7RssdigKNQJNdng3hXOFAJb0qkH+dwIDflRVZpMr3oNJIWMnlJnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752401117; c=relaxed/simple;
	bh=b7b+BiUcV0QfBrTgpAhC9TgYhAcALB/7v8wfMnqVCcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S69riEKqEjH6qc+0aTaJc2yeAmrLuQCsHpuH03iWu5angS+AQtcq/YJ7XD1guyYkUECiPBhzn+nai0q+ze0q+q6pLIdYUa8HlumNbtoZyh9ykuXzmIm2WKm3bpd5ivoRf54bYe3jMFa1qgoVxPtdi6MbO3/JkhCE4bOt7YytWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=za9OXL79; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 26647 invoked from network); 13 Jul 2025 12:05:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1752401105; bh=otji79oRxh05+WW4Agm5i4NTC7ABRqtnubFQ3DJFaeg=;
          h=From:To:Cc:Subject;
          b=za9OXL798y5YF+0Pqf7Wzjb3KEpqhSsaFjIKufqmN+E0KG6xbgQtRpzvNcogXrb+a
           KdlmFuQxnjbGBotDalJ8mv9D65PFgT50p8GIb7BsQ390wQWt5dBSRUZKcPuBuu5nnG
           +TqrdWFmq7+GKsTeQXCph8Gh3RyA7eCLb+pAiFY9bRmyNIAvba4iwEgR0qduIwHYB7
           lta4shUgMBmTvaw5ECzfBzqHdCBLWSGZ9LNN0mpfH1Q/N4Ab533y6oN/yAs+OZ3SVQ
           5SfHL1/e74bkyVFuQkDghsoXmPhobT+Vt+pqiJ1/+LDz82+bOgXPRyFJ0TB19R8vTA
           sgkz0ZAHhCxbA==
Received: from apn-78-30-72-196.dynamic.gprs.plus.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[78.30.72.196])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <jiaxun.yang@flygoat.com>; 13 Jul 2025 12:05:05 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-mips@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH 1/4] mips: remove unused function mc146818_set_rtc_mmss
Date: Sun, 13 Jul 2025 12:04:31 +0200
Message-Id: <20250713100434.699843-2-mat.jonczyk@o2.pl>
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
X-WP-MailID: 4a8feaf425475db3ad0aa7175b576a0f
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [QUP0]                               

I have checked carefully: this function is unused, so remove it.

The last caller appears to have been removed in 2007 in
commit 4b550488f894 ("[MIPS] Deforest the function pointer jungle in the time code.")

mc146818-time.h is included only in three files:
- arch/mips/mti-malta/malta-time.c
- arch/mips/loongson64/numa.c
- arch/mips/loongson2ef/common/time.c

Also, remove unused macros USEC_AFTER/USEC_BEFORE.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
---
 arch/mips/include/asm/mc146818-time.h | 74 ---------------------------
 1 file changed, 74 deletions(-)

diff --git a/arch/mips/include/asm/mc146818-time.h b/arch/mips/include/asm/mc146818-time.h
index cbf5cec345f1..07bf30bee792 100644
--- a/arch/mips/include/asm/mc146818-time.h
+++ b/arch/mips/include/asm/mc146818-time.h
@@ -12,80 +12,6 @@
 #include <linux/mc146818rtc.h>
 #include <linux/time.h>
 
-/*
- * For check timing call set_rtc_mmss() 500ms; used in timer interrupt.
- */
-#define USEC_AFTER	500000
-#define USEC_BEFORE	500000
-
-/*
- * In order to set the CMOS clock precisely, set_rtc_mmss has to be
- * called 500 ms after the second nowtime has started, because when
- * nowtime is written into the registers of the CMOS clock, it will
- * jump to the next second precisely 500 ms later. Check the Motorola
- * MC146818A or Dallas DS12887 data sheet for details.
- *
- * BUG: This routine does not handle hour overflow properly; it just
- *	sets the minutes. Usually you'll only notice that after reboot!
- */
-static inline int mc146818_set_rtc_mmss(unsigned long nowtime)
-{
-	int real_seconds, real_minutes, cmos_minutes;
-	unsigned char save_control, save_freq_select;
-	int retval = 0;
-	unsigned long flags;
-
-	spin_lock_irqsave(&rtc_lock, flags);
-	save_control = CMOS_READ(RTC_CONTROL); /* tell the clock it's being set */
-	CMOS_WRITE((save_control|RTC_SET), RTC_CONTROL);
-
-	save_freq_select = CMOS_READ(RTC_FREQ_SELECT); /* stop and reset prescaler */
-	CMOS_WRITE((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
-
-	cmos_minutes = CMOS_READ(RTC_MINUTES);
-	if (!(save_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD)
-		cmos_minutes = bcd2bin(cmos_minutes);
-
-	/*
-	 * since we're only adjusting minutes and seconds,
-	 * don't interfere with hour overflow. This avoids
-	 * messing with unknown time zones but requires your
-	 * RTC not to be off by more than 15 minutes
-	 */
-	real_seconds = nowtime % 60;
-	real_minutes = nowtime / 60;
-	if (((abs(real_minutes - cmos_minutes) + 15)/30) & 1)
-		real_minutes += 30;		/* correct for half hour time zone */
-	real_minutes %= 60;
-
-	if (abs(real_minutes - cmos_minutes) < 30) {
-		if (!(save_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
-			real_seconds = bin2bcd(real_seconds);
-			real_minutes = bin2bcd(real_minutes);
-		}
-		CMOS_WRITE(real_seconds, RTC_SECONDS);
-		CMOS_WRITE(real_minutes, RTC_MINUTES);
-	} else {
-		printk_once(KERN_NOTICE
-		       "set_rtc_mmss: can't update from %d to %d\n",
-		       cmos_minutes, real_minutes);
-		retval = -1;
-	}
-
-	/* The following flags have to be released exactly in this order,
-	 * otherwise the DS12887 (popular MC146818A clone with integrated
-	 * battery and quartz) will not reset the oscillator and will not
-	 * update precisely 500 ms later. You won't find this mentioned in
-	 * the Dallas Semiconductor data sheets, but who believes data
-	 * sheets anyway ...			       -- Markus Kuhn
-	 */
-	CMOS_WRITE(save_control, RTC_CONTROL);
-	CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
-	spin_unlock_irqrestore(&rtc_lock, flags);
-
-	return retval;
-}
-
 static inline time64_t mc146818_get_cmos_time(void)
 {
 	unsigned int year, mon, day, hour, min, sec;
-- 
2.25.1


