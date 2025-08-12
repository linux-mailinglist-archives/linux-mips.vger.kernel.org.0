Return-Path: <linux-mips+bounces-10187-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC37B21D17
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE59F7AE9BD
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9382DEA90;
	Tue, 12 Aug 2025 05:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JqzHOjKA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eJOu4USm"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234C2D47E5;
	Tue, 12 Aug 2025 05:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977479; cv=none; b=R9s3ekifWUZh2Qzm+77jQ9TT+uHkzvH7gNyqjEdrWIUEoLH5ztguU6YJNb5zzHTkmT4A4ht9D2NbM42Qycp4ubUwCrYLeSWqspDjqsFo+bmgq0KUhaxFD7AU9B2f5uatYscyLv9hHiATrBGsWE4EGtypS2B18/XxYoH4444b8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977479; c=relaxed/simple;
	bh=pEZOOlfYLKHxA52mtxp/u2Atua1rkGYZwTp881737QA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JK7bn+88oJGJZrPjhAaoU8jowPnoJEIn1vkV806dCwU0CRutbTap/xqj9HLBSvZHdH8Fe55wtcEyDsLx1KMUvySk9n+jTBut37syHGbokOe+/NaTAhrG03pKC0NPjmjKF91paA8JK5FmiYyk8nJXfiNQQcJugEacxrMdwVRAwu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JqzHOjKA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eJOu4USm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeePFN7UO8+hOKOyWOa3G3+alh9wPXoqMxnhe0D2ylY=;
	b=JqzHOjKA7yrLionJrJNO8KOAarJG0Oo28v1APFSwq89167wmxb1lZyHMuXNnHrDwxH9gSS
	/ELfgioTR5fb/Ljc+sYJEHqydQykqY+dPku+piakuLpoYplUy8nu370IDCExIRAVnKTo2d
	+v+xsnzyadL06twVI4C4micp1yORPIESPL7D6qalI1kfH6fJTrTV7AQ+lUY6RdlBKcOlnG
	roKFqmu0T++7EKHvIZhYIq0thUktatKAE+bdUH3O4P8hQJDR+cw+xBAhVt8geh7pm3kY7R
	qbqMp5Grpn0o6oeLQHjtKHgrAL7YpnUDvTR5ZMbjSFY5TkenW05hQQv/hde6lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeePFN7UO8+hOKOyWOa3G3+alh9wPXoqMxnhe0D2ylY=;
	b=eJOu4USmFl8u450RqsRFSXa2Lhj6NjHhqFOSqGSdot5xvQYhfz7huLEAqhu43i8HbV2r/Y
	gOvSdTkIIYEnsrBw==
Date: Tue, 12 Aug 2025 07:44:14 +0200
Subject: [PATCH v4 01/24] elf, uapi: Add a header for relocation constants
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-1-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1460;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pEZOOlfYLKHxA52mtxp/u2Atua1rkGYZwTp881737QA=;
 b=FP2/6LZXvWWXU9TWRCOGilFMCMdFH/DUVBCJoOqArDIYqbLz6sxu9BRz2ZOAaXa6pVuX1T7y8
 Okzk+BkTdhVBChLHs5Bq2jeBZHod38wzt/AG9GAvJK+HF4hyrhvGqlM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

While the numeric constants for relocations are architecture specific,
it is still useful to get access to them from other architectures.
Also the definitions are useful for userspace in general.
For example tools processing elf files during a kernel cross-compilation
can make use of them.

Introduce a dedicated header for them, similar to the elf-em.h header.
For now the header is empty but it will be filled step by step in
upcomming commits.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/uapi/linux/elf-r.h | 5 +++++
 include/uapi/linux/elf.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
new file mode 100644
index 0000000000000000000000000000000000000000..2c382c8a4807f394a3ccabf39a81e9e9b6f7ea45
--- /dev/null
+++ b/include/uapi/linux/elf-r.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_ELF_R_H
+#define _UAPI_LINUX_ELF_R_H
+
+#endif /* _UAPI_LINUX_ELF_R_H */
diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index 819ded2d39de2bfcfca3c25a52c8b8cd51a01c12..3d18543d5460a757f0578afe5d487233ffaa3c57 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -4,6 +4,7 @@
 
 #include <linux/types.h>
 #include <linux/elf-em.h>
+#include <linux/elf-r.h>
 
 /* 32-bit ELF base types. */
 typedef __u32	Elf32_Addr;

-- 
2.50.1


