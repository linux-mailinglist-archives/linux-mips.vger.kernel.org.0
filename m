Return-Path: <linux-mips+bounces-8691-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECEDA965C9
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A76A173B7F
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412AE20103A;
	Tue, 22 Apr 2025 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dF6E9pqh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9319F510;
	Tue, 22 Apr 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317446; cv=none; b=Qn+PO1I8tSCoc6LXTjukJiFsArBXq5A13fMt4IcZKgpyGcf0rvsyr4Q00OpaHCoa00YesYDBo757YEVQOQo362entLTl/or+ssO28ltmvhqQu8H5ySDJKAxaWqcAI5B2UYR4xcz9RCtFoRwLqbMdpGZ1np6Q39/E3xmLxMHfh5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317446; c=relaxed/simple;
	bh=QwylYaArHciXtrOfCdsCAGn0Ril2BBTKFUXlFhVuIeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRoUwXUHJXzaReHLq0b3sP6aO+hDvOBJzgU19tQLdXkAyuU2rqiM5fxuqBCIaHAUWOfD4TGO05iqXXqfUwuYbqvU3h9NqLxUvjdgPFGoR+tUEdgzD9CfhLfMX98+Ll0N5CamDPLWetKrS+9PC6LJSV+3ofAEccYeOQXBWwxZXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dF6E9pqh; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745317427;
	bh=WlmB1lqRNxFbFMYPeJr4njtQ9mNImQJWs4aHfijngHw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dF6E9pqhaG9bHpdcJOM0lqVFCn5WstacrdMGBx5UtVbSG0mR3uxySrdxgzcuawbsg
	 G/Jx9/RQyZH33e88TjmdkiLrZexRmDCMB/c0+apfYG7IZlgnkddnPvmHWrmmtH1bkk
	 XJLidj+5g9mvpajBWxa0M400uL/sgC1uWH8LWUMc=
X-QQ-mid: zesmtpip4t1745317380te5bc3dce
X-QQ-Originating-IP: WcYi1NZqqtZuTN8yyNwmSTGUPHkECqFH8z/doLuEEKY=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:22:58 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8748779318587994258
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
Subject: [PATCH v2 1/6] MIPS: dec: Only check -msym32 when need compiler
Date: Tue, 22 Apr 2025 18:22:48 +0800
Message-ID: <C7DB555D3895DE54+20250422102253.137944-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: MYha8DeKTomkKz7ip5AbqtPm+f55dSHKOIkcSp5YTMmmWUNKYykEQDSR
	009n2svWpFISYgXSwVF12JPOOvgtRHQlN7R5YsRayrYImq6BfLTzXS3e1faehVAS+SQ6b9R
	ZiLHigdEIa71eOj5NGCrh9Mxec9QLFjEOYFx12+gEhRYZi/wxZAOoCqh/xUey4ZtA0+rH3L
	l7XVzOI5wIjUOq2fFhYp20bcUyedzQRcdLdRMi1mjPbTHufClT2qievbJhP4nNVXIZm+1QW
	QC6fmIvHQosoE2KkVDB87TVdCpO0+6M5hR1oEtJAkxt1okXAK2tvsSvyanJEx7eO3yas8st
	sRL3TE75U2zPbRgrfF5c0rRgwfoG+eFQILCmngt8lzmCOXYDFljaigQ8D1/hohhjHuPkJE+
	tfUG78d4MZTFWdY5qqzCEcMziycEFpGbbqczvua0oXshYL9eSp8uDWQExDlhzVzz/pf2unD
	9CpOkEDko9e4jsy3yjybcgb7ujRIVRIfqi2SjGNMA3IwuA07tb6jk4gNTm77uC1pdQbTJ3Q
	F2UrTwtBML+ipzJpphJFZn08B35P0YscOJGauGCjFCeF01kutz4yxGTaBeQ0PTR9ZOIXLSt
	tUhHryV91dfTR5Po2GDkL657xWcXKX1hnLC8aheVMO0aEVhhZaurtCSR/ns8qkow3qHfhO8
	06sRWgXUdbF5pIALqx1kMOYux6t/w5eBkA9XEFCZ/N23Aeh/La/X/ZzzVHYsUMl4i4XoTqK
	43LrDndHHGeJe5pMm0eDKwEnvakOEE7SinrA0F0qKCEWyOatV/zMHSC8ziUaYz0KpSYoKN9
	2mI7WI6MGiHJG/RXW0jolAMDjPAuKHMLeZFZ+cv7tQONj11cPiBqOYwEcgkIqQbWhiXsCha
	XAqeLMwufYXJjhkcFyA4uHPKbX9JLY7lPYZwkU/X8lwgcYCw76wkLAGkltuYqvckfQh9FI/
	aXhA5bOOxxjVz7W4dO3lXouJu5h0QBDn/HiN3r27ETzi/5bYZRfnwzCvEboDZpR1hmt9W/o
	pWYg1v8Ry/xPYfYTs8gDfaU45vfeV+Ox0hHaE5jY0LVGe41a4V156iQ5F/V0sCdVhMWtgns
	IXKFGy7+t9lPTMPwF5BQlM=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
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


