Return-Path: <linux-mips+bounces-439-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0374A80099A
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 12:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0FE8281853
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489B3219EA;
	Fri,  1 Dec 2023 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PG/59UkC"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133461704;
	Fri,  1 Dec 2023 03:15:33 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61064E0010;
	Fri,  1 Dec 2023 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCKptM1WbQckX1/6TWdLw/l+WdnmH/2DKGhPgYFMpg4=;
	b=PG/59UkCiD8Da+NaKWqmkpGhkFnfPdkENgmb+8BnASxUBM1bNrTY9ki9c6ydjZozRTacZO
	zFvXm10pYaC3x5mV3zbPgDO1yn4loKOquf1ntufmPRHKbi+CJ5EtGnBPK53jUViy9EXBGk
	5Al6KoJ6RaGyBJcD3XzePEYrh4TquJfLMMRTKSWCs7S+iEJCO64A1WQnDkFYID1VxJsGuz
	eOI+fjE7GB7NHNu7t73BWhJMf/2N8/CsMgCft1EAB0I74Az3Td+Z62yUiur2hk8k/jKXQv
	rb0VcLp5LNWTbl9N+psbN7mOCJtICg8YFVfqAlG2Ixgps8UBKR07FhtyS+627g==
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
Subject: [PATCH v3 13/22] MIPS: traps: Give more explanations if ebase doesn't belong to KSEG0
Date: Fri,  1 Dec 2023 12:14:56 +0100
Message-ID: <20231201111512.803120-14-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201111512.803120-1-gregory.clement@bootlin.com>
References: <20231201111512.803120-1-gregory.clement@bootlin.com>
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


