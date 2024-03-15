Return-Path: <linux-mips+bounces-2256-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5387C843
	for <lists+linux-mips@lfdr.de>; Fri, 15 Mar 2024 05:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11691C20DED
	for <lists+linux-mips@lfdr.de>; Fri, 15 Mar 2024 04:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B64D534;
	Fri, 15 Mar 2024 04:27:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845DCD52F
	for <linux-mips@vger.kernel.org>; Fri, 15 Mar 2024 04:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710476840; cv=none; b=hzNim9da+28C7TqmTTMXIklKPEOV4RxLhM6U/itc2zBr4i2wgO3IWRwVkIrXIwqVnA8ddHvb4IM6mV9lmPW3VPeSTCdjPurN5NFVvPR6hteQwIPlK3CknWEXIabNVRAyDd9nzvHXeGwsCmt3sCjXcAYV06MKVhaEh4i4c+TXSJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710476840; c=relaxed/simple;
	bh=f8hOArrhr4v2KfGm1zKbRqeWdAswgqWyjh/2FkSLPsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QSNWyGgCVR9C1JL45CDKQZiiJhUi708KwJIOwNRXjVve6ufQMcjLlTBi6pqVAyrVIsINeRjZd39PYiovOU7PzPOCu31hWcePSHgPFR7FDS3BOUn3sKQQh+0JpqBBvrLsr30zCxrmo+3bbMuJ59kmF00ykv5TbM+VZffJdzE8Kkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fa6344e9d300484ba09825acb20aa7bb-20240315
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:5c2b59db-b06e-4a52-9635-12644cd49db9,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-10
X-CID-INFO: VERSION:1.1.37,REQID:5c2b59db-b06e-4a52-9635-12644cd49db9,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-10
X-CID-META: VersionHash:6f543d0,CLOUDID:fb5a0785-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:2403151211078IJOJ9H9,BulkQuantity:0,Recheck:0,SF:66|24|17|19|44|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: fa6344e9d300484ba09825acb20aa7bb-20240315
X-User: zhangyongzhen@kylinos.cn
Received: from localhost.localdomain [(39.156.73.13)] by mailgw
	(envelope-from <zhangyongzhen@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 955882352; Fri, 15 Mar 2024 12:11:04 +0800
From: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	Yongzhen Zhang <zhangyongzhen@kylinos.cn>
Subject: [PATCH] MIPS: RB532: Declare prom_setup_cmdline() and rb532_gpio_init() static
Date: Fri, 15 Mar 2024 12:10:43 +0800
Message-Id: <20240315041043.240833-1-zhangyongzhen@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

early_tlb_init() and rb532_gpio_init() were local to file but not declared
static, leading to error:

arch/mips/rb532/prom.c:49:13: error: no previous prototype for ‘prom_setup_cmdline’ [-Werror=missing-prototypes]
   49 | void __init prom_setup_cmdline(void)
      |             ^~~~~~~~~~~~~~~~~~
arch/mips/rb532/gpio.c:200:12: error: no previous prototype for ‘rb532_gpio_init’ [-Werror=missing-prototypes]
  200 | int __init rb532_gpio_init(void)
      |            ^~~~~~~~~~~~~~~

Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
---
 arch/mips/rb532/gpio.c | 2 +-
 arch/mips/rb532/prom.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index 29c21b9d42da..ea6ebfea4a67 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -197,7 +197,7 @@ void rb532_gpio_set_func(unsigned gpio)
 }
 EXPORT_SYMBOL(rb532_gpio_set_func);
 
-int __init rb532_gpio_init(void)
+static int __init rb532_gpio_init(void)
 {
 	struct resource *r;
 
diff --git a/arch/mips/rb532/prom.c b/arch/mips/rb532/prom.c
index b11693715547..b88e89ec5894 100644
--- a/arch/mips/rb532/prom.c
+++ b/arch/mips/rb532/prom.c
@@ -46,7 +46,7 @@ static inline unsigned long tag2ul(char *arg, const char *tag)
 	return simple_strtoul(num, 0, 10);
 }
 
-void __init prom_setup_cmdline(void)
+static void __init prom_setup_cmdline(void)
 {
 	static char cmd_line[COMMAND_LINE_SIZE] __initdata;
 	char *cp, *board;
-- 
2.34.1


