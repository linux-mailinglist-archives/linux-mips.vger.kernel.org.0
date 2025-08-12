Return-Path: <linux-mips+bounces-10192-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F58B21D3D
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 07:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9981A684219
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 05:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0139F2E54A3;
	Tue, 12 Aug 2025 05:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ag9FAR4S";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u1ensITg"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621402E3B00;
	Tue, 12 Aug 2025 05:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977483; cv=none; b=dGsmXe5i1VjKCjm6ZY7ioJ848WxpLQHXIMCrFa9fN6pIfXjZ35KNp0uc+egIXJD4MHfWvgG6azwj2cczjxglJF4JDoXeJh9yrx8VEJmZty9xaf0E5FAGJSWH5lbcwfI4F3UK5wEMQ55aR8Yz7cD3jg0bbTldXENNrOi/b817okA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977483; c=relaxed/simple;
	bh=ZVAGLGCFxsrer4ZyNLb2NhW6qORCMiIw2HqWP+N4aV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmyIPtTYpQMz3sOUARsNB8tuA0mXgPdQ8mQgOQcwNnxDeWKLAG6AJK2iBkPyXXJJaVkEPJrzSv752ZDV7cDMKBTSi0RziE0LMTNeBEL4amPXZE48HQ9vxxYRaALhwxeU1V9bH2cfiUIk6zenT9bTKqaQd9PfjFsc4do8fo7UnyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ag9FAR4S; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u1ensITg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fu8g+Fl052E34f4ajc7aTfb2t7+sWP8BOva3sbFf3lI=;
	b=ag9FAR4SoucTPGK9KbbFPSxHt3EGXWPDHgV/1vttnN8ZMg/XUycb91t+tFbpufLilWVZJc
	iv7mLDRjfB/vUT6zU4juqwzTsGL37zfulfZnVoEffSqPyWLXRWe6mZoYNxwxgi2JsgZeOj
	vaTIFKA8ZLwhTPnCXn8AcYRo2vbX4t0UfG3o8JCPvRgDywKfdUm4EIBExPwiXhJe6WRElC
	XH/kqQovrfbFLDCwvKDA3Wr4Qs/rzupFlRIuuOsCstYKLVhwrpBvxiT2E23d3igcm2Nzad
	+z+dNwP5ZwaDpNvYg/bP+/pZl5Qc6dW3Y1/iAuiY+hy3M+SDK4mp9VECVhhnng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fu8g+Fl052E34f4ajc7aTfb2t7+sWP8BOva3sbFf3lI=;
	b=u1ensITgZsRSuAKcfQs1pdhqsC2IlINyzHYx57P8Q57sYhYZ5ukMwC9TLF12sumTqJCETa
	fnc0xR546UaaGWDA==
Date: Tue, 12 Aug 2025 07:44:20 +0200
Subject: [PATCH v4 07/24] LoongArch: Move relocation constants to UAPI
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-7-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=8191;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZVAGLGCFxsrer4ZyNLb2NhW6qORCMiIw2HqWP+N4aV4=;
 b=VNc1TNZKDL/LVFRVz5BOq//QDqCWfYoW6xL5masgZ6JYWblQeOQ1NV9Vtszx6Gx5w6k8t92RO
 XtANlYV7IFzCsW7AORv1Q1VBm7p4qIgmE7oOIsux5VBBNXD24DMBz6d
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

These constants are useful for cross-platform userspace, for example to
process ELF files during kernel cross-compilation.

Move them from the kernel-private architecture-specific header to the UAPI.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/include/asm/elf.h | 100 ---------------------------------------
 include/uapi/linux/elf-r.h       | 100 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/arch/loongarch/include/asm/elf.h b/arch/loongarch/include/asm/elf.h
index f16bd42456e4ccf3ad6c8917165176b8ef5d8f05..5e4bcba21da2fe1b95045821156764a8f2c61fca 100644
--- a/arch/loongarch/include/asm/elf.h
+++ b/arch/loongarch/include/asm/elf.h
@@ -21,106 +21,6 @@
 #define EF_LOONGARCH_ABI_ILP32_SINGLE_FLOAT	0x6
 #define EF_LOONGARCH_ABI_ILP32_DOUBLE_FLOAT	0x7
 
-/* LoongArch relocation types used by the dynamic linker */
-#define R_LARCH_NONE				0
-#define R_LARCH_32				1
-#define R_LARCH_64				2
-#define R_LARCH_RELATIVE			3
-#define R_LARCH_COPY				4
-#define R_LARCH_JUMP_SLOT			5
-#define R_LARCH_TLS_DTPMOD32			6
-#define R_LARCH_TLS_DTPMOD64			7
-#define R_LARCH_TLS_DTPREL32			8
-#define R_LARCH_TLS_DTPREL64			9
-#define R_LARCH_TLS_TPREL32			10
-#define R_LARCH_TLS_TPREL64			11
-#define R_LARCH_IRELATIVE			12
-#define R_LARCH_MARK_LA				20
-#define R_LARCH_MARK_PCREL			21
-#define R_LARCH_SOP_PUSH_PCREL			22
-#define R_LARCH_SOP_PUSH_ABSOLUTE		23
-#define R_LARCH_SOP_PUSH_DUP			24
-#define R_LARCH_SOP_PUSH_GPREL			25
-#define R_LARCH_SOP_PUSH_TLS_TPREL		26
-#define R_LARCH_SOP_PUSH_TLS_GOT		27
-#define R_LARCH_SOP_PUSH_TLS_GD			28
-#define R_LARCH_SOP_PUSH_PLT_PCREL		29
-#define R_LARCH_SOP_ASSERT			30
-#define R_LARCH_SOP_NOT				31
-#define R_LARCH_SOP_SUB				32
-#define R_LARCH_SOP_SL				33
-#define R_LARCH_SOP_SR				34
-#define R_LARCH_SOP_ADD				35
-#define R_LARCH_SOP_AND				36
-#define R_LARCH_SOP_IF_ELSE			37
-#define R_LARCH_SOP_POP_32_S_10_5		38
-#define R_LARCH_SOP_POP_32_U_10_12		39
-#define R_LARCH_SOP_POP_32_S_10_12		40
-#define R_LARCH_SOP_POP_32_S_10_16		41
-#define R_LARCH_SOP_POP_32_S_10_16_S2		42
-#define R_LARCH_SOP_POP_32_S_5_20		43
-#define R_LARCH_SOP_POP_32_S_0_5_10_16_S2	44
-#define R_LARCH_SOP_POP_32_S_0_10_10_16_S2	45
-#define R_LARCH_SOP_POP_32_U			46
-#define R_LARCH_ADD8				47
-#define R_LARCH_ADD16				48
-#define R_LARCH_ADD24				49
-#define R_LARCH_ADD32				50
-#define R_LARCH_ADD64				51
-#define R_LARCH_SUB8				52
-#define R_LARCH_SUB16				53
-#define R_LARCH_SUB24				54
-#define R_LARCH_SUB32				55
-#define R_LARCH_SUB64				56
-#define R_LARCH_GNU_VTINHERIT			57
-#define R_LARCH_GNU_VTENTRY			58
-#define R_LARCH_B16				64
-#define R_LARCH_B21				65
-#define R_LARCH_B26				66
-#define R_LARCH_ABS_HI20			67
-#define R_LARCH_ABS_LO12			68
-#define R_LARCH_ABS64_LO20			69
-#define R_LARCH_ABS64_HI12			70
-#define R_LARCH_PCALA_HI20			71
-#define R_LARCH_PCALA_LO12			72
-#define R_LARCH_PCALA64_LO20			73
-#define R_LARCH_PCALA64_HI12			74
-#define R_LARCH_GOT_PC_HI20			75
-#define R_LARCH_GOT_PC_LO12			76
-#define R_LARCH_GOT64_PC_LO20			77
-#define R_LARCH_GOT64_PC_HI12			78
-#define R_LARCH_GOT_HI20			79
-#define R_LARCH_GOT_LO12			80
-#define R_LARCH_GOT64_LO20			81
-#define R_LARCH_GOT64_HI12			82
-#define R_LARCH_TLS_LE_HI20			83
-#define R_LARCH_TLS_LE_LO12			84
-#define R_LARCH_TLS_LE64_LO20			85
-#define R_LARCH_TLS_LE64_HI12			86
-#define R_LARCH_TLS_IE_PC_HI20			87
-#define R_LARCH_TLS_IE_PC_LO12			88
-#define R_LARCH_TLS_IE64_PC_LO20		89
-#define R_LARCH_TLS_IE64_PC_HI12		90
-#define R_LARCH_TLS_IE_HI20			91
-#define R_LARCH_TLS_IE_LO12			92
-#define R_LARCH_TLS_IE64_LO20			93
-#define R_LARCH_TLS_IE64_HI12			94
-#define R_LARCH_TLS_LD_PC_HI20			95
-#define R_LARCH_TLS_LD_HI20			96
-#define R_LARCH_TLS_GD_PC_HI20			97
-#define R_LARCH_TLS_GD_HI20			98
-#define R_LARCH_32_PCREL			99
-#define R_LARCH_RELAX				100
-#define R_LARCH_DELETE				101
-#define R_LARCH_ALIGN				102
-#define R_LARCH_PCREL20_S2			103
-#define R_LARCH_CFA				104
-#define R_LARCH_ADD6				105
-#define R_LARCH_SUB6				106
-#define R_LARCH_ADD_ULEB128			107
-#define R_LARCH_SUB_ULEB128			108
-#define R_LARCH_64_PCREL			109
-
 #ifndef ELF_ARCH
 
 /* ELF register definitions */
diff --git a/include/uapi/linux/elf-r.h b/include/uapi/linux/elf-r.h
index 02e420c255df67f8f7e4bc3165f808b9935f5b1c..576d974db6e31f8a9cd995f7428c85bd41102415 100644
--- a/include/uapi/linux/elf-r.h
+++ b/include/uapi/linux/elf-r.h
@@ -380,4 +380,104 @@
 #define R_RISCV_SET_ULEB128	60
 #define R_RISCV_SUB_ULEB128	61
 
+/* LoongArch relocation types used by the dynamic linker */
+#define R_LARCH_NONE				0
+#define R_LARCH_32				1
+#define R_LARCH_64				2
+#define R_LARCH_RELATIVE			3
+#define R_LARCH_COPY				4
+#define R_LARCH_JUMP_SLOT			5
+#define R_LARCH_TLS_DTPMOD32			6
+#define R_LARCH_TLS_DTPMOD64			7
+#define R_LARCH_TLS_DTPREL32			8
+#define R_LARCH_TLS_DTPREL64			9
+#define R_LARCH_TLS_TPREL32			10
+#define R_LARCH_TLS_TPREL64			11
+#define R_LARCH_IRELATIVE			12
+#define R_LARCH_MARK_LA				20
+#define R_LARCH_MARK_PCREL			21
+#define R_LARCH_SOP_PUSH_PCREL			22
+#define R_LARCH_SOP_PUSH_ABSOLUTE		23
+#define R_LARCH_SOP_PUSH_DUP			24
+#define R_LARCH_SOP_PUSH_GPREL			25
+#define R_LARCH_SOP_PUSH_TLS_TPREL		26
+#define R_LARCH_SOP_PUSH_TLS_GOT		27
+#define R_LARCH_SOP_PUSH_TLS_GD			28
+#define R_LARCH_SOP_PUSH_PLT_PCREL		29
+#define R_LARCH_SOP_ASSERT			30
+#define R_LARCH_SOP_NOT				31
+#define R_LARCH_SOP_SUB				32
+#define R_LARCH_SOP_SL				33
+#define R_LARCH_SOP_SR				34
+#define R_LARCH_SOP_ADD				35
+#define R_LARCH_SOP_AND				36
+#define R_LARCH_SOP_IF_ELSE			37
+#define R_LARCH_SOP_POP_32_S_10_5		38
+#define R_LARCH_SOP_POP_32_U_10_12		39
+#define R_LARCH_SOP_POP_32_S_10_12		40
+#define R_LARCH_SOP_POP_32_S_10_16		41
+#define R_LARCH_SOP_POP_32_S_10_16_S2		42
+#define R_LARCH_SOP_POP_32_S_5_20		43
+#define R_LARCH_SOP_POP_32_S_0_5_10_16_S2	44
+#define R_LARCH_SOP_POP_32_S_0_10_10_16_S2	45
+#define R_LARCH_SOP_POP_32_U			46
+#define R_LARCH_ADD8				47
+#define R_LARCH_ADD16				48
+#define R_LARCH_ADD24				49
+#define R_LARCH_ADD32				50
+#define R_LARCH_ADD64				51
+#define R_LARCH_SUB8				52
+#define R_LARCH_SUB16				53
+#define R_LARCH_SUB24				54
+#define R_LARCH_SUB32				55
+#define R_LARCH_SUB64				56
+#define R_LARCH_GNU_VTINHERIT			57
+#define R_LARCH_GNU_VTENTRY			58
+#define R_LARCH_B16				64
+#define R_LARCH_B21				65
+#define R_LARCH_B26				66
+#define R_LARCH_ABS_HI20			67
+#define R_LARCH_ABS_LO12			68
+#define R_LARCH_ABS64_LO20			69
+#define R_LARCH_ABS64_HI12			70
+#define R_LARCH_PCALA_HI20			71
+#define R_LARCH_PCALA_LO12			72
+#define R_LARCH_PCALA64_LO20			73
+#define R_LARCH_PCALA64_HI12			74
+#define R_LARCH_GOT_PC_HI20			75
+#define R_LARCH_GOT_PC_LO12			76
+#define R_LARCH_GOT64_PC_LO20			77
+#define R_LARCH_GOT64_PC_HI12			78
+#define R_LARCH_GOT_HI20			79
+#define R_LARCH_GOT_LO12			80
+#define R_LARCH_GOT64_LO20			81
+#define R_LARCH_GOT64_HI12			82
+#define R_LARCH_TLS_LE_HI20			83
+#define R_LARCH_TLS_LE_LO12			84
+#define R_LARCH_TLS_LE64_LO20			85
+#define R_LARCH_TLS_LE64_HI12			86
+#define R_LARCH_TLS_IE_PC_HI20			87
+#define R_LARCH_TLS_IE_PC_LO12			88
+#define R_LARCH_TLS_IE64_PC_LO20		89
+#define R_LARCH_TLS_IE64_PC_HI12		90
+#define R_LARCH_TLS_IE_HI20			91
+#define R_LARCH_TLS_IE_LO12			92
+#define R_LARCH_TLS_IE64_LO20			93
+#define R_LARCH_TLS_IE64_HI12			94
+#define R_LARCH_TLS_LD_PC_HI20			95
+#define R_LARCH_TLS_LD_HI20			96
+#define R_LARCH_TLS_GD_PC_HI20			97
+#define R_LARCH_TLS_GD_HI20			98
+#define R_LARCH_32_PCREL			99
+#define R_LARCH_RELAX				100
+#define R_LARCH_DELETE				101
+#define R_LARCH_ALIGN				102
+#define R_LARCH_PCREL20_S2			103
+#define R_LARCH_CFA				104
+#define R_LARCH_ADD6				105
+#define R_LARCH_SUB6				106
+#define R_LARCH_ADD_ULEB128			107
+#define R_LARCH_SUB_ULEB128			108
+#define R_LARCH_64_PCREL			109
+
 #endif /* _UAPI_LINUX_ELF_R_H */

-- 
2.50.1


