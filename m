Return-Path: <linux-mips+bounces-12504-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D7CC7ED3
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 14:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0460301A38A
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD833570A9;
	Wed, 17 Dec 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ct8m0FHE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DCA350A1F;
	Wed, 17 Dec 2025 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978588; cv=none; b=m3KYRvtG/c2ztfrEKPyHL/x+VdqVG9GF9chCdYj9FzFJCwJRwQcOJwpdtrFNyp48kUIaE3BsLU7uNv+izVyeMXE6JHEPyA0TWSaOfcajYzuqAwoQDxX7sjibf0WstZnh1gigGNXXY5FXf65eVFKxgwmjSDxZTImK134O8OvS7lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978588; c=relaxed/simple;
	bh=z8+04K3m+/VfZFp+iGAvWoWW9TNlD9vV5sf0uskJwAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A3v20CM53kPHmjHmAHNaUUk23Rj6LMwtxqYNWxQ5eK1OnGUMTT++FAuyQqL0osGNGVOUFHJ6biPwxFyA2hvxD0++wETnQlc29b+7FPKK1wVUAMUx2HHOta4swiQ0oqh/ty7RgjPbFNggaT5TY3UCEBWKjzhdTS/zfC1A3raFlTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ct8m0FHE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2105AC1A5A0;
	Wed, 17 Dec 2025 13:36:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A50C260739;
	Wed, 17 Dec 2025 13:36:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7A38102F0AD0;
	Wed, 17 Dec 2025 14:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cMM9rHXVDDAVjpqacJOwBMRQUCSdXDMyytqvCHPp5HQ=;
	b=ct8m0FHEVF4z8HdVRSeAYnYveUk/Dg8iUITZ+wGlx+re6WsV/roBWQZXd32Qu9++BU92Cg
	fFVGDxbUHR/zx8K0FtmhMrlRR7Fkm+fPMmic9GiTDhKPSM0hTp/HsAI+ZrX6udmJOHuqkp
	9imzlf1Av3FJY60D9E/+xq0n0TbJwHweeMdIBZsh0BHiOE4OSX5yLr21rcAL5dlLSrHWL3
	U7lBLdCjXPqKO64pjoFdJwBm5B2VzNekvCdj3U6oz3ShA7q5NfYDz3UhO98WFI5NIE50cD
	EyB1eBc7a/1z0Ac2SKN4Xvpx01NjjGC+cl+HuIXykGogRIb+mhwpwfihNZOgZw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:35:57 +0100
Subject: [PATCH 07/13] clk: eyeq: Skip post-divisor when computing PLL
 frequency
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-7-e9cdbd3af4c2@bootlin.com>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The output of the PLL is routed before the post-divisor so it should be
ignored when computing the frequency of the PLL, functional change is
implemented to reflect how the clock signal is wired internally.

For the PLL of the EyeQ5, EyeQ6L, and EyeQ6H, this change has no impact
as the post-divisor is either reported as disabled or set to 1. The PLL
frequency is the same before and after the post-divisor.

For the PLL in EyeQ6Lplus, however, the post-divisor is not 1, so it must
be ignored to compute the correct frequency.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index ea1c3d78e7cd..182b408b6aa4 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -177,8 +177,6 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 
 	*mult = FIELD_GET(PCSR0_INTIN, r0);
 	*div = FIELD_GET(PCSR0_REF_DIV, r0);
-	if (r0 & PCSR0_FOUTPOSTDIV_EN)
-		*div *= FIELD_GET(PCSR0_POST_DIV1, r0) * FIELD_GET(PCSR0_POST_DIV2, r0);
 
 	/* Fractional mode, in 2^20 (0x100000) parts. */
 	if (r0 & PCSR0_DSM_EN) {

-- 
2.52.0


