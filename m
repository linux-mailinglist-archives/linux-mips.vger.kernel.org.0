Return-Path: <linux-mips+bounces-12567-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7936CD8B04
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C546D300106E
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3C132E131;
	Tue, 23 Dec 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g2iDsAg5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943032C303;
	Tue, 23 Dec 2025 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484164; cv=none; b=LNLnNAmzc+g62qKCFezdrih6twXv/DrxSFpOQ3IZ3lv3jrDkH6Mny7z2+H5kfCoqCtIW3oseGqQ/Um6bm75HvqgVn05m0nQVZzDXbbeKzl/Yr3ToFYs9pYGGzGrmy8l/c390+BTkQDTzUyXOIiIt/QekE2OOabL4nz/qzcVa6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484164; c=relaxed/simple;
	bh=z8+04K3m+/VfZFp+iGAvWoWW9TNlD9vV5sf0uskJwAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blbml5PeP1QlPnBgk3enl68J/IelfoAT9fx3i71HgnLN6eZPH4EJRYhSlnlkFnesZHRIuUGw6SC7V92rgxG29+Zm+2ck4QJfdFrqRcYpJ8Q8MIOMHP5d1BGuyFRYkOgL5wXtVdEpkWspqffTr3lvL+YyRL9ZiYAIYb9pc4IEYVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g2iDsAg5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E43DD1A23A1;
	Tue, 23 Dec 2025 10:02:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFFD960716;
	Tue, 23 Dec 2025 10:02:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D64610AB09BD;
	Tue, 23 Dec 2025 11:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484159; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cMM9rHXVDDAVjpqacJOwBMRQUCSdXDMyytqvCHPp5HQ=;
	b=g2iDsAg5Zx9iB7iI7NgUFLgVSxnQMg19+qj0nYKjAKq0xR5XJFus5vBNdd5eDSIfcWOKzb
	2iKrFjfh9hHWmfZn+mkFxpS0hI4LjJpxM1VBV9iKW/KHCpGxuwnt8Y8epYe4Y5HcJOMoDo
	28UcDUE3erBekJg/ennky0jYMQvfR2RL/33RZ43N0BSYvBJZhxd/pTdhR+ZVRE9ih+HmVo
	7fSCAb6qn15HUQoM+rIFV6+Yo130ddXKGVUAudEJQqJDrEQkUGFPZjTorIUnCM4NXYwSTU
	CjLv5cliHsSVYT695z9DDu5zYB1ckIV7v/PuzxO9qIOqNwTIfU5D8aQi2xGr+g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:22 +0100
Subject: [PATCH v2 07/13] clk: eyeq: Skip post-divisor when computing PLL
 frequency
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-7-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
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


