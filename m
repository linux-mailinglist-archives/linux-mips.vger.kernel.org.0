Return-Path: <linux-mips+bounces-609-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7285680A85A
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 17:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C13CBB20B2A
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 16:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992EE374CE;
	Fri,  8 Dec 2023 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LJ/mIuxr"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0537F1997;
	Fri,  8 Dec 2023 08:12:57 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9B636000B;
	Fri,  8 Dec 2023 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702051976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGnu+pKltHatitWmpZe2slSLwq2YMSEGW5QMPSmCvCw=;
	b=LJ/mIuxr6qHAYUk6svKj9Twgg97pdvMlzT3YnIlrYdWe0JAA4FoaNYNElfpvRP9zg6lnXi
	Tn1WlWjY8dP3RJ5UK1+K4XpVTK1Rbop72PNOcPzIpdceNrBsf7hNk6e/rxClxvso1KHbRY
	2cd61JWOc4mJq9/wgD79Z+aRPHMSRCvygC5SPK2vzNX5HmEzUFxGZpUtMyXaPXFxzLc4XR
	53r8dv0QFCOD3o/U3xB/Tb1n9/Gx8V1aoUTM1AVBe0LFxRP2XnZlyZhMwRo4XhmUqZHN/u
	wJbTFTVlmOS6bA92h33a8fePoGa4K0ETaVD3Bw34Y3xn7a6eqxngzchJgbniIA==
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
Subject: [PATCH v4 03/22] MIPS: spaces: Define a couple of handy macros
Date: Fri,  8 Dec 2023 17:12:19 +0100
Message-ID: <20231208161249.1827174-4-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208161249.1827174-1-gregory.clement@bootlin.com>
References: <20231208161249.1827174-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

KSEGX_SIZE is defined to size of each KSEG segment.

TO_CAC and TO_UNCAC are defined for 32bits builds and point to KSEG 0
and KSEG1.
TO_PHYS remains to be 64bits only as we want people to
use __pa to avoid mixup compat address space.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/include/asm/addrspace.h           | 5 +++++
 arch/mips/include/asm/mach-generic/spaces.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/mips/include/asm/addrspace.h b/arch/mips/include/asm/addrspace.h
index 59a48c60a065c..03a5e2c8b5dc9 100644
--- a/arch/mips/include/asm/addrspace.h
+++ b/arch/mips/include/asm/addrspace.h
@@ -47,6 +47,11 @@
  */
 #define KSEGX(a)		((_ACAST32_(a)) & _ACAST32_(0xe0000000))
 
+/*
+ * Gives the size of each kernel segment
+ */
+#define KSEGX_SIZE		0x20000000
+
 /*
  * Returns the physical address of a CKSEGx / XKPHYS address
  */
diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index b247575c5e699..c502bdd98aad0 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -49,6 +49,8 @@
 #define HIGHMEM_START		_AC(0x20000000, UL)
 #endif
 
+#define TO_UNCAC(x)		CKSEG1ADDR(x)
+#define TO_CAC(x)		CKSEG0ADDR(x)
 #endif /* CONFIG_32BIT */
 
 #ifdef CONFIG_64BIT
-- 
2.42.0


