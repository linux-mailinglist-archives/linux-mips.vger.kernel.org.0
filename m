Return-Path: <linux-mips+bounces-8685-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E2A963E1
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 11:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56BAE188B828
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 09:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29D7256C6C;
	Tue, 22 Apr 2025 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PZk2DwvG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EA62561D9;
	Tue, 22 Apr 2025 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313080; cv=none; b=Jh66YBe8RCNaRJ4+/QTwiFzWGjsIlSztp0Hfn1/sFnuJkzVK/ZHGuC7z2RcMHHS1EEuIWP1SzJ91LPaA/WBGEh+rwh3XfMQYK6e/Zh4sO2G3w0KHHH0wj+rdnoMSBqVB+nzdkqnvLI1CnLklh/vZFKJznIZUVIyDtCcQzQXKZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313080; c=relaxed/simple;
	bh=WBUuOWQpdrQOFEYaOQmzhp+l1UfStjkHFbt5cXHqFZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pv29DmMds3n0gXIrhMm37Iv6RKemNxNX4CfyVqXJAd+ONHiySGdBwghdGKlSCZ8lGEHSp1TQLFXVbCNOyuFniEYLf5Pbjv9QF2CrvI5a2jaxDaBTOdDckwbY2IJLWT9lCek2zdKofdiDOoh+EZJLgbhfL7etJOUQwY4vShsQRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PZk2DwvG; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745313025;
	bh=VGWZpF9dZHrPeszei/T2CQ20Hv6zpF5SOxVEFV93m3I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PZk2DwvGYkpS0AnKVdURrYXzElCQKRjKLaBey04icBal/iGZSkpps5UzEfc2d9k+C
	 B4p64dQ8lIfIoLTIHRLwKLFttobKaxlzT6by9B3Z25mqNTN/dx2Ig83s1NdB5gIBlG
	 9SUlFQp39As531aFfx1Jwo1QwTfVBinX9bci0zBU=
X-QQ-mid: zesmtpip4t1745313008t2c41e022
X-QQ-Originating-IP: D2Ocb7vvYEe79UAEG9zEOt7ZAfusavGiBvAMgQLxemI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 17:10:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9580230143236949142
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	stable@vger.kernel.org
Cc: macro@orcam.me.uk,
	tsbogend@alpha.franken.de,
	wangyuli@uniontech.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.4+] MIPS: dec: Declare which_prom() as static
Date: Tue, 22 Apr 2025 17:09:37 +0800
Message-ID: <D1625EB772D42BA4+20250422090937.113109-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MlPHsU0QBEEv63P2klKLlNoevHRwHdgXgbrVu/2gjZAuqiL1iUprcBge
	5qPKskzHRFOUJcO8WXTYbo5xrbNp7XbAh4Hvs/3HNbHNlrAJhFr7rDU/mZdZvdcDEtqHLNM
	7zbegztOBn7zyM/7MOJtCFPLSoQ2dV3TX/ie7VwnXAWmvHVixKUieDKDcST9KdCreELiSfh
	+XJ9B5XKY3iDNqgOCPmchShqdwyPP0kWR3HCzAGeqsVWYg2+rKdcvF15UbgCkUEum3Wl6Le
	ySqNlrsQ7cX7PXdx141uzpTkgEKeExUgxClAmz/icDECBc3pFcNMYktlbBue1rqbknRWsUK
	iLyvCzOAavsrNPx6/nVNM3XTEb+EdVQA1jkglzqHH8XJ/qJKNlHEUXISSC8vb7lCVx/DNjc
	kAjp7n8LgXB1VknpSXFDbBDuGl26+tIzweDhfgUSsyKeNNwwVdvyYAh+FfWOsqrfyfzpD/0
	w3f79n7gV5+7VB0trPDzJM00FjKeenyz1e0JpaO+XxfBRBibrmlOe2m/P8WP7MTUBMizeES
	quTTCSw7TE/e2GOYdM8jTYhRIbh8F6tUC93j8TVOCEWAJOPexzqZI/aoWmd77a1AI2QprLl
	ZeK9af303SC2DPVlg2YInhEqX1/K5j3HPNphzgICLmuIig0+wkalQ30U2kFIGpsWiC+mr57
	3+JUu7E4Bg2ii5VgFqJvoUQr0ZzaWtSuPxHS1qObpdPw+FfNNXsQDpvp+GS1+x3yVQ93+Kh
	JXJT5djAblntj+taU7dlZt0JS5JVQB7fMAnoH9Psb1Crwt3QsUyKSa/15IXILUPWXnr94LM
	gaB/gSY7BEMy7YR6sLpPsz2+s0gt/C31AYt2qq8j1ARifd8ORKdffPti0xwJlnedVt+c+B8
	E38vwRXw7XBlmvFfXTg3srYENOws3+6NQe1M71YkQMDasRPJLAQmQWnRDmKOXrlPGwX1eNj
	eSyh5Ag4WPZiHWg1yujYXaBnNZ8g3ITTCEbw3lpVDTWDJzwnY2ld78PK7AT5otvbaCJfwJm
	7D4+AzeB1/fV/7x54T4jI8/PzSFHM=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

[ Upstream commit 55fa5868519bc48a7344a4c070efa2f4468f2167 ]

Declare which_prom() as static to suppress gcc compiler warning that
'missing-prototypes'. This function is not intended to be called
from other parts.

Fix follow error with gcc-14 when -Werror:

arch/mips/dec/prom/init.c:45:13: error: no previous prototype for ‘which_prom’ [-Werror=missing-prototypes]
   45 | void __init which_prom(s32 magic, s32 *prom_vec)
      |             ^~~~~~~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:207: arch/mips/dec/prom/init.o] Error 1
make[5]: *** [scripts/Makefile.build:465: arch/mips/dec/prom] Error 2
make[5]: *** Waiting for unfinished jobs....

Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/dec/prom/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/dec/prom/init.c b/arch/mips/dec/prom/init.c
index cb12eb211a49..8d74d7d6c05b 100644
--- a/arch/mips/dec/prom/init.c
+++ b/arch/mips/dec/prom/init.c
@@ -42,7 +42,7 @@ int (*__pmax_close)(int);
  * Detect which PROM the DECSTATION has, and set the callback vectors
  * appropriately.
  */
-void __init which_prom(s32 magic, s32 *prom_vec)
+static void __init which_prom(s32 magic, s32 *prom_vec)
 {
 	/*
 	 * No sign of the REX PROM's magic number means we assume a non-REX
-- 
2.49.0


