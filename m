Return-Path: <linux-mips+bounces-12397-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 336CACA33FB
	for <lists+linux-mips@lfdr.de>; Thu, 04 Dec 2025 11:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED6F0300D4A2
	for <lists+linux-mips@lfdr.de>; Thu,  4 Dec 2025 10:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A23330B28;
	Thu,  4 Dec 2025 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BmAkfKu3"
X-Original-To: linux-mips@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B61330D42;
	Thu,  4 Dec 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764844602; cv=none; b=JGPe1c8dFzdZ59tQGxR/c44JAi/GT1sfDkjpYWWuQAZO/3tn+lF2AzFs+nPJc6tc/xJS0Z1njFzCnnVIRrHiQOYnGdI9b6WheoFbLz5hkrEWZ55ptDIWL+mV/Vx1m7qVPBjpr2gFPJk9X48PURtuaMJSmwC7rd0XbKD/7DBBiKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764844602; c=relaxed/simple;
	bh=fDCHHZJqIp9+W1uBLN2zJjCthaFOMIGNO84Nv6A45fQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zt3sguakcTsGnPnWYg5j4AOliKTFTSJNO46x9rqK22fMuWUx4AZUEGmW8I8jNa666z87RmtKNWxOSBrhZAdRi2rPrebrLSaoZovlaKn+O+RgDCokAwvyM9bw3H5RoK3lpCBw+GvRW7yjD74G+jdshxRfRyZai3F58xmhIhMHBSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BmAkfKu3; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Cm
	zqckVJvah7udT3yIBjJcnBiLMTxqxe1XiOcD84Kzs=; b=BmAkfKu3lLGQXm17nr
	ClwkSfnJ13XnXSLMbJTC/mnAdqzI7U3jPQmHcVwOGagj+a8ti9swF7Vx+vcExKXU
	VqdC4CR6XiYtFFBqpGe5pkhv4LhVY3PYaWiC6hO7xCD9frOy74DLqPuwaYae5fof
	9WE+zv2B+ZADAZSpre5hujaZU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDXrxckZDFp6eTIEg--.48716S4;
	Thu, 04 Dec 2025 18:36:22 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: tsbogend@alpha.franken.de,
	haoxiang_li2024@163.com,
	FlorianSchandinat@gmx.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] MIPS: Fix a reference leak bug in ip22_check_gio()
Date: Thu,  4 Dec 2025 18:36:18 +0800
Message-Id: <20251204103618.89502-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXrxckZDFp6eTIEg--.48716S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4kWr1rurW8XF4kJFy8uFg_yoWfuFXE9a
	4vya4DZas5Jr1IyrW3X3WfZr1fAwnFgF4fCr17JFn5CrWrZrZxWrWDXw15Jr15WF1akr4Y
	v3yrCF1UurWfGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRAAwIUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxgbIN2kxZCYOEgAA35

If gio_device_register fails, gio_dev_put() is required to
drop the gio_dev device reference.

Fixes: e84de0c61905 ("MIPS: GIO bus support for SGI IP22/28")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 arch/mips/sgi-ip22/ip22-gio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index 5893ea4e382c..19b70928d6dc 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -372,7 +372,8 @@ static void ip22_check_gio(int slotno, unsigned long addr, int irq)
 		gio_dev->resource.flags = IORESOURCE_MEM;
 		gio_dev->irq = irq;
 		dev_set_name(&gio_dev->dev, "%d", slotno);
-		gio_device_register(gio_dev);
+		if (gio_device_register(gio_dev))
+			gio_dev_put(gio_dev);
 	} else
 		printk(KERN_INFO "GIO: slot %d : Empty\n", slotno);
 }
-- 
2.25.1


