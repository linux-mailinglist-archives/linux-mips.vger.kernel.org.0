Return-Path: <linux-mips+bounces-8503-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4DA7D640
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20EC165CDA
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E326154C0D;
	Mon,  7 Apr 2025 07:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="FEBGrZeg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82610FD;
	Mon,  7 Apr 2025 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011458; cv=none; b=SVeiEGF3eR+HbGcWBBDFSWEDiTVSLSFVlcuG67R4F7S+r6GiGoYlZVK7W+nlatfNvEBqbHuX2YmjHhLbS4WQJdAylh1DjBTxn20IIYjsR3kIyBk9XT/Bd574QB/O9hbKJa4lpIdzgHggt9ZExFoc5QuqGe/pg0HE+Uh2Ksjmyp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011458; c=relaxed/simple;
	bh=gjmegUE8nkvnqYGAzoqCkp0JHDCzhgmR/Pn3cCV+J30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcBgn5d7zjblNQhOsp5n78dwkgDaZf53ttpdT3BoF6ua8JW7bQgfUqOyv7l6AHpyzYQvsCk72os15+eYjvw1eSgprd1cPUCPJfvuqm+R0uWhjLN7pjqFmCawYPtr7Y4WdjJyeac9hmw834UbtTMHBV2BWThtWqvlaPBnEBid72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=FEBGrZeg; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744011442;
	bh=p13p1deBOhuoKBgpdie+NXcLOjyEkv+MI/7mj2NH+KU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=FEBGrZegban6NRQXrydTTnbr4gxSPlq453cZBIsimoLlTBhTYFwk0pK3Gnr1YpUcl
	 skvw46CBiMDPqLKu14b46s8SwSDZlm28gzEanTDxQlaLy/RoK4ALj7RaA7nM7WgoK9
	 b80bSe4rlj5ZvMkpbNLdeUk5XX8JYVIaEA3Sv2pA=
X-QQ-mid: bizesmtpip3t1744011400tcd2c88
X-QQ-Originating-IP: +jBvuj1PE5wRh7KO9c0VGtKpSerpbfMKtelcB15hLOM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 15:36:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11969504896408451773
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH 2/6] MIPS: Eliminate Redundant KBUILD_SYM32 Checks
Date: Mon,  7 Apr 2025 15:36:18 +0800
Message-ID: <6D153E3629AA90A6+20250407073622.495364-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
References: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Ms5ig0OTjp1HSl0g8XcbWz0l+ij2vTlatu1DU7P6BJWZDqhAgO8xIgXH
	ptpsw2FYheGHvFilVBPUq2jcOaVElzFYGgkEnuEtBCNMHDuFcp0QBCF7JiAm9xhBpPPVbkx
	z1agUL0o5HQ7UHfXra6jidNSGkNSZY++jJLgLBUj2oM6GnPCbxYluYCcL/fB9e+6uVhdDa/
	m545Ok4Rv8jJDYuztMRgs6e/4IEl8ZoJqJj5pFb6kvKkTaEydi/xlKmkGUwpVX6I/5E/3lh
	qTZptCWxpGPTXHoPEm8QIU/XP/O1LKsN4agjsS13XduePYl8xK8AcFZkkVzDKWWS+EOvqda
	PtT3l4M8m+QDPoISZFjfTPzs5OVVC1so9QbtLVPvwa2laXlNWaG9nitDbFypHG2Z5DA+mXH
	K7RyvdHvaOWtaVEwM8BMaIb+RSWnwFX+DbIMuckqwFa+dmBP7LRVXlX4N8RwisXkCx/RQsc
	cRWlA2/w2ov7aT63480GDMRl9ZHCU1N2FqwoG3hzPwhHuDiltoMQpt1sHuND8gA4zWz6T2U
	b0/qdhO72uLo1CAyak7bkP3DxjfYmTvxUmE9NXG4QsMT5jCOFf8+NPsnpG3hPEpzFh3cNNW
	2XOHAK2Q5zaEC3+FHdkp9V5P8Eo6So0MY+AHFBk4KRdLLN0QI8gcgPrIxclzRYmabJXbGth
	wJ6UgYDmPwy54YIQnGsWrCUTyXxAYUFGQeZ85jtm8OgxNWmyCa+fjorWR0rdZyUAgxKtQBL
	GuKq0APs08Ztop0f1ReK7KMcMmnDE3bVgQtOCu4c07foDUxglChTMD97pQiWsll4pe1tl3E
	jFywpccl0FMNJ/u7ZBEMCYm7G6ZQ2y+mg32WKTV075+iPYPn53EJjk3L5HR5BJeK0psSM9M
	Xg6v2WRwEW0MrTGkDo51tBhIqZxakgrj5inylnbhb+sLLw16Grd+Xze91AgYw9O6tE60XW5
	w5kmKfV64Eykz6CaMAweyvSH8Kk8IbvLfVkRTQR1RgYTYn2Nvpmiqld3HseB00nOHF9eYQ3
	WXx3Kl6A==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Given that KBUILD_SYM32=y is a prerequisite for this statement to be
executed, it's logically redundant to verify KBUILD_SYM32 is y again.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 1fffc6cf8b52..ad06e81f50fb 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -299,7 +299,7 @@ ifdef CONFIG_64BIT
   endif
 
   ifeq ($(KBUILD_SYM32), y)
-    cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
+    cflags-y += -msym32 -DKBUILD_64BIT_SYM32
   else
     ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
       $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
-- 
2.49.0


