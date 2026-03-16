Return-Path: <linux-mips+bounces-13692-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE5XIqgiuGk8ZgEAu9opvQ
	(envelope-from <linux-mips+bounces-13692-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:32:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1284B29C729
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569923020A52
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17903A6EEC;
	Mon, 16 Mar 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rlU0bcoB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD33A63E2;
	Mon, 16 Mar 2026 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674767; cv=none; b=UGTLISlgvmUgIeMuQo/BqFa1VB22pUBvHEWhJVpMkKhWWH9pQNAZbWybvBd2mpkpX9VUAM3YBWD9OrhcLWKwUPyodXUn7Xgx2kxiRnHEM6VWkbzPfNDFTH6cleumwJ2CLnmUxnRaqbYHO/LYd/VmGQ4cWP4rl0H+9uysExJsnd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674767; c=relaxed/simple;
	bh=kz55thIenPw3bekdJ4aFbt2VUZoLFRkqCicN/30NKDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vr7VGgy6/pcn+fAPAlcipBq15NF+7G8o5pG9HDmQ25whxAmPLr9UiqhEJ2KFVu3r2ZCWT4eB2jOPCHUCG+ENdX1kt/VQo51inMEgBVQuW6EgAB5STArBMQaMLzSxTH+8dlRjg/ayYLlDGQrwWR654gBag4PgdhqKDgccErJX+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rlU0bcoB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 92A30C55051;
	Mon, 16 Mar 2026 15:26:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F06C15FC4A;
	Mon, 16 Mar 2026 15:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 077EB103721F3;
	Mon, 16 Mar 2026 16:26:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fzigpU/p/PzFO6PSD51srQn9vza1EMhFgBBVZX2t/WQ=;
	b=rlU0bcoBsAEncaYDD+0VdD6lcTC9bnCiZpMYDYsdY6ojDX99uDmfKJD9T2A5Gk8dI0iDFt
	oL0oO6N5nzKT6QIS7Y+01P1EkoDE4SL0/X+QhNQafTX+rOOGBhDiffozrQA6Lo3pPW61eS
	AWKUP8nUY2+JuwsOeGme6AcSmezQeXFCKWRkI0UIu3wMCnzGFjnmQnbsYGVfOeamVHr8rP
	YC/y/2H2S/49v092H3iE0Qk680IOv94tf+U4U4J67EiVZjx+PS+vSzfJ1AGEusSaZHrp+F
	E2FJ8XCKiRcqh6ThxxPUE6frhW48dFE8zAfcozUCAHcrOd8gWWbFfVQjLFvWgw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:45 +0100
Subject: [PATCH v4 08/13] clk: eyeq: Adjust PLL accuracy computation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-8-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13692-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 1284B29C729
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The spread spectrum of the PLL found in eyeQ OLB is in 1/1024 parts of the
frequency, not in 1/1000, so adjust the computation of the accuracy. Also
correct the downspreading to match.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 904d7d77d415..abffa46364f5 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -164,7 +164,7 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
 static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 				   unsigned long *div, unsigned long *acc)
 {
-	u32 spread;
+	unsigned long spread;
 
 	if (r0 & PCSR0_BYPASS) {
 		*mult = 1;
@@ -196,23 +196,23 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 	/*
 	 * Spread spectrum.
 	 *
-	 * Spread is 1/1000 parts of frequency, accuracy is half of
-	 * that. To get accuracy, convert to ppb (parts per billion).
+	 * Spread is in 1/1024 parts of frequency. Clock accuracy
+	 * is half the spread value expressed in parts per billion.
 	 *
-	 * acc = spread * 1e6 / 2
-	 *   with acc in parts per billion and,
-	 *        spread in parts per thousand.
+	 * accuracy = (spread * 1e9) / (1024 * 2)
+	 *
+	 * Care is taken to avoid overflowing or losing precision.
 	 */
 	spread = FIELD_GET(PCSR1_SPREAD, r1);
-	*acc = spread * 500000;
+	*acc = DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
 
 	if (r1 & PCSR1_DOWN_SPREAD) {
 		/*
 		 * Downspreading: the central frequency is half a
 		 * spread lower.
 		 */
-		*mult *= 2000 - spread;
-		*div *= 2000;
+		*mult *= 2048 - spread;
+		*div *= 2048;
 
 		/*
 		 * Previous operation might overflow 32 bits. If it

-- 
2.53.0


