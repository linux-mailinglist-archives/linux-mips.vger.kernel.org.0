Return-Path: <linux-mips+bounces-4379-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A2937937
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jul 2024 16:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58F01282FE4
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jul 2024 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288D913C904;
	Fri, 19 Jul 2024 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Po1GXehA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED81DDEA;
	Fri, 19 Jul 2024 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721399545; cv=none; b=CqX0j1vPPPsSWT3ABT0F5hvqzlWLFNcM3GDsuEuIVObmFk7cFIRjAU4Sd4JrSmr6mezvSLwV4aE5/zcDfOWddu9FNWwKS4D5EPUlRk5qadVBZPqwro2ROdIxk/l5JqucJbGxmB9+Yhena+xAzJsG54OOeXjpV6/rqno1m1DcZb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721399545; c=relaxed/simple;
	bh=eSNSgiFbmLBeurqiEh72ipXm+lBT2ycrGZa8tUn601Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jpwmRuuSCAeDPhlPThM248njHkDgNLlKsRDGboDeIa5RkiVnJixHR2vJhiVR3oayG+2jVjc4rcQfILrVqajlZgyyXkV55hAA8XTM5sD5VSaQmgs5uFpG88KHT/wM80VY+VYcdjmsmxWaLnMrW4pLMhfjCtolLTnxxKqju9dIJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Po1GXehA; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id DEF57C3DA3;
	Fri, 19 Jul 2024 14:15:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 618E3E0009;
	Fri, 19 Jul 2024 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721398501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tct01ejxcK2T8As8Xqn354fsyLcWnCMauPph/e+Y6fY=;
	b=Po1GXehAH5rVnYfkVeXnRJmWZgX5YQFERpxSV8tJw2wYg1H0w3ZIv9TwfgseD4uil0e3qq
	qJ5qgd4ecGflYRp1rX0vXI4HVCWKOcKHvV2hDs5MTbxXt3+LiZbYBbKAVcFQkf5g2qe/Go
	pGYs4PziGKbIE+5BhEhNQFJAbnmNzLZAjpFEi1gs6zDFHjt6rAGQxTSkt9LvNj8VtBD+vc
	4gMsxHBh3522vl7ZdNbAvmcG/e4XJk5V29V1757cW/gHJ3O53gtGKApRbjOjZSJhErLfyV
	tFTk3uNa7KSUZRn5pzWXwnS8XQEcY6mi8j2yqK+Oy7Nh4UQIs5RdY7i3Hyru8g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 19 Jul 2024 16:14:53 +0200
Subject: [PATCH] MIPS: SMP-CPS: Fix address for GCR_ACCESS register for
 I6500
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240719-smp_i6500-v1-1-8738e67d4802@bootlin.com>
X-B4-Tracking: v=1; b=H4sIANx0mmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0NL3eLcgvhMM1MDA12L5CQjY2MLc4tkE0MloPqCotS0zAqwWdGxtbU
 AFCr0hFsAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Burton <paulburton@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: gregory.clement@bootlin.com

Unlike most other MIPS CPUs, the I6500 CPUs have different address
offsets for the Global CSR Access Privilege register. In the "MIPS64
I6500 Multiprocessing System Programmer's Guide," it is stated that
"the Global CSR Access Privilege register is located at offset 0x0120"
in section 5.4.

However, this is not the case for other MIPS64 CPUs such as the
P6600. In the "MIPS64® P6600 Multiprocessing System Software User's
Guide," section 6.4.2.6 states that the GCR_ACCESS register has an
offset of 0x0020.

This fix allows to use the VP cores in SMP mode.

Based on the work of Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Fixes: 859aeb1b0dd1 ("MIPS: Probe the I6500 CPU")
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/include/asm/mips-cm.h | 4 ++++
 arch/mips/kernel/smp-cps.c      | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 3d9efc802e36..41bf9b3a98fb 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -240,6 +240,10 @@ GCR_ACCESSOR_RO(32, 0x0d0, gic_status)
 GCR_ACCESSOR_RO(32, 0x0f0, cpc_status)
 #define CM_GCR_CPC_STATUS_EX			BIT(0)
 
+/* GCR_ACCESS - Controls core/IOCU access to GCRs */
+GCR_ACCESSOR_RW(32, 0x120, access_i6500)
+#define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
+
 /* GCR_L2_CONFIG - Indicates L2 cache configuration when Config5.L2C=1 */
 GCR_ACCESSOR_RW(32, 0x130, l2_config)
 #define CM_GCR_L2_CONFIG_BYPASS			BIT(20)
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index e074138ffd7f..60590890b6da 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -325,7 +325,10 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
 
 	/* Ensure the core can access the GCRs */
-	set_gcr_access(1 << core);
+	if (current_cpu_type() != CPU_I6500)
+		set_gcr_access(1 << core);
+	else
+		set_gcr_access_i6500(1 << core);
 
 	if (mips_cpc_present()) {
 		/* Reset the core */

---
base-commit: 9298d51eb3af24f88b211087eb698399f9efa439
change-id: 20240719-smp_i6500-8cb233878c41

Best regards,
-- 
Gregory CLEMENT <gregory.clement@bootlin.com>


