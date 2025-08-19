Return-Path: <linux-mips+bounces-10372-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D410FB2B596
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 02:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A03818A4B67
	for <lists+linux-mips@lfdr.de>; Tue, 19 Aug 2025 00:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41DC19C540;
	Tue, 19 Aug 2025 00:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf9fcNQg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83532176ADB;
	Tue, 19 Aug 2025 00:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755564929; cv=none; b=PpaXyeNQspHVWTIckK9mcmJgXrYx0FlRNu8zuMXmWZD7iLOeHwNWrtBxBjXP6vJiU2q7lnKBBNZvwSVMbTpg/XFV1Y7EcZAXgJzU8hJ+mDG0s1YNY8wlOzzIu24ueRazIM9mlkfwnqDuoYBLbdMGwfhM/+/I38r82SPP4iSlO5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755564929; c=relaxed/simple;
	bh=RHDDgdI1KU5gTd6q3RZ5KjPYkSkpxLcDr1NCuu19268=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vrwp53Vxoa7wFDp4GkErXUTYyCVjL2F9uslq8ztOhl4p4crO8Z+iTw35Qk+o/AguRF6Q/9mom4vIuusk/E2H1chA/ps9syrMPB9R6Yo26oNE/KrnswQna5mWSkMsvN1nkfbe726k+pIptuvkVCyjXJm6/KuI5iX1bO+02ULCssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf9fcNQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A33C4CEEB;
	Tue, 19 Aug 2025 00:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755564929;
	bh=RHDDgdI1KU5gTd6q3RZ5KjPYkSkpxLcDr1NCuu19268=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xf9fcNQgSU+Jeg+ZP/DY9xu+7OEGwXkut8IrHzRW8NQLSJst0aTV0vjj7mBLD2TMC
	 w5Fy48Sn79iupubE3YtfbIfAZusLxLPs26rf7V0ryA7My7a+9RNPJSdkDFA+bypbef
	 SxGw74sKCkXQJfaZC+ps0lk9znD9XBmUnvgdm6lcfG4Dymf7j7PwKOAneQrOIzbUez
	 vCSoiI+k4kes3saiX75j3h1XiAq43lBTMSMpkalNwUodG0ItYSp05wxSQjcjHYl4v/
	 z2RjuW+7g/v5dY5viRILFm+jyrKcdgAUsnv3ksqOxqwz7dYrU5SvTErUHtrouytaWZ
	 aW3FdXzlx4+Dw==
Date: Mon, 18 Aug 2025 17:55:28 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 00/10] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Message-ID: <202508181753.7204670E@keescook>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>

On Mon, Aug 18, 2025 at 11:57:16AM -0700, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
>
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
>
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.

Looks good to me!

Reviewed-by: Kees Cook <kees@kernel.org>

> I think it makes sense for either Andrew to carry this via -mm on a
> nonmm branch or me to carry this via the Kbuild tree, with the
> appropriate acks.

I vote you carry it with Kbuild. :)

--
Kees Cook

