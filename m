Return-Path: <linux-mips+bounces-593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E09809D11
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 08:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FBF31F21133
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 07:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D300B101DB;
	Fri,  8 Dec 2023 07:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CDNIHDNb"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58848171F
	for <linux-mips@vger.kernel.org>; Thu,  7 Dec 2023 23:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702020649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lqd+oR1/9Yw4u2jQUrZmD5XRa3aKzcaLuNSBKTGkq30=;
	b=CDNIHDNbOaFrW/2lxpEugRR0AY83IhDDZg0hNMiJMWs2bFfgyb5Se46tUBh0hyoZE5YV3a
	sxN9BpfkktLFMweSlyCTWcF0MLuda0OOtg9uIXArwOzg92ftwXvfMUvPFeiZ0DF9CMcW30
	w0GaVeBjhv9UWt/EjIgnKAnTHrV0IMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-owVotutEOF-CVKYkPKJ4lw-1; Fri, 08 Dec 2023 02:30:45 -0500
X-MC-Unique: owVotutEOF-CVKYkPKJ4lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449CC85A588;
	Fri,  8 Dec 2023 07:30:44 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 917B98CD0;
	Fri,  8 Dec 2023 07:30:39 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	x86@kernel.org,
	akpm@linux-foundation.org,
	eric_devolder@yahoo.com,
	sfr@canb.auug.org.au,
	ignat@cloudflare.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 0/5] kexec: fix the incorrect ifdeffery and dependency of CONFIG_KEXEC
Date: Fri,  8 Dec 2023 15:30:31 +0800
Message-ID: <20231208073036.7884-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

The select of KEXEC for CRASH_DUMP in kernel/Kconfig.kexec will be
dropped, then compiling errors will be triggered if below config
items are set:

===
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_CRASH_DUMP=y
===

E.g on mips, below link error are seen:
--------------------------------------------------------------------
mipsel-linux-ld: kernel/kexec_core.o: in function `kimage_free':
kernel/kexec_core.c:(.text+0x2200): undefined reference to `machine_kexec_cleanup'
mipsel-linux-ld: kernel/kexec_core.o: in function `__crash_kexec':
kernel/kexec_core.c:(.text+0x2480): undefined reference to `machine_crash_shutdown'
mipsel-linux-ld: kernel/kexec_core.c:(.text+0x2488): undefined reference to `machine_kexec'
mipsel-linux-ld: kernel/kexec_core.o: in function `kernel_kexec':
kernel/kexec_core.c:(.text+0x29b8): undefined reference to `machine_shutdown'
mipsel-linux-ld: kernel/kexec_core.c:(.text+0x29c0): undefined reference to `machine_kexec'
--------------------------------------------------------------------

Here, change the incorrect dependency of building kexec_core related object
files, and the ifdeffery on architectures from CONFIG_KEXEC to
CONFIG_KEXEC_CORE.

Testing:
========
Passed on mips and loognarch with the LKP reproducer.

Baoquan He (5):
  loongarch, kexec: change dependency of object files
  m68k, kexec: fix the incorrect ifdeffery and build dependency of
    CONFIG_KEXEC
  mips, kexec: fix the incorrect ifdeffery and dependency of
    CONFIG_KEXEC
  sh, kexec: fix the incorrect ifdeffery and dependency of CONFIG_KEXEC
  x86, kexec: fix the wrong ifdeffery CONFIG_KEXEC

 arch/loongarch/kernel/Makefile  |  2 +-
 arch/m68k/include/asm/kexec.h   |  4 ++--
 arch/m68k/kernel/Makefile       |  2 +-
 arch/mips/cavium-octeon/smp.c   |  4 ++--
 arch/mips/include/asm/kexec.h   |  2 +-
 arch/mips/include/asm/smp-ops.h |  2 +-
 arch/mips/include/asm/smp.h     |  2 +-
 arch/mips/kernel/Makefile       |  2 +-
 arch/mips/kernel/smp-bmips.c    |  4 ++--
 arch/mips/kernel/smp-cps.c      | 10 +++++-----
 arch/mips/loongson64/reset.c    |  4 ++--
 arch/mips/loongson64/smp.c      |  2 +-
 arch/sh/include/asm/kexec.h     |  4 ++--
 arch/sh/kernel/Makefile         |  2 +-
 arch/sh/kernel/reboot.c         |  4 ++--
 arch/sh/kernel/setup.c          |  2 +-
 arch/x86/boot/compressed/acpi.c |  2 +-
 17 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.41.0


