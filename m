Return-Path: <linux-mips+bounces-9799-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB01CB0309A
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 12:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25AF916493C
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 10:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9577E30100;
	Sun, 13 Jul 2025 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="dEF2U9pX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E3A1F0994
	for <linux-mips@vger.kernel.org>; Sun, 13 Jul 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752401119; cv=none; b=B8mgvnq20ry7oVW1tfjyx/C43VDX8Qd5qXowGK5bApw5Rg+mWS55fQL+IwS0aNIQ3xSOnPbif4wUS32daTOP13NPtkYtVlcGkIknvBHkv3xQjmEAyzSkzImqc5PV2j4BcP7SBTGiERxRp6oG6Y09fTPULaj7ZmjTaTfPjdoZx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752401119; c=relaxed/simple;
	bh=bGBQDtR+6Z6cAV9LfZQmdCyopOJw19msfoWEJXzNwHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jM0Luhm7WU1AfJVC4wnC3DX3WGAfX5Fc/CQFiR2JvlXUaRE+9e5MypdPa3EyWCS3Pq7UfMFR0BqhOcCtMsmls2frh7QVAf59gsWknL/ouaEX06UY9vRWFKWRqHUP05hlN7/DqkThTvNfdeNvOpIMny2kEDx1dbHjMinu7TN3kYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=dEF2U9pX; arc=none smtp.client-ip=193.222.135.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 47151 invoked from network); 13 Jul 2025 12:05:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1752401113; bh=2WHH9leCL20zYk/IJKiOltbTf1FDg0xIXHKJpRqHleM=;
          h=From:To:Cc:Subject;
          b=dEF2U9pXLLuraoWdjHGfZLMB7zey/WiBFkCHQI0hWV/qno+Udm7FUPkqfy43XdsZv
           qg3k8eiUpFpTBr9uqh0per7J9T8vjS9dz0kViKGYbnHISsyaKyPNQcVDQXoOHWbdab
           zwAGARsTiytDUFAIJXH3sLaXBI8Ei0kBrcA9+wy08y8Pjh+EN6bVylc2JhGUSDZL+g
           sTdsag7sHW/MwpX5Q9FVNM6xtuI/bS9EL0xzY7/aQBEOzYTD3vGoDM4IQD84XDnSzZ
           fqKd7/R/5X8GWxznljCaOyHPlBdykdgM3uW9y4cRVA0qQaQAq2NKPy4+dwp3aiH0Zo
           7rk6j5EkjT8mA==
Received: from apn-78-30-72-196.dynamic.gprs.plus.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[78.30.72.196])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <jiaxun.yang@flygoat.com>; 13 Jul 2025 12:05:12 +0200
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-mips@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH 2/4] mips/mach-rm: remove custom mc146818rtc.h file
Date: Sun, 13 Jul 2025 12:04:32 +0200
Message-Id: <20250713100434.699843-3-mat.jonczyk@o2.pl>
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
X-WP-MailID: f1b4d652ec2decfbd19ef1cd7040fb8b
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [ITMh]                               

The mc146818_decode_year macro is used only in mc146818_get_cmos_time,
which in turn is called only in
	arch/mips/loongson2ef/common/time.c
and
	arch/mips/mti-malta/malta-time.c

So no SNI or mach-rm content. SNI did not use mc146818_get_cmos_time
apparently since
commit 06cf5583fd9a ("[MIPS] SNI RM updates")
in 2007.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
---
 arch/mips/include/asm/mach-rm/mc146818rtc.h | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-rm/mc146818rtc.h

diff --git a/arch/mips/include/asm/mach-rm/mc146818rtc.h b/arch/mips/include/asm/mach-rm/mc146818rtc.h
deleted file mode 100644
index a074f4f84f75..000000000000
--- a/arch/mips/include/asm/mach-rm/mc146818rtc.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2004 by Ralf Baechle
- *
- * RTC routines for PC style attached Dallas chip with ARC epoch.
- */
-#ifndef __ASM_MACH_RM_MC146818RTC_H
-#define __ASM_MACH_RM_MC146818RTC_H
-
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define mc146818_decode_year(year) ((year) < 70 ? (year) + 2000 : (year) + 1900)
-#else
-#define mc146818_decode_year(year) ((year) + 1980)
-#endif
-
-#include <asm/mach-generic/mc146818rtc.h>
-
-#endif /* __ASM_MACH_RM_MC146818RTC_H */
-- 
2.25.1


