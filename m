Return-Path: <linux-mips+bounces-3281-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF338C75D8
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 14:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DF001C21A02
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 12:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A6514601B;
	Thu, 16 May 2024 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="QaF6Wo9e"
X-Original-To: linux-mips@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5396145B24;
	Thu, 16 May 2024 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715861902; cv=none; b=ebw+ozrb6KUVzKWC8oxnpFga0H6M5CO5VYhsOhZVINCnOMSmOGuSA8WW05Oi/5KJec2Nr8mbuseDs8+trjPrIfTYGmMTXKTOwLzIdH+AOh7aYCjwyc6UXa42mJ2PU/uYdJ7+2DxfoN2p2hOHalXKz77/IirxP405t//UyzwYwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715861902; c=relaxed/simple;
	bh=21bx4c1PmfkU2JPz9tYRAzj1c31ZjgcveRPXwlDx3Pg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QTcIIykGwRh3V+j72n+v86H21dhfQiklirYhB92RBoVTw33UsN18EnSq/T0J35f2zr5v9JenjbxPbYdJ8cqOxics12Uc966WEg8r2VLjIWtbRDWPkwbMrxGlw7Qql3tpi4g4Tx8/uCGDhy1m8FjrrBWwr0HpfAwcqXTLKFNDJlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=QaF6Wo9e; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=vofaX8fsHWZZdLKjY6vYcEjUy3BVDsZa1OFGxEENHhk=;
	b=QaF6Wo9eWARKm6glyHkx+PiUgBnZV92PYSDX8gy3+7j80LCoa2hX4NLvmJH9Sc
	fGuBYfC7nNA1mPINu/KLN0qje8LqcQ6XVqDnQn0hfiMxqkMstIuZTuOvTvxKy8Fi
	AOEGFzxpCQowwr48HMWMsoG2w7Six5OkzHTp6n68Yoq7A=
Received: from localhost.localdomain (unknown [116.128.244.171])
	by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wDHD+tp9UVmXt_9Bw--.21873S4;
	Thu, 16 May 2024 20:01:52 +0800 (CST)
From: Genjian <zhanggenjian@126.com>
To: tsbogend@alpha.franken.de,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	ricardo@marliere.net
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Genjian Zhang <zhanggenjian@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH 1/3] MIPS: Loongson64: include asm/bootinfo.h
Date: Thu, 16 May 2024 19:59:04 +0800
Message-Id: <20240516115906.1224164-1-zhanggenjian@126.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHD+tp9UVmXt_9Bw--.21873S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWrKF47Cr4fuFWxuw4UJwb_yoW3trXEga
	42y3y0grn5AF1xA34fWFn3Ar4ak348Way5uwn5Xr9Yvas8JayDCFW7Z34UtF1DWrs0yrWr
	Zr1rJr1kCF1fGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjS_MPUUUUU==
X-CM-SenderInfo: x2kd0wxjhqyxldq6ij2wof0z/1tbiHhTgfmV20wENggAAsa

From: Genjian Zhang <zhanggenjian@kylinos.cn>

build-warning is printed:
arch/mips/loongson64/dma.c:25:13: error: no previous prototype for ‘plat_swiotlb_setup’ [-Werror=missing-prototypes]

Include the header to fix it.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
---
 arch/mips/loongson64/dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
index 8220a1bc0db6..5c5e524b9121 100644
--- a/arch/mips/loongson64/dma.c
+++ b/arch/mips/loongson64/dma.c
@@ -3,6 +3,7 @@
 #include <linux/init.h>
 #include <linux/swiotlb.h>
 #include <boot_param.h>
+#include <asm/bootinfo.h>
 
 dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
-- 
2.25.1


