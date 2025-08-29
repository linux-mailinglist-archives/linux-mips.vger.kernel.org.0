Return-Path: <linux-mips+bounces-10855-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CFB3C4E8
	for <lists+linux-mips@lfdr.de>; Sat, 30 Aug 2025 00:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D01613A890A
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 22:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DCB26FDBB;
	Fri, 29 Aug 2025 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeI1Uyyw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0222B2A1AA;
	Fri, 29 Aug 2025 22:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756506832; cv=none; b=vCSXcb3tONzlxX8lGWE4RfH9MzadJKSKN8KpuOzRbxRM4xyGxCWkBAMMYD8xWpkpBmMqSRZL9ZhsUysqOaKMArGu8gFK5AhEcZDdOitMjjhT4LB86ZCX9wu29wVzR3XdMR2zdi/4AfwvgMJjzKfFpCks03mrdUmUedM0Sq9Ic/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756506832; c=relaxed/simple;
	bh=gW3UREhITNbhZNhXVhy/1JzS54isi8alO3SClI/0N4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OR0jCuckKwC+/om4uA/xqjZIFiQDrlbyj1/B/fyWYk66So9zIi3gPnpxjGBQ5q9F9OZ1dggmD+qSIwnQt+CvaqDHdc6a0WjvqigEHzNyxR4RyfnYRyVXdRgGw/7AM0x5fYkwtzbEinlCHb8s/I4LZ2Lu3AylE0Mz2ZRAfKgc6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeI1Uyyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5459DC4CEF0;
	Fri, 29 Aug 2025 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756506831;
	bh=gW3UREhITNbhZNhXVhy/1JzS54isi8alO3SClI/0N4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CeI1UyywLphq6rbxihW3K12s6RgLJ57FMTz4eKtrVBaIOZQlRF5Mw5MGN9VZqsyUF
	 ws1VVPK2A9Aphpeu08IZ+PBsvH/hZxYQZ/E8LlLJ2UoQZh6ZiWU7Ee+Bxfnwgu4wDN
	 qm+ussMtaWLdi83SF8aT0+Btb7yjNB9Ygip41cIO0PmgxXzADx6IHAKLQjnLPLfqj2
	 5eqSmq9NNuwF0+wjF3Nc60azb8fAUFVptz94yF9f9Xn6OeJKPvhEVPRSVPcQIiH9ig
	 389Jr83bSdXVSFqVbGJ4RM5keAw6x2twpNgOifIA2xME7cb4HiY+r6PWu/R5+ICtHu
	 LsNzjw1Q4Twaw==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Marco Elver <elver@google.com>, 
 "Peter Zijlstra (Intel)" <peterz@infraded.org>, kasan-dev@googlegroups.com
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
Subject: Re: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Message-Id: <175650682606.3003527.17329504429724755241.b4-ty@kernel.org>
Date: Fri, 29 Aug 2025 15:33:46 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Thu, 21 Aug 2025 14:15:37 -0700, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
> 
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
> 
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.
> 
> [...]

Applied, thanks!

[01/12] kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
        https://git.kernel.org/kbuild/c/20c0989283564
[02/12] arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
        https://git.kernel.org/kbuild/c/65aebf6f5880e
[03/12] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
        https://git.kernel.org/kbuild/c/02aba266e391f
[04/12] arm64: Remove tautological LLVM Kconfig conditions
        https://git.kernel.org/kbuild/c/23cb0514208da
[05/12] mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
        https://git.kernel.org/kbuild/c/e633c2e78fd1c
[06/12] powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
        https://git.kernel.org/kbuild/c/488954ca195d0
[07/12] riscv: Remove version check for LTO_CLANG selects
        https://git.kernel.org/kbuild/c/6578a1ff6aa49
[08/12] riscv: Unconditionally use linker relaxation
        https://git.kernel.org/kbuild/c/7ccbe91796d7b
[09/12] riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
        https://git.kernel.org/kbuild/c/87b28d71396bf
[10/12] lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
        https://git.kernel.org/kbuild/c/a817de20091c3
[11/12] objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
        https://git.kernel.org/kbuild/c/573ad421cc551
[12/12] KMSAN: Remove tautological checks
        https://git.kernel.org/kbuild/c/5ff8c11775c74

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


