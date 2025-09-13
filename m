Return-Path: <linux-mips+bounces-11289-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B396B55BE7
	for <lists+linux-mips@lfdr.de>; Sat, 13 Sep 2025 02:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5739A7AF714
	for <lists+linux-mips@lfdr.de>; Sat, 13 Sep 2025 00:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456BA1885A5;
	Sat, 13 Sep 2025 00:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcTnakkN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4778F43
	for <linux-mips@vger.kernel.org>; Sat, 13 Sep 2025 00:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724924; cv=none; b=ILtXCxDdp2yfzxTycgJubc9syioIQQ9sAxnLaschyAEZY80IW4dyVULaYxhPc77wr2rdKPDrJbpHazYgKJ67TT7Wn6/88bms5WiRS5cpET1xAwy2AT1UHmzP+nEr7OW6pGMTjlxPdSkICPdzv6NKvoscoAToh4qP1IvkwZGDF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724924; c=relaxed/simple;
	bh=eGt6p4ZjFeLe2iCSQ/AVZeB8ZlFdwKPgIafRJWfogAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnlwQgQx1wEFrRR5E+9VsccNfY574DodmCS+ofVV1jBFk4qzMCDU/ErqMDH2rcTDyQY9ULYXIaIVkl0ZHyZxV93AYq6WoTUqwj9+42Bn7pHngqCKP2CsDwTLSz20T+1wf/wqfXZuXJMeinBfow8IGV/Nwi00VVt/0dQXokgQ0tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcTnakkN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso427896566b.2
        for <linux-mips@vger.kernel.org>; Fri, 12 Sep 2025 17:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724918; x=1758329718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brUQzIfCd0Hsthf3I31XlgkqlDsgZYmVYRfws4Ev66A=;
        b=ZcTnakkNmFYjQdChEjtaqK6HEcCwMgYs1rXg39HJJglVr4tegCv0ClYqye4QSs7t5B
         nBzOxKX9ffT0TGlKUjDYDesIqmLae9atQjaty2n+4wACYUDNbsMBnvrEJU+7A6wppzuf
         JkP2j1HCvksc/G+cQLMJEB26oM4bly9Uaf7len5rAcFLSnrXK4MmjB6mR3W+WbQQzGj2
         s0B9VmeQH+3+7yBlflwz4FO+7d2p4g5iDNhDU+wLnTbCVPDkcwCH9tSj+xzmhjrzsvNV
         xYCXm15o6tgPTnS+wPQy3tNtCeu/09LXTyp/+sllPbYOZ5RLlcWPnA/Rd3bvtnahbXWt
         lKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724918; x=1758329718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brUQzIfCd0Hsthf3I31XlgkqlDsgZYmVYRfws4Ev66A=;
        b=Z4RKs8g3L1JA3wBpu7Rk3hdvPTba4QEbgTbgHQDxmRzIJK4Dnj5ihD9HtDq60lQuIe
         hnCymemfnfh2DPT+IshjkPzQyCZUO5Z8VC2oRGxr++2jgPc9C0nFDh1Sjr0uuO0/C2C0
         ruvfqLCnUobjtLPJpMQkD3na9kywybnqWlfZDReBVBdkQl0TND9KXMg+bpn5QKOLfhIt
         xHVnyFmBVrAzGyZ/CXSxZTe84F2yXiEGo1U4lsWoTZ1OqxW42m8JXLVMAJt58o8nl1/w
         QsPGHxSgAHa1fynI5N1pexOQh8DSEO4VPk3kKystVP0ycda/0ulGQFrZWbrB9z5BwrZ2
         rUQg==
X-Forwarded-Encrypted: i=1; AJvYcCWdtYXNnC43/trPpYhCOUWMCP0dSSrNtTQDj6NcLyUUWPYI0x/XiEv3bRiqwtC9KUSqTjDlZtL9rHS1@vger.kernel.org
X-Gm-Message-State: AOJu0YwIIpDaIW6wfeUJz+sGcL3yxayO9N9D6IIZNg4svQspt/suJNdk
	tRqcMN5MIqYZWXseWkXU1fyy18UR5l6DQRy/49m7648sfZY1QFB7s9nR
X-Gm-Gg: ASbGncvMk7t2/0eEwJoLLgmqOvNyVMbTebpi15lOqA7OzdMVdxmMM6k/sLqLJ6VCPUA
	hWT15uwMlzBX4T0hl5Pn5rDSt9ow3vbQmy9jE+5XHMRVokNo1m0hvZw3fKYOSNtqiR26LF7uxVY
	u1frr4NUHb12cNrZ7HQYdUIh+5XBP/LGVidnAySkHTotEyZdiwqDsiGSTX606Ph8QzvF7OlCLNn
	EozfeHsR+HCIyRaG0Jj7LkbbfpU5mKym6et/YwTjt77vMRCYvSy/qvDyGu6F0eksBMKuiYsyhrD
	6O+gEwrJGM/DQ4EBz2TwMP7cyeOHHIzX/pljobunR0Aw6lnw3+BovKYhK0ubamRdd9DrYeqfMei
	H0TClbuvW9EcX6rHiVzX7gM5G1SE7Hg==
X-Google-Smtp-Source: AGHT+IFhKaZuOZuHh9m3zt1qgdjZK8E9TZ0Xtk6mNXJxSo6OktVvoEgwN+yDRi3/QGfp0/HMd569SA==
X-Received: by 2002:a17:907:3d8c:b0:afe:8b53:449c with SMTP id a640c23a62f3a-b07c37dc9f1mr442768666b.34.1757724918489;
        Fri, 12 Sep 2025 17:55:18 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b316e2d4sm471493966b.45.2025.09.12.17.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:55:18 -0700 (PDT)
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
Subject: [PATCH RESEND 14/62] init: m68k, mips, powerpc, s390, sh: remove Root_RAM0
Date: Sat, 13 Sep 2025 00:37:53 +0000
Message-ID: <20250913003842.41944-15-safinaskar@gmail.com>
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

Root_RAM0 used to specify ramdisk as root device.
It means nothing now, so let's remove it

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/m68k/kernel/uboot.c                |  1 -
 arch/mips/kernel/setup.c                |  1 -
 arch/powerpc/kernel/setup-common.c      | 11 ++++-------
 arch/powerpc/platforms/powermac/setup.c |  4 +---
 arch/s390/kernel/setup.c                |  2 --
 arch/sh/kernel/setup.c                  |  4 +---
 include/linux/root_dev.h                |  1 -
 init/do_mounts.c                        |  2 --
 8 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index fa7c279ead5d..d278060a250c 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -83,7 +83,6 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 	    (uboot_initrd_end > uboot_initrd_start)) {
 		initrd_start = uboot_initrd_start;
 		initrd_end = uboot_initrd_end;
-		ROOT_DEV = Root_RAM0;
 		pr_info("initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
 	}
 #endif /* if defined(CONFIG_BLK_DEV_INITRD) */
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 11b9b6b63e19..a78e24873231 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -173,7 +173,6 @@ static unsigned long __init init_initrd(void)
 		goto disable;
 	}
 
-	ROOT_DEV = Root_RAM0;
 	return PFN_UP(end);
 disable:
 	initrd_start = 0;
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 68d47c53876c..97d330f3b8f1 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -363,17 +363,14 @@ void __init check_for_initrd(void)
 	DBG(" -> check_for_initrd()  initrd_start=0x%lx  initrd_end=0x%lx\n",
 	    initrd_start, initrd_end);
 
-	/* If we were passed an initrd, set the ROOT_DEV properly if the values
-	 * look sensible. If not, clear initrd reference.
+	/* If we were not passed an sensible initramfs, clear initramfs reference.
 	 */
-	if (is_kernel_addr(initrd_start) && is_kernel_addr(initrd_end) &&
-	    initrd_end > initrd_start)
-		ROOT_DEV = Root_RAM0;
-	else
+	if (!(is_kernel_addr(initrd_start) && is_kernel_addr(initrd_end) &&
+	    initrd_end > initrd_start))
 		initrd_start = initrd_end = 0;
 
 	if (initrd_start)
-		pr_info("Found initrd at 0x%lx:0x%lx\n", initrd_start, initrd_end);
+		pr_info("Found initramfs at 0x%lx:0x%lx\n", initrd_start, initrd_end);
 
 	DBG(" <- check_for_initrd()\n");
 #endif /* CONFIG_BLK_DEV_INITRD */
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index eb092f293113..237d8386a3f4 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -296,9 +296,7 @@ static void __init pmac_setup_arch(void)
 #endif
 #ifdef CONFIG_PPC32
 #ifdef CONFIG_BLK_DEV_INITRD
-	if (initrd_start)
-		ROOT_DEV = Root_RAM0;
-	else
+	if (!initrd_start)
 #endif
 		ROOT_DEV = DEFAULT_ROOT_DEVICE;
 #endif
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 7b529868789f..a4ce721b7fe8 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -923,8 +923,6 @@ void __init setup_arch(char **cmdline_p)
 	/* boot_command_line has been already set up in early.c */
 	*cmdline_p = boot_command_line;
 
-        ROOT_DEV = Root_RAM0;
-
 	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	if (IS_ENABLED(CONFIG_EXPOLINE_AUTO))
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 50f1d39fe34f..c4312ee13db9 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -147,10 +147,8 @@ void __init check_for_initrd(void)
 
 	/*
 	 * If we got this far in spite of the boot loader's best efforts
-	 * to the contrary, assume we actually have a valid initrd and
-	 * fix up the root dev.
+	 * to the contrary, assume we actually have a valid initramfs.
 	 */
-	ROOT_DEV = Root_RAM0;
 
 	/*
 	 * Address sanitization
diff --git a/include/linux/root_dev.h b/include/linux/root_dev.h
index 847c9a06101b..e411533b90b7 100644
--- a/include/linux/root_dev.h
+++ b/include/linux/root_dev.h
@@ -10,7 +10,6 @@ enum {
 	Root_NFS = MKDEV(UNNAMED_MAJOR, 255),
 	Root_CIFS = MKDEV(UNNAMED_MAJOR, 254),
 	Root_Generic = MKDEV(UNNAMED_MAJOR, 253),
-	Root_RAM0 = MKDEV(RAMDISK_MAJOR, 0),
 };
 
 extern dev_t ROOT_DEV;
diff --git a/init/do_mounts.c b/init/do_mounts.c
index f0b1a83dbda4..5c407ca54063 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -437,8 +437,6 @@ static dev_t __init parse_root_device(char *root_device_name)
 		return Root_NFS;
 	if (strcmp(root_device_name, "/dev/cifs") == 0)
 		return Root_CIFS;
-	if (strcmp(root_device_name, "/dev/ram") == 0)
-		return Root_RAM0;
 
 	error = early_lookup_bdev(root_device_name, &dev);
 	if (error) {
-- 
2.47.2


