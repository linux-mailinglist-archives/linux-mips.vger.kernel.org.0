Return-Path: <linux-mips+bounces-225-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531F7F62CC
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 16:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C67631C211BB
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 15:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94DE3AC26;
	Thu, 23 Nov 2023 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UDCEufjk"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04612D69;
	Thu, 23 Nov 2023 07:27:02 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B05A1C0007;
	Thu, 23 Nov 2023 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700753221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=imSdkuhb1bmbiT2B28YIP5ZVYeyaD1qizr5YYVEXZZM=;
	b=UDCEufjkJ/1u4nKt134YGyIOwir5VO2QexjErqbHyxiJmbqn6Gdo1GKtpUIj4oWEVeZ1Zm
	sAm7KjqPgTiKgZauy+fXpIrUKh2R9a/CQyar7yCkAn8ZeWj32RyFinHDbt3pPFfe/eO0Qu
	DYdOTHu9EUVieAwaeq9haSOwpasU9X5jgrrMQnQwloUdp0bzKfqw907sSv/IUefTFdGUtu
	NwoIlqNpl6nEj+qTyqiwyvAV0dZHCf7Xw+MZtUyAfWOtOP8j/BvzeFu+FigiSjdxQE1i0y
	3+O0m93mha/eZFJUrSMUP1bZVUdK4zVgzLUjsnd40eDPElvWs0TyLknH38Comg==
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
Subject: [PATCH v2 09/21] MIPS: traps: Handle CPU with non standard vint offset
Date: Thu, 23 Nov 2023 16:26:26 +0100
Message-ID: <20231123152639.561231-10-gregory.clement@bootlin.com>
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Some BMIPS cpus has none standard start offset for vector interrupts.

Handle those CPUs in vector size calculation and handler setup process.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/traps.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index ea59d321f713e..651c9ec6265a9 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -74,7 +74,6 @@
 
 #include "access-helper.h"
 
-#define MAX(a, b) ((a) >= (b) ? (a) : (b))
 
 extern void check_wait(void);
 extern asmlinkage void rollback_handle_int(void);
@@ -2005,6 +2004,7 @@ void __noreturn nmi_exception_handler(struct pt_regs *regs)
 unsigned long ebase;
 EXPORT_SYMBOL_GPL(ebase);
 unsigned long exception_handlers[32];
+static unsigned long vi_vecbase;
 unsigned long vi_handlers[64];
 
 void reserve_exception_space(phys_addr_t addr, unsigned long size)
@@ -2074,7 +2074,7 @@ static void *set_vi_srs_handler(int n, vi_handler_t addr, int srs)
 		handler = (unsigned long) addr;
 	vi_handlers[n] = handler;
 
-	b = (unsigned char *)(ebase + 0x200 + n*VECTORSPACING);
+	b = (unsigned char *)(vi_vecbase + n*VECTORSPACING);
 
 	if (srs >= srssets)
 		panic("Shadow register set %d not supported", srs);
@@ -2370,20 +2370,33 @@ void __init trap_init(void)
 	extern char except_vec3_generic;
 	extern char except_vec4;
 	extern char except_vec3_r4000;
-	unsigned long i, vec_size;
+	unsigned long i, vec_size, vi_vec_offset;
 	phys_addr_t ebase_pa;
 
 	check_wait();
 
+	if (cpu_has_veic || cpu_has_vint) {
+		switch (current_cpu_type()) {
+		case CPU_BMIPS3300:
+		case CPU_BMIPS4380:
+			vi_vec_offset = 0x400;
+			break;
+		case CPU_BMIPS5000:
+			vi_vec_offset = 0x1000;
+			break;
+		default:
+			vi_vec_offset = 0x200;
+			break;
+		}
+		vec_size = vi_vec_offset + VECTORSPACING*64;
+	} else {
+		vec_size = 0x400;
+	}
+
 	if (!cpu_has_mips_r2_r6) {
 		ebase = CAC_BASE;
-		vec_size = 0x400;
 	} else {
-		if (cpu_has_veic || cpu_has_vint)
-			vec_size = 0x200 + VECTORSPACING*64;
-		else
-			vec_size = PAGE_SIZE;
-
+		vec_size = max(vec_size, PAGE_SIZE);
 		ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
 		if (!ebase_pa)
 			panic("%s: Failed to allocate %lu bytes align=0x%x\n",
@@ -2450,6 +2463,7 @@ void __init trap_init(void)
 	 * Initialise interrupt handlers
 	 */
 	if (cpu_has_veic || cpu_has_vint) {
+		vi_vecbase = ebase + vi_vec_offset;
 		int nvec = cpu_has_veic ? 64 : 8;
 		for (i = 0; i < nvec; i++)
 			set_vi_handler(i, NULL);
-- 
2.42.0


