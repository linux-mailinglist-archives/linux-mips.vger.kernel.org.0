Return-Path: <linux-mips+bounces-9800-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64417B0309B
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 12:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A81189CDB3
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEFE1F0994;
	Sun, 13 Jul 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="XVBOr9WD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF4264627
	for <linux-mips@vger.kernel.org>; Sun, 13 Jul 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752401120; cv=none; b=XySjAUvkRN0G6R0zb/tOkXCBPIBQeoNxL56c5byVSE5HYnttM8tM2OaddAvtHt5QJUx3N8gIa6RMcOPI1X2HxWKmAbDmuFjgz5+wso/mSSg2DqwYjcmbIule7fePSJEF3TJvNyDJpUBJUprCPi1VT9cxlsKo8oav786opfZXQv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752401120; c=relaxed/simple;
	bh=fF/Wc5wz8BWfrDfpuyKExg6imQW/e6O1xGzSpL83nJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eeZOKZpjQ+B8DFSP+Qc/ZkRmVVt8hgcBw44gRllKI1R44gNAUy5C5BWWmtxGq19Am3WYrciC0VzRYMKmaLSm6x/U9SkGAcPrI+gy8FQS/sv/NFItkDwGgM74cAx1T6C7fvkHFNvVAIqEwTT1ed2CEaT4UK3PVS0BW3ogSgAxBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=XVBOr9WD; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 7715 invoked from network); 13 Jul 2025 12:05:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1752401116; bh=4GNeEPrLhpHCSM+3rd6Ktv3pye4ZJGLvulpzM5ndxb0=;
          h=From:To:Cc:Subject;
          b=XVBOr9WDxqFqcqhlyobd1spFGS0CATPHfVX9FkchovHPPIdymUoNPLGSIJS0ikMd/
           T1+/ZSlQAqDwEY9wo0zW55O3EOKRNFHvOUIZuv1/tgA+8ipFI4googw36B+DZJwH2t
           BnjC9mhBBKS3PRkL4zRQboGQcGei0SgDBFXuapcQZJi3iWRLDx7kipEGicouF4U0BJ
           BcU2lKevZIiJ5nAQ2gU/uIx3z/5/hrX+DSJeQ0WfCGQ4XU2vMCLANAyLfdS/65VzcT
           +VnHt8UdF1FUgZL/tTE3mgitjokedz+PG8PpLEBnaq1OfDIWyixMZR+DmmYOX9Prnp
           +jjaQSYKX1E9A==
Received: from apn-78-30-72-196.dynamic.gprs.plus.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[78.30.72.196])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <jiaxun.yang@flygoat.com>; 13 Jul 2025 12:05:15 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-mips@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH 3/4] mips: remove redundant macro mc146818_decode_year
Date: Sun, 13 Jul 2025 12:04:33 +0200
Message-Id: <20250713100434.699843-4-mat.jonczyk@o2.pl>
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
X-WP-MailID: be7ae8428f573c3fee11a84cc70c131a
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [AeNh]                               

The mc146818_decode_year macro is used only in mc146818_get_cmos_time(),
which in turn is called only in
	arch/mips/loongson2ef/common/time.c
and
	arch/mips/mti-malta/malta-time.c
so on mach-jazz it is unused and can be removed. On other platforms it
is defined in the same way, so it can be safely folded into
mc146818_get_cmos_time().

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
---
 arch/mips/include/asm/mach-generic/mc146818rtc.h | 4 ----
 arch/mips/include/asm/mach-jazz/mc146818rtc.h    | 2 --
 arch/mips/include/asm/mach-malta/mc146818rtc.h   | 2 --
 arch/mips/include/asm/mc146818-time.h            | 5 ++++-
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/mach-generic/mc146818rtc.h b/arch/mips/include/asm/mach-generic/mc146818rtc.h
index 9c72e540ff56..249279b0494d 100644
--- a/arch/mips/include/asm/mach-generic/mc146818rtc.h
+++ b/arch/mips/include/asm/mach-generic/mc146818rtc.h
@@ -29,8 +29,4 @@ static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
 
 #define RTC_ALWAYS_BCD	0
 
-#ifndef mc146818_decode_year
-#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1900)
-#endif
-
 #endif /* __ASM_MACH_GENERIC_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mach-jazz/mc146818rtc.h b/arch/mips/include/asm/mach-jazz/mc146818rtc.h
index 987f727afe25..639bff8ebca3 100644
--- a/arch/mips/include/asm/mach-jazz/mc146818rtc.h
+++ b/arch/mips/include/asm/mach-jazz/mc146818rtc.h
@@ -33,6 +33,4 @@ static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
 
 #define RTC_ALWAYS_BCD	0
 
-#define mc146818_decode_year(year) ((year) + 1980)
-
 #endif /* __ASM_MACH_JAZZ_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mach-malta/mc146818rtc.h b/arch/mips/include/asm/mach-malta/mc146818rtc.h
index e8cc7fdf7415..7da2c0ea55da 100644
--- a/arch/mips/include/asm/mach-malta/mc146818rtc.h
+++ b/arch/mips/include/asm/mach-malta/mc146818rtc.h
@@ -31,6 +31,4 @@ static inline void CMOS_WRITE(unsigned char data, unsigned long addr)
 
 #define RTC_ALWAYS_BCD	0
 
-#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1900)
-
 #endif /* __ASM_MACH_MALTA_MC146818RTC_H */
diff --git a/arch/mips/include/asm/mc146818-time.h b/arch/mips/include/asm/mc146818-time.h
index 07bf30bee792..4e07914e94e6 100644
--- a/arch/mips/include/asm/mc146818-time.h
+++ b/arch/mips/include/asm/mc146818-time.h
@@ -37,7 +37,10 @@ static inline time64_t mc146818_get_cmos_time(void)
 		year = bcd2bin(year);
 	}
 	spin_unlock_irqrestore(&rtc_lock, flags);
-	year = mc146818_decode_year(year);
+	if (year < 70)
+		year += 2000;
+	else
+		year += 1900;
 
 	return mktime64(year, mon, day, hour, min, sec);
 }
-- 
2.25.1


