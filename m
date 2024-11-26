Return-Path: <linux-mips+bounces-6802-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD99D9CA2
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2024 18:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12FE4285378
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2024 17:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CA01DB95F;
	Tue, 26 Nov 2024 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pNuaXkMJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8471CEE9B
	for <linux-mips@vger.kernel.org>; Tue, 26 Nov 2024 17:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732642457; cv=none; b=p5svVTmUBbqWNY31/mctW6mFHFTHtrwSnGTtfhvFfKfsynRB/C4Se9KlMKJ6BlWNUe09T0Jiw3SNe56MekP+KYIezLGXrlaHfrKXYhN4zmLlROEMcMv7y7uedgZnUqs5HsyKLlmbiyR2AgXNEnvv/omLTr0MdKnMQdMhAzzY70c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732642457; c=relaxed/simple;
	bh=mGFTtX6XXg5VLNadn4sVwmluKYYuu0Mt7yyAn3iW9cg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=pnEspiVy2kevQppqKrF+jlpD/F1mcrs1Q2vKbE6mJngJHZlYin6Ov5zsvt+mUgtkbv/eaGivHyI6mLihhXi2l0yBpMNx6PZyqBv88AnHtaje5AxVXGw1jRk92KVIg/jOUy0O5Ux3ODFVfUVXr1D76KtIZak7b5bKfaLkk99t6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pNuaXkMJ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e5efb04da7so5810462a91.0
        for <linux-mips@vger.kernel.org>; Tue, 26 Nov 2024 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732642454; x=1733247254; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A90IYmUCselE4qTryd9IxmYXZiUDGR9//N6PGP0Z5oI=;
        b=pNuaXkMJSgG459n86F/vKNVs/ZfHGGrvPuD1C9YrWVsF9jLGkYJqZSJjw4FzX/H5Xe
         4+ZWWCUqvAvDJFv54U2JzLy1x8AhTm2TxxYP0iZ767KcTUvP0z+f8QWJr2C55iLiw6p4
         s8cMNVRaQGvW4tu4yw0D90RlyOa8CEb7zIV4SmYXhJ+TSx4tp7HekmB8Hoj+Vy637st8
         zDOCT4Edr/eukcNqxTQh7v+mo3s82/CVvHvoJGFhwx0HSmDzMDUfqh/CEfRNeG0IxCLj
         FBHRQOGbvFnj2ISggcZBFm6sf41m5bPtzc6qvGBVDtH1csuxiFFLe6BDZ7CUJTF+0XlN
         kutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732642454; x=1733247254;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A90IYmUCselE4qTryd9IxmYXZiUDGR9//N6PGP0Z5oI=;
        b=HvFm4GE7jHfYvSigZ8XV6Gh89w6iuIgyoSRA+U8Yxh7ZdFNo8Wws0D6mpJn/5n87bk
         HbwzZTiM0amDIBA14ZEPSLqXKv7ABXxJnuJgLwVunab4e8lYTi1TXJ4JfuZN0CPWxpng
         HCqPP8fKvocNPhvqYrY6waj1QkK60aIvPN8MMN6ilw3hnd1toy2oaoVrjownH4C0MJNh
         TM6Ppp0VGmRkoyle3PpadSduhj4QxR4opuU5Nh5tlUZ8CNjsS/40X0BAGDFxWd7G7l3J
         Ax1ZAFWvkQI/K0ohA1YxkGXmX3ls6Dz49V9Twr8cVPpbvKlvLm0x89iMyeYzP5/xozwQ
         ctng==
X-Forwarded-Encrypted: i=1; AJvYcCVlsu+/ZRwvl2fH4oMt7MhYohhL4UJcNWmL4dWx9/fjVB5rjpw3z2h7h2xzM7oO4l+ecbUBWPOiTYE+@vger.kernel.org
X-Gm-Message-State: AOJu0YxjejQ+3bPH4JVxvqBDBrQrDVNZ4mF21eWCZrBaFZidlnNG83sR
	a6uQpKOZ0Y7zGi9SWN8LuHAsfjLRcSyy/iT8aaNvmA6YjXIkIoA7FOQOXPbnlfozkQ==
X-Google-Smtp-Source: AGHT+IGzrM6FvnCM634BZvjuGUEkX5BfMb0HbEZwyhF6T4V9Rxe+LZz2q7yU8kaH9JCYzhnBYVXRWyo=
X-Received: from pjbrr4.prod.google.com ([2002:a17:90b:2b44:b0:2ea:5824:7f25])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d81:b0:2ea:4e9e:df87
 with SMTP id 98e67ed59e1d1-2ee08eb62b0mr146049a91.19.1732642454261; Tue, 26
 Nov 2024 09:34:14 -0800 (PST)
Date: Tue, 26 Nov 2024 09:34:09 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241126173409.3728585-1-xur@google.com>
Subject: [PATCH v2] [MIPS] Place __kernel_entry at the beginning of text section
From: Rong Xu <xur@google.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Klara Modin <klarasmodin@gmail.com>, Rong Xu <xur@google.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Mark __kernel_entry as ".head.text" and place HEAD_TEXT before
TEXT_TEXT in the linker script. This ensures that __kernel_entry
will be placed at the beginning of text section.

Drop mips from scripts/head-object-list.txt.

Signed-off-by: Rong Xu <xur@google.com>
Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Closes: https://lore.kernel.org/lkml/c6719149-8531-4174-824e-a3caf4bc6d0e@alliedtelesis.co.nz/T/
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/kernel/head.S        | 1 +
 arch/mips/kernel/vmlinux.lds.S | 1 +
 scripts/head-object-list.txt   | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index e90695b2b60e..c7528d96dd1a 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -59,6 +59,7 @@
 #endif
 	.endm
 
+	__HEAD
 #ifndef CONFIG_NO_EXCEPT_FILL
 	/*
 	 * Reserved space for exception handlers.
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index d575f945d422..c9c1ba85ac7b 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -62,6 +62,7 @@ SECTIONS
 	_text = .;	/* Text and read-only data */
 	_stext = .;
 	.text : {
+		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index fd5d00bac447..f12b4a7b8406 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -23,7 +23,6 @@ arch/m68k/coldfire/head.o
 arch/m68k/kernel/head.o
 arch/m68k/kernel/sun3-head.o
 arch/microblaze/kernel/head.o
-arch/mips/kernel/head.o
 arch/nios2/kernel/head.o
 arch/openrisc/kernel/head.o
 arch/parisc/kernel/head.o

base-commit: 3596c721c4348b2a964e43f9296a0c01509ba927
-- 
2.47.0.338.g60cca15819-goog


