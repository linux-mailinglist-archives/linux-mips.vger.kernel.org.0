Return-Path: <linux-mips+bounces-1010-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3765832BE3
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 15:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C8742844DD
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 14:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE8655E7E;
	Fri, 19 Jan 2024 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNMx427E"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C455E71
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705676065; cv=none; b=sgHMzpln6Y283unv1JjVfzLElfF/WsvvpyNuZOaLuok2qQ02wxJCcgpeDPRKo41LLIOP3a+J7WlRmbhDE+iykZbnZKyMaBT/XIUCUc1P5N/BdSUQHfVCQeBJ0C29IkdO9vYtQN794SSr8HrZUbrd7uZZDRWEBCCGndyFqz0W0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705676065; c=relaxed/simple;
	bh=+kOO43E85ahYtBRdDODzuq4Xc6WUCJmQ0tsIgZHp7Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=e5K+o6R2ah5Zd8XcqTgKLKJiSGqN2x1PiN8HivCvw0gQSUR4noU2xjdoXpGucXeVCYjyuidRAa4XXv2rWMVG/z8TLjPsa6Esh2x5rp5vWw6TwLY1ey++pBKmjbVnS0MiOi/iF8WK8ilhnEccQ3Lg6AxJleXBXNd18/KLGQJBNXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNMx427E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rvI+qIRXvnkRa99jMtk0WlMp94Xm6ORI7SgED7Qv6WY=;
	b=MNMx427E1F2EvsVlrcG6s1TREXlQ3tUm3DaI1h0EPkPCINnuX76IlTiCMyuZDaUeApEWW2
	12WV1VcQQkLCThT+WLrIroxnJ+2YAG9CdQiwqn4/qqYelgEZMY+0+RSB/TDjxSUu0LU4es
	5orQQGAQ5eqC/KebS+gszNn37mPdPfQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-5WFyMg4UNWmcGndjb4K8hw-1; Fri,
 19 Jan 2024 09:54:16 -0500
X-MC-Unique: 5WFyMg4UNWmcGndjb4K8hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 159183C025B8;
	Fri, 19 Jan 2024 14:54:16 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA96351D5;
	Fri, 19 Jan 2024 14:54:09 +0000 (UTC)
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
Subject: [PATCH v2 11/14] arm, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:38 +0800
Message-ID: <20240119145241.769622-12-bhe@redhat.com>
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
items on arm with some adjustments.

Here use IS_ENABLED(CONFIG_CRASH_RESERVE) check to decide if compiling
in the crashkernel reservation code.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/arm/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index ff2299ce1ad7..cf0b3798179f 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -979,7 +979,6 @@ static int __init init_machine_late(void)
 }
 late_initcall(init_machine_late);
 
-#ifdef CONFIG_KEXEC
 /*
  * The crash region must be aligned to 128MB to avoid
  * zImage relocating below the reserved region.
@@ -1007,6 +1006,9 @@ static void __init reserve_crashkernel(void)
 	unsigned long long total_mem;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
+		return;
+
 	total_mem = get_total_mem();
 	ret = parse_crashkernel(boot_command_line, total_mem,
 				&crash_size, &crash_base,
@@ -1064,9 +1066,6 @@ static void __init reserve_crashkernel(void)
 		insert_resource(&iomem_resource, &crashk_boot_res);
 	}
 }
-#else
-static inline void reserve_crashkernel(void) {}
-#endif /* CONFIG_KEXEC */
 
 void __init hyp_mode_check(void)
 {
-- 
2.41.0


