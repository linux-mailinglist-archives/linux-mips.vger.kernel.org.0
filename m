Return-Path: <linux-mips+bounces-429-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A189B800983
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 12:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D31A11C20A2E
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCB22134A;
	Fri,  1 Dec 2023 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XUkmNmNZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC0A10E5;
	Fri,  1 Dec 2023 03:15:26 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D846E2000B;
	Fri,  1 Dec 2023 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AagYqurduAd05kHY0ow9kHcvI+mUo3FUEEyQW1aeXWI=;
	b=XUkmNmNZbAI8ZBUM/abQ1IVZSBWxfK27/ZesXuxSyGIdve2+WQ5TB9iTAf7u/yzdIbZEOn
	Nz9p0a28Nm1DR1Nx7/XzxpnPLQUT0Ek1VSiDnAZDZNNVAQYy6PQogxBbX1iWEDJKHyerct
	Oczg5zYdGiODwlsSvVo7tJYYLBM9Hmr9uw5hAzC6Kps75J51nBlD2xC8J/znpukJDWEV9l
	K3+mKsnbyfKyhuN8IpTS9sVCZPcpcjdaA7zwAY3xA0FRYfMzB9ZqueMVsiLcTIEQ0boHs6
	dU81PvbKl4syGjdKmtf6WFpXEy4LSdF1b8YEnicj2bPJBNBTKBkFRJGQx5IRCg==
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
	Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 04/22] MIPS: genex: Fix except_vec_vi for kernel in XKPHYS
Date: Fri,  1 Dec 2023 12:14:47 +0100
Message-ID: <20231201111512.803120-5-gregory.clement@bootlin.com>
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

Use {highest, higher, hi, lo} immediate loading sequence
to load 64 bit jump address for handler when kernel is
loaded to XKPHYS.

Co-developed-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Co-developed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/kernel/genex.S | 19 +++++++++++++++----
 arch/mips/kernel/traps.c | 34 ++++++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index b6de8e88c1bd4..fd765ad9ecac0 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -272,11 +272,22 @@ NESTED(except_vec_vi, 0, sp)
 	.set	push
 	.set	noreorder
 	PTR_LA	v1, except_vec_vi_handler
-FEXPORT(except_vec_vi_lui)
-	lui	v0, 0		/* Patched */
+#if defined(CONFIG_32BIT) || defined(KBUILD_64BIT_SYM32)
+FEXPORT(except_vec_vi_hi)
+	lui	v0, 0			/* Patched */
+#else
+FEXPORT(except_vec_vi_highest)
+	lui	v0, 0			/* Patched */
+FEXPORT(except_vec_vi_higher)
+	daddiu	v0, 0			/* Patched */
+	dsll	v0, 16
+FEXPORT(except_vec_vi_hi)
+	daddiu	v0, 0			/* Patched */
+	dsll	v0, 16
+#endif
 	jr	v1
-FEXPORT(except_vec_vi_ori)
-	 ori	v0, 0		/* Patched */
+FEXPORT(except_vec_vi_lo)
+	PTR_ADDIU	v0, 0		/* Patched */
 	.set	pop
 	END(except_vec_vi)
 EXPORT(except_vec_vi_end)
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 246c6a6b02614..60c513c51684f 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2091,18 +2091,26 @@ static void *set_vi_srs_handler(int n, vi_handler_t addr, int srs)
 		 * If no shadow set is selected then use the default handler
 		 * that does normal register saving and standard interrupt exit
 		 */
-		extern const u8 except_vec_vi[], except_vec_vi_lui[];
-		extern const u8 except_vec_vi_ori[], except_vec_vi_end[];
+		extern const u8 except_vec_vi[], except_vec_vi_hi[];
+		extern const u8 except_vec_vi_lo[], except_vec_vi_end[];
+#if defined(CONFIG_64BIT) && !defined(KBUILD_64BIT_SYM32)
+		extern const u8 except_vec_vi_highest[], except_vec_vi_higher[];
+#endif
 		extern const u8 rollback_except_vec_vi[];
 		const u8 *vec_start = using_rollback_handler() ?
 				      rollback_except_vec_vi : except_vec_vi;
 #if defined(CONFIG_CPU_MICROMIPS) || defined(CONFIG_CPU_BIG_ENDIAN)
-		const int lui_offset = except_vec_vi_lui - vec_start + 2;
-		const int ori_offset = except_vec_vi_ori - vec_start + 2;
+		const int imm_offset = 2;
 #else
-		const int lui_offset = except_vec_vi_lui - vec_start;
-		const int ori_offset = except_vec_vi_ori - vec_start;
+		const int imm_offset = 0;
+#endif
+#if defined(CONFIG_64BIT) && !defined(KBUILD_64BIT_SYM32)
+		const int highest_offset = except_vec_vi_highest - vec_start + imm_offset;
+		const int higher_offset = except_vec_vi_higher - vec_start + imm_offset;
 #endif
+		const int hi_offset = except_vec_vi_hi - vec_start + imm_offset;
+		const int lo_offset = except_vec_vi_lo - vec_start + imm_offset;
+
 		const int handler_len = except_vec_vi_end - vec_start;
 
 		if (handler_len > VECTORSPACING) {
@@ -2119,10 +2127,16 @@ static void *set_vi_srs_handler(int n, vi_handler_t addr, int srs)
 #else
 				handler_len);
 #endif
-		h = (u16 *)(b + lui_offset);
-		*h = (handler >> 16) & 0xffff;
-		h = (u16 *)(b + ori_offset);
-		*h = (handler & 0xffff);
+#if defined(CONFIG_64BIT) && !defined(KBUILD_64BIT_SYM32)
+		h = (u16 *)(b + highest_offset);
+		*h = uasm_rel_highest(handler);
+		h = (u16 *)(b + higher_offset);
+		*h = uasm_rel_higher(handler);
+#endif
+		h = (u16 *)(b + hi_offset);
+		*h = uasm_rel_hi(handler);
+		h = (u16 *)(b + lo_offset);
+		*h = uasm_rel_lo(handler);
 		local_flush_icache_range((unsigned long)b,
 					 (unsigned long)(b+handler_len));
 	}
-- 
2.42.0


