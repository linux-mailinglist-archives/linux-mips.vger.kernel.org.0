Return-Path: <linux-mips+bounces-13245-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN3PENdMoGnvhwQAu9opvQ
	(envelope-from <linux-mips+bounces-13245-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:38:31 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 514211A6BA0
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CD013305BF50
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76C136E49F;
	Thu, 26 Feb 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LUCjbAZZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9084536C599;
	Thu, 26 Feb 2026 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112872; cv=none; b=h4679hLQ9BCh5mogVjfbNu5lm9fopfW8HoyQZ3o0O6UeEeX+92beUJgBIMz4mrN9GzZL9HsuNmmBqkQBZPSqrPBZjmiUJWA4/tcbzpnmS8+6KIgV9mVKXMjNeAB7clIoTNRgjZmG3MHg57Fj4b8XcpiiFZfho/OIPfzvcEw+VrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112872; c=relaxed/simple;
	bh=kz55thIenPw3bekdJ4aFbt2VUZoLFRkqCicN/30NKDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcB5Nn4KXb9tSqTzmpnGJfOPMFZTDhGQlAVgGE2rabEo5H+dpy1IjxFnjd9yeTT4j7h9ZH5PNFz6KPZVClWyL9bl9TppmGolTCToXfXrmtykFmaKmL79ViwQhaMR2R+MuzJIMouTmAFthZxmmoZC6MEggSCvhfPrhvn2jpzCBbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LUCjbAZZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7022CC40698;
	Thu, 26 Feb 2026 13:34:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFA9F5FDEB;
	Thu, 26 Feb 2026 13:34:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A86911036938D;
	Thu, 26 Feb 2026 14:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fzigpU/p/PzFO6PSD51srQn9vza1EMhFgBBVZX2t/WQ=;
	b=LUCjbAZZzwDLziehO+tdO7+Fu9Kg752edpAoKa6DBHWHGmJE12fXhetWGFKp8ONsVbrUqZ
	a5+Bw0Z0kvAOUMqjyP6nB56bRhvAja8GE9NgFpGs37QRbm/RLtJ8vnhwgMhe3Z8leuAPiF
	mSde+2QUVoGSfyWmsOHehRunDjAcHJLXI/ePrrYfUTzu7H9xX34rf48jCmOwSsaMUTZ0sE
	UOPBzA+fja1glPHKj5rb6kTJKN9CZJW5lnd3fnrVNcKlAJZpEPwNHfHj5OG3WTgkEaiMZv
	SgICi2vQKg+XgiWbd0fIdDH9d6az+RitfigUGy8HZPAmYaEEjHZXLLP/cxfsqQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 26 Feb 2026 14:33:52 +0100
Subject: [PATCH v3 08/13] clk: eyeq: Adjust PLL accuracy computation
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-eyeq6lplus-v3-8-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13245-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email]
X-Rspamd-Queue-Id: 514211A6BA0
X-Rspamd-Action: no action

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


