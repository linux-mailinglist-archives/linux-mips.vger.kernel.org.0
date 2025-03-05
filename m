Return-Path: <linux-mips+bounces-8085-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BED15A4F575
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 04:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED72916F821
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 03:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750283A8F7;
	Wed,  5 Mar 2025 03:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SoSyO24H"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448542E336F;
	Wed,  5 Mar 2025 03:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741145747; cv=none; b=hJIx5h7CLweHOFFO/8RFOBJhc9DJxZdCrtdZ7La/jdG/LfgzIVisV2jSRTtYidhC6pP47Gw88JSHBoAIXts7y3xhGHedM8L0KHORTiSBz7Fp5raK+P6gXHrZDW6B0JjY/uONevd2umbP0ockqlEfhKRYsevQRk5C0JQGkChgR3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741145747; c=relaxed/simple;
	bh=YhpqESCa7X4qwClnGLmcs2LQkm+0kkpH8+h/yk2a08Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EubB7cMDiq6hdieULOpTo/U1+F0yLoES8Y1vigxXzHonDI0QkiiAq9vld0yBZfhZ+N5ivpbkYYaX+qH1p+G6MgkLfezS/a9IDchn2OzbXS9PUbMb40j+gE16D5PlFE3W5sknfy9dHAZdwLmu4MBg6OqWVvZuDBA6+eQ1XMv9pD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SoSyO24H; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1741145727;
	bh=HFXDpVRoV7fVpwf1jPiqDZoScxJygDs+OZNWRACrGd4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SoSyO24HkHnX2kcaIVW0m4YkGfcfiqunnNxAHWg0uR5WGRdQIrP3hI9EaZq0W6wsx
	 AI5fdyZv8XMC65C72oqtDjYNmdbesLmh4THSvSRiMHUhNImHrqeMQ70ItAZFZQrHus
	 tBVnF5XNuElzVhmiOH+Iz/nYxGv3rau7pjrxhY6k=
X-QQ-mid: bizesmtpip2t1741145681t6cfh9f
X-QQ-Originating-IP: EbXEJ32OK2QiKly+s5QYaHysf8TpMgxAm8Yl+7ozglI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Mar 2025 11:34:39 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8366188937216395239
From: WangYuli <wangyuli@uniontech.com>
To: macro@orcam.me.uk,
	tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	chenlinxuan@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v2] MIPS: dec: Remove dec_irq_dispatch()
Date: Wed,  5 Mar 2025 11:34:36 +0800
Message-ID: <303EFD6BFBDAC7C8+20250305033436.31214-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
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
X-QQ-XMAILINFO: MauZFeUCNtAMjs4gQDc9KQ/B4cEYkJBUcLhRhOhmA0XYp6leWuxfWiH/
	tA7iclm/teD7yL9MBgjnpEcN+i60K3Ly/HAjA16r7mynotH+9vhS2s3myHFxO3hypTHi7Yn
	9G7xNHcEdtXuKF+bPEvVgW1EZVQxJwUHi4Zacj2zmwhQhmw16V8LvtmuNlsk0H6fw/C2Rkj
	Y6hDRwQqBh9RpaTXp7peChBP4aafJYTvlRsWTRwxmrVkMmkHSAnhDv3Dr/6IptkFOGZt2vu
	iTfiLGHQC0XBhPnRUdpzXjDtf6QpmETM38NKCSdWnbOBcgI4BvtTiFGkUFDRoW0UTM6sO/a
	0vSYVlHHJvVyayeyzje1csLhe9sCanGkIbWeKOCTCLHNJ+g1ArCmZBCK2iPF3OhtaNFAYqn
	g5VY7BjxsxQbdEyuN0Qy7mXb5H3fhJuNOZlXJ01G5jhB2APFKzYKMdcLRRY+7k8IGvYtRtg
	VN34boPsCB7hxIFRPHS2CE+16idwjw/EFHIh3HzOm4wMbaFMqKl838QdYYVHx64UW1JfnVN
	dyh0uKPRQU+9RIL5QD7KMqMmg7OanpUixtz5whF1zZG83a/ZbSsMgUIMjJCrx1JpY//Dtvx
	yt9979Rzvf6ilzmDE/c0jiLWVfCcQmxVYuP4oNRMU929fovKgjk4OilJ7cDq2iAQeGBemK2
	1z9WfoLViux1SR2mbwFiXHwZSyI3B0V758lc/o2aC0FmE6W9GOUleHeypWSAy/PfAjA9OZE
	bcKLtH8srce+6e+RDFsNV8iNwXAkn+K9Tft0MB5Vy5m4uK0VsQAIOUwOBJD/2eq7rlTR5N6
	83fBPNeWlIEEjULSl1hnXyCNNf5g55OWDC5fD/psLf+mdMDMxvg/f7NsZpQxP0LUnNQXgv6
	2Kray41Y7Gx3xi5XTHRy0YBWJO1x139H9eXNJPqv+uI97Wbd9yDLJnvPWRCq7Mm56sz4MJX
	YkcqyfuXweA0KkPM8HaKla9BkJx27PEBd8GtOoeBMgf0PAXIX9uzf6uatW7WVNg9C9o7wpm
	uqveQtCXBgIYsADku/
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Commit 187933f23679 ("[MIPS] do_IRQ cleanup") introduced dec_irq_dispatch()
function. But Subsequent to commit 8f99a1626535 ("MIPS: Tracing: Add
IRQENTRY_EXIT section for MIPS"), the dec_irq_dispatch() function is
rendered superfluous. Remove it to eradicate compilation warnings.

[ Quoting Maciej W. Rozycki: ]

    It always has been, since its inception, see commit 187933f23679
  ("[MIPS] do_IRQ cleanup").

    Up to commit 8f99a16265353 ("MIPS: Tracing: Add IRQENTRY_EXIT section
  for MIPS") `do_IRQ' used to be a macro, that's why.  At the time `do_IRQ'
  was converted to a macro `dec_irq_dispatch' was created and previously
  this place used to call `do_IRQ' too.

    This cleanup should have been made along with commit 8f99a16265353, so
  it's pretty old a technical debt being sorted here.

[ Fix follow error with gcc-14 when -Werror: ]

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

Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=187933f23679c413706030aefad9e85e79164c44
Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f99a162653531ef25a3dd0f92bfb6332cd2b295
Link: https://lore.kernel.org/all/alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: More detailed commit message.
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
index 6b100c7d0633..affae92f1918 100644
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


