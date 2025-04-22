Return-Path: <linux-mips+bounces-8693-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF3A965CC
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467AE17BED1
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80FF2144BA;
	Tue, 22 Apr 2025 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="etRAOVNW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1A91EDA2C;
	Tue, 22 Apr 2025 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317459; cv=none; b=i7/75W9u94E4BcxGF+V8eEsWf35iss25y53ZhlosXAkZZjU+D5xKOGwISeCe1FCM2CAGQ4o0xG+UEoOIs4d5oeXlir4X3bqxSE6rIYRUiGqikLST7JwU8+qD8zvN4SzrdM0pii5uPL3ui00I23A93mxLZn4z6uwR9f6+A3S8iMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317459; c=relaxed/simple;
	bh=gjmegUE8nkvnqYGAzoqCkp0JHDCzhgmR/Pn3cCV+J30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF3COSt6Gm0nMj/62nVhOPrf/GtOEfXUkw5wdqWstnYHzw8cZ3Vp0g4rE3pxet0TmpBdcfYOk+XwO99EeY0FEfy89GUB1RCELjMCHb1r7o1Q/ehSx4Z9Ktu1MeYFf3D5QaidplL2+i1AvcrPU7u90WvxhvVeagGVa+b+20Fktwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=etRAOVNW; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745317426;
	bh=p13p1deBOhuoKBgpdie+NXcLOjyEkv+MI/7mj2NH+KU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=etRAOVNWpcQMSe6kfltvgiXywzE1gZ7vczheoe9UxbuHoCwRWLFHo05GrMTRI+o/I
	 aHR+DlAtBDq5TD7ilpRgQsEiV6ToMbg6is/IlQB7QqUpsEH7/c2KAxGMCE/+SEPvrB
	 bY0EKfzKXN5dvmEmVQM8hz7aTnV2OU61eUBU1tnY=
X-QQ-mid: zesmtpip4t1745317385t99dfa428
X-QQ-Originating-IP: fUrGjttCi44eEZnGCNZku/HmudvD3QI6pVKyD2F0rW4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:23:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9625508605425131605
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
Subject: [PATCH v2 2/6] MIPS: Eliminate Redundant KBUILD_SYM32 Checks
Date: Tue, 22 Apr 2025 18:22:49 +0800
Message-ID: <5D20D311FB1FCDF1+20250422102253.137944-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Np+/JNR9oCIP6eIBrtHRZQ4VzIYzIVjpRNQObTetPVIiFtb0+G3L7g8u
	CiS6fuXXGwZy9EVqsGcn4Isjw/pNPmQabRn8QMJ07rpfuvCbojuHqO2mCM8RJWjnnPgEay+
	KalQSm+h6/ioXoMPcngZSCw/reNIb1d+Rs+Ki+QnIT2cDe+Nfezkqdh7UZ0KkmvBmA+8wWH
	qgfjrhXqNWDMuFBCZiCtSEEs5cRRRD230+JCC/QCkRcWN6FF03rnw4HrVXlgx9Dk5QCAV8a
	Z4HiOTZ0OJvOe5vf9H9SP9s2BO/p8VNi3KWlgz06U/lpNMf2vVlnalWG3et1DlclHAXtI1S
	OA8Rp/81gaboLfWlrl5thIQSyCrWW9TknSU9SoNqdFdiFZDfH8u0bQqLe1+AdQQaOxbEHaA
	0B98IwUjUYFuTqHJHXmTEitiNONgjxJsvbKK6Yb6u4QJMRaWyYsZA+Gm80koqjPUDIC+Urg
	sjc5j1UiflEUG7csFEd4vuRKp5XKDjqkRDmAhSJqXsWptJliaQCiX/ck27Hq21j+Uz3Z32D
	5rxAmfUfAgCmpzybRLU1nmg2wnxRnHlO4G2BYhe/QwAqKRDkqhIyiXpEphc5gWgecyO20KI
	WbHWtxGhMZI/Jkliz7+h83HkByjzdtYyzr8KFHDZ9quRDrjHBb0HTs3rHWk89/6vbuEaN/W
	A1AjLTOkdVIReH15K1UAloHKgloSwl7q58ywaFIZLkkeQeX5gYNiZ9FaXY4n8ULwhsC2PU4
	v7EkFCAcPudxmwAlRyKI7wLESk+HSadbPZu7aGrxWv8L3QXXO/nZiGgfCB9aveg3u6QLBNK
	xJKne2g2zG/SCG02sSsPrT0W1TSwj23Id2MvHbMgAeDlqWH5+uIOq2vzaxFsAbyv2m4LC8i
	dFYQheIF8iQJeQ8G5iImcXvpqJ7MD9RnvDk1t8sot343+e05GJzxHzuDvmmWWvNzfbkr2Py
	IVTicdnyFvSm63UoEReUXlsigsGZa6N9nOClsUNM+nYikDuVZKgrQJydJB9eciXUR+wrOQo
	3fkLfkCl3lLxnArvxcOpIAJfhdsLw3ZjNf4OWO6IBiwu+T7m67kmXVrTnfeRTjzy0e2zOFZ
	VvXgltYipH7PO04UlfGyXs=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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


