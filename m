Return-Path: <linux-mips+bounces-10208-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1BB21D94
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 887A66859F1
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0C42EA47E;
	Tue, 12 Aug 2025 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DOgN3Y5E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xp94uLfR"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC52E9EDE;
	Tue, 12 Aug 2025 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977499; cv=none; b=Z8ADI8+IS/AVdAHIM+djFphaZ7EJIVQ1Y8xX/4QuA+/SyzW4NePTqrvnHFQ1kjqdVzSTRqQ57hGmDAR22z+vqPEp32u7HyUIJpFRdAUq4z1OfF5NLXQVJ4mCmba5EUibw1jhhFgxkg4aN0SNtF/WPRocn3ox1R7UnagaxfSnabw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977499; c=relaxed/simple;
	bh=Kx23G/jdGST0tg6021hFwad6UPxIH/+IOFc6beuEorU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv3iOljajRdOINqLBsccjST4l7cEh7SiscxTKatADlmKSFrmXHkkn1/rSmwWhGKIbwJ0OmW7cqmxVQ/3Ad0SJTUrZqO/nnVLfJ1ZXiG6lYUhDd45SVPAdSd9bPkF3k8efPhUjvIx/8KZY4qtsq6TeQn/v3PeYy9VATYi0yy/4o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DOgN3Y5E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xp94uLfR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Kjpq5eR3VtQueM0L6XasJAF39E5US6j25ec6FsCv3w=;
	b=DOgN3Y5EQB5kdutA1572V0LhXOZXnmRl6p0P18a1t7ObF9ucTKlbEHkVhxaejvdIZK3PIY
	lIUNnRcEoWpe9jMcL/sz5eDD1osU0bJplewxq79IGnmKl56iuX34wGlZkE8q0QXbW8ODPS
	/tRsjn5u/aceWhclEIiQoXuf5PoMDguQZFCa+gVrW0g1vlK8gccXdEQDtujNgXNNo0KdxN
	WuCKV7zOYOnI0NnSYDP7lGE+2WUwTHGjY7UEreXmXplASXvZjXyi/1+qv/lFjFdZDmXlU/
	TSNZ1c1JACCFOcsJSoennrnbZSFvpsaVg3kBWIxDpWM65m2K7yxEzt3JfuJQug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Kjpq5eR3VtQueM0L6XasJAF39E5US6j25ec6FsCv3w=;
	b=Xp94uLfRG/UGZ4I0EOrrP3/TrL+9J/C3gXEU1nyi3fx2RRuH8xCgRiBDmDN3dECl7takoc
	IY8Vx1R01mdHNgCQ==
Date: Tue, 12 Aug 2025 07:44:35 +0200
Subject: [PATCH v4 22/24] MIPS: ELF: Add more PC-relative relocation
 definitions
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-22-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1659;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Kx23G/jdGST0tg6021hFwad6UPxIH/+IOFc6beuEorU=;
 b=9721hy+2tPJhw7rgs5OUlE+6rM6NCuWPGCnHL0GckAQKuaqMknOzzL6abxn133J0vzAnS6u6/
 H4ms/FvzKN2ALTXQO9bp4r8ji2uMhcnak2odoRO0TaHpLw+mLogGUf1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

These are used by userspace and are necessary for the vdsocheck tool.

Also update the copy in tools/ so they can be used by vdsocheck.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/uapi/linux/elf-r.h       | 6 ++++++
 tools/include/uapi/linux/elf-r.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index e750989e44e8f517d7dacf9d3a338af7a136e40f..9f7457ba1c63252d10b9ab25601581bd99af7a21 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -616,10 +616,16 @@
  */
 #define R_MIPS_PC21_S2		60
 #define R_MIPS_PC26_S2		61
+#define R_MIPS_PC18_S3		62
+#define R_MIPS_PC19_S2		63
+#define R_MIPS_PCHI16		64
+#define R_MIPS_PCLO16		65
 /*
  * This range is reserved for vendor specific relocations.
  */
 #define R_MIPS_LOVENDOR		100
 #define R_MIPS_HIVENDOR		127
 
+#define R_MIPS_PC32		248
+
 #endif /* _UAPI_LINUX_ELF_R_H */
diff --git a/tools/include/uapi/linux/elf-r.h b/tools/include/uapi/linux/elf-r.h
index e750989e44e8f517d7dacf9d3a338af7a136e40f..9f7457ba1c63252d10b9ab25601581bd99af7a21 100644
--- a/tools/include/uapi/linux/elf-r.h
+++ b/tools/include/uapi/linux/elf-r.h
@@ -616,10 +616,16 @@
  */
 #define R_MIPS_PC21_S2		60
 #define R_MIPS_PC26_S2		61
+#define R_MIPS_PC18_S3		62
+#define R_MIPS_PC19_S2		63
+#define R_MIPS_PCHI16		64
+#define R_MIPS_PCLO16		65
 /*
  * This range is reserved for vendor specific relocations.
  */
 #define R_MIPS_LOVENDOR		100
 #define R_MIPS_HIVENDOR		127
 
+#define R_MIPS_PC32		248
+
 #endif /* _UAPI_LINUX_ELF_R_H */

-- 
2.50.1


