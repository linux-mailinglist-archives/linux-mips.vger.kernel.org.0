Return-Path: <linux-mips+bounces-608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A09F80A853
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 17:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102E41F211B0
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 16:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556523717A;
	Fri,  8 Dec 2023 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mH9paY0I"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3050198E;
	Fri,  8 Dec 2023 08:12:56 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1A1AFF806;
	Fri,  8 Dec 2023 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702051975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1f+FndhwKpT84ogIpFFowDtfhlo7ZPzn2H3k9c4MjvQ=;
	b=mH9paY0INwCSHRRvr0ILwz0hCbBShsbJrUhXHRHvhPuXUX3/mFDZec6v/klIEIHeoxQ/17
	VILKSFM/h5tcp/8skT3xrMypgkOoIC1tCsYvmERxxJ5QEuZDY9BFOHnNVio4C1oy0ZUayr
	JRQZfgE5HIIFG2XBb1aBCecj9wEBS1BkmKiAtro6Ns1DThqSdfDTjMRBx1VMXaLawi2a3o
	ySSg2AO8RbWLD30ma7wOJ1lJozjH2t3sg0qn8mchrlJ7lSirrVqi5Lr8vyS6yitFotmikd
	5oWrcYdVXkMIDBG0X/x6JvEsBQPC/SPzOzcB2+T8TtHrzUlZerk2eq2VeNprvA==
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
Subject: [PATCH v4 02/22] MIPS: Export higher/highest relocation functions in uasm
Date: Fri,  8 Dec 2023 17:12:18 +0100
Message-ID: <20231208161249.1827174-3-gregory.clement@bootlin.com>
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Export uasm_rel_{higher,highest} functions.
Those functions can be helpful in dealing with 64bit immediates.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/uasm.h | 2 ++
 arch/mips/mm/uasm.c          | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index 296bcf31abb57..12db6d2fca070 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -196,6 +196,8 @@ void uasm_build_label(struct uasm_label **lab, u32 *addr,
 #ifdef CONFIG_64BIT
 int uasm_in_compat_space_p(long addr);
 #endif
+int uasm_rel_highest(long val);
+int uasm_rel_higher(long val);
 int uasm_rel_hi(long val);
 int uasm_rel_lo(long val);
 void UASM_i_LA_mostly(u32 **buf, unsigned int rs, long addr);
diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
index 125140979d62c..6846bf2084c5e 100644
--- a/arch/mips/mm/uasm.c
+++ b/arch/mips/mm/uasm.c
@@ -425,7 +425,7 @@ int uasm_in_compat_space_p(long addr)
 }
 UASM_EXPORT_SYMBOL(uasm_in_compat_space_p);
 
-static int uasm_rel_highest(long val)
+int uasm_rel_highest(long val)
 {
 #ifdef CONFIG_64BIT
 	return ((((val + 0x800080008000L) >> 48) & 0xffff) ^ 0x8000) - 0x8000;
@@ -433,8 +433,9 @@ static int uasm_rel_highest(long val)
 	return 0;
 #endif
 }
+UASM_EXPORT_SYMBOL(uasm_rel_highest);
 
-static int uasm_rel_higher(long val)
+int uasm_rel_higher(long val)
 {
 #ifdef CONFIG_64BIT
 	return ((((val + 0x80008000L) >> 32) & 0xffff) ^ 0x8000) - 0x8000;
@@ -442,6 +443,7 @@ static int uasm_rel_higher(long val)
 	return 0;
 #endif
 }
+UASM_EXPORT_SYMBOL(uasm_rel_higher);
 
 int uasm_rel_hi(long val)
 {
-- 
2.42.0


