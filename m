Return-Path: <linux-mips+bounces-8618-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85414A91DEA
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 15:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20A64188A569
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 13:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1089F1474B8;
	Thu, 17 Apr 2025 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Z5w3AX3q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB2250F8;
	Thu, 17 Apr 2025 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896376; cv=none; b=ftrGBcD5sJx1C5SsMwGnXKQTv58ka28F7hVFfFxPdkA+7HcK0rvOJrY42hf2d9vcoAZfN0/ntHWeIHWEXjWDcQcKoHuYOPltzMJfk2lbvAHvaYu+WS7OXx0nRER/6XzZY+wWPfng0osxK+coviVEjKLn2h0g8tDTfIXGfBNtYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896376; c=relaxed/simple;
	bh=Fq7IdhdrnNct8iqWEVHnFE0MFeEMqOyDb8u/JYxncXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ma39oz2YrOUd4qzVMdiR5HB3U43PB/60AQN2FqPK3Qe/ovJGaMb0a5vjlH68oB72UzqbfpD9qABU2Iyy1amuxKe928MHmxVYTPtU9FFTTub2hwLRDHcg0eSPMauHUd2xUuPhZE3KDYdmtzo6ZDvKo8po8s+9/7sOFEQs35MxjpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Z5w3AX3q; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744896350;
	bh=XxR2ZHiLVR1ar1sC2oj9zb4tbB77P/btLN2y/3RrHb0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Z5w3AX3qNbWE9BHreocOXmzJj3A7K3JI4mwq6LyftTa+T+HZXoxNRGjNrqd/J45Iv
	 61B4q5tvy7ycXFQgUgyvpwarl2k2qiDRU/G1FyxCeYMQLdT4W5J3BdAWjGXa+8b01j
	 YpFjrB4eexSvbztrfL+WICpHSLBUW0xSKG7kzgAI=
X-QQ-mid: zesmtpip2t1744896298t85e739b0
X-QQ-Originating-IP: LtLexsaQxwKAHGWspoZ7PEzBQe1WlPqyohCnjpVi16s=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Apr 2025 21:24:55 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16509579133343517929
EX-QQ-RecipientCnt: 20
From: WangYuli <wangyuli@uniontech.com>
To: corbet@lwn.net,
	tsbogend@alpha.franken.de
Cc: akpm@linux-foundation.org,
	jeffxu@chromium.org,
	lorenzo.stoakes@oracle.com,
	kees@kernel.org,
	Liam.Howlett@oracle.com,
	wangyuli@uniontech.com,
	hca@linux.ibm.com,
	takumaw1990@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@linutronix.de,
	namcao@linutronix.de,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	Erpeng Xu <xuerpeng@uniontech.com>
Subject: [PATCH] mseal sysmap: enable mips with LOONGSON64
Date: Thu, 17 Apr 2025 21:24:10 +0800
Message-ID: <7EB087B72C4FBDD3+20250417132410.404043-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MZqCzNCKZzA8shl6Scu7inVgMrHsqaT5zreO+30jgecaDaySn7iNzCTl
	s6tHaTudRJU2DgB55bZaB79xuD5LVY0D9b4InOpMuKDwCGJIWkCKx48/9G5sCw4bM3Cp/zi
	2CGjq0+tSj2dfek2Vbq/s2nkhOIBXN7LTZQK+dkneFAQwtHTr0RkGwAtvfJj4zDbT61XMF7
	uUG2ly54lXpFd5aedYipi58xRylJdrTIxv7GNNGW76FFplKQx8jhzwSc1Oc1lHuwzsJ5UJE
	DK2o2CZAcBKw+RWGjlvczWFiTX4XlA1ZoJZJ01nrJGnE5Q0Ra4yhA/eYBeyAfIcZeXwPmcg
	07o3tnA8ffsLEvIybQAVzSf+T05cFpkZCN4iaPrZ5AwN1kalH3JHjsm/ZjUd+CbH6yIQeds
	03eQnApVvtQH6XkF9sRpBfgZyDS8oaHJzpaF23w2YfcJNC2g+TlEsiaT62RpgQ1dBZO/F1c
	PAQpDn48DeZZVWOc+ll++Uy26QetjTi1u5YeMyVQBX5fJLGeV32BEaD7k6x/Y8wHYNmSiHI
	SrX5KzLZZpTjiIULPh2Ru7k65SEQTTmZmp4SlCzvFuH/06YBQRWxGx+MbyOx5V4WAAE9TGn
	bXBLrYHQjrTz2kGxjMXF2pyJBJQwo0yMBy5JXRyufF0pLjoY6jkl72xDRi+Kv1O51QGJTx4
	ylIoO4kvCGsTv65TSAbwblAVUpNTw34pWWOeTfaQz7nw9SvvfazADa1uO4bPScVM3KZy1wn
	Erd2Ku8TwjcOxeAUXzpuN+ZFIogunOuC/9ruF65fdUbuS2UJc3xTVbaf2cd3PKAvFTyEH+A
	rTt4n8Z5Bt+u0Y4FX4FJxBQBaxorChOep7YKcpAHVM0p8D3cwSVwzZ9Twnk/KLbrZBUUX2Z
	vQ0BlaQ0jXXAv7cL+jkQ9WAKfScYRTc1yyW6cMJHNYY3w798E9PQ/Gt+RFV1/YUldZVhy2a
	DC2isu3IakcsBQaVahlMuZHXIinn/9Tx0acd1tTJvcKtQPMEiORg7Tiff7d9oj+nCeecsLL
	9wjk+DBzX/jMWApXUxtd4r0V8kFIt2eQ9BkxFSvMq1e0xYqv1sTdiAAzoMuP3Xn3S45d8Fz
	YQUEwBKtk/L
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on mips with
CPU_LOONGSON64, covering the vdso.

NOTE:
  There is significant diversity among devices within the MIPS
architecture, which extends to their kernel code implementations.
  My testing capabilities are limited to Loongson 3A4000/3B4000
CPUs.
  Consequently, I have not enabled mseal sysmap support for the
entirety of mips64, as I lack the necessary devices for testing.

Tested-by: Erpeng Xu <xuerpeng@uniontech.com>
Tested-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
NOTE:
  1. As I am unaware whether other 64-bit MIPS devices function
properly, I have not yet modified the MIPS status in
mseal_sys_mappings/arch-support.txt.
  2. From my perspective, it appears that this architecture also
does not rely on remapping the VDSO, VVAR, or any other special
mapping. Nevertheless, I believe it would be best to get further
confirmation from more expert individuals such as Lorenzo Stoakes
and Thomas Bogendoerfer.
---
 Documentation/userspace-api/mseal.rst | 2 +-
 arch/mips/Kconfig                     | 1 +
 arch/mips/kernel/vdso.c               | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index ea9b11a0bd89..968a6db8afb7 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -144,7 +144,7 @@ Use cases
   architecture.
 
   The following architectures currently support this feature: x86-64, arm64,
-  loongarch and s390.
+  loongarch, mips64el (loongson3) and s390.
 
   WARNING: This feature breaks programs which rely on relocating
   or unmapping system mappings. Known broken software at the time
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc0772c1bad4..055a185deb07 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -25,6 +25,7 @@ config MIPS
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_SUPPORTS_HUGETLBFS if CPU_SUPPORTS_HUGEPAGES
+	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if CPU_LOONGSON64
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index de096777172f..6221f2dcedb1 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -167,7 +167,8 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	/* Map VDSO image. */
 	vma = _install_special_mapping(mm, vdso_addr, image->size,
 				       VM_READ | VM_EXEC |
-				       VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
+				       VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
+				       VM_SEALED_SYSMAP,
 				       &image->mapping);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.49.0


