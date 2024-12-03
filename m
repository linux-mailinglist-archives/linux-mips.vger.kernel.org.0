Return-Path: <linux-mips+bounces-6848-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F6D9E1E61
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 14:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E426E166D3B
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 13:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9421A1F6664;
	Tue,  3 Dec 2024 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DieYce3V"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9A1F130E;
	Tue,  3 Dec 2024 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234160; cv=none; b=cfVlQfBTRr86hf1LPDkvDpUPx8aWfdP8Th7iK2skicbJdXDz90ODg6SyiNRBIjRBl4YUYa/0tRxRblKAIblFiCPB3JsvUEZecMD5TI7voTloORtlP5OFw3Nj7M3ctLRTd/XrK5roGkkayI0bZX0hvnKQ3G/Kf3dqiCrVwBZlee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234160; c=relaxed/simple;
	bh=lKeQ9AtKmtT3/g6/89CnJT2/810ZwKky7x2wGzEisZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFAYzcEyzrnfYDnxiNv9ZHW/75UmyvY+qwADBMfFcfp/f+wy87x4RYBulcFIgdKt99opV1vNRCEC22rEbdGR3zMzkRn3rNsI32VsdeMr5nlKbKrlxbmM6+yZO74KfTv85IEWWQDR5kOCEXQFzE7AhDQ87FBADeT8yty2MR/IPI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DieYce3V; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9E9B60010;
	Tue,  3 Dec 2024 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733234151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsABzj1Vfkjzo1UXnSDoTFRCNe+h1i3gV/KNPBs/irU=;
	b=DieYce3VkYHzLoO+PC9eGa31KQ6wBRNn/L8eFhyXMtAAQhXPZorJUVIUnzkqZTfh0VWG2t
	rPJWTtFoefA9cSwPeGftVWZl6jgTvJczPqcJtrZagXun79wcqK4RuPN4L9l9CPaAjJM4zl
	99Jm/r6wrNiwiQ5FzLxfzzjawscumEAsLFz1aHlvjHHyY92RqtfkXZQtunooa+VnV9EmVp
	5weaRlG33b6Bpvpu2nHDdfk8vZbsgxAMcOAdLaXzxV2aLF1sTx3xmu78T5bTMfdXHQIUpI
	rHxQndz8ESUlm9PMV5FHVC3L4TbbITkJUXLie6nr50dxsc7xYNtufxjUggs2wg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 03 Dec 2024 14:55:48 +0100
Subject: [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5
 NVMEM
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-rmem-v1-5-24f4970cf14e@bootlin.com>
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

Mobileye EyeQ5 has a non-volatile memory region which
gets used to store MAC addresses. Its format includes
a prefix 12-byte header and a suffix 4-byte CRC.

Add an optional ->checksum() callback inside match data;
it runs CRC32 onto the content.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/nvmem/rmem.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/nvmem/rmem.c b/drivers/nvmem/rmem.c
index ca89c2689031534ff316a48e03360aeec823b025..04796f4fa8ae708387013fa260afb901a14e24ff 100644
--- a/drivers/nvmem/rmem.c
+++ b/drivers/nvmem/rmem.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2020 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  */
 
+#include <linux/crc32.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
@@ -15,6 +16,18 @@ struct rmem {
 	struct reserved_mem *mem;
 };
 
+struct rmem_match_data {
+	int (*checksum)(struct rmem *priv);
+};
+
+struct __packed rmem_eyeq5_header {
+	u32 magic;
+	u32 version;
+	u32 size;
+};
+
+#define RMEM_EYEQ5_MAGIC	((u32)0xDABBAD00)
+
 static int rmem_read(void *context, unsigned int offset,
 		     void *val, size_t bytes)
 {
@@ -47,10 +60,66 @@ static int rmem_read(void *context, unsigned int offset,
 	return 0;
 }
 
+static int rmem_eyeq5_checksum(struct rmem *priv)
+{
+	struct rmem_eyeq5_header header;
+	void *buf __free(kfree) = NULL;
+	u32 computed_crc, *target_crc;
+	size_t data_size;
+	int ret;
+
+	ret = rmem_read(priv, 0, &header, sizeof(header));
+	if (ret)
+		return ret;
+
+	if (header.magic != RMEM_EYEQ5_MAGIC)
+		return -EINVAL;
+
+	/*
+	 * Avoid massive kmalloc() if header read is invalid;
+	 * the check would be done by the next rmem_read() anyway.
+	 */
+	if (header.size > priv->mem->size)
+		return -EINVAL;
+
+	/*
+	 *           0 +-------------------+
+	 *             | Header (12 bytes) | \
+	 *             +-------------------+ |
+	 *             |                   | | data to be CRCed
+	 *             |        ...        | |
+	 *             |                   | /
+	 *   data_size +-------------------+
+	 *             |   CRC (4 bytes)   |
+	 * header.size +-------------------+
+	 */
+
+	buf = kmalloc(header.size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = rmem_read(priv, 0, buf, header.size);
+	if (ret)
+		return ret;
+
+	data_size = header.size - sizeof(*target_crc);
+	target_crc = buf + data_size;
+	computed_crc = crc32(U32_MAX, buf, data_size) ^ U32_MAX;
+
+	if (computed_crc == *target_crc)
+		return 0;
+
+	dev_err(priv->dev,
+		"checksum failed: computed %#x, expected %#x, header (%#x, %#x, %#x)\n",
+		computed_crc, *target_crc, header.magic, header.version, header.size);
+	return -EINVAL;
+}
+
 static int rmem_probe(struct platform_device *pdev)
 {
 	struct nvmem_config config = { };
 	struct device *dev = &pdev->dev;
+	const struct rmem_match_data *match_data = device_get_match_data(dev);
 	struct reserved_mem *mem;
 	struct rmem *priv;
 
@@ -73,10 +142,21 @@ static int rmem_probe(struct platform_device *pdev)
 	config.size = mem->size;
 	config.reg_read = rmem_read;
 
+	if (match_data && match_data->checksum) {
+		int ret = match_data->checksum(priv);
+		if (ret)
+			return ret;
+	}
+
 	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
 }
 
+static const struct rmem_match_data rmem_eyeq5_match_data = {
+	.checksum = rmem_eyeq5_checksum,
+};
+
 static const struct of_device_id rmem_match[] = {
+	{ .compatible = "mobileye,eyeq5-bootloader-config", .data = &rmem_eyeq5_match_data },
 	{ .compatible = "nvmem-rmem", },
 	{ /* sentinel */ },
 };

-- 
2.47.1


