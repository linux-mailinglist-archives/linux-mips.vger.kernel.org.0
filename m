Return-Path: <linux-mips+bounces-8307-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A43A6C798
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 05:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A8591756D7
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 04:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF2113A265;
	Sat, 22 Mar 2025 04:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="g22LYAh2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0772A1CF;
	Sat, 22 Mar 2025 04:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742619134; cv=none; b=gW+UiQuWRsC0hA5UU0IGVdUXEFagRANFRSNLpbDIZKtjT0YPzUugJQEorsTF0xldpw4MRHhrqDjTE2hQP6aK5n6kCkzcRhN5xpMiYZwicvioKqaZ+7iF7cYfU9cYcRUXr5GvsOwWP67xE5L4oOepYpVIm3KiJ11WK06p84BpVKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742619134; c=relaxed/simple;
	bh=ZqVUq25vtch3NJeA9V7qRbEw121ffeWJF0AaEbjIsIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rVxOpyBGkR7NoYdRNRmQdZ0sM34eMJN6/PTyMEODgukpu/aJNY2MX7TrskGcVqcm8ll3XuwLIzdjbw9pLpHrCr+Hub+rNS24TpaXaFiPXEK3imTfvPxkWDSrjE8BGMg8gBlJylYWDDmz7IPp+344Yr0zFMDpeoYNXjfX7+v8yEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=g22LYAh2; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1742619066;
	bh=fVbG1ZybPjQGplyq0kjx9MEJAhkFMUZGQ0sNVT/4SNU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=g22LYAh26vTaA2Mwq44pPL8lcuuTUZ5w+VoONF8eFm+F4KwfFDc44ZJ/1Yzff/KUJ
	 ca/5JNieJEuHZ7c1BhYG3h6EOu3RYBGbRWOEr9FMJ7B0F6SGjlaUxmb9a2BtTqV3Ve
	 Z9SbhEwXkehlP12/YL9+tHociaiP3k3wo0cn+VZA=
X-QQ-mid: bizesmtpip3t1742619052tkyi4b5
X-QQ-Originating-IP: w/M2VUTH20i9uV+YShiougwZMCayxu44nfhBTm/ds7g=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 22 Mar 2025 12:50:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5458398049186991101
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de
Cc: wangyuli@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Felix Yan <felixonmars@archlinux.org>,
	Mingcong Bai <jeffbai@aosc.io>
Subject: [RFC PATCH] MIPS: KGDB: Remove the useless "nop"
Date: Sat, 22 Mar 2025 12:50:34 +0800
Message-ID: <4621EB3971C7BB9D+20250322045034.297491-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M8Li3la+wnbNEMPwE2ICO7DlZu2V8P+//HPSdP6KQPdLbKkXcoy39CsM
	zNMH32InHcy3rDI8uOLPoyn9A7eJBfxavLP4X6QGisG2QdyqKBI4eP2J+VU3KlQaBGVgX94
	phn6GClHCrExmSeqgb+CG671UFq5tul2x8SCTpvmyQBbaNeSK7QwSVIo6OI/1p9EwppOFek
	OkXJKFrxjukq+xIM9Gfzex9zz3zHaHPTl2ZHpNafUXUM6p5A1i0gtpH0b9Ey82oxHnya48z
	gEpqGkSc6QydNNTOEWCDQHqqGuNi3SMX7TrUTYKl2yFSM1wesHaZx1FJUoVuIkslka0kO4c
	eOT1mHrfDbIH1/YeYS9ciDQrX1h7zhRN+4EE1EjKPyhJYnqbIOcB5aqtUGaUQuU6IEsSfLR
	O486Rmaskfk+QPX5G/iWypYeoucrUfiAokLGaLHPaR4KfX1OSfg9nM2f84Rf6nmObrzcspD
	Zs0OG/z0hzX6ERmfaEsktp/XjQ07hCZN6GVRVNbIDbZTHBMxjaPlLLZxFGpSbg6zaznoAe7
	cskSWpv2zKvVEAKDsatDvaJ5yobPQyAj3lg4xzNvSj6NbFF3qfVuNG7rBoDpOPolcCD7P/7
	Nvsh9e6cyCwOND/IHlQ3uvjbOGeUS761uqtqfWBvw2Jh0z5A+v7TwGV1TjkqrDjNfJpCLPn
	EI5INq9Chm0Tdj2nNidUrq0VRihjE+TX3CcZCedBtQSyXQyAIVH9tEv8Rzwe4D5FXBMbctq
	/elL6z8+gHhOxHaqH4JaPOWGjHRmEYAc2UAnhe6t7p0iT2qEhV2l4jvLeTq0aG2oy6+Abug
	SfN4b+ZIEEQ60WAMSzQMZMP9KeowyxpsoJo/eykIcFZICXIWLQiEeqh2nh2ojmHvnY/Hupv
	roVUUPeI4cY0rcRlYgMslknSm887TNLxcXYsaxdEgs62mqpjsL7U0gvcYtZ4b9q6t+QeWO2
	hlmcVrY06AYv+gGu3mkPUm+0jdUZ4ffGDOfwybjC+ivgy1YRFg1ZCOAMsoMfM7HjwRfuF9f
	TBuBcg3JbMUNw2gNfJ
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

The nop instruction surrounding "breakinst:\tbreak\n\t" appears to
serve no real purpose.

Its introduction can be traced back to commit 51c6022fdb ("[PATCH]
MIPS update") within the Linux history tree [1]. This commit was
substantial, comprising 41010 lines, and provides no justification
for the insertion of this nop instruction.

Based on the MIPS architecture specification, delay slots are only
present after jump instructions or MIPS1 load instructions.
Consequently, the nop here is not intended to satisfy a delay slot
requirement.

Thus, this instruction is suspicious and should probably be removed.

[1]. https://web.git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git

Cc: Maciej W. Rozycki <macro@orcam.me.uk>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Felix Yan <felixonmars@archlinux.org>
Cc: Mingcong Bai <jeffbai@aosc.io>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
NOTE:
  This patch is submitted as an RFC due to my incomplete knowledge
of the extensive history of MIPS.
  The nop instruction in question may indeed have a valid reason for
its existence, but its origins are likely too far in the past to
easily ascertain.
  I would be grateful if anyone with relevant historical information
could take the time to elaborate on the background, such as specific
models or microarchitectures that might be impacted by this change.
  Thank you all very much for your assistance.
---
 arch/mips/kernel/kgdb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/kgdb.c b/arch/mips/kernel/kgdb.c
index 09a2d7bb9eef..d6ccc7d2d34f 100644
--- a/arch/mips/kernel/kgdb.c
+++ b/arch/mips/kernel/kgdb.c
@@ -201,9 +201,7 @@ void arch_kgdb_breakpoint(void)
 	__asm__ __volatile__(
 		".globl breakinst\n\t"
 		".set\tnoreorder\n\t"
-		"nop\n"
 		"breakinst:\tbreak\n\t"
-		"nop\n\t"
 		".set\treorder");
 }
 
-- 
2.49.0


