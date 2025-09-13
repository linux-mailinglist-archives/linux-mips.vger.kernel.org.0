Return-Path: <linux-mips+bounces-11308-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABCB55D5A
	for <lists+linux-mips@lfdr.de>; Sat, 13 Sep 2025 03:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3154563203
	for <lists+linux-mips@lfdr.de>; Sat, 13 Sep 2025 01:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A1C1B983F;
	Sat, 13 Sep 2025 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvSr4bQV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C983E47B
	for <linux-mips@vger.kernel.org>; Sat, 13 Sep 2025 01:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726178; cv=none; b=tPingvw4heFseTc+WnDPK9199W7+MRKJInq0hA7b98PEJcxcunK+E3Wx+Xa/u0VpJybgDu8DS2tzex/iQ+rSQ4dkbxrOXC3BmgZob1dQwJOYICVfx/+6fdDNWPmgP8ZOR+GkmvlKplD/gu8UZoSb99tMPDqVWEGxKIhGpewST14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726178; c=relaxed/simple;
	bh=EiIsazq+8AAIxPXReMMvw7uV4x0thFYUO8UTXtaH2NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WV15HIJJK7kWwhmDnnzLBFpTMPZVtTH9KkPEzCHV4eKp+HzQdJ9jAHD0tN1PTnjTDHu8vMRV7kpNWsnTfBbwYIr7WtukC9pGTRYrx2do3E741oDjSU08il10aJtMxJKEGFVUJZWPORYjfIof+BfuyLaEZpRBPWYelZeGn9KeR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvSr4bQV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so3763364a12.3
        for <linux-mips@vger.kernel.org>; Fri, 12 Sep 2025 18:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726172; x=1758330972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjswgxWrFNOKRwzjkiuQ0bl5mmgWmo9Cqzfehf6N75I=;
        b=jvSr4bQV0NBkepgypf1ITx9wJFDPd8goYHDE3v7WHi72yPVyDxhnXpAqyMnSOr/KsN
         3OgNR1FpfEl7UVZvRliYvyPjFnA5aAz/oO6imykP8IPDQ7RsyvkOKBCfzkpcc37up4nN
         9XeN3SQrdwycGfKTtnZKbAnvp2wgZdcKuGGCoFtklFGvAYOUQobhPy6gswMgIlW3bH/A
         7W/CpoWHMNGfwNWxRdtCvLdIyBrRMG25Y0XMznqgy1VNw5ORUZb+Pgvn5Z8DqRRIFWG/
         kT29/ji3yQpFmGkd/nm/AGAqO5UV4tVOrKirHilAqIvHDHcpknTzHFO8zFVlVShmeFSy
         VEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726172; x=1758330972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjswgxWrFNOKRwzjkiuQ0bl5mmgWmo9Cqzfehf6N75I=;
        b=YTRhn3k1BjvoL5TaNPhBvhkKIEyvZKDgxDVVa3izFmO4q3jEx+GlWpJcVu22Fx++GO
         7oTVrj800kHY3EBXHjZjPY34mDxRROwVmbOM+3rs/me3iHpcVZStGxu8keS3+dq/qYII
         Qpta6+QbXMjvpiN8c9Sldk+kQnydBZvqCSBlyD9akIIWO8zTSTuZw8hjY8xUu79Ex5uh
         lXSiFEYQu4bHgHDDfTCCRudxDe+CJmHE7P+dTopJJTKPP//6CdHS4SoifiXC35OztpyS
         yBr3Miir3tmn26Q+CVoD5afJmnnlDgPGLjGz0SmPcGh3s1ekfk9rkQoG7cgXhPLJm4Qy
         XELw==
X-Forwarded-Encrypted: i=1; AJvYcCULqltNnPuHkAkUMyWKVx8q4E2+jEsfDPVitoqe/iXQsMTH+lNh8pPFmv2tYZ7kqwB/QN246xUVekwT@vger.kernel.org
X-Gm-Message-State: AOJu0YzJvHbSdav5qct1hN2dvpjq3vZToWbo0mlgN3HOeOhtiv7k6Qoo
	X4FUEKmlNgH9+Oo3HOHA/Px7Ja9Dr4RtOjdElaCK27PcW+F3/Onsj63r
X-Gm-Gg: ASbGncv8Jfv1Ned6/hf4k8GriajUP+mayXYpOCBVu3oO7xOZ+4ODEZJVfD9AKde8M8V
	HZi4xEkzlikVsLA53OTJkyrjnKrO78C7moQzgaMv81H9UpIH4Dxx9LrmS3YcAw9YbDDOwc8AV3H
	ONRX5Idd7067294aD2WwPd66MBBrMimlVchrm1dNcfb5todFnX9aEMAtqu1qEVje+9+TRrKFN0B
	MlaYVjf7yvcFUKy8RsVlQwpQo/x5ljObJ/MAxblfX311C8nKd5/OQgviBsOv6MlZHFcyv+LcroQ
	GEyMAX19rgx7Wx6+Gj8nTxtypS1HDP5VqwCmhPkTgM7gh9HgrdckJUOhgpCVYhXyYcQ6eUhkRp1
	iHDP3r4hgCKYflDl9ORCLATrqNNk0GA==
X-Google-Smtp-Source: AGHT+IE1vl5AoL08hnxvihV4MKDaztrK6JygVC9P3kqlNeKyWBvnhpYqmVFYWjhHgbqbRt0/sx/2Sg==
X-Received: by 2002:a05:6402:40d3:b0:61e:ae59:5f07 with SMTP id 4fb4d7f45d1cf-62ed82718ddmr4360854a12.20.1757726172015;
        Fri, 12 Sep 2025 18:16:12 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ac2efsm4135647a12.12.2025.09.12.18.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:16:10 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 33/62] init: remove init/do_mounts_initrd.c
Date: Sat, 13 Sep 2025 00:38:12 +0000
Message-ID: <20250913003842.41944-34-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/Makefile           |  1 -
 init/do_mounts_initrd.c | 36 ------------------------------------
 init/initramfs.c        | 23 +++++++++++++++++++++++
 3 files changed, 23 insertions(+), 37 deletions(-)
 delete mode 100644 init/do_mounts_initrd.c

diff --git a/init/Makefile b/init/Makefile
index b020154b3d2a..09657c0274eb 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -17,7 +17,6 @@ obj-$(CONFIG_INITRAMFS_TEST)   += initramfs_test.o
 obj-y                          += init_task.o
 
 mounts-y			:= do_mounts.o
-mounts-$(CONFIG_BLK_DEV_INITRD)	+= do_mounts_initrd.o
 
 #
 # UTS_VERSION
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
deleted file mode 100644
index 509f912c0fce..000000000000
--- a/init/do_mounts_initrd.c
+++ /dev/null
@@ -1,36 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/unistd.h>
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/minix_fs.h>
-#include <linux/romfs_fs.h>
-#include <linux/initrd.h>
-#include <linux/sched.h>
-#include <linux/freezer.h>
-#include <linux/kmod.h>
-#include <uapi/linux/mount.h>
-
-#include "do_mounts.h"
-
-static int __init early_initrdmem(char *p)
-{
-	phys_addr_t start;
-	unsigned long size;
-	char *endp;
-
-	start = memparse(p, &endp);
-	if (*endp == ',') {
-		size = memparse(endp + 1, NULL);
-
-		phys_external_initramfs_start = start;
-		phys_external_initramfs_size = size;
-	}
-	return 0;
-}
-early_param("initrdmem", early_initrdmem);
-
-static int __init early_initrd(char *p)
-{
-	return early_initrdmem(p);
-}
-early_param("initrd", early_initrd);
diff --git a/init/initramfs.c b/init/initramfs.c
index 90096177a867..8ed352721a79 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -606,6 +606,29 @@ int initramfs_below_start_ok;
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
 
+static int __init early_initrdmem(char *p)
+{
+	phys_addr_t start;
+	unsigned long size;
+	char *endp;
+
+	start = memparse(p, &endp);
+	if (*endp == ',') {
+		size = memparse(endp + 1, NULL);
+
+		phys_external_initramfs_start = start;
+		phys_external_initramfs_size = size;
+	}
+	return 0;
+}
+early_param("initrdmem", early_initrdmem);
+
+static int __init early_initrd(char *p)
+{
+	return early_initrdmem(p);
+}
+early_param("initrd", early_initrd);
+
 static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
 
 void __init reserve_initrd_mem(void)
-- 
2.47.2


