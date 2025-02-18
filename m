Return-Path: <linux-mips+bounces-7822-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E9EA39C9F
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 13:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3B53A91E3
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 12:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61392265CB7;
	Tue, 18 Feb 2025 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GZUYwJ3+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A508D264A91;
	Tue, 18 Feb 2025 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883589; cv=none; b=KFTYRLGkHi2nXR21yAvaFJl5QMM/Rly3Mmgc4UIvUhjfcKniq3Oecguacb3T3gvfawUDPFqWLn9cn68dUx/c8z/JbQ+LTFw5JsIXdjZTvw6ja79PvZWqOyI4L0aYk7SbTixHzXeqelrsvTNjYNYpBd2Sbvaw6oRnfYYtAz8PjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883589; c=relaxed/simple;
	bh=13OK0ly+Y9D7D0IsatLoyzRKM7fn6t6uu4z+wld9J4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WCYRhapmJSXDQFipTNxX9FbUmfWPaRGDINeaX0qP89EvEKeC+uIvQmTjz3txFzKMG4q2ZcfJ7gQUP4fFkedvf0+k/DhjC07GDf2Kta6PF9h+vypytkOQfOjUo4NAzhapHvsAnU3RZbSiLHbRG3OAhYW9qYOGSuVy9bY5Pif75uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GZUYwJ3+; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739883575;
	bh=A+GxPdGU6RxcKTKTUjnNUysJyqMdd00HP+fC5NjA62U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GZUYwJ3+bXdfxtq0uJgjZLIOlHmk1KmGfAu7iS079B/3NS4rerTpgEOh1jYXtS5kf
	 Jhb6ajRPLmnZ77orbIKOIK8urS5/DIntl9x5A9cBWk8dCKLOUoWYc/MVqq53+ukicm
	 MJuIfDBsH+UGIg72FResiDnNskNeGyYfrnJ2C3Yw=
X-QQ-mid: bizesmtpip3t1739883526tocs40p
X-QQ-Originating-IP: zfAGLJ/ZbWNea6zi7EMvGF1miZNnL7+mFFbIV8HnI1I=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Feb 2025 20:58:45 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16123507562462357034
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: chenlinxuan@uniontech.com,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH 5/7] MIPS: dec: Remove dec_irq_dispatch()
Date: Tue, 18 Feb 2025 20:58:42 +0800
Message-ID: <222468E85948B141+20250218125842.667798-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N8VH26L7kmdizyDMymZ7/E9YiRux5mfMF0iOMYTYHBk8AJ5PyxtC/GFY
	n27MRIUVmQ2G1DdJQtsjsjCbq8iwtNwdPgO8NnopwXIJQA6OXma4bwyKfSvByTon72KrYJa
	xrSNFAfE4fkZn6TRkszyPG14oSZG8fRMPvK8A5f3nb4CPLzeXoCDjrA3E+7Ibo42aBxtkAj
	iZOlYFIy2K83ZPhC3NDtuh2LOF8IE+ssAFhN/gJ4L41jNQu+5NkfGsginvYf8riI48rF1iJ
	u66atdkWGq/SO6vlt866QH2VwY/RDLyaTteR8GvcGuszDz46sWoi1roHSYHKXIJrv7VBUzi
	KDagpm1JZJUPvN4eKKzSGgsMeg+d16tWXwvC3LuXPFOmf+rpQ4rcqCUSEm38gNtq+NK3Ybg
	4n0Yoc62BqaUCQ8ZU86XhJmxOeU79d6PeVy2ftBzi5tkQD6fuQMToEGLjZEBhoaRoeQiWpq
	aLiyhdkAXD7xaUZrxTOyN7IyIKZPqQ5vaj+g0Mqh06dck6GoEbzpgLeE5N1CSIEZ43lwtT/
	Ny1qvX6cW1urdTSPbvJR1gmLcPp+5Es4v6hkQmFCC4kgGs2EgyLQxoVb4oXoAqUe0Mjda8h
	Uq4Zh5y2/UhKEdo5RT4SgZbbi1tn8uZbdKw3Mu8tx2ihvx1Qlvk8Hg1bl49pB/cNvGYCyyY
	zYwrIXFhTeuUkA90ItXgNbvoQMi8gsHRdhgsV/vkS/+LdlaMl05U+ADwo9xQsQVYQrugd7F
	OUwbp2Uj4jT29u8DvooOdJg1UdxQ+I3U9C6PmDrVFgq5IYoAt/+EsTvG2cySzoMAPK+nkdr
	QAevBg6mbcHuPke9C+u3Hju18A6bwXf8ITB95gerRClayl1BN5hr4/vyFO5jqYHoZ2xi6jg
	4PMOfaA23/N3E6wKgtFFA1MvRHaz1NudISPjhuAwWksNP71rtypyRiYgvug8NbW2oAgKEoH
	bn72DVRxmKyJLMz+GGt+Gon8gozAw2WAtLnieHnTfpmA0PmjqTZln1Ec4LEbJjGMws3nluK
	EGwFJ/pEEaCDbM5SUMbESv593Qllw2Rb7L3B5cK+IVWX0wOssHZekqpVKEY4rd7Kic3vXDi
	dXgiSg3T/DncSz82xaq5qE=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Currently, dec_irq_dispatch() is exclusively invoked by int-handler.S.
Inline the do_IRQ call into int-handler.S to silence the compiler
warning.

Fix follow error with gcc-14 when -Werror:

arch/mips/dec/setup.c:780:25: error: no previous prototype for ‘dec_irq_dispatch’ [-Werror=missing-prototypes]
  780 | asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
      |                         ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[7]: *** [scripts/Makefile.build:207: arch/mips/dec/setup.o] Error 1
make[6]: *** [scripts/Makefile.build:465: arch/mips/dec] Error 2
make[5]: *** [scripts/Makefile.build:465: arch/mips] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [Makefile:1992: .] Error 2
make[3]: *** [debian/rules:74: build-arch] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
make[1]: *** [/mnt/83364c87-f5ee-4ae8-b862-930f1bd74feb/Projects/CommitUpstream/LinuxKernel/Temp/linux/Makefile:1625: bindeb-pkg] Error 2
make: *** [Makefile:251: __sub-make] Error 2

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/dec/int-handler.S | 2 +-
 arch/mips/dec/setup.c       | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/mips/dec/int-handler.S b/arch/mips/dec/int-handler.S
index 011d1d678840..a0b439c90488 100644
--- a/arch/mips/dec/int-handler.S
+++ b/arch/mips/dec/int-handler.S
@@ -277,7 +277,7 @@
 		 srlv	t3,t1,t2
 
 handle_it:
-		j	dec_irq_dispatch
+		j	do_IRQ
 		 nop
 
 #if defined(CONFIG_32BIT) && defined(CONFIG_MIPS_FP_SUPPORT)
diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
index 56a7ecf06b7b..6ba4c4973c9a 100644
--- a/arch/mips/dec/setup.c
+++ b/arch/mips/dec/setup.c
@@ -771,9 +771,3 @@ void __init arch_init_irq(void)
 			pr_err("Failed to register halt interrupt\n");
 	}
 }
-
-asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
-{
-	do_IRQ(irq);
-	return 0;
-}
-- 
2.47.2


