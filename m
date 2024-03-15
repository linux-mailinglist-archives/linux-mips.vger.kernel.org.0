Return-Path: <linux-mips+bounces-2255-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFAF87C7BF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Mar 2024 03:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 242B8B21955
	for <lists+linux-mips@lfdr.de>; Fri, 15 Mar 2024 02:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B794CC8C7;
	Fri, 15 Mar 2024 02:53:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B156FD7
	for <linux-mips@vger.kernel.org>; Fri, 15 Mar 2024 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710471197; cv=none; b=lh/ng5dyhFV4LcAfkTNaqF2xIMvuYtlxDjcvp6H8EgeMVhO8Ouj1+B8UTxeOBytoueDCFmmYlWGtW25QeZ+tiz3BJrZUp/Fq6fVyGVKExccJcqYUNMSbRGyp3hBTeVCI/uMtC/N5u2M8P6K5Jl7nqYiqDJ0yPBvzwOGaYCg8Vnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710471197; c=relaxed/simple;
	bh=5o5Nq+ygA3ePAKHP/y8MZdgopVu1qLt+cSpW/QJougI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bipDZ7u43OrD+HsI56VxmGvc4qb8pFQ3iLEYrY6/ipDAu+XZIUFDgmxQS3Ch2D8Y8zs8O35RJ+zKZk0gMwtURC0fm1RYPzVs9sL+pq0+3plfj81hdJUn3wFIEb46QUs3ewz3f+zvX0tLXr5tY3++HNeXDXqQtih+f5W00zP07VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ddd072080cdb42adb02b0a87c74c2aba-20240315
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:d101882d-acf6-4267-bbaf-318ecfbd47dd,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:15
X-CID-INFO: VERSION:1.1.37,REQID:d101882d-acf6-4267-bbaf-318ecfbd47dd,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:15
X-CID-META: VersionHash:6f543d0,CLOUDID:31f0eaff-c16b-4159-a099-3b9d0558e447,B
	ulkID:2403151053085XK4P9PK,BulkQuantity:0,Recheck:0,SF:66|24|72|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: ddd072080cdb42adb02b0a87c74c2aba-20240315
X-User: zhangyongzhen@kylinos.cn
Received: from localhost.localdomain [(39.156.73.13)] by mailgw
	(envelope-from <zhangyongzhen@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 107195462; Fri, 15 Mar 2024 10:53:05 +0800
From: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
To: hauke@hauke-m.de
Cc: zajec5@gmail.com,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Subject: [PATCH] MIPS: BCM47XX: Declare early_tlb_init() static
Date: Fri, 15 Mar 2024 10:52:35 +0800
Message-Id: <20240315025235.182866-1-zhangyongzhen@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

early_tlb_init() was local to file but not declared static,
leading to error:

arch/mips/bcm47xx/prom.c:126:6: error: no previous prototype for ‘early_tlb_init’ [-Werror=missing-prototypes]
  126 | void early_tlb_init(void)
      |      ^~~~~~~~~~~~~~

Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
---
 arch/mips/bcm47xx/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
index 7344a5eb990e..58fb7c2dc3b8 100644
--- a/arch/mips/bcm47xx/prom.c
+++ b/arch/mips/bcm47xx/prom.c
@@ -124,7 +124,7 @@ void __init prom_init(void)
 /* Stripped version of tlb_init, with the call to build_tlb_refill_handler
  * dropped. Calling it at this stage causes a hang.
  */
-void early_tlb_init(void)
+static void early_tlb_init(void)
 {
 	write_c0_pagemask(PM_DEFAULT_MASK);
 	write_c0_wired(0);
-- 
2.34.1


