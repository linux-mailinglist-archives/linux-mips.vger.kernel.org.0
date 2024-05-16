Return-Path: <linux-mips+bounces-3280-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89038C75D4
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 14:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 912B5284E9B
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 12:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3789C145A12;
	Thu, 16 May 2024 12:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="LOffGyV7"
X-Original-To: linux-mips@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687F4145B01;
	Thu, 16 May 2024 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715861899; cv=none; b=KMvoOwqP9zW1TMgsmWxeea8GQlYSFwt6u4YFalNZTLhmRam6gBTmsevklBUSwZinXoE7JQZgefR+pAfuifLfYhxZ/qLdwB6ZYunm8TQ+1gSEVS8ezQi6DGcrqcGLy4tbmJa/uISQogX0qwRB1h+EQC2U0ie59mCfC90oqILUWf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715861899; c=relaxed/simple;
	bh=HFCQg3Sx4ZhEpDdFJ4Xk+JoGPY6Gfx1b4LEHhW4aXsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYFOLD2DEVsknwCqwvwm579S27PyqDQRof35SXxz/5H84EEXY91xrxP1RsfwF8W3R6PEgiB8Q5lgmeSQ4ZEHx36a0yHxU1s2KdAH6APX7emE0Ms0n0P9MgLZBXlv2aVfesVm8NA3x3L9EeKzOSWVpXBRz/8eXEN57N1v4Fmv+nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=LOffGyV7; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=c/c6UprRMJ+Pu2qhWWNi5OJ+tLUdGCPrD5YFgn6dxvw=;
	b=LOffGyV73othVfZ2u6U7kpHvNHb8ueEpG5nSavtgJ1IQQKabg/Mqyca701W+E8
	WCtLQeJdwM6X20TjKDQhRQtUVfXJIo1gJHA4pWS/kyG3KMDyTjeOFGpIWUDsfiIZ
	xpzxkVKSAhzJaffaxpA/Ze+DebM2GWs94l3ha6forVCLg=
Received: from localhost.localdomain (unknown [116.128.244.171])
	by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wDHD+tp9UVmXt_9Bw--.21873S6;
	Thu, 16 May 2024 20:01:58 +0800 (CST)
From: Genjian <zhanggenjian@126.com>
To: tsbogend@alpha.franken.de,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	ricardo@marliere.net
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Genjian Zhang <zhanggenjian@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH 3/3] MIPS: ip22-gio: Make ip22_gio_set_64bit() and ip22_gio_init() static
Date: Thu, 16 May 2024 19:59:06 +0800
Message-Id: <20240516115906.1224164-3-zhanggenjian@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516115906.1224164-1-zhanggenjian@126.com>
References: <20240516115906.1224164-1-zhanggenjian@126.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHD+tp9UVmXt_9Bw--.21873S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyUAr48KrykGry8Kr1kuFg_yoW8JFy7pr
	W0yFnrKFWjgFWDWFs5Cry8Xr4S9wn8ArWFvF4qk34IgF1rGFy3JF4rKr98Zr1UGrWUZ3Wr
	XF1Fg3ZxKw4I9wUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZAwsUUUUU=
X-CM-SenderInfo: x2kd0wxjhqyxldq6ij2wof0z/1tbiHhTgfmV20wENggABsb

From: Genjian Zhang <zhanggenjian@kylinos.cn>

These functions are used in only one file.
Made them static to fix the following build error:

arch/mips/sgi-ip22/ip22-gio.c:249:6: error: no previous prototype for ‘ip22_gio_set_64bit’ [-Werror=missing-prototypes]
arch/mips/sgi-ip22/ip22-gio.c:398:12: error: no previous prototype for ‘ip22_gio_init’ [-Werror=missing-prototypes]

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
---
 arch/mips/sgi-ip22/ip22-gio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index a3cdcb289941..2738325e98dd 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -246,7 +246,7 @@ void gio_set_master(struct gio_device *dev)
 }
 EXPORT_SYMBOL_GPL(gio_set_master);
 
-void ip22_gio_set_64bit(int slotno)
+static void ip22_gio_set_64bit(int slotno)
 {
 	u32 tmp = sgimc->giopar;
 
@@ -395,7 +395,7 @@ static struct resource gio_bus_resource = {
 	.flags = IORESOURCE_MEM,
 };
 
-int __init ip22_gio_init(void)
+static int __init ip22_gio_init(void)
 {
 	unsigned int pbdma __maybe_unused;
 	int ret;
-- 
2.25.1


