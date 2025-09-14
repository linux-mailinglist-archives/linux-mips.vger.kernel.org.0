Return-Path: <linux-mips+bounces-11329-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD021B56590
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 05:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 587A13BBE7D
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 03:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC353267B01;
	Sun, 14 Sep 2025 03:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0pjvupp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8391F26E6E4
	for <linux-mips@vger.kernel.org>; Sun, 14 Sep 2025 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822268; cv=none; b=KTurnGue4rumxoMQMCEstNCN9Y1KyVAiAjeEIlUbkwLi1Sj0mOgM/+nI7mwAsRn+oxXVKQiVKqgcGwu+37Xld9t3H0OQXSO6od9Q8V/9ZbA3ll3ppKhZT6Q29CjTz0zslAFLCBY8kpbqZ5cZRchNFq+4+EMwHzFv4jz+DfJ1XDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822268; c=relaxed/simple;
	bh=oKU/He6fgnkGxFwiXzfMSQvpywViA2YaDdh3D2HgJ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeBh0kZb7xHhInvs6SnAxlopQxe54QOxJg74+IULy5pbGs9hMkv66JaASUIxNIXyX/9ZKpdtUcW9wLy+LQSai+GtgxWj7MeQ+rI+nRwa7DyO1YUlY5nYHgl/JGO8J5Yp8SxsKx0Q++S3D6+kOMmCjw5jXK6bp9i51WIbHJ3edQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0pjvupp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78ead12so403618566b.1
        for <linux-mips@vger.kernel.org>; Sat, 13 Sep 2025 20:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822264; x=1758427064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=Z0pjvupp9oiKINjNbyeuSobzmzNc3O235l4XZaJq6+xnV8xiQNvmcPRhTjA0wy8g9j
         1e/VnNr8qqUxIu704AIAXUk3hdIHvQA2i+7JMtdyUSLBNWCch2mJfUrX3kek54B00jIX
         cpkdx+SF3alQFdxuMwBpZmAMcBz1Fkvbhqc+rqW0oPJBw3vuPYmCSOvsKe8xp+b9RN/V
         gAdtsX4NIFWKTmhvWP3oEqv1ZMtJ8kBfRF67kPO2/akOjOYC2dMCZGY8BqZAd+ytSz+V
         h3rnckiFQSpaBVNrFt5iWUY1JpIoQK/ePVg8RRD6OraLlYp4RCO48NNQFUqRkIYcPgQk
         HyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822264; x=1758427064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=LhkK8OmWerR4nGdFdi514U4xuChrp8iXH5CFv7VHmfRcIJoZ/tM4hsT7Ff5bevhfuV
         HsOzpq1CO8uMuL6tPm5a8l8ShceZiKt9oBxr4z0EjbA7x8772KUC1UMcbV0SMnoLVhHY
         Q68rp4xPdEtx75mdY9m1Kt2oMTR9daV2WPo2YfF/R3pKkJJ4BAsdamSikWRZXNMXvBBI
         PURxP0Xem9U+GJzlKSz8PPViYlWAxpnP+xf7Rxs6nDnGxLuCehpFrWecWC5BW3hWis33
         62DO+7Fqb8MKM/qccw2vszRCjpCVpwjtyhALyRhSCEVJ3uBrGMc0sClOCpYJjnoMQMWB
         QthA==
X-Forwarded-Encrypted: i=1; AJvYcCVc9xDiXW2KRwIEUOea7wl4OudKln+E78fpglAPSH6/bM3jeV7jxcRwukv5EWMdubTEqVg4RMPNZe3/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxohdc0sD2V6ourqnzkBcnUCAYaWZm0DGpvvzPK615c5C+PQ1od
	SVK4oGMQGCOSglvDnOV5DiE096o6co4Nr5okIGbpAiNBgFHrM0B/ARaq
X-Gm-Gg: ASbGncvN5myFmRvJ1O4QzM3Db7qWhPHOUrZQY0iHAUXDuI1fx0UFBN2FPOWFFJiUkP6
	vte/Jzm/lgA9R3DtEIqDGxsbMOuh/4FwmJ1FgthPVdgipf1qOYOUB+xzr/dm7/UU9aXLQ/kTpVA
	Q9gCAmvd4heVnEsfVq7rf42Ipowi/ueA6xTFvue+LnrGhzFrDOI3XJ3VUImmE+afqY4NjlafinU
	gs9ZjiZYEca2CCtSv4V0JvFGxtm0Dee3hAIHIrmYgOw9it5PcYSgBlCk1cTMNElXamYAhulR6hI
	4517dCec4Kz64aHLPr3fpwlhyEXJKtWAq/39cMxIN/2PLZXZOJQTITzQ4R9QX/iHzfuVPr4+Cm7
	0V0ApyiTV4INzqQr9SW5Wz3ZhlSLltw==
X-Google-Smtp-Source: AGHT+IGOdPvfXOVddm8G6LJhfH2nNJDoTTLKR/3NE7kowNRoQPIuzhxmV+feQvXrrMYzfjsz5Ubcxg==
X-Received: by 2002:a17:906:a84d:b0:b07:cf04:8a43 with SMTP id a640c23a62f3a-b07cf049441mr520202566b.41.1757822263792;
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31287cesm676665366b.30.2025.09.13.20.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
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
Subject: [PATCH RESEND 50/62] init: rename ramdisk_command_access to initramfs_command_access
Date: Sun, 14 Sep 2025 06:57:38 +0300
Message-ID: <20250914035738.3741007-1-safinaskar@gmail.com>
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
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index cbebd64f523c..a42f1f0fce84 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1587,11 +1587,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(initramfs_execute_command);
-	if (ramdisk_command_access != 0) {
+	int initramfs_command_access;
+	initramfs_command_access = init_eaccess(initramfs_execute_command);
+	if (initramfs_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			initramfs_execute_command, ramdisk_command_access);
+			initramfs_execute_command, initramfs_command_access);
 		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.47.2


