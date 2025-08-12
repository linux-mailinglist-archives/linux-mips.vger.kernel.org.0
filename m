Return-Path: <linux-mips+bounces-10194-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C0B21D35
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9466F2A8A77
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2969B2E5B22;
	Tue, 12 Aug 2025 05:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="17d1f5te";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AnyzdISP"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913AE2E4245;
	Tue, 12 Aug 2025 05:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977485; cv=none; b=RpoM3nZovnctYW9+6o1F2mO/IF7zV7stAOv1Wz2jXzDrVgVxKvkRdNowS8+R9vomzrZmZw9Zs3/JaDtIK8SrTqa5lmmJXQ0GgQiivOF3GojJgN6vooHtPnvDJBc0+GoDji4ievdPUXFxfgPlmSYIoifoXs06Y/hOEam4MiUnVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977485; c=relaxed/simple;
	bh=n05how22sEnufdxrM4828i2NNT++aNc+IpUgzqX7ohk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJyxTm9jupdp5yASskTc0huwsxw34fiF0FP6XPdCSgPWv3ccbOyil5pselCEMNKY/bL4LvVtzGQPyZP9pJKEcD/PTLY3CjAxcld6MZBJfk6FUMYC5NT/XQBPkNMF4kH5cMw7EuvrQqZevW0uTMBNCKrHf8tiJPDbe4TKnXDFj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=17d1f5te; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AnyzdISP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/qXdYtuegbf1kl5O2TCqH5+73vhTlXMdIZfEuJ+F/k=;
	b=17d1f5te+/cYBYYWcDFI2wtdn9xCozU1IkOSYgkcb8wwg8BvllCjsWrJlWBsegHjcXWWT3
	JW7rnq6dzPdI1jfRRI4Ba8bFhvLYvh9a04yrwZlE0U9F9P1g5DfUWBM5uQTfMy6OxNdcAu
	Ezv+Cec9cudmfQ0tnoqRpOuEOQYz8/Fu29PDNf1QXEPO1wdM/PtQrsAsWDNEgSygSdMCUe
	Bhv3EbU1D2p+VZpyHFp4vo3+ifKQlo03GgriBzPwA/5lzqXv/pzM14a5dDSFK7iZBTkibz
	8j+KrfAUXszZVTX8OjrMunhc06qTDe59Yplj8hJ/hsxVmkOQjUn1TaTGGsLJtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/qXdYtuegbf1kl5O2TCqH5+73vhTlXMdIZfEuJ+F/k=;
	b=AnyzdISPaKFp+y6n7TGUqk/HejZjbkZ6cHuOvZNDIlkCerQgYuGgZsZTvKifvm6DRPWK2N
	1LTEcv+LjMlE2fAw==
Date: Tue, 12 Aug 2025 07:44:18 +0200
Subject: [PATCH v4 05/24] powerpc/elf: Move relocation constants to UAPI
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-5-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=22362;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=n05how22sEnufdxrM4828i2NNT++aNc+IpUgzqX7ohk=;
 b=oI7oXoKhdlE0kZzRJI6qcV4/RnB44Z/ZCa4X/gEW6kb9109rpAZpDJ0BKApz4EG+rn/9CHAf0
 Su5Yu4Vq3eLBG8aD7k5rSdis0I/EPi+x5UmtzvVYaSHcJ1OnGDZMsF/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

These constants are useful for cross-platform userspace, for example to
process ELF files during kernel cross-compilation.

Move them from the kernel-private architecture-specific header to the UAPI.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/uapi/asm/elf.h | 201 ------------------------------------
 include/uapi/linux/elf-r.h          | 201 ++++++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+), 201 deletions(-)

diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
index a5377f494fa316f62821a27ce1c32fede4c0507d..aba921b8249a2654be2a78c879c9ef236a017b57 100644
--- a/arch/powerpc/include/uapi/asm/elf.h
+++ b/arch/powerpc/include/uapi/asm/elf.h
@@ -17,78 +17,6 @@
 #include <asm/cputable.h>
 #include <asm/auxvec.h>
 
-/* PowerPC relocations defined by the ABIs */
-#define R_PPC_NONE		0
-#define R_PPC_ADDR32		1	/* 32bit absolute address */
-#define R_PPC_ADDR24		2	/* 26bit address, 2 bits ignored.  */
-#define R_PPC_ADDR16		3	/* 16bit absolute address */
-#define R_PPC_ADDR16_LO		4	/* lower 16bit of absolute address */
-#define R_PPC_ADDR16_HI		5	/* high 16bit of absolute address */
-#define R_PPC_ADDR16_HA		6	/* adjusted high 16bit */
-#define R_PPC_ADDR14		7	/* 16bit address, 2 bits ignored */
-#define R_PPC_ADDR14_BRTAKEN	8
-#define R_PPC_ADDR14_BRNTAKEN	9
-#define R_PPC_REL24		10	/* PC relative 26 bit */
-#define R_PPC_REL14		11	/* PC relative 16 bit */
-#define R_PPC_REL14_BRTAKEN	12
-#define R_PPC_REL14_BRNTAKEN	13
-#define R_PPC_GOT16		14
-#define R_PPC_GOT16_LO		15
-#define R_PPC_GOT16_HI		16
-#define R_PPC_GOT16_HA		17
-#define R_PPC_PLTREL24		18
-#define R_PPC_COPY		19
-#define R_PPC_GLOB_DAT		20
-#define R_PPC_JMP_SLOT		21
-#define R_PPC_RELATIVE		22
-#define R_PPC_LOCAL24PC		23
-#define R_PPC_UADDR32		24
-#define R_PPC_UADDR16		25
-#define R_PPC_REL32		26
-#define R_PPC_PLT32		27
-#define R_PPC_PLTREL32		28
-#define R_PPC_PLT16_LO		29
-#define R_PPC_PLT16_HI		30
-#define R_PPC_PLT16_HA		31
-#define R_PPC_SDAREL16		32
-#define R_PPC_SECTOFF		33
-#define R_PPC_SECTOFF_LO	34
-#define R_PPC_SECTOFF_HI	35
-#define R_PPC_SECTOFF_HA	36
-
-/* PowerPC relocations defined for the TLS access ABI.  */
-#define R_PPC_TLS		67 /* none	(sym+add)@tls */
-#define R_PPC_DTPMOD32		68 /* word32	(sym+add)@dtpmod */
-#define R_PPC_TPREL16		69 /* half16*	(sym+add)@tprel */
-#define R_PPC_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
-#define R_PPC_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
-#define R_PPC_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
-#define R_PPC_TPREL32		73 /* word32	(sym+add)@tprel */
-#define R_PPC_DTPREL16		74 /* half16*	(sym+add)@dtprel */
-#define R_PPC_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
-#define R_PPC_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
-#define R_PPC_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
-#define R_PPC_DTPREL32		78 /* word32	(sym+add)@dtprel */
-#define R_PPC_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
-#define R_PPC_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
-#define R_PPC_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
-#define R_PPC_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
-#define R_PPC_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
-#define R_PPC_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
-#define R_PPC_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
-#define R_PPC_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
-#define R_PPC_GOT_TPREL16	87 /* half16*	(sym+add)@got@tprel */
-#define R_PPC_GOT_TPREL16_LO	88 /* half16	(sym+add)@got@tprel@l */
-#define R_PPC_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
-#define R_PPC_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
-#define R_PPC_GOT_DTPREL16	91 /* half16*	(sym+add)@got@dtprel */
-#define R_PPC_GOT_DTPREL16_LO	92 /* half16*	(sym+add)@got@dtprel@l */
-#define R_PPC_GOT_DTPREL16_HI	93 /* half16*	(sym+add)@got@dtprel@h */
-#define R_PPC_GOT_DTPREL16_HA	94 /* half16*	(sym+add)@got@dtprel@ha */
-
-/* keep this the last entry. */
-#define R_PPC_NUM		95
-
 
 #define ELF_NGREG	48	/* includes nip, msr, lr, etc. */
 #define ELF_NFPREG	33	/* includes fpscr */
@@ -166,133 +94,4 @@ typedef elf_vrreg_t elf_vrregset_t32[ELF_NVRREG32];
 typedef elf_fpreg_t elf_vsrreghalf_t32[ELF_NVSRHALFREG];
 #endif
 
-/* PowerPC64 relocations defined by the ABIs */
-#define R_PPC64_NONE    R_PPC_NONE
-#define R_PPC64_ADDR32  R_PPC_ADDR32  /* 32bit absolute address.  */
-#define R_PPC64_ADDR24  R_PPC_ADDR24  /* 26bit address, word aligned.  */
-#define R_PPC64_ADDR16  R_PPC_ADDR16  /* 16bit absolute address. */
-#define R_PPC64_ADDR16_LO R_PPC_ADDR16_LO /* lower 16bits of abs. address.  */
-#define R_PPC64_ADDR16_HI R_PPC_ADDR16_HI /* high 16bits of abs. address. */
-#define R_PPC64_ADDR16_HA R_PPC_ADDR16_HA /* adjusted high 16bits.  */
-#define R_PPC64_ADDR14 R_PPC_ADDR14   /* 16bit address, word aligned.  */
-#define R_PPC64_ADDR14_BRTAKEN  R_PPC_ADDR14_BRTAKEN
-#define R_PPC64_ADDR14_BRNTAKEN R_PPC_ADDR14_BRNTAKEN
-#define R_PPC64_REL24   R_PPC_REL24 /* PC relative 26 bit, word aligned.  */
-#define R_PPC64_REL14   R_PPC_REL14 /* PC relative 16 bit. */
-#define R_PPC64_REL14_BRTAKEN   R_PPC_REL14_BRTAKEN
-#define R_PPC64_REL14_BRNTAKEN  R_PPC_REL14_BRNTAKEN
-#define R_PPC64_GOT16     R_PPC_GOT16
-#define R_PPC64_GOT16_LO  R_PPC_GOT16_LO
-#define R_PPC64_GOT16_HI  R_PPC_GOT16_HI
-#define R_PPC64_GOT16_HA  R_PPC_GOT16_HA
-
-#define R_PPC64_COPY      R_PPC_COPY
-#define R_PPC64_GLOB_DAT  R_PPC_GLOB_DAT
-#define R_PPC64_JMP_SLOT  R_PPC_JMP_SLOT
-#define R_PPC64_RELATIVE  R_PPC_RELATIVE
-
-#define R_PPC64_UADDR32   R_PPC_UADDR32
-#define R_PPC64_UADDR16   R_PPC_UADDR16
-#define R_PPC64_REL32     R_PPC_REL32
-#define R_PPC64_PLT32     R_PPC_PLT32
-#define R_PPC64_PLTREL32  R_PPC_PLTREL32
-#define R_PPC64_PLT16_LO  R_PPC_PLT16_LO
-#define R_PPC64_PLT16_HI  R_PPC_PLT16_HI
-#define R_PPC64_PLT16_HA  R_PPC_PLT16_HA
-
-#define R_PPC64_SECTOFF     R_PPC_SECTOFF
-#define R_PPC64_SECTOFF_LO  R_PPC_SECTOFF_LO
-#define R_PPC64_SECTOFF_HI  R_PPC_SECTOFF_HI
-#define R_PPC64_SECTOFF_HA  R_PPC_SECTOFF_HA
-#define R_PPC64_ADDR30          37  /* word30 (S + A - P) >> 2.  */
-#define R_PPC64_ADDR64          38  /* doubleword64 S + A.  */
-#define R_PPC64_ADDR16_HIGHER   39  /* half16 #higher(S + A).  */
-#define R_PPC64_ADDR16_HIGHERA  40  /* half16 #highera(S + A).  */
-#define R_PPC64_ADDR16_HIGHEST  41  /* half16 #highest(S + A).  */
-#define R_PPC64_ADDR16_HIGHESTA 42  /* half16 #highesta(S + A). */
-#define R_PPC64_UADDR64     43  /* doubleword64 S + A.  */
-#define R_PPC64_REL64       44  /* doubleword64 S + A - P.  */
-#define R_PPC64_PLT64       45  /* doubleword64 L + A.  */
-#define R_PPC64_PLTREL64    46  /* doubleword64 L + A - P.  */
-#define R_PPC64_TOC16       47  /* half16* S + A - .TOC.  */
-#define R_PPC64_TOC16_LO    48  /* half16 #lo(S + A - .TOC.).  */
-#define R_PPC64_TOC16_HI    49  /* half16 #hi(S + A - .TOC.).  */
-#define R_PPC64_TOC16_HA    50  /* half16 #ha(S + A - .TOC.).  */
-#define R_PPC64_TOC         51  /* doubleword64 .TOC. */
-#define R_PPC64_PLTGOT16    52  /* half16* M + A.  */
-#define R_PPC64_PLTGOT16_LO 53  /* half16 #lo(M + A).  */
-#define R_PPC64_PLTGOT16_HI 54  /* half16 #hi(M + A).  */
-#define R_PPC64_PLTGOT16_HA 55  /* half16 #ha(M + A).  */
-
-#define R_PPC64_ADDR16_DS      56 /* half16ds* (S + A) >> 2.  */
-#define R_PPC64_ADDR16_LO_DS   57 /* half16ds  #lo(S + A) >> 2.  */
-#define R_PPC64_GOT16_DS       58 /* half16ds* (G + A) >> 2.  */
-#define R_PPC64_GOT16_LO_DS    59 /* half16ds  #lo(G + A) >> 2.  */
-#define R_PPC64_PLT16_LO_DS    60 /* half16ds  #lo(L + A) >> 2.  */
-#define R_PPC64_SECTOFF_DS     61 /* half16ds* (R + A) >> 2.  */
-#define R_PPC64_SECTOFF_LO_DS  62 /* half16ds  #lo(R + A) >> 2.  */
-#define R_PPC64_TOC16_DS       63 /* half16ds* (S + A - .TOC.) >> 2.  */
-#define R_PPC64_TOC16_LO_DS    64 /* half16ds  #lo(S + A - .TOC.) >> 2.  */
-#define R_PPC64_PLTGOT16_DS    65 /* half16ds* (M + A) >> 2.  */
-#define R_PPC64_PLTGOT16_LO_DS 66 /* half16ds  #lo(M + A) >> 2.  */
-
-/* PowerPC64 relocations defined for the TLS access ABI.  */
-#define R_PPC64_TLS		67 /* none	(sym+add)@tls */
-#define R_PPC64_DTPMOD64	68 /* doubleword64 (sym+add)@dtpmod */
-#define R_PPC64_TPREL16		69 /* half16*	(sym+add)@tprel */
-#define R_PPC64_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
-#define R_PPC64_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
-#define R_PPC64_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
-#define R_PPC64_TPREL64		73 /* doubleword64 (sym+add)@tprel */
-#define R_PPC64_DTPREL16	74 /* half16*	(sym+add)@dtprel */
-#define R_PPC64_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
-#define R_PPC64_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
-#define R_PPC64_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
-#define R_PPC64_DTPREL64	78 /* doubleword64 (sym+add)@dtprel */
-#define R_PPC64_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
-#define R_PPC64_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
-#define R_PPC64_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
-#define R_PPC64_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
-#define R_PPC64_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
-#define R_PPC64_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
-#define R_PPC64_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
-#define R_PPC64_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
-#define R_PPC64_GOT_TPREL16_DS	87 /* half16ds*	(sym+add)@got@tprel */
-#define R_PPC64_GOT_TPREL16_LO_DS 88 /* half16ds (sym+add)@got@tprel@l */
-#define R_PPC64_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
-#define R_PPC64_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
-#define R_PPC64_GOT_DTPREL16_DS	91 /* half16ds*	(sym+add)@got@dtprel */
-#define R_PPC64_GOT_DTPREL16_LO_DS 92 /* half16ds (sym+add)@got@dtprel@l */
-#define R_PPC64_GOT_DTPREL16_HI	93 /* half16	(sym+add)@got@dtprel@h */
-#define R_PPC64_GOT_DTPREL16_HA	94 /* half16	(sym+add)@got@dtprel@ha */
-#define R_PPC64_TPREL16_DS	95 /* half16ds*	(sym+add)@tprel */
-#define R_PPC64_TPREL16_LO_DS	96 /* half16ds	(sym+add)@tprel@l */
-#define R_PPC64_TPREL16_HIGHER	97 /* half16	(sym+add)@tprel@higher */
-#define R_PPC64_TPREL16_HIGHERA	98 /* half16	(sym+add)@tprel@highera */
-#define R_PPC64_TPREL16_HIGHEST	99 /* half16	(sym+add)@tprel@highest */
-#define R_PPC64_TPREL16_HIGHESTA 100 /* half16	(sym+add)@tprel@highesta */
-#define R_PPC64_DTPREL16_DS	101 /* half16ds* (sym+add)@dtprel */
-#define R_PPC64_DTPREL16_LO_DS	102 /* half16ds	(sym+add)@dtprel@l */
-#define R_PPC64_DTPREL16_HIGHER	103 /* half16	(sym+add)@dtprel@higher */
-#define R_PPC64_DTPREL16_HIGHERA 104 /* half16	(sym+add)@dtprel@highera */
-#define R_PPC64_DTPREL16_HIGHEST 105 /* half16	(sym+add)@dtprel@highest */
-#define R_PPC64_DTPREL16_HIGHESTA 106 /* half16	(sym+add)@dtprel@highesta */
-#define R_PPC64_TLSGD		107
-#define R_PPC64_TLSLD		108
-#define R_PPC64_TOCSAVE		109
-
-#define R_PPC64_REL24_NOTOC	116
-#define R_PPC64_ENTRY		118
-
-#define R_PPC64_PCREL34		132
-#define R_PPC64_GOT_PCREL34	133
-
-#define R_PPC64_REL16		249
-#define R_PPC64_REL16_LO	250
-#define R_PPC64_REL16_HI	251
-#define R_PPC64_REL16_HA	252
-
-/* Keep this the last entry.  */
-#define R_PPC64_NUM		253
-
 #endif /* _UAPI_ASM_POWERPC_ELF_H */
diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index cf931fc05afa1825aa9737a4e6259ec0da678d3a..0d0dfaa7c724d5f0230e5b7b9b713d8587030637 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -113,4 +113,205 @@
 
 #define R_AARCH64_RELATIVE		1027
 
+/* PowerPC relocations defined by the ABIs */
+#define R_PPC_NONE		0
+#define R_PPC_ADDR32		1	/* 32bit absolute address */
+#define R_PPC_ADDR24		2	/* 26bit address, 2 bits ignored.  */
+#define R_PPC_ADDR16		3	/* 16bit absolute address */
+#define R_PPC_ADDR16_LO		4	/* lower 16bit of absolute address */
+#define R_PPC_ADDR16_HI		5	/* high 16bit of absolute address */
+#define R_PPC_ADDR16_HA		6	/* adjusted high 16bit */
+#define R_PPC_ADDR14		7	/* 16bit address, 2 bits ignored */
+#define R_PPC_ADDR14_BRTAKEN	8
+#define R_PPC_ADDR14_BRNTAKEN	9
+#define R_PPC_REL24		10	/* PC relative 26 bit */
+#define R_PPC_REL14		11	/* PC relative 16 bit */
+#define R_PPC_REL14_BRTAKEN	12
+#define R_PPC_REL14_BRNTAKEN	13
+#define R_PPC_GOT16		14
+#define R_PPC_GOT16_LO		15
+#define R_PPC_GOT16_HI		16
+#define R_PPC_GOT16_HA		17
+#define R_PPC_PLTREL24		18
+#define R_PPC_COPY		19
+#define R_PPC_GLOB_DAT		20
+#define R_PPC_JMP_SLOT		21
+#define R_PPC_RELATIVE		22
+#define R_PPC_LOCAL24PC		23
+#define R_PPC_UADDR32		24
+#define R_PPC_UADDR16		25
+#define R_PPC_REL32		26
+#define R_PPC_PLT32		27
+#define R_PPC_PLTREL32		28
+#define R_PPC_PLT16_LO		29
+#define R_PPC_PLT16_HI		30
+#define R_PPC_PLT16_HA		31
+#define R_PPC_SDAREL16		32
+#define R_PPC_SECTOFF		33
+#define R_PPC_SECTOFF_LO	34
+#define R_PPC_SECTOFF_HI	35
+#define R_PPC_SECTOFF_HA	36
+
+/* PowerPC relocations defined for the TLS access ABI.  */
+#define R_PPC_TLS		67 /* none	(sym+add)@tls */
+#define R_PPC_DTPMOD32		68 /* word32	(sym+add)@dtpmod */
+#define R_PPC_TPREL16		69 /* half16*	(sym+add)@tprel */
+#define R_PPC_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
+#define R_PPC_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
+#define R_PPC_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
+#define R_PPC_TPREL32		73 /* word32	(sym+add)@tprel */
+#define R_PPC_DTPREL16		74 /* half16*	(sym+add)@dtprel */
+#define R_PPC_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
+#define R_PPC_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
+#define R_PPC_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
+#define R_PPC_DTPREL32		78 /* word32	(sym+add)@dtprel */
+#define R_PPC_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
+#define R_PPC_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
+#define R_PPC_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
+#define R_PPC_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
+#define R_PPC_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
+#define R_PPC_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
+#define R_PPC_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
+#define R_PPC_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
+#define R_PPC_GOT_TPREL16	87 /* half16*	(sym+add)@got@tprel */
+#define R_PPC_GOT_TPREL16_LO	88 /* half16	(sym+add)@got@tprel@l */
+#define R_PPC_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
+#define R_PPC_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
+#define R_PPC_GOT_DTPREL16	91 /* half16*	(sym+add)@got@dtprel */
+#define R_PPC_GOT_DTPREL16_LO	92 /* half16*	(sym+add)@got@dtprel@l */
+#define R_PPC_GOT_DTPREL16_HI	93 /* half16*	(sym+add)@got@dtprel@h */
+#define R_PPC_GOT_DTPREL16_HA	94 /* half16*	(sym+add)@got@dtprel@ha */
+
+/* keep this the last entry. */
+#define R_PPC_NUM		95
+
+/* PowerPC64 relocations defined by the ABIs */
+#define R_PPC64_NONE    R_PPC_NONE
+#define R_PPC64_ADDR32  R_PPC_ADDR32  /* 32bit absolute address.  */
+#define R_PPC64_ADDR24  R_PPC_ADDR24  /* 26bit address, word aligned.  */
+#define R_PPC64_ADDR16  R_PPC_ADDR16  /* 16bit absolute address. */
+#define R_PPC64_ADDR16_LO R_PPC_ADDR16_LO /* lower 16bits of abs. address.  */
+#define R_PPC64_ADDR16_HI R_PPC_ADDR16_HI /* high 16bits of abs. address. */
+#define R_PPC64_ADDR16_HA R_PPC_ADDR16_HA /* adjusted high 16bits.  */
+#define R_PPC64_ADDR14 R_PPC_ADDR14   /* 16bit address, word aligned.  */
+#define R_PPC64_ADDR14_BRTAKEN  R_PPC_ADDR14_BRTAKEN
+#define R_PPC64_ADDR14_BRNTAKEN R_PPC_ADDR14_BRNTAKEN
+#define R_PPC64_REL24   R_PPC_REL24 /* PC relative 26 bit, word aligned.  */
+#define R_PPC64_REL14   R_PPC_REL14 /* PC relative 16 bit. */
+#define R_PPC64_REL14_BRTAKEN   R_PPC_REL14_BRTAKEN
+#define R_PPC64_REL14_BRNTAKEN  R_PPC_REL14_BRNTAKEN
+#define R_PPC64_GOT16     R_PPC_GOT16
+#define R_PPC64_GOT16_LO  R_PPC_GOT16_LO
+#define R_PPC64_GOT16_HI  R_PPC_GOT16_HI
+#define R_PPC64_GOT16_HA  R_PPC_GOT16_HA
+
+#define R_PPC64_COPY      R_PPC_COPY
+#define R_PPC64_GLOB_DAT  R_PPC_GLOB_DAT
+#define R_PPC64_JMP_SLOT  R_PPC_JMP_SLOT
+#define R_PPC64_RELATIVE  R_PPC_RELATIVE
+
+#define R_PPC64_UADDR32   R_PPC_UADDR32
+#define R_PPC64_UADDR16   R_PPC_UADDR16
+#define R_PPC64_REL32     R_PPC_REL32
+#define R_PPC64_PLT32     R_PPC_PLT32
+#define R_PPC64_PLTREL32  R_PPC_PLTREL32
+#define R_PPC64_PLT16_LO  R_PPC_PLT16_LO
+#define R_PPC64_PLT16_HI  R_PPC_PLT16_HI
+#define R_PPC64_PLT16_HA  R_PPC_PLT16_HA
+
+#define R_PPC64_SECTOFF     R_PPC_SECTOFF
+#define R_PPC64_SECTOFF_LO  R_PPC_SECTOFF_LO
+#define R_PPC64_SECTOFF_HI  R_PPC_SECTOFF_HI
+#define R_PPC64_SECTOFF_HA  R_PPC_SECTOFF_HA
+#define R_PPC64_ADDR30          37  /* word30 (S + A - P) >> 2.  */
+#define R_PPC64_ADDR64          38  /* doubleword64 S + A.  */
+#define R_PPC64_ADDR16_HIGHER   39  /* half16 #higher(S + A).  */
+#define R_PPC64_ADDR16_HIGHERA  40  /* half16 #highera(S + A).  */
+#define R_PPC64_ADDR16_HIGHEST  41  /* half16 #highest(S + A).  */
+#define R_PPC64_ADDR16_HIGHESTA 42  /* half16 #highesta(S + A). */
+#define R_PPC64_UADDR64     43  /* doubleword64 S + A.  */
+#define R_PPC64_REL64       44  /* doubleword64 S + A - P.  */
+#define R_PPC64_PLT64       45  /* doubleword64 L + A.  */
+#define R_PPC64_PLTREL64    46  /* doubleword64 L + A - P.  */
+#define R_PPC64_TOC16       47  /* half16* S + A - .TOC.  */
+#define R_PPC64_TOC16_LO    48  /* half16 #lo(S + A - .TOC.).  */
+#define R_PPC64_TOC16_HI    49  /* half16 #hi(S + A - .TOC.).  */
+#define R_PPC64_TOC16_HA    50  /* half16 #ha(S + A - .TOC.).  */
+#define R_PPC64_TOC         51  /* doubleword64 .TOC. */
+#define R_PPC64_PLTGOT16    52  /* half16* M + A.  */
+#define R_PPC64_PLTGOT16_LO 53  /* half16 #lo(M + A).  */
+#define R_PPC64_PLTGOT16_HI 54  /* half16 #hi(M + A).  */
+#define R_PPC64_PLTGOT16_HA 55  /* half16 #ha(M + A).  */
+
+#define R_PPC64_ADDR16_DS      56 /* half16ds* (S + A) >> 2.  */
+#define R_PPC64_ADDR16_LO_DS   57 /* half16ds  #lo(S + A) >> 2.  */
+#define R_PPC64_GOT16_DS       58 /* half16ds* (G + A) >> 2.  */
+#define R_PPC64_GOT16_LO_DS    59 /* half16ds  #lo(G + A) >> 2.  */
+#define R_PPC64_PLT16_LO_DS    60 /* half16ds  #lo(L + A) >> 2.  */
+#define R_PPC64_SECTOFF_DS     61 /* half16ds* (R + A) >> 2.  */
+#define R_PPC64_SECTOFF_LO_DS  62 /* half16ds  #lo(R + A) >> 2.  */
+#define R_PPC64_TOC16_DS       63 /* half16ds* (S + A - .TOC.) >> 2.  */
+#define R_PPC64_TOC16_LO_DS    64 /* half16ds  #lo(S + A - .TOC.) >> 2.  */
+#define R_PPC64_PLTGOT16_DS    65 /* half16ds* (M + A) >> 2.  */
+#define R_PPC64_PLTGOT16_LO_DS 66 /* half16ds  #lo(M + A) >> 2.  */
+
+/* PowerPC64 relocations defined for the TLS access ABI.  */
+#define R_PPC64_TLS		67 /* none	(sym+add)@tls */
+#define R_PPC64_DTPMOD64	68 /* doubleword64 (sym+add)@dtpmod */
+#define R_PPC64_TPREL16		69 /* half16*	(sym+add)@tprel */
+#define R_PPC64_TPREL16_LO	70 /* half16	(sym+add)@tprel@l */
+#define R_PPC64_TPREL16_HI	71 /* half16	(sym+add)@tprel@h */
+#define R_PPC64_TPREL16_HA	72 /* half16	(sym+add)@tprel@ha */
+#define R_PPC64_TPREL64		73 /* doubleword64 (sym+add)@tprel */
+#define R_PPC64_DTPREL16	74 /* half16*	(sym+add)@dtprel */
+#define R_PPC64_DTPREL16_LO	75 /* half16	(sym+add)@dtprel@l */
+#define R_PPC64_DTPREL16_HI	76 /* half16	(sym+add)@dtprel@h */
+#define R_PPC64_DTPREL16_HA	77 /* half16	(sym+add)@dtprel@ha */
+#define R_PPC64_DTPREL64	78 /* doubleword64 (sym+add)@dtprel */
+#define R_PPC64_GOT_TLSGD16	79 /* half16*	(sym+add)@got@tlsgd */
+#define R_PPC64_GOT_TLSGD16_LO	80 /* half16	(sym+add)@got@tlsgd@l */
+#define R_PPC64_GOT_TLSGD16_HI	81 /* half16	(sym+add)@got@tlsgd@h */
+#define R_PPC64_GOT_TLSGD16_HA	82 /* half16	(sym+add)@got@tlsgd@ha */
+#define R_PPC64_GOT_TLSLD16	83 /* half16*	(sym+add)@got@tlsld */
+#define R_PPC64_GOT_TLSLD16_LO	84 /* half16	(sym+add)@got@tlsld@l */
+#define R_PPC64_GOT_TLSLD16_HI	85 /* half16	(sym+add)@got@tlsld@h */
+#define R_PPC64_GOT_TLSLD16_HA	86 /* half16	(sym+add)@got@tlsld@ha */
+#define R_PPC64_GOT_TPREL16_DS	87 /* half16ds*	(sym+add)@got@tprel */
+#define R_PPC64_GOT_TPREL16_LO_DS 88 /* half16ds (sym+add)@got@tprel@l */
+#define R_PPC64_GOT_TPREL16_HI	89 /* half16	(sym+add)@got@tprel@h */
+#define R_PPC64_GOT_TPREL16_HA	90 /* half16	(sym+add)@got@tprel@ha */
+#define R_PPC64_GOT_DTPREL16_DS	91 /* half16ds*	(sym+add)@got@dtprel */
+#define R_PPC64_GOT_DTPREL16_LO_DS 92 /* half16ds (sym+add)@got@dtprel@l */
+#define R_PPC64_GOT_DTPREL16_HI	93 /* half16	(sym+add)@got@dtprel@h */
+#define R_PPC64_GOT_DTPREL16_HA	94 /* half16	(sym+add)@got@dtprel@ha */
+#define R_PPC64_TPREL16_DS	95 /* half16ds*	(sym+add)@tprel */
+#define R_PPC64_TPREL16_LO_DS	96 /* half16ds	(sym+add)@tprel@l */
+#define R_PPC64_TPREL16_HIGHER	97 /* half16	(sym+add)@tprel@higher */
+#define R_PPC64_TPREL16_HIGHERA	98 /* half16	(sym+add)@tprel@highera */
+#define R_PPC64_TPREL16_HIGHEST	99 /* half16	(sym+add)@tprel@highest */
+#define R_PPC64_TPREL16_HIGHESTA 100 /* half16	(sym+add)@tprel@highesta */
+#define R_PPC64_DTPREL16_DS	101 /* half16ds* (sym+add)@dtprel */
+#define R_PPC64_DTPREL16_LO_DS	102 /* half16ds	(sym+add)@dtprel@l */
+#define R_PPC64_DTPREL16_HIGHER	103 /* half16	(sym+add)@dtprel@higher */
+#define R_PPC64_DTPREL16_HIGHERA 104 /* half16	(sym+add)@dtprel@highera */
+#define R_PPC64_DTPREL16_HIGHEST 105 /* half16	(sym+add)@dtprel@highest */
+#define R_PPC64_DTPREL16_HIGHESTA 106 /* half16	(sym+add)@dtprel@highesta */
+#define R_PPC64_TLSGD		107
+#define R_PPC64_TLSLD		108
+#define R_PPC64_TOCSAVE		109
+
+#define R_PPC64_REL24_NOTOC	116
+#define R_PPC64_ENTRY		118
+
+#define R_PPC64_PCREL34		132
+#define R_PPC64_GOT_PCREL34	133
+
+#define R_PPC64_REL16		249
+#define R_PPC64_REL16_LO	250
+#define R_PPC64_REL16_HI	251
+#define R_PPC64_REL16_HA	252
+
+/* Keep this the last entry.  */
+#define R_PPC64_NUM		253
+
 #endif /* _UAPI_LINUX_ELF_R_H */

-- 
2.50.1


