Return-Path: <linux-mips+bounces-234-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B57F62E5
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 16:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE756B217BD
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 15:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2E83E468;
	Thu, 23 Nov 2023 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ezsiTQk1"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A571F10C0;
	Thu, 23 Nov 2023 07:27:06 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB15A40002;
	Thu, 23 Nov 2023 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700753225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCKptM1WbQckX1/6TWdLw/l+WdnmH/2DKGhPgYFMpg4=;
	b=ezsiTQk10iF+9RkJPCisP/IK3Du+KZIUqiD3vB+Ciz7VII/LNStwt40t5Y+EMuH41tc0rB
	3DPKQ3b1MCSCAWWE02Q+0E/ARWNp5LcXXvZUSKpBqzC/z4vL5tNPtaF4U7+gygR2rcffDQ
	ISIxWgqkqz+C0XeYvnyRmnBUg8D/fgUsax+k1L92bfrECNaqNg6Pb1SAeqTKg9WqOyzQtE
	7q5lzfNTsvO62erFgaFkWDghjB4ynCTh9YuxA6qR6DCG08oVovdasQ0mRHEMvExOm0hP4S
	FmMVIvvJpH8lvC0LjrZmHSJpFMm4rlPe2uwotxyZ6SuYY9fSCrOE8FLx2JEtig==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 13/21] MIPS: traps: Give more explanations if ebase doesn't belong to KSEG0
Date: Thu, 23 Nov 2023 16:26:30 +0100
Message-ID: <20231123152639.561231-14-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123152639.561231-1-gregory.clement@bootlin.com>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Now that we support having the kernel in XPHYS and not only in KSEG0,
the case where ebase doesn't belong to KSEG0 is more likely to
occur. However, in this scenariowe encounter a significant and
intimidating stack dump without any explanation. To address this, we
should eliminate the uninformative stack dump and replace it with a
warning that provides a clear explanation of the issue.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/kernel/traps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 68f1dd54cde1c..3af2aa82b4408 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2420,10 +2420,13 @@ void __init trap_init(void)
 		 * EVA is special though as it allows segments to be rearranged
 		 * and to become uncached during cache error handling.
 		 */
-		if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
+		if (!IS_ENABLED(CONFIG_EVA) && ebase_pa < 0x20000000)
 			ebase = CKSEG0ADDR(ebase_pa);
 		else
 			ebase = (unsigned long)phys_to_virt(ebase_pa);
+		if (ebase_pa >= 0x20000000)
+			pr_warn("ebase(0x%llX) should better be in KSeg0",
+				ebase_pa);
 	}
 
 	if (cpu_has_mmips) {
-- 
2.42.0


