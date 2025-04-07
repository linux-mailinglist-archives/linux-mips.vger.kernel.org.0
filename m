Return-Path: <linux-mips+bounces-8508-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC599A7D661
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C367D188BA9B
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECDD2288EA;
	Mon,  7 Apr 2025 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="l5RoOhen"
X-Original-To: linux-mips@vger.kernel.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF0227BA1;
	Mon,  7 Apr 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.124.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011482; cv=none; b=byoLSdn+++4TKvzxwl7xFZXvNUbW2AcHhimfvkdM3KpaW7jM2eu+Pt9imKwk6Na9dB8CrCPUBreGt9Tgg/EVEIDPvQTyp5Pi9qnP+iDLu6yDbSwSArZyHd2KlaQcV9z0tdRDFRXNpp1ixpSwck533fu70VfxYEnH1rGpbjuQUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011482; c=relaxed/simple;
	bh=aOUxpTx+k+5fk5OYmSww98phSSuRsLaGNQ+0Q/iRm8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwUfDjRi+9jfL/qAYJHwhFkaw7UmpN0UIu/f6Lruokil/0qK13nhewUQI36gISfkmRQZEXoA+vbsmU2XGTc5l7smCh2TbNEvOyd1hKmf8RpymoSC/XW5KA/MELHuu9+eCOhILmQ4ATwDVQ/PjboXQmYrhqFsJdW8cIt1BUgbVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=l5RoOhen; arc=none smtp.client-ip=114.132.124.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744011454;
	bh=nCPkl2VraY01qejRiFzb+h6eDDwwwG21C+d7Srnl4uE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=l5RoOhenl4hqc8wzdxZeKwb+vDXPtWL3CXJjX312BctMKZhSWPAvQ3L2MbpexH0Mm
	 X0Zoegsv5XMFGY6vyHb2i8wGC5fDV9tJ3VDNd37byxum2l7CJzGoRXpFG8awvPHuzQ
	 E9YnIJAfmwLQvPKR9shG5IBv4cxgMsBDeNMfL/T4=
X-QQ-mid: bizesmtpip3t1744011412tc3d219
X-QQ-Originating-IP: 02OFKp1UY6jex5kRH9rXwrmPpRDfOW7UJZq8ASGN5EQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 15:36:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4522790010008692420
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
Subject: [PATCH 4/6] MIPS: dec: Remove dec_irq_dispatch()
Date: Mon,  7 Apr 2025 15:36:20 +0800
Message-ID: <9A0AC98FE53685E8+20250407073622.495364-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
References: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: OYpbVsTx4C81075+4uUd+cpuLNkcU8AJSwwchmSUAyTC0HB46zeQF1Sr
	C+SAB3SkaXQ5lkAtYofK8OMu113e+cwOw/f0zHjt5H21ooZwjKzPboBX2E3nHpLRp0eHLMW
	arzjB+Cbfuvtq06J61iZhnkpOimpYzPIxBlm1XSHUcNUqWaJcy/IszyWXAfnmXAhaKTjKhm
	CVyINRQlbUQRY/QRUu4WSVlO9Vzh29jgKxrDNL1kO3YT65RMvtRp4lP7yIyKlUChUqm5whB
	EIU/NgUoZAaLdqAlc4k2P7oXn3BPqUFQ+h5JZUHL09csMCiJ1fvyEoQ8t8Kj+xhnFJQp7bt
	4pPe0QgLpM6igspkpGTPro3kyQd8bzrMh9OzVXYHf9mStAFNp6cl1o1wmxQnyjKDPqfO9L9
	CEQgeeaCrFxmGDFAcFmBc6wOJmdWEztf0KsJHgwTr+WH6JTE+Yo52KiNx4iUBEKX/WnNxs3
	px9H7S1zQBL6Zj3DutSgUrdWQv1M/0vxt09eGYuvTu985LipcmYmgUiasXFmngW6bo2+ZqL
	ManpwKShtzxBwxh8L24ooF5Jw56TLWq2M+hHr9GYr1Jnc2MWMjmYgaK/1GTonMJeX8KmsH4
	vB39b2yE75xtIaiLnSNnjoqHE688K1AAbPAuT6j/V+ZOlKBgrhsj2iEZYHuDI0wVgPn4s9g
	4sWKFbTx+/Xw/nJA7KcRluWO+Zd5+1vQPcIwbK0JH7ALHbt2O3VCm6O3r0lqZlCSlRPR87F
	G2kYfmeF1gAzE7a2kCURkFSAz7rn0OESt5DkKj1BqTUKrhdbX52JXD9OTze6Ht41QH/dsRW
	g9Yt65LscLd7unMXMlk0YWKRIdJ5mdlMiGCjJBAT8t9LEk+OEnzn0eLoQ2QGKPolviTLaCF
	O5GbgP4iAC0y1U/WzRzkU5DUkwskevZtphiX3JMTL728sVlNB/ZMV5TEZxnybtCTfHlTtWo
	5nCBz/zeHnT26XrXcozA1o0q6LfwWZD9ZbjXuY+v5ZkyBMMyR8aGzCLAKBMiNAqoNBoPINy
	tMr1udN48O0TSxcIyRzpH16ogrklk=
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
2.49.0


