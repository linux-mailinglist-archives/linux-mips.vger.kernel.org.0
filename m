Return-Path: <linux-mips+bounces-7724-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF93A30DC6
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 15:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7CA618870ED
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 14:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2263E24C698;
	Tue, 11 Feb 2025 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="mIGZgNwF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6FC24C67A;
	Tue, 11 Feb 2025 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282928; cv=none; b=d4k98nDRu8LPRblDKcpH8pMW2oyOrLfAaUg3ToKT1ven8G2nj7K2N1MPH6gP9JVpyWRO/jC28fDjjIZzO75q3bKGrxLX+3vhxE83GMS/rtQgFkK7pv2ZvkeoPFuaQjt0DMAkprNMyFYKmpVhF44NBIIaBTFucaaMSQ+xS8eukCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282928; c=relaxed/simple;
	bh=0PFh1OG9X//IBm62qDANGEQPsFHlL0salMfKyoQEYmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGOFzcCBFhHYjoFpH4gBTtDLYVdvzwpdY3WL9MW+y4ZaWgeS2S7B6x9+3ZWemk78oa28oVagMpQrgvmosvI0PGRjSgP2s3Zcffol6GkQ29oPNn1xF8SrQixESQAkUm4d/Kxhn6VnTm+q52Rz/qNr3T1y6yd4kbhm0N4DsNJfdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=mIGZgNwF; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739282879;
	bh=Ye9E/OOxaG1qDTj2JmfnAhMxyR9NraXuwREP5ViG3jg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mIGZgNwFwmY1FBjx3hGpWnKVot1tw7F8qD2MBBbUH4iDm04DvCtMXvzadL8JiVSoO
	 MO0Wt7IpR7kkFxFQ12KyU2mDz9MmdrgTrSfiZdCDdNyec1/WjLPEJOeT4qi4KJBvk6
	 EOb34gbxKDMxbCqYMWYyFj4kXnzxAD3H0OUjBz4A=
X-QQ-mid: bizesmtpip3t1739282869t48piuu
X-QQ-Originating-IP: wqSrQbwuHDK5cNCHMi6h+ZDxwJYJixw9ggcSfwm96/k=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Feb 2025 22:07:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5207954684755876973
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	macro@orcam.me.uk,
	masahiroy@kernel.org,
	jiaxun.yang@flygoat.com,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH 1/2] MIPS: Eliminate Redundant KBUILD_SYM32 Checks
Date: Tue, 11 Feb 2025 22:07:39 +0800
Message-ID: <4EACDB7E6DA201A2+20250211140740.1812778-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com>
References: <41107E6D3A125047+20250211135616.1807966-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NDjjYYC84KgIMmaP6860sI42p41k0TtaUILug9Nr6/9uQ0oXTxUPrfhv
	Gj1dHdYkfiS/cYewO9w1ZNWF/lC2OJ9TnYzHUCSrCPeBRtJL0Q54acdT8enrhasli9bi+Gd
	vvmWksBzTDtTLlQJfWHhsF3TYT1X14+Bo5S3RcH2ZQiS1aqeJ74ohBSr3MbFlgWADR1AFIK
	2ATiJp4l2XxMu26fWBeF8a5sOjDhhQhzsC0BN+pEOnKCCjYAMhzWqaucxY/QpLHwz2/9Jv3
	AalEJbCMx9fAIB0OPm/EjC2/qGazxWYhEbx2oE0AxLAV5d6VAbaqItZUtyOkVgisWPZMEJ0
	ZSv5AW2QwD6t5ycVBt2Dy4GPFO9YeMoRtfVAJcbVUR43wnx0E3cw57j2WAO9ElVxacPFakP
	UNOSHJJWWB8koOoUNmfBbYbVots0duA48AiXN5IVG5FTMlKRgCArX7hFReQew9DRtKm59lz
	wVuKKDU3Pu7PWMxsJo8X6T94Z8Pu1upWKDfNcVa2rhOEiD3V8vBZ6X1hSnuy+XS6ua0wdEJ
	GNM738FaniCLSt/bTg7RNXZk9ducBLGRIr652yvZH4KX653VzTLnYkgEzo83bDHBrw74k5I
	Bml2tKbiePF6XW3/ZSO+ZLB1Ol6o6a8hogjbvW2tM7gOF4gf+zySvjHnjstbHUOsOxK07bv
	jHevO92D0xkD6XU0MVv/lIQj72KsF1QTWiuv5QGmJVlxwmLeJ4M63Z6L1wtWxNOAHvww3f4
	GP9QrOhEvGYSXcM89hfM/uTcofbIq1/ebSGcPg3R8ECM53BITR2sUM7r2pWZ8USS6Q1ZN71
	atHrxLBZMZ1LQy9e6jHaS8575PPKko4ieL0wVSd5ecTJ2/5DP8LmHf5rHofo69ydvW1Rig3
	b8WR39ki5oCjAQMg8V+vsbAJeyWbcROpvm07keCHKGbV2Z/uZgVsWWk/+ROKRiQ99CsWGd+
	6DCis4wCYZ5CP1bf8eHEouIB0vbs6Z4m56mH/wXABKph8pfczsfHYlkhyYM38DrxTNUObWi
	/AwNY1ETW+grkHcWn2iu6/VIXGTrY=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Given that KBUILD_SYM32=y is a prerequisite for this statement to be
executed, it's logically redundant to verify KBUILD_SYM32 is y again.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index be8cb44a89fd..962eb749ed23 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -302,7 +302,7 @@ ifdef CONFIG_64BIT
   endif
 
   ifeq ($(KBUILD_SYM32), y)
-    cflags-$(KBUILD_SYM32) += -msym32 -DKBUILD_64BIT_SYM32
+    cflags-y += -msym32 -DKBUILD_64BIT_SYM32
   else
     ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
       $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
-- 
2.47.2


