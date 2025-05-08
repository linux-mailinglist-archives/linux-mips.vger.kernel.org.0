Return-Path: <linux-mips+bounces-8964-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FFEAAF1A8
	for <lists+linux-mips@lfdr.de>; Thu,  8 May 2025 05:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFFE0188E5F4
	for <lists+linux-mips@lfdr.de>; Thu,  8 May 2025 03:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AAE1F3BAC;
	Thu,  8 May 2025 03:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENHPijUw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4821DE4DC;
	Thu,  8 May 2025 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674930; cv=none; b=Wj4sxeCDyhzAtAk/WnMKNyei2woSpp9iJWmRtGzhhEZvMB0P0a760m/GtACicWcnryCTqCD6GSzN18YsRDz6LdL69ALjulqtVtUwWsLGWqJvkqajImnGYshduU49z/1bFvoYnXqYYqsoReJokuMJmx9sfia+KtYyEhkQlJQN2+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674930; c=relaxed/simple;
	bh=vdAmVAbufuOs39noAWyicE6RZakZi51NyGvoS2Gr3As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FH4+TCX9tTP8S8bYW9hDNTZRx1nJyz8+iGa6xW2iVWYSxxbJoYeg+O1RcO3DfrzeCQR43LRPFiXT5VRmpVvGvNyh88WU3WAm3fj3IOdT2xsYADdUCMShWpiRWkS1ptlVBQwHV1R1zdd0QYaevPUCRfNm5jdgtgBoRVxvNqIEi2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENHPijUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5C7DC4CEE8;
	Thu,  8 May 2025 03:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746674929;
	bh=vdAmVAbufuOs39noAWyicE6RZakZi51NyGvoS2Gr3As=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ENHPijUw2e8bBenUyJA/B5Fl0O8M1Vco9GZYiy/fbeuooQminhUsQ/vxPgEywxxqB
	 6A4Si22NuGnUzknZV4/hWZpGYemjL7zw12MTTpxKPesWQsJ+A+q801D6EjeS5fGKUC
	 8fpPERcaVhfIqtACyVlLsrCvc7FrfOACLq42NPaJymerWDd931B6X0Z6mWtRED77hR
	 PjIBqhgElF8ua0JWFcR9Uz5uYP0GWt0NyeVwkw8zAJxsxJ359ZV039h97CS7rzoy0N
	 VdBCeQlPqfW+MZWcm0TTxNt7QYJjIzgA57WJVo5DSehccTgMyYY70yYUcDHT5HXUyJ
	 dFCxZWtMzxuag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C417CC3ABBE;
	Thu,  8 May 2025 03:28:49 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Thu, 08 May 2025 11:28:42 +0800
Subject: [PATCH] mtd: rawnand: loongson1: Fix inconsistent refcounting in
 ls1x_nand_chip_init()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-loongson1-nand-fix-v1-1-27b26234c62c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOkkHGgC/x2MQQqAMAzAvjJ6tjAHOvQr4mHaqgXpZAMRZH93e
 EwgeSFzEs4wmhcS35IlaoW2MbAeQXdGocrgrOtsZz2eMeqeo7aoQQk3edD5YfErUb8Fghpeiav
 +p9NcygcEQdaqZAAAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746674928; l=2384;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=Enffpow1/oAmcpIlxb54XqOtVEib/iLdUuIMLpplTqs=;
 b=fYD8HRpmUt1FmYMRV3iW1cBEn4niKD1j8KhX3W660f8g/vV9SUM9UJ2xm+x1vbLINlw0u8KKW
 vHC+7SwNRNmAPW6deUZAEbq+C+iM1dGovTg/E7gfvQniSTIjeTEuiSr
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

As reported by Dan,
commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
Driver"), leads to the following Smatch static checker warning:

drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_chip_init()
warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.counter':

Fix this issue by calling of_node_put() immediately after using chip_np.
In addition, remove all unnecessary of_node_put(chip_np) calls.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aBR535RZZT-sa6QZ@stanley.mountain/
Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 drivers/mtd/nand/raw/loongson1-nand-controller.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
index 6a369b1c7d86..5f1bde21c8fc 100644
--- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
@@ -703,27 +703,25 @@ static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
 	if (!chip_np)
 		return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND chip\n");
 
-	chip->controller = &host->controller;
-	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
-	chip->buf_align = 16;
-	nand_set_controller_data(chip, host);
 	nand_set_flash_node(chip, chip_np);
+	of_node_put(chip_np);
 	if (!mtd->name)
 		return dev_err_probe(dev, -EINVAL, "Missing MTD label\n");
 
+	nand_set_controller_data(chip, host);
+	chip->controller = &host->controller;
+	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
+	chip->buf_align = 16;
 	mtd->dev.parent = dev;
 	mtd->owner = THIS_MODULE;
 
 	ret = nand_scan(chip, 1);
-	if (ret) {
-		of_node_put(chip_np);
+	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
-	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		nand_cleanup(chip);
-		of_node_put(chip_np);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 

---
base-commit: 08710e696081d58163c8078e0e096be6d35c5fad
change-id: 20250507-loongson1-nand-fix-279b7cdd6fad

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



