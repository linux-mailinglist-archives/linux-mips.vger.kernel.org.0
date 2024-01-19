Return-Path: <linux-mips+bounces-1008-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04426832BD9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 15:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B97271C23EE4
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 14:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E9355E42;
	Fri, 19 Jan 2024 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9aGmZkC"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3454BEC
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705676049; cv=none; b=ubvo0uqxF7Ee8mbNJSwfuJ1+vd4XWqByBhgpStrf+p5r8KBIq7vzHGO/FKQ3MYPsetJRDV5odJXjtVKVNBnMVSdsNS4nKeOmEQ6vUeYAoiCjEHDzR4S6XS2tNMW+29u5dL1awi3NiJJ5G8h65Ce41AYkqkHlU5dZojZcDiv5dBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705676049; c=relaxed/simple;
	bh=4OLku53QZ0JcIhWOC5lpSpfsCOe7WyE8PhE4np3c32c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=hkOxAVe4I92zyma5du6lOVpICbGSBMmbQxmrXZ1T6iDGwlmHlpbJfzxBNJq3ww+sX7oe7tWDgmgdQ3A9c9L6tDQEzRy32JA4c3THptLl+zsRbxA9BTRmA2POJTpdAd/t0IpthOjMP+updeM1DMdmI+xlR+fXQrhtwGuCzcIyEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9aGmZkC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ELQbTPNyx4L6Rjica+79k486cYCM/jEDd+jz77hDLU=;
	b=Z9aGmZkCOvjghITRBUjjZoZoEGssCmcO9lSg47NrXkrPtGAtRYxfJtl6ITVeacENGrKl5f
	OlJ2T/qPyUnVW6xT1ckMih2TUicCwYyg0h1fNmF38+dui0WtYz3gRKJMgjHxdNbsu7h8NZ
	0QHknhjQqVZJWOZ4wOCKjDFipnlusDs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-KYkDc-tBOHakDPqfCoeT5g-1; Fri, 19 Jan 2024 09:54:03 -0500
X-MC-Unique: KYkDc-tBOHakDPqfCoeT5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B53284FA80;
	Fri, 19 Jan 2024 14:54:02 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77D8C5012;
	Fri, 19 Jan 2024 14:53:55 +0000 (UTC)
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
Subject: [PATCH v2 09/14] s390, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:36 +0800
Message-ID: <20240119145241.769622-10-bhe@redhat.com>
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
items on s390 with some adjustments.

Here wrap up crash dumping codes with CONFIG_CRASH_DUMP ifdeffery.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/s390/kernel/kexec_elf.c          |  2 ++
 arch/s390/kernel/kexec_image.c        |  2 ++
 arch/s390/kernel/machine_kexec_file.c | 10 ++++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/s390/kernel/kexec_elf.c b/arch/s390/kernel/kexec_elf.c
index 9da6fa30c447..4d364de43799 100644
--- a/arch/s390/kernel/kexec_elf.c
+++ b/arch/s390/kernel/kexec_elf.c
@@ -40,8 +40,10 @@ static int kexec_file_add_kernel_elf(struct kimage *image,
 		buf.bufsz = phdr->p_filesz;
 
 		buf.mem = ALIGN(phdr->p_paddr, phdr->p_align);
+#ifdef CONFIG_CRASH_DUMP
 		if (image->type == KEXEC_TYPE_CRASH)
 			buf.mem += crashk_res.start;
+#endif
 		buf.memsz = phdr->p_memsz;
 		data->memsz = ALIGN(data->memsz, phdr->p_align) + buf.memsz;
 
diff --git a/arch/s390/kernel/kexec_image.c b/arch/s390/kernel/kexec_image.c
index af23eff5774d..a32ce8bea745 100644
--- a/arch/s390/kernel/kexec_image.c
+++ b/arch/s390/kernel/kexec_image.c
@@ -24,8 +24,10 @@ static int kexec_file_add_kernel_image(struct kimage *image,
 	buf.bufsz = image->kernel_buf_len;
 
 	buf.mem = 0;
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 	buf.memsz = buf.bufsz;
 
 	data->kernel_buf = image->kernel_buf;
diff --git a/arch/s390/kernel/machine_kexec_file.c b/arch/s390/kernel/machine_kexec_file.c
index 8d207b82d9fe..c2bac14dd668 100644
--- a/arch/s390/kernel/machine_kexec_file.c
+++ b/arch/s390/kernel/machine_kexec_file.c
@@ -105,6 +105,7 @@ static int kexec_file_update_purgatory(struct kimage *image,
 	if (ret)
 		return ret;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH) {
 		u64 crash_size;
 
@@ -121,6 +122,7 @@ static int kexec_file_update_purgatory(struct kimage *image,
 						     sizeof(crash_size),
 						     false);
 	}
+#endif
 	return ret;
 }
 
@@ -134,8 +136,10 @@ static int kexec_file_add_purgatory(struct kimage *image,
 
 	data->memsz = ALIGN(data->memsz, PAGE_SIZE);
 	buf.mem = data->memsz;
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 
 	ret = kexec_load_purgatory(image, &buf);
 	if (ret)
@@ -158,8 +162,10 @@ static int kexec_file_add_initrd(struct kimage *image,
 
 	data->memsz = ALIGN(data->memsz, PAGE_SIZE);
 	buf.mem = data->memsz;
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 	buf.memsz = buf.bufsz;
 
 	data->parm->initrd_start = data->memsz;
@@ -223,8 +229,10 @@ static int kexec_file_add_ipl_report(struct kimage *image,
 		data->kernel_buf + offsetof(struct lowcore, ipl_parmblock_ptr);
 	*lc_ipl_parmblock_ptr = (__u32)buf.mem;
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH)
 		buf.mem += crashk_res.start;
+#endif
 
 	ret = kexec_add_buffer(&buf);
 out:
@@ -268,10 +276,12 @@ void *kexec_file_add_components(struct kimage *image,
 	memcpy(data.parm->command_line, image->cmdline_buf,
 	       image->cmdline_buf_len);
 
+#ifdef CONFIG_CRASH_DUMP
 	if (image->type == KEXEC_TYPE_CRASH) {
 		data.parm->oldmem_base = crashk_res.start;
 		data.parm->oldmem_size = crashk_res.end - crashk_res.start + 1;
 	}
+#endif
 
 	if (image->initrd_buf) {
 		ret = kexec_file_add_initrd(image, &data);
-- 
2.41.0


