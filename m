Return-Path: <linux-mips+bounces-8504-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F74A7D642
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFEC1689B0
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A2522578A;
	Mon,  7 Apr 2025 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="qOGA7VQq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DC71448D5;
	Mon,  7 Apr 2025 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011462; cv=none; b=R95TCyCGo82nkMzRewt/bV+Fm3APjyb+nkMeTGIQC2+jdLbENkh/OBnpoT2kjYH3WGr89DVckQkPkG4LQ81Ie68MjJrhJX0V67gnfVwqtWTQsFzkL0z+rJhC9Fgtk4Eq/gw6cKqcor6kpqlu5fP5wXZj6xJQTpFZVZcOZj7U14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011462; c=relaxed/simple;
	bh=QwylYaArHciXtrOfCdsCAGn0Ril2BBTKFUXlFhVuIeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjR+J9MZnfWM2iDRQo9b/MbsAT7mJxHitV7TMrF3AvAT0g5iha7aDLKJA2TMtIjNRvZaF7VhQpOEJYBCf36ouvXEJ2Y5Ah4XhymiBW7bMdkPJTpo1Sq0IK6MC2Gj+Qja9oR8W0YKZLTuiJbRuMYfMszK+UPIjfP/O0PiLh1/kCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=qOGA7VQq; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744011441;
	bh=WlmB1lqRNxFbFMYPeJr4njtQ9mNImQJWs4aHfijngHw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=qOGA7VQqyAMftpEkBpZiIHO/vAKbQPjA4PuHhTseqUp3ikxsycsk+5B05vwGy5wJf
	 KYji73/OtS49J0u/ujdzxP/DBPBkMdINMD0ITLkP5eLQ4A2qyINvJeoSK2pObpRozZ
	 PoWA7wQN00W940eeJO7vAOwHzz/eNqhfsxFLmMKw=
X-QQ-mid: bizesmtpip3t1744011395t5aaab9
X-QQ-Originating-IP: CFrrbh+XKBuy56Bc+1fT2TuamGrReuar4te8VuaaenA=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 15:36:33 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5810228923210500629
EX-QQ-RecipientCnt: 9
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com,
	Chen Linxuan <chenlinxuan@uniontech.com>
Subject: [PATCH 1/6] MIPS: dec: Only check -msym32 when need compiler
Date: Mon,  7 Apr 2025 15:36:17 +0800
Message-ID: <EE81D854B8704705+20250407073622.495364-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: MtJoEQFRGvIzVQ3Lf23uvfe1z0b9qlGOJweMha9cFje2jw4lX6tAQ0Zb
	kuI0O8SieADnFc4LbF3dxdAoueMeZ+10JAYGFMsJi3AvT3xAOdkBW4bOrUGWeC7tBnW4S66
	LmKjlVi8kyn2rN7a7XJVjVrGwT/wQ05TSnxOSFk/oyPnI3lJKVGYadV4rCnUvAz3zqwl+0x
	9RhLp36BsN1wBPF16eRrDu9kB9KinLpmDHU7PSi+DF+so37TaseJTH5UPVy8QWMkminV8a/
	r/vAX8jI12qnHiLF7pMsFaRB+lW6Nd5/HylBPBXS3oVv7hWce+S7o07Jne0/VpfP8TGIqmp
	CpFVUJtUMVh7AsJVx7fxavHeQFQpiuJYU4Ia9rJttnsVAb/9pXaK7+K5secvpr+UWdcLkoI
	UjDW3TZdCq4dhAnmRJ7cA0osAEw30ewX8RPwJa2yvfJsfTrnCO17JBKTgd7cBSFf0yrJB9K
	5FyZRvoKyncfBVj0czEGKTV13Z2qfzQpJX8qvp2+ncBOeN8Ga565yP0yOZlnt5p/VXmgToY
	4Py9gLel3hnh6zIpLb8i0ebtRz79IoLuY/Zx6jmbBy/m2LmdtmQN6M8dmTPjwDKon/iT/j7
	5G1TNE9eJlXMDmoc9VnteVcBV7+pzclz6iSdGCvWjuXMh+Ipk4gvcD1lv/ymSUgcMCXfvk2
	tkVZeH3YubXzu9w+BrwZTMDsIWpx6H6YW+zpjo58wLRY/SxG/NQtSnmNVFTEKLdAb7htJjl
	NKUvb20M2CinpkmouJR92IEpmh0MKb4JTQGhUN5nzuz3G82j9pUdH+GiDiNvyq3uH9OgkrQ
	zbQyJKO/08wxgeGoP5oRwqLjAYcgpyGdr3efTBFRyoY0wCk2NYlYYna5+XR+910YO4cRMvf
	AWBYCk61NctT6X7mA+vH+++EY4psfb+2rTQ57UfHXRmDlxzCjzQOSukrQ4+UQCXsyhMW/fW
	MZF/p4Ian+5Smb0fkaB1Rkni1iEJtgeV6zhVgN9sPg7qhx4z8xyWtkmh9JgJjYzBWw1fbxp
	Y2SBam3eYBxX+OAbaT+QECnIytohb6/e/8KU1MHLYACIL00C84
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

During 'make modules_install', the need-compiler variable becomes
null, so Makefile.compiler isn't included.

This results in call cc-option-yn returning nothing.

For more technical details on why need-compiler is null during
‘make modules_install’ and why no compiler invocation is actually
needed at this point, please refer to commit 4fe4a6374c4d ("MIPS:
Only fiddle with CHECKFLAGS if need-compiler") and commit
805b2e1d427a ("kbuild: include Makefile.compiler only when compiler
is needed").

Commit a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression") tried to fix the same issue but it
caused a compile error on clang compiler because it doesn't support
'-msym32'. Then, commit 18ca63a2e23c ("MIPS: Probe toolchain support
of -msym32") fixed it but reintroduced the CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression.

Wrapping this entire code block with #ifdef need-compiler to avoid
all issues is the best solution for now.

To get rid of spurious "CONFIG_CPU_DADDI_WORKAROUNDS unsupported
without -msym32" error.

Link: https://lore.kernel.org/all/alpine.DEB.2.21.2502120612000.65342@angie.orcam.me.uk/
Link: https://lore.kernel.org/all/alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk/
Fixes: a79a404e6c22 ("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression")
Reported-by: Maciej W. Rozycki <macro@orcam.me.uk>
Closes: https://lore.kernel.org/all/alpine.DEB.2.21.2501030535080.49841@angie.orcam.me.uk/
Co-developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index d9057e29bc62..1fffc6cf8b52 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -284,6 +284,7 @@ entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
+ifdef need-compiler
 #
 # Automatically detect the build format. By default we choose
 # the elf format according to the load address.
@@ -304,7 +305,8 @@ ifdef CONFIG_64BIT
       $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
     endif
   endif
-endif
+endif # CONFIG_64BIT
+endif # need-compiler
 
 # When linking a 32-bit executable the LLVM linker cannot cope with a
 # 32-bit load address that has been sign-extended to 64 bits.  Simply
-- 
2.49.0


