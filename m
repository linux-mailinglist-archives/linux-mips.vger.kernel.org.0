Return-Path: <linux-mips+bounces-6906-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 235789E9B18
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 17:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 562BF166A8A
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007A6146A63;
	Mon,  9 Dec 2024 15:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nlfb/+Uu"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAAF136671;
	Mon,  9 Dec 2024 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759982; cv=none; b=RUrfC4w4zOhvsQ4DgTdmeBbs40ymZKpMUbxQ2Dw3zayOH31khCe/JCTXFbJ8eANQlBYfG/L729AuKAr3RL9ZcA0IAhb5UMBNx97EAMAjFPzvAoo7IoeqKgb3Aj9RYNK3LLOHWZ4SPfRmTxzLOgdnumgnCG7MYpVMWNnR65VieUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759982; c=relaxed/simple;
	bh=/Wb5mnMykMP2xH0s1vcKryQucphSiN86XrEBmBaWTAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0iSc0mxfUwkRVyQsssYR0TRfI9qDaFPxqPUxylJR6/H3OhQcuoxyItpobueHWzYAN/EeIGgppEVIuLNSOJP7dK+ZnQumpoRqDcWFoighDJdYIPtTYxzOkmDKXQFvSKpFgovgnNhXNigGOw4+N5HrHTskZnELuTF9SVWn/8f1Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nlfb/+Uu; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E668320004;
	Mon,  9 Dec 2024 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733759978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t34cnBs5FIaeftw7DyeBVQ1s8Ww5ZRuvy9kmRpnaCI=;
	b=nlfb/+Uuu16k1TzU2Rq8J1zJkT82CiKICUZyW9Mr8IWwM8HMZV0hXZ9jgN5romH6Chv/tu
	HCZepT5M8deXvtje1niDVuB7u8VA95aXf6q/Mi6EfuXv+7DgOcf0XiLsw728MeY8HySzAh
	mQLKkOz8gvFDweDJnU2oLSqF4qORfGll2x2lV0KtY8fDMLlNC/JVTKnNqnK26+HeW8LDww
	PSYMA1LMqdbr+3srBsArzk7Eool79wEx2Z+RrRfCrRnCqPteVyD/rnZc5BgT3mkX5+LtYM
	+oV8gSgeHQxQ7hpykM8/v2Kqappi26K4tpxyjeA6XhlZa5/vfn87cwLVFF1r7A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 09 Dec 2024 16:59:37 +0100
Subject: [PATCH v2 3/6] nvmem: rmem: make ->reg_read() straight forward
 code
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-rmem-v2-3-cbc0e8c08a21@bootlin.com>
References: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
In-Reply-To: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
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


