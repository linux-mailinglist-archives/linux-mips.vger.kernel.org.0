Return-Path: <linux-mips+bounces-8694-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185AA965D0
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC767AC91E
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7CE2147EA;
	Tue, 22 Apr 2025 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="J2w0Bi7m"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41730F510;
	Tue, 22 Apr 2025 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317460; cv=none; b=CJ0o1o1GpXLlujlRQuSO51P/A4sLKqooPp8s6PzAwwrtUcUHKFlWTQN9rTSZP+bnSaROqqhkYpNAN7Sr6Owe9qt6fD+b0Mj2DIlKtkYcSho8xPUuyEkJAMycgbmDWScK3Bcq/A/7yE0PM6WdZyUMsxmp/EnF9fgaEsM5WhlBTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317460; c=relaxed/simple;
	bh=aOUxpTx+k+5fk5OYmSww98phSSuRsLaGNQ+0Q/iRm8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BRB4fYOccqNNZWnqk0HueMVfxydgyRR0HwaBpXaNXkQVumZweFjYnmU974p9QLbGPX54gHHKC3HCVcdLsodJuS+DB9EginmkOvffsjCGu24NL8DUe0Bf5zINZWbES6mXh4jDZxUqvHyFAkDRAHEoz+fSAbXjUAeLnH5HP7XGXQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=J2w0Bi7m; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745317443;
	bh=nCPkl2VraY01qejRiFzb+h6eDDwwwG21C+d7Srnl4uE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=J2w0Bi7mtIzZfxhm5IAz0Sgsac33/7czxgjkkMyC8CaOd50F8GI1LhxlS1/h5v2sJ
	 PRVLkiarJsErriFSE+VSMT96mSkyiFLehv66tyW5XBl+fuFV6ku1hF6ZDCkjXlkuFu
	 +d4jvcfgF1/iredxKTfslJ1jm1BxcAtEENrmVVRA=
X-QQ-mid: zesmtpip4t1745317399tb833f869
X-QQ-Originating-IP: pn0vdm8843sak/UTPiNLAc1jJEy9sFECKFGIZyXCzEs=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:23:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15127516559595859823
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
Subject: [PATCH v2 4/6] MIPS: dec: Remove dec_irq_dispatch()
Date: Tue, 22 Apr 2025 18:22:51 +0800
Message-ID: <093E43FBF9F4F005+20250422102253.137944-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: NHaWRpycPDeTUbKqbCmKp7OqkX0jNNN5lm/T/P/pR9kHy3n6r0kgsvK8
	lOVt8OVDMTWUVgdWuEU+hZSsNdaJ6M6vTVzmEbIhVxJP/hBAeuNyRmLFcNQ84OaJBx4Psia
	5TgXqSSAxWt3/DCxr7xOLbx6C2CkRKCTknBjie6GzS2Hwg127Fx3acw5cLeDvQ2ePCSmj8h
	udkotD1DcBPNnhTs6g4uWdty+oNpHOGLf93zEkeEhRGON/T/5fdfSwNFv0hS9tfpjdjtBc0
	pCj+n1oYApOhxulzmYWXSXbnebLMUfittmjRi524K4Y04hkiXOcOKV4Rq7UuneTpBp9fKF9
	VnQ36sWtraHHPzBjs0pEG32+RSNOlyuXwf/BBboNpgbPEqMV35WRPJ1LSps8qxbuGemwW3i
	XrJsfSp3Yd0W+yG7SY/2tz+1RcXY2fcuo9V5SI7CIeWfmJjhm1waxUrANNLlcIH0q1OFQho
	Jw4VNRu4YFnvsldk9sh6VfLxfEaW4TZgovFikonKWrSt0sZlc98FHL8Xqv3UgWI2+VSCCik
	N59sjJ9kxqceD293rA0OUKD0TQlven/kvcEU5ailXdoWnXk0e2bUj0Zrvqgbp2xnC2WgOmq
	lPyrCgbInvazZL6F0rAShUbIkohzUrZvf11lDYVD7u9JW4dZEfeEeD2GC+CxDSSfYdsrC5w
	E+13ZrNf65errcp7kYIizOxL9Gt3YM5HORKyIhdgaHKWxkQ6C3MF2xJ1qZAW1pxTf0rT5Bt
	+1g8Dcs1Z7ojMmM5TQrfZCIgqWc8mhFObZ6VNMfar5/OgXmzYBC9HgJkm5LLpxsfltAdu67
	cj0eSYD6T2dCAF/U8MN1a6CPkY/Dx0oIXk2CDIoJSJPGcl1Mfkom5/opTZWT4RnbV/6uD8L
	JdqOVL1dzlEQmbRcZQlUx+kYLg5Htj+/Ha6DwfL961xcx/aVCCAAELmkdorSnMLnsH+esmk
	kY+22pH9S/lrlm4Imn+IpIINsALKxHfMGO7CIFRaoWivv1ijCIIhAy413wAUMDUTl2cUlje
	6HUpUX6Kkxbs7NgyJV6FzEWuamccBYernDTU2GGzxqkWCN6hNg8bp6RZbW2xly04RlOaQi8
	OTY7FCMY4pw53uGVwJAu7w=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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


