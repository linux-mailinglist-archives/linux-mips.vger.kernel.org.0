Return-Path: <linux-mips+bounces-6797-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2789D8EE7
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2024 00:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6140D289B3E
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2024 23:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD231925AD;
	Mon, 25 Nov 2024 23:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r1+vshw1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66E1E480
	for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732576202; cv=none; b=bUMFaQqBu43/Jx8j54RAc0Hzsfsm4goQrp/fTazwGxGpdJJyvuJaW+uA8yIOJX2N3rT113Y5MYZ6SLZOk/gBGV4C61cs0AQgF9Nyw5rifwSHWJ9L1yX2Xfr4VoL8UVE5HXPVoZk31x3aBu0PtFQmbblpe4/Wi68Mw2XXpF0Brmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732576202; c=relaxed/simple;
	bh=p+JwPTIdtJuhlleWphzAyu/o4Jkrz2u6YvO9LTlnK2A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=Ny3XPeO1WIYYXOiIHZ0S131aagEurRC3UGYr2a4IiEBtqqXVmlZAnsYS32sTvQRSjLk+iH5QAjcQjYH7o8cjeKnLMJgkUZZzL2UNC8eVvQwLnvukBdCI+9aV3M8en0HKFmlQpiT9UVegtr5JcB54WY6S58Bi3P2rJoyGIb3YmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r1+vshw1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ea396ba511so6070800a91.3
        for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732576200; x=1733181000; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=slq9+JcUHnAWV6W5s8I4p+DaqsqfhLtbI53XDx3aDQw=;
        b=r1+vshw1FvRlM8zcZtmA4asWM4DS4LojZlRS/oufxD5H1eiqzVkyGKWET7ii0+0m5/
         oxm9o726vvcDtDHS8e5wq7ggmEOzZa3rDjBOreXOGFRCBbg1h3iTfs6VJ9d+jU0z/rs7
         aVS6zXvKwEKPak6HoqDosNnSzv3iFewWm8Xlit6xbAOv14NJZGIZ69RUc/ZYylv1uJKe
         FkZvLxsEC428kjNeavg+DcIdl9BGxzck0peVDFvbA0vqitPiNPK1y5PXiS1UH2eodSOy
         d6yhkC8HbXehoLnwrTzRYQd1ZmiqmtA7aagoOVSIHfFvyrT1u810a+KswmsnVC2SzYkU
         L1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732576200; x=1733181000;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=slq9+JcUHnAWV6W5s8I4p+DaqsqfhLtbI53XDx3aDQw=;
        b=rXgmuOKcVqqLf4+QuBKcGJ3tlw1i8z9CC0mP4q3Iq7OvUGX7U9SxKjkv62MVho1Gt/
         T4lsWWLjqrxuPKJJ5oal5tUVu6nwqv1hZZMVUByOuf+3ytV4/48+nNl2m81YI2E6xnQa
         Cda9+fbzB/nebNJOVg8qOcYnFuxWgY5T2QlhObIKleUNVS7fLF95jUHu7mFUJwKUCVVC
         HwPzlLYFi+avFwyqFq2Y9Kyf8ufc+gZe3+VYdUbDH/IAYLAev2VWFv0XdNWuxnargugn
         PMjRcu+1tqNjASYD9XerCTR1GbMBgJPCgJNIEmBk5uaeA/5BA5j7Ri8jf6pQodl8+IOH
         cluQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtO5v56/uNkZHUvE9NvmU/YPAXMJnV4duowkyYDXjBo7Z0gQU1J6e/GZF0BIoQD25rulcksTiFTe0J@vger.kernel.org
X-Gm-Message-State: AOJu0YxfU2AdWSPUlPU5RsLKY9wfiDGeHA9Ufa9k4z9F/1rbLzkAlRyt
	rJ4Xqj/QO42ZuzTXyftw6Rnpls4yv2/CW9l5NmjFbYB9sgkMbDX3GvKSSiC7+Cde7A==
X-Google-Smtp-Source: AGHT+IFvbThfmjyDGuaAizZoPz0OQyINfR8VSt1dw1TgS4AOGYsYx+QNS2lR2VXDyrw06XvagAQ08WA=
X-Received: from pjbph5.prod.google.com ([2002:a17:90b:3bc5:b0:2ea:7174:2101])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d06:b0:2ea:8e42:c48
 with SMTP id 98e67ed59e1d1-2eb0e02b0fbmr18297418a91.3.1732576200597; Mon, 25
 Nov 2024 15:10:00 -0800 (PST)
Date: Mon, 25 Nov 2024 15:09:53 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241125230953.3090508-1-xur@google.com>
Subject: [PATCH] [MIPS] Place __kernel_entry at the beginning of text section
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
---
 arch/mips/kernel/head.S        | 1 +
 arch/mips/kernel/vmlinux.lds.S | 1 +
 scripts/head-object-list.txt   | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index e90695b2b60e..6d5fc498c6f9 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -26,6 +26,7 @@
 
 #include <kernel-entry-init.h>
 
+	__HEAD
 	/*
 	 * For the moment disable interrupts, mark the kernel mode and
 	 * set ST0_KX so that the CPU does not spit fire when using
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


