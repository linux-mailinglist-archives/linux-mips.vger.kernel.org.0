Return-Path: <linux-mips+bounces-6908-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA81F9E9B1C
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 17:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA3A28300C
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A93E14F9E2;
	Mon,  9 Dec 2024 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZzeRFr9R"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884B13D8A3;
	Mon,  9 Dec 2024 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759984; cv=none; b=EFniyxY2rjIUrBr9V53RY4fHNBtNKOQGUttSRd+W985JJSj1ak+zsH0yHCvOcs9V6ygb5PQWcQcAX+d+IhoFmgrj+//CLkYxkorpDrHNeoBZnaGUbKkKCf0JtALPhUh+g5KSKitreo0Kvm7lkUz5sYVZBd+hwCAKqBKPIsL1s3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759984; c=relaxed/simple;
	bh=JQW+GRuAYpqVaYJr8AD+8K+ovcWI6p97DbY7ox6OxzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pcMtRvjEYTXBD0YFM24rIytSTQgGiGBK5VfP1X97GxPb45Q2sd7jWas9EYt1KiTDu7Nq5pec/PLOoW9bYsyLAKH0PGhTIvlGr/qRJs+aZsRzHtWnTymplfy7EmIUcESf1wtsa78EFtLAJwfjvC69rSTR4oX1DzUN6K0eZkk6YIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZzeRFr9R; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4894B20008;
	Mon,  9 Dec 2024 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733759979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uoVHDS/FRQA9f0oimOdFs9drLE+G2Ls+ee4zqWm5bLs=;
	b=ZzeRFr9RKaARWSc7QImRzvQQ/Caj7f8Xv7FMUX8S9bKpHttnxoAg5vFKMD8UE14hkxmAyD
	3MviIT9gjA2V7LpQ7apklQofDimnHyLCFU6EmhpH30hfkCeQuwZFTh2IuK+kSd49G3VSMT
	IXJCFLgqyW357LR1GMbZkhLim92zQ8bITgnjTQYHMHo7ZIPVmgGrg+VEdwdL6iFa3xkgXd
	pnbEDxCFTLjBVa38xCCmrlmNI2r0p5ZWkjGjz+yMY3bMl+O/zI8/kLsEjfKv8qeb1tpeYY
	la/B/97iauyTN5T5VPA+uX5obdstyIuH6+Mu1nrvSvxDI+MOAjAAj21FN0WECg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 09 Dec 2024 16:59:39 +0100
Subject: [PATCH v2 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5
 NVMEM
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-rmem-v2-5-cbc0e8c08a21@bootlin.com>
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

Mobileye EyeQ5 has a non-volatile memory region which
gets used to store MAC addresses. Its format includes
a prefix 12-byte header and a suffix 4-byte CRC.

Add an optional ->checksum() callback inside match data;
it runs CRC32 onto the content.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/nvmem/rmem.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/nvmem/rmem.c b/drivers/nvmem/rmem.c
index ca89c2689031534ff316a48e03360aeec823b025..1f0caf1d2dc1b3d42e5ac79b55222beb59fdd30d 100644
--- a/drivers/nvmem/rmem.c
+++ b/drivers/nvmem/rmem.c
@@ -3,11 +3,13 @@
  * Copyright (C) 2020 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
  */
 
+#include <linux/crc32.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 struct rmem {
 	struct device *dev;
@@ -15,6 +17,18 @@ struct rmem {
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
@@ -47,10 +61,66 @@ static int rmem_read(void *context, unsigned int offset,
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
 
@@ -73,10 +143,21 @@ static int rmem_probe(struct platform_device *pdev)
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


