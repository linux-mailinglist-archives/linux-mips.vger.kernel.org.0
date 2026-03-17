Return-Path: <linux-mips+bounces-13734-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNs8EXJZuWnYAgIAu9opvQ
	(envelope-from <linux-mips+bounces-13734-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 14:38:58 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4643B2AB047
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 14:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EDEB30630A1
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 13:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82EA3290BD;
	Tue, 17 Mar 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2dC0/RvC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6772F12C6;
	Tue, 17 Mar 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754424; cv=none; b=KwHQ0Zi1b6wDyEtgdwdsB2QrBheB6uGCo5GgNnI7IualHuKfvjGHcJ/YTAPGaMvuQwik7Rc0hIYQM1u5+OzdX/N+Yx+yvunBkfzaFY0KdSH+nGo5n0LEjQrXXkpr+aHEYsQvjFr4qf0rPg1/Vl0m9zoJaFaPc5hQYv1+7gLXZ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754424; c=relaxed/simple;
	bh=1d5jwm/HXf+1jopHHwdBEsJurqsfrBJka01HmjVnAuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyOGlM37Va3hay/N+Jhu1T4aQcni0RCDKG3AwiQDj9xzFeSqA7LeRsxNo2Fe/aWLgAoEpj2eywWIqilQsWInCoDMozahdxeo5YIyH/4HO+4QXsnLiHZW+smD0wUngtFgwj2ad7dkfOgJZfqZ0OhvNbiqv4YL8l0WUQD1EfnlmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2dC0/RvC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D60D1A2DF3;
	Tue, 17 Mar 2026 13:33:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DA795FC9A;
	Tue, 17 Mar 2026 13:33:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4F2B104505EB;
	Tue, 17 Mar 2026 14:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773754419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aUYUflWYXCNMFkVZDsoHMMnLEv02bLTB8mbRpGNIxfo=;
	b=2dC0/RvCd6o6IcNU6LnR1S/sCsRyNTjyJSOTurvhH5HvwqW+GGfC8c9mYzxC/6yrYpP2KD
	LG3h5K3DGwzLAQsNKjoUO36m6+9jgMS9KY6wu72PpaQ+DeFfNPyhoHuVRJJHjx86xWA7G/
	93nUU8xZRBFbyXNgUKqAHK3ue4LQyt/XvCXSN1oh2I8am4fcAuA3FWo/goRqpPFFjcKd3n
	d9GM2UbeRd5f2uoqfAQMCu+JmRd9PBxPu+o1gDBUlcX6E1Mdqk/5zTwDtFWJg1ss8EIKkZ
	B8U43WMStqY+fgt/vxuojs17gLGefjJo951Me1iA+aT/cinL9Fymw7A7vi4SjA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 17 Mar 2026 14:33:07 +0100
Subject: [PATCH v5 05/10] clk: eyeq: Prefix the PLL registers with the PLL
 type
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-clk-eyeq7-v5-5-6f6daa2c2367@bootlin.com>
References: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
In-Reply-To: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13734-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4643B2AB047
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename the PLL registers to make room for other PLL types that are
present in the eyeQ7H.

Move the access to the PLL register inside the function parsing it
as both call sites were doing the same thing.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 76 +++++++++++++++++++++++---------------------------
 1 file changed, 35 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index d9303c2c7aa5..e4e690a12a23 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -48,28 +48,28 @@
 #include <dt-bindings/clock/mobileye,eyeq6lplus-clk.h>
 
 /* In frac mode, it enables fractional noise canceling DAC. Else, no function. */
-#define PCSR0_DAC_EN			BIT(0)
+#define FRACG_PCSR0_DAC_EN			BIT(0)
 /* Fractional or integer mode */
-#define PCSR0_DSM_EN			BIT(1)
-#define PCSR0_PLL_EN			BIT(2)
+#define FRACG_PCSR0_DSM_EN			BIT(1)
+#define FRACG_PCSR0_PLL_EN			BIT(2)
 /* All clocks output held at 0 */
-#define PCSR0_FOUTPOSTDIV_EN		BIT(3)
-#define PCSR0_POST_DIV1			GENMASK(6, 4)
-#define PCSR0_POST_DIV2			GENMASK(9, 7)
-#define PCSR0_REF_DIV			GENMASK(15, 10)
-#define PCSR0_INTIN			GENMASK(27, 16)
-#define PCSR0_BYPASS			BIT(28)
+#define FRACG_PCSR0_FOUTPOSTDIV_EN		BIT(3)
+#define FRACG_PCSR0_POST_DIV1			GENMASK(6, 4)
+#define FRACG_PCSR0_POST_DIV2			GENMASK(9, 7)
+#define FRACG_PCSR0_REF_DIV			GENMASK(15, 10)
+#define FRACG_PCSR0_INTIN			GENMASK(27, 16)
+#define FRACG_PCSR0_BYPASS			BIT(28)
 /* Bits 30..29 are reserved */
-#define PCSR0_PLL_LOCKED		BIT(31)
+#define FRACG_PCSR0_PLL_LOCKED			BIT(31)
 
-#define PCSR1_RESET			BIT(0)
-#define PCSR1_SSGC_DIV			GENMASK(4, 1)
+#define FRACG_PCSR1_RESET			BIT(0)
+#define FRACG_PCSR1_SSGC_DIV			GENMASK(4, 1)
 /* Spread amplitude (% = 0.1 * SPREAD[4:0]) */
-#define PCSR1_SPREAD			GENMASK(9, 5)
-#define PCSR1_DIS_SSCG			BIT(10)
+#define FRACG_PCSR1_SPREAD			GENMASK(9, 5)
+#define FRACG_PCSR1_DIS_SSCG			BIT(10)
 /* Down-spread or center-spread */
-#define PCSR1_DOWN_SPREAD		BIT(11)
-#define PCSR1_FRAC_IN			GENMASK(31, 12)
+#define FRACG_PCSR1_DOWN_SPREAD			BIT(11)
+#define FRACG_PCSR1_FRAC_IN			GENMASK(31, 12)
 
 struct eqc_pll {
 	unsigned int	index;
@@ -162,34 +162,40 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
 	*div >>= shift;
 }
 
-static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
-				   unsigned long *div, unsigned long *acc)
+static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
+			       unsigned long *div, unsigned long *acc)
 {
 	unsigned long spread;
+	u32 r0, r1;
+	u64 val;
 
-	if (r0 & PCSR0_BYPASS) {
+	val = readq(base);
+	r0 = val;
+	r1 = val >> 32;
+
+	if (r0 & FRACG_PCSR0_BYPASS) {
 		*mult = 1;
 		*div = 1;
 		*acc = 0;
 		return 0;
 	}
 
-	if (!(r0 & PCSR0_PLL_LOCKED))
+	if (!(r0 & FRACG_PCSR0_PLL_LOCKED))
 		return -EINVAL;
 
-	*mult = FIELD_GET(PCSR0_INTIN, r0);
-	*div = FIELD_GET(PCSR0_REF_DIV, r0);
+	*mult = FIELD_GET(FRACG_PCSR0_INTIN, r0);
+	*div = FIELD_GET(FRACG_PCSR0_REF_DIV, r0);
 
 	/* Fractional mode, in 2^20 (0x100000) parts. */
-	if (r0 & PCSR0_DSM_EN) {
+	if (r0 & FRACG_PCSR0_DSM_EN) {
 		*div *= (1ULL << 20);
-		*mult = *mult * (1ULL << 20) + FIELD_GET(PCSR1_FRAC_IN, r1);
+		*mult = *mult * (1ULL << 20) + FIELD_GET(FRACG_PCSR1_FRAC_IN, r1);
 	}
 
 	if (!*mult || !*div)
 		return -EINVAL;
 
-	if (r1 & (PCSR1_RESET | PCSR1_DIS_SSCG)) {
+	if (r1 & (FRACG_PCSR1_RESET | FRACG_PCSR1_DIS_SSCG)) {
 		*acc = 0;
 		return 0;
 	}
@@ -204,10 +210,10 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 	 *
 	 * Care is taken to avoid overflowing or losing precision.
 	 */
-	spread = FIELD_GET(PCSR1_SPREAD, r1);
+	spread = FIELD_GET(FRACG_PCSR1_SPREAD, r1);
 	*acc = DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
 
-	if (r1 & PCSR1_DOWN_SPREAD) {
+	if (r1 & FRACG_PCSR1_DOWN_SPREAD) {
 		/*
 		 * Downspreading: the central frequency is half a
 		 * spread lower.
@@ -232,18 +238,12 @@ static void eqc_probe_init_plls(struct device *dev, const struct eqc_match_data
 	const struct eqc_pll *pll;
 	struct clk_hw *hw;
 	unsigned int i;
-	u32 r0, r1;
-	u64 val;
 	int ret;
 
 	for (i = 0; i < data->pll_count; i++) {
 		pll = &data->plls[i];
 
-		val = readq(base + pll->reg64);
-		r0 = val;
-		r1 = val >> 32;
-
-		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
 		if (ret) {
 			dev_warn(dev, "failed parsing state of %s\n", pll->name);
 			cells->hws[pll->index] = ERR_PTR(ret);
@@ -799,14 +799,8 @@ static void __init eqc_early_init(struct device_node *np,
 		const struct eqc_pll *pll = &early_data->early_plls[i];
 		unsigned long mult, div, acc;
 		struct clk_hw *hw;
-		u32 r0, r1;
-		u64 val;
 
-		val = readq(base + pll->reg64);
-		r0 = val;
-		r1 = val >> 32;
-
-		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
 		if (ret) {
 			pr_err("failed parsing state of %s\n", pll->name);
 			goto err;

-- 
2.53.0


