Return-Path: <linux-mips+bounces-4419-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A077C938FBE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 15:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB7D2823A0
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 13:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E73316A38B;
	Mon, 22 Jul 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QOzZbP3J"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115582BAF9;
	Mon, 22 Jul 2024 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721654158; cv=none; b=dWe0iypEKoPVyhzjkXwLB9c7g3u8i0aELlSBjiaJGCdIp69TQwG/UMaHS7BLcxHzZJLHp9ga+5fMOsjXg88SQAqwv2puUkgj+7ZdFjhkQ1zXkP4QgsAuTENUsb2oXHNOBBjWg4cmh4u2tHFwaXxnR33Sb4Gi+rL3No153WS2f+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721654158; c=relaxed/simple;
	bh=pjFNIc9gT7SJjeTagPcv0lVq5UnqFiFkkokqEGgOEz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=trtcySF3bBro+XEEMzuhY+r4zSSTiy6qSxSi2oEFTytlo4zUhdU9s2qhxrlh0XVvoPm5bN2fMfFxwRpY3ypItJTE+dkFOOYvUneetj7Gw8Y7xFeZA69zctOwxOAPxPcygEkX1iZoYvW+k4Bpk0+1ysUFdmV1WUxhmxDIUKlIzW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QOzZbP3J; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF774240007;
	Mon, 22 Jul 2024 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721654153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kBYY4QzDT9NrEEj3vDnYvsmuXgQT6szDvWOj3UiFc1w=;
	b=QOzZbP3J/lGECm/baIq9zYMyd1SRUqe7+upkVZikTT94YwMVyce7ScdOlV6PjLhfpfHWsr
	GHEso7G2CcaHoG8kPlLTly9VTWZUMc7FXSsyIJW35q2/6LGcza8RV8S9vh94VuGnIUot03
	yYvy8JPw2EnDjHcP4jG2FTO9JR8TXH/Bm687P6/fR0ce3jIrTW0d5dfHzWrK322JSlGRw+
	wuk3Q5MYycmnboaJvCH/4y7nIBlJhPPK4BEpQrbyxSI88TuUtrt7fppVfpxsz8Unm7KIJP
	xLEE8jGG46BTpRgQ8JbA4q/7wxatjvQ9RK4EopOJioaVOI5WEjhMb0FePPO4ww==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 22 Jul 2024 15:15:39 +0200
Subject: [PATCH v2] MIPS: SMP-CPS: Fix address for GCR_ACCESS register for
 CM3 and later
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-smp_i6500-v2-1-3101459cba29@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHpbnmYC/23MSwrCMBSF4a2UOzaSl821I/chRWwa7QWblKQEp
 WTvxo4d/ofDt0FykVyCrtkgukyJgq8hDw3Y6e6fjtFYGySXmhtxZmlebtSeOGdoB6kUGrRaQP0
 v0T3ovVvXvvZEaQ3xs9NZ/NZ/ShZMMDQKXWtGjVxehhDWF/mjDTP0pZQviEBndaQAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: gregory.clement@bootlin.com

When the CM block migrated from CM2.5 to CM3.0, the address offset for
the Global CSR Access Privilege register was modified. We saw this in
the "MIPS64 I6500 Multiprocessing System Programmer's Guide," it is
stated that "the Global CSR Access Privilege register is located at
offset 0x0120" in section 5.4. It is at least the same for I6400.

This fix allows to use the VP cores in SMP mode if the reset values
were modified by the bootloader.

Based on the work of Vladimir Kondratiev
<vladimir.kondratiev@mobileye.com> and the feedback from Jiaxun Yang
<jiaxun.yang@flygoat.com>.

Fixes: 197e89e0984a ("MIPS: mips-cm: Implement mips_cm_revision")
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Changes in v2:
- Based the detection on the CM version and not on a single CPU version
- Renamed the macro accordingly
- Link to v1: https://lore.kernel.org/r/20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com
---
 arch/mips/include/asm/mips-cm.h | 4 ++++
 arch/mips/kernel/smp-cps.c      | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 3d9efc802e36..10e96b119c36 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -240,6 +240,10 @@ GCR_ACCESSOR_RO(32, 0x0d0, gic_status)
 GCR_ACCESSOR_RO(32, 0x0f0, cpc_status)
 #define CM_GCR_CPC_STATUS_EX			BIT(0)
 
+/* GCR_ACCESS - Controls core/IOCU access to GCRs */
+GCR_ACCESSOR_RW(32, 0x120, access_cm3)
+#define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
+
 /* GCR_L2_CONFIG - Indicates L2 cache configuration when Config5.L2C=1 */
 GCR_ACCESSOR_RW(32, 0x130, l2_config)
 #define CM_GCR_L2_CONFIG_BYPASS			BIT(20)
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index e074138ffd7f..05174aa9881c 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -325,7 +325,10 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
 
 	/* Ensure the core can access the GCRs */
-	set_gcr_access(1 << core);
+	if (mips_cm_revision() < CM_REV_CM3)
+		set_gcr_access(1 << core);
+	else
+		set_gcr_access_cm3(1 << core);
 
 	if (mips_cpc_present()) {
 		/* Reset the core */

---
base-commit: 9298d51eb3af24f88b211087eb698399f9efa439
change-id: 20240719-smp_i6500-8cb233878c41

Best regards,
-- 
Gregory CLEMENT <gregory.clement@bootlin.com>


