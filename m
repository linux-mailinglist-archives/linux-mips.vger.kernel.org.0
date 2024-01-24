Return-Path: <linux-mips+bounces-1084-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B8383A118
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 06:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D27828DAFD
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 05:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93668101CA;
	Wed, 24 Jan 2024 05:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PlqA2Upl"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33417559
	for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 05:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706073250; cv=none; b=HJqN5AGl9N4FU96nlUomua4HuiiSwEaGF2n/UwGim5D/u186tWuDJn2gxVbi8CpxouI09Cpcs8MRlx4s3jzMTwu04CSVe/DHJGOnUWWjeszb2gi2r//ze6Kmsz5UILi49yCzTcMHsyRhx7B58YUBYC6Q4Ru3bntpJpdzLmhVsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706073250; c=relaxed/simple;
	bh=dkYTv4vv/1SoWwXXD+uudRFCP4mJqhIMMcl51qz1x/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=KXkrNgGZsat8gq1pYnSgu1yKVenurEG6MrJHPwIY/aIoBwlWvYIVmGaQ9zLDdBoK0n+Uvmu+hgufQAqtyiZGE6rciHHSCcHjYCPXXm/R+e+5iOC8+Y8mo4PlYQJom+o+9cP5yletLuDSRgUn+tl5mj37ZP1G9J6wF4vqKjDe12s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PlqA2Upl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGJ4xzKEBHQCL+Lx7EHmlxoam/nGU3dZpz0/i2oQX6A=;
	b=PlqA2UplUn3/WBTzWNiis55Z9djRcYSLAN6sn8f81wVhmoc05nlYkMXcCFN2T20wgXELOp
	F8rr1S2Rv+5MakwHInMGOIynexeWcJ9BVGP1yX+cL4E95EjO3J0Gt9TG50blwGAa+UBaQz
	g2xJoSEuCoP57gysQMfN5HIBzE322VI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-mzXdjdWzM6OsVmH87hSpMw-1; Wed, 24 Jan 2024 00:14:01 -0500
X-MC-Unique: mzXdjdWzM6OsVmH87hSpMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1D2C185A780;
	Wed, 24 Jan 2024 05:14:00 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 367081C060AF;
	Wed, 24 Jan 2024 05:13:54 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	hbathini@linux.ibm.com,
	piliu@redhat.com,
	viro@zeniv.linux.org.uk,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH linux-next v3 08/14] ppc, crash: enforce KEXEC and KEXEC_FILE to select CRASH_DUMP
Date: Wed, 24 Jan 2024 13:12:48 +0800
Message-ID: <20240124051254.67105-9-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-1-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

In PowerPC, the crash dumping and kexec reboot share code in
arch_kexec_locate_mem_hole(), in which struct crash_mem is used.

Here enfoce enforce KEXEC and KEXEC_FILE to select CRASH_DUMP for now.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e66fd9923250..31f013e636e3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -608,6 +608,10 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 config ARCH_SUPPORTS_KEXEC
 	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
 
+config ARCH_SELECTS_KEXEC
+	def_bool y
+	select CRASH_DUMP
+
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool PPC64
 
@@ -618,6 +622,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
 	depends on KEXEC_FILE
 	select KEXEC_ELF
+	select CRASH_DUMP
 	select HAVE_IMA_KEXEC if IMA
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
-- 
2.41.0


