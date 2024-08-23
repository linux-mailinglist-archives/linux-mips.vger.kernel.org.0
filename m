Return-Path: <linux-mips+bounces-5028-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D588A95C28B
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 02:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0641D1C21E73
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 00:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602B2BE47;
	Fri, 23 Aug 2024 00:41:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4623AB;
	Fri, 23 Aug 2024 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724373710; cv=none; b=LJ9MEgZ+HvYB6ym5alBR2gWLN+YRGIcJ9X1+QPZz0vIm2MoqbQevKz4+y1VkFn6/iasafKzItpRQL3hGOx68PxHYyPLe9xKGNrz5lAOQopXK/a+/3tqrc/NTU98RYB78EwopQ7dOUg7P+8YqRJlKBclkghCua2ZDiE9BquOdJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724373710; c=relaxed/simple;
	bh=ay4D6AfbKHWeweQWZp8GUqV00zuH70bD131HhDyI2/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIdI7SQIgBwxG2DwhsewTWEa6tz/szZe7piPMn+67HlEGNNYKN6bCHIhoPHoow0B1M0dcjQ2ln5KavHxXRRwU0xOgzHvfLvvQczfADWyengLuvDxFLJs+BQs37g8Jf8a9otet98qzKKSVTdN8xvvQ9alZk72qIBB1cLJa/p1PbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0b7efa1c1bso1447041276.3;
        Thu, 22 Aug 2024 17:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724373706; x=1724978506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrrorkPUTMRy8B+Se5r9dC5v0n87yzEWeWGrk9H7liI=;
        b=vOb9XKHoxKqZaFKdJuFjTHw7711nKK5RdOVPL4F3xV5EHxUbJzSf3iSgLHDKGuP8hD
         +BURFulJTwNNGyZ6Hjy/kWy98rC2SbUwH3aII3xcHTUATFgpfiADMpeNSdhdvYSbYnTO
         CkqKLgeAe6zxS8mkLQsm+OlXSR7wKhxX+gXxjBHR+OLJ3GhARWFozOhZal2I9lmVe67c
         jn7wzNCkL83X9NUY4xjubXIq1wzCqjwW+h8hxj46WCSKEqgwf67dAZHndUpdLisyV1NZ
         ei+d5XrHc3qRUOm4iOlD4/guQk3BHb9n286d/WeDwy3ZeC2JdQo2mnjZU1PFg3e9yblv
         iuew==
X-Forwarded-Encrypted: i=1; AJvYcCWMn+qVWtUuD3A4Bi6iTIY1BZNRwYJ+0w3+j0EOQg0WY/jaaqk1Tbeb8P6hIx1PPOIVPCho+6F/DxbMnQ==@vger.kernel.org, AJvYcCWa5L9AXP6xhfSZFq3KieZADJo1qw0Bs6xX5mAcGwJpr/TxJ0Ksm+8wiDoWVax2pJK/4vFcuX+2dYsU@vger.kernel.org, AJvYcCX2rmv2h9oC5fL1B0L4GaMPgB9Lkd7jFkHw2op7K3hmua6Xkk0Bijw0wSoKtA6mGD/bZbNY/v4e/fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8aeI+XKeGvucyS0Ag8awpFWt+nbN/WhgRbNnsY6o5HBvX1KkC
	wqBLsDeYzGZpBcn1V/vwVNJRTPkvGK9oemzVgKAHdnsQ8gBysLlh
X-Google-Smtp-Source: AGHT+IFIoz3CpMkQuGZF7qiev1E8+/L42B5M6zof+vl5mrM+UBz8KVmsk5nfokb4H2v2uq4x0faLyg==
X-Received: by 2002:a05:6902:2083:b0:e16:4dc8:3cbf with SMTP id 3f1490d57ef6-e17a83e2837mr770622276.28.1724373706517;
        Thu, 22 Aug 2024 17:41:46 -0700 (PDT)
Received: from [192.168.2.219] (bras-base-mtrlpq3141w-grc-05-65-93-184-127.dsl.bell.ca. [65.93.184.127])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fe0dda4bsm12009631cf.22.2024.08.22.17.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 17:41:46 -0700 (PDT)
Message-ID: <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
Date: Thu, 22 Aug 2024 20:41:40 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
To: Baoquan He <bhe@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 kexec@lists.infradead.org, debian-powerpc@lists.debian.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com,
 hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk,
 Sam James <sam@gentoo.org>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
 <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024-08-22 20:04, Baoquan He wrote:
> If so, below patch possiblly can fix it. Can you help check if it's OK?

That removes the possibility of enabling CRASH_DUMP on PPC_BOOK3S_32, even when booting via other mechanisms. Maybe it would be best to just make it not-default? Please take a look at this patch:


From d6e5fe3a45f46f1aa01914648c443291d956de9e Mon Sep 17 00:00:00 2001
From: Dave Vasilevsky <dave@vasilevsky.ca>
Date: Thu, 22 Aug 2024 20:13:46 -0400
Subject: [PATCH] powerpc: Default to CRASH_DUMP=n when Open Firmware boot is
 likely
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Open Firmware is unable to boot a kernel where PHYSICAL_START is
non-zero, which occurs when CRASH_DUMP is on.

On PPC_BOOK3S_32, the most common way of booting is Open Firmware, so
most users probably don't want CRASH_DUMP. Users booting via some
other mechanism can turn it on explicitly.

Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
Reported-by: Reimar Döffinger <Reimar.Doeffinger@gmx.de>
Fixes: 75bc255a7444
---
 arch/arm/Kconfig       | 3 +++
 arch/arm64/Kconfig     | 3 +++
 arch/loongarch/Kconfig | 3 +++
 arch/mips/Kconfig      | 3 +++
 arch/powerpc/Kconfig   | 4 ++++
 arch/riscv/Kconfig     | 3 +++
 arch/s390/Kconfig      | 3 +++
 arch/sh/Kconfig        | 3 +++
 arch/x86/Kconfig       | 3 +++
 kernel/Kconfig.kexec   | 2 +-
 10 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 54b2bb817a7f..200995052690 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1597,6 +1597,9 @@ config ATAGS_PROC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
 	default !(ARCH_FOOTBRIDGE || ARCH_RPC || ARCH_SA1100)
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2f8ff354ca6..43e08cc8204f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1558,6 +1558,9 @@ config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 	def_bool CRASH_RESERVE
 
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 70f169210b52..ce232ddcd27d 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -599,6 +599,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_SELECTS_CRASH_DUMP
 	def_bool y
 	depends on CRASH_DUMP
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 60077e576935..b547f4304d0c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2881,6 +2881,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
 	default "0xffffffff84000000"
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7b09b064a8a..0f3c1f958eac 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -682,6 +682,10 @@ config RELOCATABLE_TEST
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
 
+config ARCH_DEFAULT_CRASH_DUMP
+	bool
+	default y if !PPC_BOOK3S_32
+
 config ARCH_SELECTS_CRASH_DUMP
 	def_bool y
 	depends on CRASH_DUMP
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..eb247b5ee569 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -880,6 +880,9 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 	def_bool CRASH_RESERVE
 
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index a822f952f64a..05a1fb408471 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -275,6 +275,9 @@ config ARCH_SUPPORTS_CRASH_DUMP
 	  This option also enables s390 zfcpdump.
 	  See also <file:Documentation/arch/s390/zfcpdump.rst>
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 menu "Processor type and features"
 
 config HAVE_MARCH_Z10_FEATURES
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 1aa3c4a0c5b2..3a6338962636 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -549,6 +549,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool BROKEN_ON_SMP
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 007bab9f2a0e..aa4666bb9e9c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2087,6 +2087,9 @@ config ARCH_SUPPORTS_KEXEC_JUMP
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_HOTPLUG
 	def_bool y
 
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 6c34e63c88ff..4d111f871951 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -97,7 +97,7 @@ config KEXEC_JUMP
 
 config CRASH_DUMP
 	bool "kernel crash dumps"
-	default y
+	default ARCH_DEFAULT_CRASH_DUMP
 	depends on ARCH_SUPPORTS_CRASH_DUMP
 	depends on KEXEC_CORE
 	select VMCORE_INFO
-- 
2.34.1


