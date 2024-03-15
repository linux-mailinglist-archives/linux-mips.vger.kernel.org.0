Return-Path: <linux-mips+bounces-2253-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD04887C777
	for <lists+linux-mips@lfdr.de>; Fri, 15 Mar 2024 03:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF7D91C20C46
	for <lists+linux-mips@lfdr.de>; Fri, 15 Mar 2024 02:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40396FD2;
	Fri, 15 Mar 2024 02:29:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D56FB8
	for <linux-mips@vger.kernel.org>; Fri, 15 Mar 2024 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710469790; cv=none; b=c2nemlv+CcJNJtim6zv6RncbBYjhxdKgqnskMf0TVOu3NTf7oQ9g7Bm4joUk2itn5xr8Exe/sHKpSpJLEJYwmHS1G1JqXoShm2+kIu6PMqQXs1NarRvPDevbXXHBF47WdMG8KEVLdLuDy1hj926fBFwZ2j8CI9/gulfhsctERG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710469790; c=relaxed/simple;
	bh=5hdp/lcptjuys/5hwsuVEVahaRHPqqctBlB0SMglzQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=X5OqHjSnmVbosjM+qFT28TPlu5vJNHp2bKBKzn5hwINc+fGf+l5zFMxfpPaTuEovUcsLB5L44g6dn4wwsojue/MiWQs3mGllg9lMzIrdC0PxRFUY4p8petvnHxQ0ZS9aHJxkFkzhqyqyZxqVy0Su90WRPMO0lSTnYZdKbqjp9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d8d6727e32e14dd1b36aff02585d82bb-20240315
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:a1ef4a55-6469-451d-abf1-84c732adb545,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.37,REQID:a1ef4a55-6469-451d-abf1-84c732adb545,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6f543d0,CLOUDID:19a1eaff-c16b-4159-a099-3b9d0558e447,B
	ulkID:240315102932MKVAAP63,BulkQuantity:0,Recheck:0,SF:66|24|72|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: d8d6727e32e14dd1b36aff02585d82bb-20240315
X-User: zhangyongzhen@kylinos.cn
Received: from localhost.localdomain [(39.156.73.13)] by mailgw
	(envelope-from <zhangyongzhen@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 980637056; Fri, 15 Mar 2024 10:29:29 +0800
From: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
To: hauke@hauke-m.de
Cc: zajec5@gmail.com,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Subject: [PATCH] MIPS: BCM47XX: include header for bcm47xx_prom_highmem_init() prototype
Date: Fri, 15 Mar 2024 10:29:23 +0800
Message-Id: <20240315022923.178593-1-zhangyongzhen@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bcm47xx_prom_highmem_init() is a global function declared in
arch/mips/bcm47xx/bcm47xx_private.h, but this header is not
included before the definition, causing a error:

arch/mips/bcm47xx/prom.c:134:13: error: no previous prototype for ‘bcm47xx_prom_highmem_init’ [-Werror=missing-prototypes]
  134 | void __init bcm47xx_prom_highmem_init(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
---
 arch/mips/bcm47xx/prom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 99a1ba5394e0..7344a5eb990e 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -35,6 +35,7 @@
 #include <asm/bootinfo.h>
 #include <bcm47xx.h>
 #include <bcm47xx_board.h>
+#include "bcm47xx_private.h"
 
 static char bcm47xx_system_type[20] = "Broadcom BCM47XX";
 
-- 
2.34.1


