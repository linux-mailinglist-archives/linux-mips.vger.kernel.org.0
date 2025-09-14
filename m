Return-Path: <linux-mips+bounces-11332-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EEB565C4
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 05:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F24A14241E2
	for <lists+linux-mips@lfdr.de>; Sun, 14 Sep 2025 03:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A15F267B01;
	Sun, 14 Sep 2025 03:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKs6hFjH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB7B265CA2
	for <linux-mips@vger.kernel.org>; Sun, 14 Sep 2025 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822375; cv=none; b=F69iFr3JybmLZGWQs9uQgVgtUHjYZHsNLTRQb4/Q7aFmmhytKWB4r3SPcFWJaXMWxsI9dnIDA2Z7qPuX7g4cIRSOwIAM3Qnkx22VKC1rwS0Gnf/OoQ1D7984FQis6pd8LQeqB5ljFNLlBdEkdXRTysxmP93fq+oohITDGMq9LWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822375; c=relaxed/simple;
	bh=dWOevKs33KVPp7BfwW01lTdoAaIwqA9A0zVQ5+zAb7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QsIPvQ9Xg2v8RLE4OxtRR/UGaLQpksHhBJcE0/BlUtpb3pjSjUJrLPXd5SEYPC4XFXGu4i+5O4+LXqx/nCkZk6f6Pz+pHvs95PKyXcrkbtyx87agt5kdAeH6wygSpttyXh3I7sAv0W/IBj0zKijLoTKeCvCrDTQ5q8qovJs2JDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKs6hFjH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so479129266b.3
        for <linux-mips@vger.kernel.org>; Sat, 13 Sep 2025 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822372; x=1758427172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=HKs6hFjH8hGEx8kFtB0nX1YwQKxkyNvIdKjk/YzKI/z0N2ZDpeaXyG20MCSaoI/O2G
         2InbYsM0JIlQw7fF9JQOjh6n9wTE10N4NGXAGVvOCQCKKy9hNkIvXHLpTaffaQ6s4mep
         pn0gal8CFQcQZ85hI0z7RZR+ISakVK9tsmvSpSebNlKb7PJPBY29jl/n1UT+16TV+0Kq
         W5Tf98TOSJKftoJa69Zn2ced0NPDfmm4/u8FNqhdlooOtvVHogWf1HBA6yplUDCHmgHZ
         OkkxLOYjZIXLTHxcdVwz73zpMIl1H00w+5KjoLiwvSIKL2neU5Q4/hIDRV0tsOcrkaR0
         rIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822372; x=1758427172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=TM3gxZI46GQMhk/sZs+QwZoUrSJX8ba1rGCdcIJAVz2UPdmxrmy/QwLpKssQds2gqM
         AAHJiTsgPCgyFFwa215o4iEN91SwqHylbTj8twoJzEc/Nd/d0jThroLvfdkJVQvp8CrM
         59BT4zBXiovVQr5HbS5xqyWLe/Nla6Dm0ideFiFfyk8diREBDKEwi1rxr0xr9Ppf7YOK
         HbnnEj1ZCnxYsVLDOtXN9jPA0wmFo0qgMq0dZ2zfYmwd/OLsA6eedLWC/aQjyJG3HjXP
         ivnW2SNlWE8tBVPE5hD8STQAAdQOadFcRAcjC7EmIsf8Maxf/v7DWXuUcozPJN4PHfWa
         JFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6aS34IxwKP9Xrn7AgSZdaibJ6B5GaXRmTPTp/Qz+5XpsR6vxtecfehUB6lM0d9+2ixzjE+WkX1jt2@vger.kernel.org
X-Gm-Message-State: AOJu0YykZuSrtYGpk4+aA6+o0c80/h72NakDX2IZRxE1Te5MdBnbVZ96
	dWJb4xKSFJ6X0LwykcHQHraUJa5P/MPQfSSujV8JUQk1iCOmZ2UQK1Mv
X-Gm-Gg: ASbGncsUm/tZb2JAQmNOqAh2QtIv7PE8njTV0EYkSFz10sDJuk2WSLjMFE7Dnq5L1+y
	G7oT/lxjlk9weQtG2j21mlt4C+BSra1y+diBDLaH5SQWpdV8eB0bzX/2PsxdKj9MOQi0JUlItbg
	1BEYTSd+n2fQ2hIyeSQfN0yE1SlhM5c5z1E37IzpjUsuPMqdmBxWcuIHpmb/5LLEkQdN1VHxK4O
	gMUntxHrU1OcufbCUmwu9Ap8Agj5UB7UHnADD1JEvDQlgNxANYH/DTYGppKDSSi42/DuSiOH8b7
	+KFd4uoyn9BuQrJvrjPoRLHtcdOvBZ06XIc4cB+37SpHKD3fDEsiO9C4Tahddpkq72q+RhpaeoU
	aILr7A2WUb8dlX71QABo=
X-Google-Smtp-Source: AGHT+IHIaNmlQUOqaI2XvHaD2x2sJJCA+iwXMxeIqgPaozK4MzRrxS2gXxwIxVkINaRf0GrOSh3U1Q==
X-Received: by 2002:a17:907:3ea6:b0:b09:48c6:b7ad with SMTP id a640c23a62f3a-b0948c6c6a4mr387666066b.57.1757822371514;
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07de03d93csm287001766b.12.2025.09.13.20.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH RESEND 53/62] init: rename kexec_free_initrd to kexec_free_initramfs
Date: Sun, 14 Sep 2025 06:59:26 +0300
Message-ID: <20250914035926.3770703-1-safinaskar@gmail.com>
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
 init/initramfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 40c8e4b05886..d52314b17c25 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -690,7 +690,7 @@ void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 }
 
 #ifdef CONFIG_CRASH_RESERVE
-static bool __init kexec_free_initrd(void)
+static bool __init kexec_free_initramfs(void)
 {
 	unsigned long crashk_start = (unsigned long)__va(crashk_res.start);
 	unsigned long crashk_end   = (unsigned long)__va(crashk_res.end);
@@ -713,7 +713,7 @@ static bool __init kexec_free_initrd(void)
 	return true;
 }
 #else
-static inline bool kexec_free_initrd(void)
+static inline bool kexec_free_initramfs(void)
 {
 	return false;
 }
@@ -743,7 +743,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initrd()) {
+	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initramfs()) {
 		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
 	} else if (retain_initramfs && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
-- 
2.47.2


