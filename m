Return-Path: <linux-mips+bounces-1013-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C1832BF4
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 15:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE50B1C2429C
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 14:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB3256B8B;
	Fri, 19 Jan 2024 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2+jInUI"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F354FA5
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705676086; cv=none; b=NV8fedw3RjSXryppqpEFdG+JWg5TnKLdFG+btbjsKHXsfVmmR7ih3lSAG10R6wFP8caiPtJ5dJeDHHilKOjYvMG+O+itbE9xupdnv1FbvrAziw6XBsQxm+8Ncrv00YipIAZnYiiYOjoGmThF1AR210NX7ny/bVlQKqeR7Isug7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705676086; c=relaxed/simple;
	bh=OUjhJFF9q7D4YR1pSHqAvZMEA4AEazo/hcoLLBgzWxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=g8T7alEzH6T1pu8ab8RmFQ3SKGtnvCHl76eCFzYOT6tC30b2HxCoiNLF8VMVBQNS5GwMc1rr8v9W2GMpB7oIGvB2oidtTtmbUMsSCBxC/IQGidzvZMx+EBHP58nhaFK3ZHX3BcjK3izaRMQ1gensEKtJGQyPBBWIm/IEot/JBYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2+jInUI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDvYJxBJvZegSwo4Kk9zAYMdDY4WlX7FhACBVJ8AwnU=;
	b=H2+jInUIj+zICM22D2UZGIWa3MpvisdF0A3+BwqGaxhzaL1ETyD0rBDgXq28mIgQgaxEnL
	sG8i78vjnG5189DXWW43wUyeTbS1FhMt0gq4cHqzp/rDkul3+HD7auVq4Wha8z2nSwMZ8U
	nkxtn9SUGD3EsXI43DlRDlTx8dVJxVk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-osoDulHkOveZzpDk9NGWvg-1; Fri, 19 Jan 2024 09:54:38 -0500
X-MC-Unique: osoDulHkOveZzpDk9NGWvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12C54868A02;
	Fri, 19 Jan 2024 14:54:37 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBA8251D5;
	Fri, 19 Jan 2024 14:54:30 +0000 (UTC)
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
Subject: [PATCH v2 14/14] loongarch, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:41 +0800
Message-ID: <20240119145241.769622-15-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Now crash codes under kernel/ folder has been split out from kexec
code, crash dumping can be separated from kexec reboot in config
items on loongarch with some adjustments.

Here wrap up crash dumping codes with CONFIG_CRASH_DUMP ifdeffery, and
use IS_ENABLED(CONFIG_CRASH_RESERVE) check to decide if compiling
in the crashkernel reservation code.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/loongarch/kernel/setup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index d183a745fb85..61f88dd97947 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -258,11 +258,13 @@ static void __init arch_reserve_vmcore(void)
 
 static void __init arch_parse_crashkernel(void)
 {
-#ifdef CONFIG_KEXEC
 	int ret;
 	unsigned long long total_mem;
 	unsigned long long crash_base, crash_size;
 
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
+		return;
+
 	total_mem = memblock_phys_mem_size();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base,
@@ -283,7 +285,6 @@ static void __init arch_parse_crashkernel(void)
 
 	crashk_res.start = crash_base;
 	crashk_res.end	 = crash_base + crash_size - 1;
-#endif
 }
 
 static void __init fdt_setup(void)
@@ -468,7 +469,7 @@ static void __init resource_init(void)
 		request_resource(res, &bss_resource);
 	}
 
-#ifdef CONFIG_KEXEC
+#ifdef CONFIG_CRASH_RESERVE
 	if (crashk_res.start < crashk_res.end) {
 		insert_resource(&iomem_resource, &crashk_res);
 		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
-- 
2.41.0


