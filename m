Return-Path: <linux-mips+bounces-696-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37380F2FA
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 17:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 274601F213FD
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 16:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EED7A229;
	Tue, 12 Dec 2023 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LbdYo6lR"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21F5F5;
	Tue, 12 Dec 2023 08:35:34 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACB801C0007;
	Tue, 12 Dec 2023 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702398933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLrp9lcJ5PQW92KPtBpFPcB6UQzVTee0sSxnR5o7EZA=;
	b=LbdYo6lRPpwdkiC1qRLoOCK7PkZyJJ8wPXnnbyNgoAFGmOwuqvKikSrMRM7k5MIp4LySGy
	YltKy8oLdARmXSzPt/H2hjukhd4OrjJaL90nUzQoc/XOYGoZSl39h43pNxRnZ+FZvOZ/yW
	nBXl1fK+nBShY7Yhc31I8JtVQyC1oKSjYcGXIuym6db2d0DUx6fWaQybMqwO+/5+F+Sj9k
	e6vFs040Q8Zg5Rio2cwx+YrTk0Q5GCoM27leEtGxSMEHRD200gsQZ0JcSLEzcnCjKnlpdY
	r0PxkoWG1gZU/K/S+KTqQQSlG/Qowm/QoQFB05Irb75f8kS5V5mDf395KD+MmA==
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 11/22] MIPS: traps: Enhance memblock ebase allocation process
Date: Tue, 12 Dec 2023 17:34:43 +0100
Message-ID: <20231212163459.1923041-12-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212163459.1923041-1-gregory.clement@bootlin.com>
References: <20231212163459.1923041-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

We try to allocate from KSEG0 accessible space first, and
then if we really can't allocate any memory from KSEG0 and
we are sure that we support ebase in higher segment, give
it another go without restriction.

This can maximize the possibility of having ebase in KSEG0.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/traps.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index a6d0ae12b3c4c..089247555c752 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2399,7 +2399,12 @@ void __init trap_init(void)
 		memblock_reserve(ebase_pa, vec_size);
 	} else {
 		vec_size = max(vec_size, PAGE_SIZE);
-		ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
+		ebase_pa = memblock_phys_alloc_range(vec_size, 1 << fls(vec_size),
+						     0x0, KSEGX_SIZE - 1);
+
+		if (!ebase_pa && (IS_ENABLED(CONFIG_EVA) || cpu_has_ebase_wg))
+			ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
+
 		if (!ebase_pa)
 			panic("%s: Failed to allocate %lu bytes align=0x%x\n",
 			      __func__, vec_size, 1 << fls(vec_size));
-- 
2.42.0


