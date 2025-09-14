Return-Path: <linux-mips+bounces-11328-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF578B56586
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 05:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE633173EBA
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 03:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F5C271A9D;
	Sun, 14 Sep 2025 03:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRPnFhfi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350B26A1CC
	for <linux-mips@vger.kernel.org>; Sun, 14 Sep 2025 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822233; cv=none; b=QoFf00tcnMyfzeuM43yz3aCt9HRCvR0EQlrDE6/beSSO2qrzisfG20KJYgV/hcnNRynkl2PJR5uqw2r5G2SIMQihjU2qbKgvrrU2/Oqm62WUpx+08MJsUt7kryNvLxNr7IzK8y2hPwL/wHo2QmOTLrNXKCZjYHIkXXoKNyxwz3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822233; c=relaxed/simple;
	bh=6pXJgBOVmgKyryw3LURicaeyD0WS1HvzY8WG0GWatOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XE+nDsnkON6jMLHfyQjn/rpBERVhRWW+tih9ujiOvUBuoG0CTKSz+i8x4cFZdNaXPsGUJJ8XzQ0HtxJUY2F9w2+Okn+/TyRq3R35T/sKrcHC+XmxATzCCK5h+4cjSFtBtIs2Kp5nWUAjWL2nK1Hifw6RWg1zROqxkGQ5MgYbQLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRPnFhfi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b079c13240eso507525366b.1
        for <linux-mips@vger.kernel.org>; Sat, 13 Sep 2025 20:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822228; x=1758427028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=kRPnFhfit7+R6UzkS4cF3DKL1S7JHip+IAyQf6T2UGYDd+vYI9IC8v9G51KVb5WDAk
         RN/gPz1lGKSMFe9Oe7MIowDwv3N0e4/KFS91xhYm0G+VoSkSei8WkHktPa2wEMB4pNUj
         WzAE/ebYcnJlcUWXpTXxg7oBxbqGV3WM9sIv1WyWWMlOmd/DBHQ0UO8HJ8wtmu7F5pSQ
         pAM88kkn9raeM/jhalMJUOdMS5VqW/+AUemoRwnUmW0/oDdl4OSBi4zM++ZdXBaXmYLj
         VGYSY1r8rSsi6oTo3enO0OXT4w2WPUK9VtsKTo5k8z5kW918njUd5UMO2sKFBB8AaeWA
         2SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822228; x=1758427028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=OdwqKYT3L2HOp2tgCyGJxgDEf8rp6Ek9QPigm2CZDsS7/zWJyC4sa8R1Yy4948Yjiu
         Mu7koBB6VlAZUHK+pPh4V4tUz6clMHu8V7TxJ1+EyzI7+RuaeNVvvU8V57jkvMiyf6zL
         Qa/b7OMMCJrP0QiYpaCO/VInL8VF/Jr+XtgH1G1mp3PfGtegwjwFQ0gRAa9ctOf51ZsX
         QnLcxFhGMEmcVtZt0GEh8uxF2JGPJY7mcNSYa1w1QO5ODVPHX9lZINhGDx3fj1dt+5O0
         OuByRShKHBWBibYGWWKeg3qheXj4daCj1CWANpUt3jHtBMf43K47XhgjibbDb3k9InRO
         Pueg==
X-Forwarded-Encrypted: i=1; AJvYcCUsXHOgQtmmNkbNUPRvfqkEiynqG5oUDyi9iKAZnmRb5yirwgI2J8sO+SoVx3kWQoeAPof2nkQAUJME@vger.kernel.org
X-Gm-Message-State: AOJu0YwfrFp45iaGXANuZAx2wnc5XfPUkXPdpd+c90e/jLch2gno37FY
	rhma2a9mI3N+3nnTX6xE7ZgvQfK4HPo4hs+VepHUe8Bvsr9sCsyrNGWD
X-Gm-Gg: ASbGncv8PVE44F4MFQlVQFhUTvV6jNx1hUy4iAanrfyj7dO/CeSfeQXk9mrIUNcp1Dj
	5qoVi6Y9Hkk7wfg+wwrOpGNHrxBxwflBsJEh67AvRL+NbbvIlIyReCsWuGyl4dzoLGDQHgoHcMA
	YJHBr0KgFAcxfhvreGXLwrRZjGHZ7WiNefWHp7uBLY+6GJBBtXsd6J0Nt/uFy8NrszExACNFIau
	M//lnjI2YOzTMVmZigAz0yYzmsilAydCoktODHdMjWB8+OfzgsNsz2fihD3tcsFctd0YQcTNtn1
	m7aXlz6DKS1v3Ju2H3EtWhcbPDgAR8mjwrH+ODXrN76mXHY4lAUeM0aiFIfg2M/H1v1S7+NeaXj
	w7Cpyaj/mUNJxBisEyxdsqsBs35RSdQ==
X-Google-Smtp-Source: AGHT+IHHnPU+sOVT053l7deT3P8z3LJVFAOiksWjmZKd0Ub2gBIDgZK1/4gCPHfUrNaBqPQVOEAIKA==
X-Received: by 2002:a17:907:d16:b0:b04:6338:c936 with SMTP id a640c23a62f3a-b07c35b8e53mr876582466b.17.1757822228258;
        Sat, 13 Sep 2025 20:57:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f1e54sm673986866b.75.2025.09.13.20.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:07 -0700 (PDT)
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
Subject: [PATCH RESEND 49/62] init: rename ramdisk_execute_command to initramfs_execute_command
Date: Sun, 14 Sep 2025 06:57:03 +0300
Message-ID: <20250914035703.3729713-1-safinaskar@gmail.com>
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
 init/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/init/main.c b/init/main.c
index 5186233c64fd..cbebd64f523c 100644
--- a/init/main.c
+++ b/init/main.c
@@ -160,7 +160,7 @@ static size_t initargs_offs;
 #endif
 
 static char *execute_command;
-static char *ramdisk_execute_command = "/init";
+static char *initramfs_execute_command = "/init";
 
 /*
  * Used to generate warnings if static_key manipulation functions are used
@@ -609,7 +609,7 @@ static int __init rdinit_setup(char *str)
 {
 	unsigned int i;
 
-	ramdisk_execute_command = str;
+	initramfs_execute_command = str;
 	/* See "auto" comment in init_setup */
 	for (i = 1; i < MAX_INIT_ARGS; i++)
 		argv_init[i] = NULL;
@@ -1491,12 +1491,12 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
-	if (ramdisk_execute_command) {
-		ret = run_init_process(ramdisk_execute_command);
+	if (initramfs_execute_command) {
+		ret = run_init_process(initramfs_execute_command);
 		if (!ret)
 			return 0;
 		pr_err("Failed to execute %s (error %d)\n",
-		       ramdisk_execute_command, ret);
+		       initramfs_execute_command, ret);
 	}
 
 	/*
@@ -1588,11 +1588,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * the work
 	 */
 	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(ramdisk_execute_command);
+	ramdisk_command_access = init_eaccess(initramfs_execute_command);
 	if (ramdisk_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			ramdisk_execute_command, ramdisk_command_access);
-		ramdisk_execute_command = NULL;
+			initramfs_execute_command, ramdisk_command_access);
+		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
 
-- 
2.47.2


