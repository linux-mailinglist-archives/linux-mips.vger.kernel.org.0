Return-Path: <linux-mips+bounces-11318-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E539B564BA
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 05:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1D211A20762
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 03:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C82C26E6E1;
	Sun, 14 Sep 2025 03:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8exd0Or"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2725334B
	for <linux-mips@vger.kernel.org>; Sun, 14 Sep 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821872; cv=none; b=aARxaWE0Kub5u7He4MEbPq+etDVW8gl1pQkIgS3OcSAN/4kUIY5qVixwR7nvgE2TMJQy0t9Mrp299l6eHWLoahUnr7YXghfk9d1gaTZVF16yzQ78bA4OPDDWSKyAoYKb2Rim4gm9FwgQhbgaIoebBAjwwjtoIE6vbzxTphVdP4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821872; c=relaxed/simple;
	bh=0pa06GJsqjKCCDz/UM3o5nwPqkgP4CqvzP324rR3v40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYnzDTY31RE/ooRWvFnMlhiFt6I4LcpMeE6ScsZPwHEN13d4yvuSl6JE5tDhS4c3ANsmcvnn6Lwfo2NJxo6Ea9d87hj2suCe7GQEwk/tlDh+jz46YwSRYA61OhtgE0Mc0CsS3cFHFRIeAvMQYh2RnE9rYUpXLKlu9byOEOT4pkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8exd0Or; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso92709766b.1
        for <linux-mips@vger.kernel.org>; Sat, 13 Sep 2025 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821868; x=1758426668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=Q8exd0Or+KP3IfpJ/F6cr04Z8ZzprXAK/vvOy0fDtx94X4VdoDeaLl53x+Re5XVu87
         nMyvaYDn8vFmTcEvvBxemBcs/KQak0F949JM4uH33s339OQt5URkPKDSAY3+ZGKOdjL5
         pUJ94likUMs0rBMqjlpvJwgZdJbK3S9flcLQ8zD5bq7g6BoxDcTYuO+f8U85RhZRiEFd
         NWgbXH/2vbui42YTjC9kWIfsAixItMc1GfQiwH5d3DjDt9wpiScun1VkZoezAqvc6RKI
         73MhrVf1ZHdX6nrAEPt0Dk6q5BbIrsUiJClkzy8cJCjt926MOo3foy+tV7x7JwQDnt3k
         Kq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821868; x=1758426668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=fmwE46Xay9gzwy7buSyGLcVIgGLNF72o2C5nou9MbOGHA9EkZZi0mPgo1Fq/iX3aU6
         hAQTbfIsvBxmFgwvuP6EQAAlJrUCLGmFRfeIqUdV1+6oKf2s9fC2H1Bk4lxBAdZvFvI7
         lTw3nN5+BH/7nKHgFf2x8ReRW2/s2iR6B5scCqfK4aVOYsaT4HUiRFasKu/Lp98zp5bI
         mbpofbEzUFEjjCYgjbg0vaSTc4czJeStC8yj1Xmt/5dN5iCf54MlcRCEOVBxgQlmeFQo
         M48M+2enJb+sjDNXGRLBb3/KIUAO7yqkf2i8LPUC8UmAF99keqBzb+fs120/tSg3PIAB
         l37g==
X-Forwarded-Encrypted: i=1; AJvYcCUhgaUC/j8h8lZc1fvm0gDZKW/42Wl/eWmwm4aBmVdxIm2w9OzsfPMzEy1Qwu6Xz5Xe7gRCtp+VXHvR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0KOVXECLapWhiDpPu1JqoRbbXUe1h+Y9OhLcIcLcH3pjh0pCQ
	b4QpG7/V22gJVbPDlJykTIvAMlcgud/Mmp9lW+T1IIv1VlwBFZ6Bxi7O
X-Gm-Gg: ASbGncsX3bMicFfg1AguwFs4koa8iikzxTaV4fp3Q0P4bEusRmCwBQ5DXgQLS0PFgSg
	4UTIDORU7bEZYB5+sbJ3gYIOR4zovX6kUb0q1WBZ2LqWulWib0XCiTbz502M1vIf05oHk/FBaog
	pzW5EdvLP0tj/+jGSp+k7rHiCArAd3MFaNeya9eINQoy65Kn/ZTi8c5IrRYFd/LZlL0e7sKK8I/
	j2iSkLwQwwrIU3mRdu59xNf/vYwzXdgEspVN6mqQ5gZRxfuNYDPEprb+uKnn7wJyAwiu5XUtj8l
	9FSnUJAJ3KZRGef93GINYa+pVwiAoyQVk1ddAHsR9AR/W6iQum/AstmC0jJQzBxtrVMnjYz2C9r
	P9pgcejWqt5D4cW9TlGM=
X-Google-Smtp-Source: AGHT+IGYiK6likOM/TjE1BLl/jI3UX22nGT0EQIxF87CUWohx3tkGnMcAa8PzC4lwu+rbC2577QTfw==
X-Received: by 2002:a17:906:46c7:b0:b07:da17:79fd with SMTP id a640c23a62f3a-b07da178367mr507229866b.17.1757821868321;
        Sat, 13 Sep 2025 20:51:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347b6fsm679031866b.111.2025.09.13.20.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:51:07 -0700 (PDT)
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
Subject: [PATCH RESEND 39/62] init: make console_on_rootfs static
Date: Sun, 14 Sep 2025 06:51:03 +0300
Message-ID: <20250914035103.3619203-1-safinaskar@gmail.com>
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
 include/linux/initrd.h | 2 --
 init/main.c            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 364b603215ac..55239701c4e0 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -23,6 +23,4 @@ extern unsigned long phys_external_initramfs_size;
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
 
-void console_on_rootfs(void);
-
 #endif /* __LINUX_INITRD_H */
diff --git a/init/main.c b/init/main.c
index 58a7199c81f7..f119460bf8e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1533,7 +1533,7 @@ static int __ref kernel_init(void *unused)
 }
 
 /* Open /dev/console, for stdin/stdout/stderr, this should never fail */
-void __init console_on_rootfs(void)
+static void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
-- 
2.47.2


