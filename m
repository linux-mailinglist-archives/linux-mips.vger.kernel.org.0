Return-Path: <linux-mips+bounces-430-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA62800985
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 12:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962101C20A4C
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6722A2134E;
	Fri,  1 Dec 2023 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fgzihX1c"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4976310D8;
	Fri,  1 Dec 2023 03:15:25 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24268C000C;
	Fri,  1 Dec 2023 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwMGUZspLb3scKoCxR0kEqf6HvwmvWkmRHeYsxLYvU8=;
	b=fgzihX1c1UqV0SL6jO3hqG4IniDL2MBT476VKZEk5eDHgFmD4ZuqUuQD50im18Y5gEsOVk
	dFigKAqRlhhoG4AGfVD4kw/R7p5K3AqPf/GE3c1NhgLPls+KcQ2TXXWkpcmxDJ1h2Fu8Ri
	VHPpnCBTjWIV3ffmY4NkP6qfXB+lDch2xU4ZuWJLhsyuda5XHokF4T7IU6LMnPnKPgfP4q
	qLpi6L3S0aO9AD/Fdb5x+/sEvO+NYiCOoTtLCp6WOQuVPTupzl1VSMh7GccNs6/KcU1R+a
	IIrYwnDH/QVnNWSR7UDJn2D4gxfvBSb/h3diVy5KY+Gp0IMIVbXphi3B4VTXNg==
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
Subject: [PATCH v3 03/22] MIPS: spaces: Define a couple of handy macros
Date: Fri,  1 Dec 2023 12:14:46 +0100
Message-ID: <20231201111512.803120-4-gregory.clement@bootlin.com>
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

KSEGX_SIZE is defined to size of each KSEG segment.

TO_CAC and TO_UNCAC are brought to 32bit builds as well,
TO_PHYS remains to be 64bit only as we want people to
use __pa to avoid mixup compat address space.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/addrspace.h           | 5 +++++
 arch/mips/include/asm/mach-generic/spaces.h | 5 +++--
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index b247575c5e699..05db19521e817 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -79,11 +79,12 @@
 #endif
 
 #define TO_PHYS(x)		(	      ((x) & TO_PHYS_MASK))
-#define TO_CAC(x)		(CAC_BASE   | ((x) & TO_PHYS_MASK))
-#define TO_UNCAC(x)		(UNCAC_BASE | ((x) & TO_PHYS_MASK))
 
 #endif /* CONFIG_64BIT */
 
+#define TO_CAC(x)		(CAC_BASE   | ((x) & TO_PHYS_MASK))
+#define TO_UNCAC(x)		(UNCAC_BASE | ((x) & TO_PHYS_MASK))
+
 /*
  * This handles the memory map.
  */
-- 
2.42.0


