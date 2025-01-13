Return-Path: <linux-mips+bounces-7413-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F67A0B5B3
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 12:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB98A165346
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 11:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB6E22CF07;
	Mon, 13 Jan 2025 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SNBtvNQt"
X-Original-To: linux-mips@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942B22CF03;
	Mon, 13 Jan 2025 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767779; cv=none; b=MIFdbnaontZ3CA3AX3mKbnVj2Sv7IJHZS3WnMbHtwZTJiytKMnO0zF+f1q4i0FX5bCsks9fjgxWMcXgxr8uKlYw25eEBIoZ85VEwHks//Za+rfbY58qhwgTlGevdGjUZ9RxynnwQIt9H57mCMMmvhdKUz+iirpTnVqecY07RK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767779; c=relaxed/simple;
	bh=ZyeWQJpTwGAGdbZR/bEhR0PM6mD78pCqdTSfYHfG17s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwHIfI41DRwRs4NDYd6uTOTJQKrNcvzEwgYtL51OoWpYng0DnyZD8O/jANVZ1+R2HFVG+Hy7NgWfY+l1i5W0ofek5TqbSbcXcw4nzzbm4TqGVY8qhBjHGkxcjoatFb61c5p+wppHzNpKtwI5VE9VjUj0ABsFp1emoRauGWHygSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SNBtvNQt; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TkMb9saWDKoVdtAfj3qa4lA0CizVrZu729rv04Lulvo=; b=SNBtvNQteCLBFLux9+nUjUvJEg
	CnXxQVer/mHF2wV9/1uUZjUNs+9E1hRGycU8IDmNxgVjjoIyBrk5/On+PKirnoa1w1e1LRWPR63N4
	CkRiOEkx0r/777oeC0pUjDPbn+7GGDONFy3/zaQuEM4sNyS0qhq4qfuH/5LDHr3Ko3pfqc22RzBV+
	9MKnb6QDYSTX8FSkGVMMEEg7PK0kuQkG2D5X0ZPdpdGumr+6m5j36zgdP3YGa543Gv/p+SMi96nLN
	qvuNfWgfeyWbfjCrYvka4KoNG2ydGcDpwFv1r+DZ29hyTyGM00DZlMao0vFzMFkn2QyviMXWr/Xfo
	dkRdArZw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIdT-0000000AHfF-0IL5;
	Mon, 13 Jan 2025 11:29:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7CCFA30057A; Mon, 13 Jan 2025 12:29:34 +0100 (CET)
Date: Mon, 13 Jan 2025 12:29:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.or
Subject: [PATCH] x86: Disable EXECMEM_ROX support
Message-ID: <20250113112934.GA8385@noisy.programming.kicks-ass.net>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-9-rppt@kernel.org>
 <Z4QM_RFfhNX_li_C@intel.com>
 <20250112190755.GCZ4QTC01KzoZkxel9@fat_crate.local>
 <20250113111116.GF5388@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113111116.GF5388@noisy.programming.kicks-ass.net>

On Mon, Jan 13, 2025 at 12:11:16PM +0100, Peter Zijlstra wrote:

> There's definiltely breakage with that module_writable_address()
> nonsense in alternative.c that will not be fixed by that patch.
> 
> The very simplest thing at this point is to remove:
> 
>      select ARCH_HAS_EXECMEM_ROX             if X86_64
> 
> and try again next cycle.

Boris asked I send it as a proper patch, so here goes. Perhaps next time
let x86 merge x86 code :/

---
Subject: x86: Disable EXECMEM_ROX support

The whole module_writable_address() nonsense made a giant mess of
alternative.c, not to mention it still contains bugs -- notable some of the CFI
variants crash and burn.

Mike has been working on patches to clean all this up again, but given the
current state of things, this stuff just isn't ready.

Disable for now, lets try again next cycle.

Fixes: 5185e7f9f3bd ("x86/module: enable ROX caches for module text on 64 bit")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9d7bd0ae48c4..ef6cfea9df73 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -83,7 +83,6 @@ config X86
 	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
 	select ARCH_HAS_EARLY_DEBUG		if KGDB
 	select ARCH_HAS_ELF_RANDOMIZE
-	select ARCH_HAS_EXECMEM_ROX		if X86_64
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL

