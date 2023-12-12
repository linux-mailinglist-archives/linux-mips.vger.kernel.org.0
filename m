Return-Path: <linux-mips+bounces-690-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2380F2EE
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 17:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54A1F1C20F26
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 16:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415F27A205;
	Tue, 12 Dec 2023 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hV61DdsZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CB7CF;
	Tue, 12 Dec 2023 08:35:28 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC60D1BF206;
	Tue, 12 Dec 2023 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702398926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lKcme3eaH65euvc/e2P73RSdLcgnsk0eRcbckWPUCdg=;
	b=hV61DdsZAAj98ndi9omfMHJ64OQ103h1zci1b7xPMPI1LEe6X2UpwRXzSwRTP/3K71WgTO
	4xbWq2ONnAmjcVGBPXj8Ed3viBxklngetrxWiKpw3UpPk1GG262+vfczvzm4jeAj14H5FK
	cg/ZVreDQSR7LUJ+457DJdUb6m9Sm8PEMrTrULk3xsBQ0OqFDaXd8wCwPcGX4mn7riw6JP
	rcSkchf6mhbGT9zrClx1kSOVargaobSp0kX9ciKayh2lW/t1HQtlwZd13tBauicNAC7QzA
	RZ9fT/zbzPwTfbpvNhw6XmMgi6aoy89132BttBKG0Wt9FXXKyezjYx15F9UMfQ==
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
Subject: [PATCH v5 03/22] MIPS: spaces: Define a couple of handy macros
Date: Tue, 12 Dec 2023 17:34:35 +0100
Message-ID: <20231212163459.1923041-4-gregory.clement@bootlin.com>
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

Define KSEGX_SIZE to represent the size of each KSEG segment.

Introduce TO_CAC and TO_UNCAC specifically for 32-bit builds, pointing
to KSEG0 and KSEG1.

TO_PHYS remains exclusive to 64-bit builds to encourage the use of
__pa and prevent compatibility address space confusion.

KSEGX_SIZE is defined to size of each KSEG segment.

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


