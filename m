Return-Path: <linux-mips+bounces-436-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CE800992
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 12:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2C328180C
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176C321376;
	Fri,  1 Dec 2023 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ID55cpOW"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4FC10F8;
	Fri,  1 Dec 2023 03:15:32 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 283781C000C;
	Fri,  1 Dec 2023 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcHHna0h/IgIzh58pWB4uS96fnTDDQBk114hJ4c/spg=;
	b=ID55cpOWhIKsrlvBDFEiMQsd/i+9SVHpFmKiSgSrf4ea2szu210SB8aO2yquFUAHiUG2nv
	ypReEnWoH6+ahhhbuluGNSmcGzaXfwcRZ7S9As+VDn3AmJydh/gIQfAfkeFanqET1aNpQr
	7M/iSXvedKpG9dqb+vArtGOi/mxXQGNX36ViAOoQDjtq6DU+Nqo4OlpIUOVshc5ywsBjVa
	zFWoGDvDs5H3wVzoKaF1FxmmECafAiHanzY/s2zI4vFS04C8w15ybfYwia+j+dCpoFTQ/N
	STIEp0faDUMzPLnDDCO/k+6mVuEEHVAJF6gBkLJIdKKTypccSspQEmZXRqBGpQ==
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
Subject: [PATCH v3 11/22] MIPS: traps: Enhance memblock ebase allocation process
Date: Fri,  1 Dec 2023 12:14:54 +0100
Message-ID: <20231201111512.803120-12-gregory.clement@bootlin.com>
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
index b6e94654f6211..68f1dd54cde1c 100644
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


