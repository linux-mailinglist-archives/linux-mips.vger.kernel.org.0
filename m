Return-Path: <linux-mips+bounces-10296-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E805B26834
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 15:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AD0A3AB73B
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 13:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2703002D7;
	Thu, 14 Aug 2025 13:50:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF63B2FFDDE;
	Thu, 14 Aug 2025 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179438; cv=none; b=M+/GR9OPN2EJMxsFVNsK4LgsqSsRAoHGYjzEcDiFGswpuHT4qKarraPv8hksTyh004MaJ/niIxkpiIPYV5P1hPRNYXkhgG+FYA/+4tm8h1f8QPquHq6LXMbwUISY+JvIYxHzBtAzIg81voAfaTo5oSpmmlDvAS/1TqkswRAkRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179438; c=relaxed/simple;
	bh=vFczm8e5OaiPzDro8LfC6emO/k/Igt0MHXU7T1y7z8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HTFYqDf5JsR6ImuBh7i77+YLW1BXiaPjEYt5q/9AAS8X5+TaSndzVRHybOQvPGRUOrJegKoHTOef6GcilvK5Wf6QZaCRfDft1d5uvGkFOmbv8jKzEb952lr62rUZ8vBdXsmMbgbeJLV985rBdVxHAijOggqZX6qKllGUfSU9t60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c2mf83rJXz9sSN;
	Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBzqxKLEhtqg; Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c2mf82mg0z9sSH;
	Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 48B088B764;
	Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id u4JdrB2diOCo; Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C584A8B763;
	Thu, 14 Aug 2025 15:43:09 +0200 (CEST)
Message-ID: <86186254-b2c6-4818-af0a-4eb67d90e501@csgroup.eu>
Date: Thu, 14 Aug 2025 15:43:09 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/08/2025 à 07:44, Thomas Weißschuh a écrit :
> The compiler can emit absolute relocations in vDSO code,
> which are invalid in vDSO code.
> Detect them at compile-time.

I'm a bit puzzled with this series.

If I understand correctly, the check will be done only when you have 
RUST available ?

I wouldn't expect having RUST to build a C kernel.

By the way, aren't relocations already detected by command 
cmd_vdso_check in lib/vdso/Makefile.include , using readelf ? Why is a 
new tool needed and why does it have to be written in RUST langage ?

Thanks
Christophe

> 
> libc elf.h is missing some of the relocation constants,
> so make user of the kernels own UAPI headers instead.
> 
> Kbuild and Rust folks: This contains custom definitions of hostprog
> bindgen and rust library commands.
> These are currently only defined inside the subsystem directory.
> Let me know if they should go into scripts/Makefile.host.
> 
> This will conflict with my SPARC64 generic vDSO patches [0].
> If both end up being applied at the same time, please leave out commit
> 'vdso/vdsocheck: Drop the transitional kconfig option' from this series.
> 
> [0] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20250724-vdso-sparc64-generic-2-v1-0-e376a3bd24d1%40linutronix.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3f03f6747325451ee98808ddd9634f27%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638905742749561064%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=HacF%2FvlUoxA9P6fTiN1ytw49gwayX1wNE7IxfEkFutE%3D&reserved=0
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v4:
> - Replace the inline shell logic with a dedicated build-time tool
> - Link to v3: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250611-vdso-absolute-reloc-v3-0-47897d73784b%40linutronix.de&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3f03f6747325451ee98808ddd9634f27%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638905742749584369%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7NxAhutk6IXl%2B3fe1kkZEzhZz6CWye%2FVAcFO%2BgtS4uo%3D&reserved=0
> 
> Changes in v3:
> - Drop already applied bugfix for arm64
> - Disable LTO for the riscv vDSO, as it is incompatible
> - Link to v2: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26%40linutronix.de&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3f03f6747325451ee98808ddd9634f27%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638905742749600546%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=uv0qMS5qq0DovLHtxfRvT42atbJEkztylpOS8zt6bJ4%3D&reserved=0
> 
> Changes in v2:
> - Link to openend (invalid) GCC bug containing more explanations
> - Refine commit messages
> - Don't fail on commit absolute relocations in debug info
> - Link to v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fr%2F20250429-vdso-absolute-reloc-v1-0-987a0afd10b5%40linutronix.de&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3f03f6747325451ee98808ddd9634f27%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638905742749616057%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=K5iwoz0Xqc8kheotWEc4M2KrZ7UVMDObOyFfCPj4N8Q%3D&reserved=0
> 
> ---
> Thomas Weißschuh (24):
>        elf, uapi: Add a header for relocation constants
>        x86/elf, um/x86/elf: Move relocation constants to UAPI
>        ARM: elf: Move relocation constants to UAPI
>        arm64: elf: Move relocation constants to UAPI
>        powerpc/elf: Move relocation constants to UAPI
>        riscv: elf: Move relocation constants to UAPI
>        LoongArch: Move relocation constants to UAPI
>        s390/elf: Move relocation constants to UAPI
>        MIPS: ELF: Move relocation constants to UAPI
>        tools headers UAPI: Sync ELF headers with the kernel sources
>        vdso: Add the vdsocheck tool
>        x86/vdso: Enable the vdsocheck tool
>        ARM: vdso: Enable the vdsocheck tool
>        arm64: vdso: Enable the vdsocheck tool
>        powerpc/elf: Add 32-bit REL16 relocation definitions
>        powerpc/vdso: Enable the vdsocheck tool
>        riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
>        riscv: vdso: Disable LTO for the vDSO
>        riscv: vdso: Enable the vdsocheck tool
>        LoongArch: vDSO: Enable the vdsocheck tool
>        s390/vdso: Enable the vdsocheck tool
>        MIPS: ELF: Add more PC-relative relocation definitions
>        MIPS: vdso: Enable the vdsocheck tool
>        vdso/vdsocheck: Drop the transitional kconfig option
> 
>   arch/arm/include/asm/elf.h          |  24 --
>   arch/arm/vdso/Makefile              |   4 +-
>   arch/arm64/include/asm/elf.h        |  55 ----
>   arch/arm64/kernel/vdso/Makefile     |   4 +-
>   arch/loongarch/include/asm/elf.h    | 100 ------
>   arch/loongarch/vdso/Makefile        |   4 +-
>   arch/mips/include/asm/elf.h         |  53 ---
>   arch/mips/vdso/Makefile             |   8 +-
>   arch/powerpc/include/uapi/asm/elf.h | 201 ------------
>   arch/powerpc/kernel/vdso/Makefile   |   4 +-
>   arch/riscv/include/uapi/asm/elf.h   |  66 ----
>   arch/riscv/kernel/vdso/Makefile     |  11 +-
>   arch/s390/include/asm/elf.h         |  83 -----
>   arch/s390/kernel/vdso32/Makefile    |   4 +-
>   arch/s390/kernel/vdso64/Makefile    |   4 +-
>   arch/x86/entry/vdso/Makefile        |   6 +-
>   arch/x86/include/asm/elf.h          |  34 --
>   arch/x86/um/asm/elf.h               |  33 --
>   include/uapi/linux/elf-r.h          | 631 ++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/elf.h            |   1 +
>   lib/vdso/Makefile                   |   2 +
>   lib/vdso/Makefile.include           |  17 +
>   lib/vdso/check/.gitignore           |   3 +
>   lib/vdso/check/Makefile             |  28 ++
>   lib/vdso/check/elf.rs               | 488 ++++++++++++++++++++++++++++
>   lib/vdso/check/vdsocheck.rs         | 279 ++++++++++++++++
>   tools/include/uapi/linux/elf-em.h   |  71 ++++
>   tools/include/uapi/linux/elf-r.h    | 631 ++++++++++++++++++++++++++++++++++++
>   tools/include/uapi/linux/elf.h      | 112 ++++++-
>   29 files changed, 2277 insertions(+), 684 deletions(-)
> ---
> base-commit: 5180c6526acc9f1cb58f8b11fba67583c22e0854
> change-id: 20250428-vdso-absolute-reloc-a226293c1761
> 
> Best regards,


