Return-Path: <linux-mips+bounces-10993-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B02DB41F9E
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3F417C75A
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C623009CA;
	Wed,  3 Sep 2025 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xd7pnMZu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16ED3002D9;
	Wed,  3 Sep 2025 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903660; cv=none; b=UUtZPJBTx4+X0PgZz5R5FAnbqUWjZH8Jhzo+kMa3tDTZPv/42c9XsxZzefICq4vSwGwZv2ZwmZJ6IQHwrUH3MZnLFqoGh3f1Y9HW1VMLQlKNKaHf4PzG61mSXkc9zmZrTpB/ZwSUQ0b+95d35OSS5GeR0AMSoxGW/DV19V7w5XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903660; c=relaxed/simple;
	bh=VM3OVD/vWiYiSOkeqjWoIBwv1wDYZB8pk3Bp3cycWMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNKqRcxZVwWg+vtXSk7tEZBKyA62mPnq0xfQgQYtTlrXUEPADlxvRSE4pWwSMTt+xbdQkKJsk4MSZExTt37CBcakxh1uLynrPGGKXgZ8XV5jAuC/G0Qg9e9e8AOUySTfglGwKv9Dqzs26aMiNAZcq8gHobDn6R3H0P446KRGr8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xd7pnMZu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF3E91A08EC;
	Wed,  3 Sep 2025 12:47:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C67A6606C3;
	Wed,  3 Sep 2025 12:47:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44E061C22CD91;
	Wed,  3 Sep 2025 14:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y7/3uUqHDVMs8kf6yCzPNaMJlbjeqZRZRUZYl68nr5c=;
	b=xd7pnMZuiROl4gry4SM/mQcrhE0lAgzhWG10AXQp8YgcIZMWUTsTiT3BbCqLKVJJAgN9Au
	g9GSHs2roJNSHoGHUI6duywQ2vp4hCvF/W8Kh7epTdpmj2hlSW9LajHxsxJX1mRVtcxTIC
	9PWZrrNgxONdxs+kqpQfd+evy1rRXP4D9yBd5nA5hbwTyomzFgU+3/+SzJLsPDv4UFFiXS
	J7vIDN43/YrB9E1wi/XTfu1tWxwwpPXi6m+9gYY1o5HWtX/fpyBMiE5Yq0S118v2121fqA
	DpvcgTgatPkvoWVBpYoAFwMkv1rnW00JBgW/pDU4sB2eYV1Hg1DD1/jjE2PqdQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:08 +0200
Subject: [PATCH 01/19] dt-bindings: soc: mobileye: rename to eyeq-olb.yaml
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-1-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
In-Reply-To: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Sari Khoury <sari.khoury@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Drop the 5 from the binding name as the OLB described in it are found
in multiple Mobileye eyeQ SoCs.

The binding already contains entries for eyeQ6L and eyeQ6H OLBs
alongside the one for the eyeQ5.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../soc/mobileye/{mobileye,eyeq5-olb.yaml => mobileye,eyeq-olb.yaml}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq-olb.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
rename to Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq-olb.yaml
index 6d11472ba5a704d5d20f43776e5867f507a39242..a1fb33ab4399cca52fad1e589beede54e09e5512 100644
--- a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq-olb.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq5-olb.yaml#
+$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq-olb.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mobileye EyeQ SoC system controller

-- 
2.51.0


