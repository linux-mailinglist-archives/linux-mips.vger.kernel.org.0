Return-Path: <linux-mips+bounces-6845-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6038C9E25CD
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 17:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C538B3A664
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 13:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DD41F4288;
	Tue,  3 Dec 2024 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pGVkKslm"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A2189F3F;
	Tue,  3 Dec 2024 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234159; cv=none; b=in0tFqrdXVU1AvgmtqQoDWpXE6Y5qdr3mUMAxR1VD5A1Kn2bVf01bz96ioBMcgsUDFcmWGYvsltXVpFcarPr6w9KvcLvpflQdUAJ/9lQXCRxKdUCq+GuuK228eBm7hyLmcz91JMRFu3zCW/eJD0WOpeIsScBWOEUQQB0UlQWlGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234159; c=relaxed/simple;
	bh=/Wb5mnMykMP2xH0s1vcKryQucphSiN86XrEBmBaWTAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhW+M4bYa0xtX5FQ/Ygj2VUr4Z2EjDUIQFAdjQSa7HkJLVMSS45aiMXBDk2P+s/gD90mqRz3SJyKB0hOC5v/2lVQVEzBxlclLwokJkOVnsxibb9WWxbOiQJUhLTfScDZ9GS5CJCMu6rnwx5nUP9233GSbDFGtoBFU5d1qG2BLMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pGVkKslm; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8418860006;
	Tue,  3 Dec 2024 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733234150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t34cnBs5FIaeftw7DyeBVQ1s8Ww5ZRuvy9kmRpnaCI=;
	b=pGVkKslmTGSKjlVYV0LAVQRfXbyomRirzBJoAHPcXsiR1XjLKX7ZkFRCekeQAV0KliH9Ry
	r7wF13aTnIaOJqj+7ZIIxkvGt52cbVFY4Oe4wBmnpgMTEelKRuFRY9Am5bjAWo/QAqpNiA
	ZFjR1xB8bSkyUXxu416Hxl1vqprxms9FtohjTfh2WFIrJoOTllba2DFAmMpZqI/OPT5uuY
	1P+n4zGxZRMbmPy3rad7lPJZpJLdwnXG0MfTuRxth2Ajx3mKC2/RDc+MJqhRF0GqzeSFex
	e4qk2kPQIzmWmSse/4lD6FmZqFvZkGYZAwgCMef5ib2ArJodRCtptBD2U6QzSg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 03 Dec 2024 14:55:46 +0100
Subject: [PATCH 3/6] nvmem: rmem: make ->reg_read() straight forward code
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-rmem-v1-3-24f4970cf14e@bootlin.com>
References: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
In-Reply-To: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

memory_read_from_buffer() is a weird choice; it:
 - is made for iteration with ppos a pointer.
 - does futile error checking in our case.
 - does NOT ensure we read exactly N bytes.

Replace it by:
1. A check that (offset + bytes) lands inside the region and,
2. a plain memcpy().

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/nvmem/rmem.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/nvmem/rmem.c b/drivers/nvmem/rmem.c
index 7f907c5a445e7865c8626e00362df0040fe52241..0dc5c8237c7538efe4597c182d7bdb709b945851 100644
--- a/drivers/nvmem/rmem.c
+++ b/drivers/nvmem/rmem.c
@@ -21,10 +21,10 @@ static int rmem_read(void *context, unsigned int offset,
 		     void *val, size_t bytes)
 {
 	struct rmem *priv = context;
-	size_t available = priv->mem->size;
-	loff_t off = offset;
 	void *addr;
-	int count;
+
+	if ((phys_addr_t)offset + bytes > priv->mem->size)
+		return -EIO;
 
 	/*
 	 * Only map the reserved memory at this point to avoid potential rogue
@@ -36,20 +36,17 @@ static int rmem_read(void *context, unsigned int offset,
 	 * An alternative would be setting the memory as RO, set_memory_ro(),
 	 * but as of Dec 2020 this isn't possible on arm64.
 	 */
-	addr = memremap(priv->mem->base, available, MEMREMAP_WB);
+	addr = memremap(priv->mem->base, priv->mem->size, MEMREMAP_WB);
 	if (!addr) {
 		dev_err(priv->dev, "Failed to remap memory region\n");
 		return -ENOMEM;
 	}
 
-	count = memory_read_from_buffer(val, bytes, &off, addr, available);
+	memcpy(val, addr + offset, bytes);
 
 	memunmap(addr);
 
-	if (count < 0)
-		return count;
-
-	return count == bytes ? 0 : -EIO;
+	return 0;
 }
 
 static int rmem_probe(struct platform_device *pdev)

-- 
2.47.1


