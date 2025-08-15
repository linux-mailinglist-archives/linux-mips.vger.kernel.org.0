Return-Path: <linux-mips+bounces-10323-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F09B27DF0
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 12:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF6C51BC581A
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 10:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D35D2FE561;
	Fri, 15 Aug 2025 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aO2iazZB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S6z9FpXD"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333492FCC15;
	Fri, 15 Aug 2025 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755252366; cv=none; b=NI0+5yFsz4XxlVB9jEdoY/Z+jHn5G1lxQlCAIBH/SMNHDV3oe7Jb9JYf/KDeNJLCC8aUJFaJAv2fxghFfTTb2GPxqwXybudAfvZG/7Wqy4hq8dRHedDV3NzfOUKEOGxNv835w0u/xpTQTc5fpBphfsTva/qSTPxpUOLfTsSWIuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755252366; c=relaxed/simple;
	bh=Qum2QJiRlsLf40QcWgyKpHqDOId5H79nbhv7G1AXN9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msdvAgmOBcDqm7R6i4MEo/D0lB/vJJBGS5wPBZZJqmgAhKlv2QHAi37dyC5JmupKmxfyj5kNu3i1KfWIxjejRFE6zK6F1e3qEqrCPHQ+WM4mnyE81oM7V+fG0dw4clsqrHMi+5/BIKidIjYiKyoDMpAqSFE3SNthkydu0r/L4ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aO2iazZB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S6z9FpXD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 15 Aug 2025 12:06:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755252363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKM6vYBTvYJgJZpC+3klg9OwyY5OfNg57KkNb0OocWg=;
	b=aO2iazZBVl4jvGHcxioVfsh65iLR3Izq+qWPXADbutMqMavKgUaUthaDr+R6w1r6xC69M7
	pL5h2TEWtWYewAnpScYhJCkIaFAKgULbi15SjfGtKC8LJ/mZc1hQQzLg71FWu25eDTH0y1
	MdUY3+nnowrj0PdDzw1hyrQ8ozJ0BdBe+J6xfrhxUNOLMiWm7280NRlOtJuKnvCK2Hl4+R
	JjnaSPjNDatrg+pgW4dq3uCQftbz45AWPj/EWmXs4IklOD4k8lw//0rXGaZQYflfEXqJDN
	ZoNnis/wD+gc1ASC2wdlydN0BBi8bv7A4d+0Pi34HL6a8GZJXUQvVqO1fxQIkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755252363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKM6vYBTvYJgJZpC+3klg9OwyY5OfNg57KkNb0OocWg=;
	b=S6z9FpXDI0m5KmQAvWcT/IWg9tN8RVfisToJ75YI5pbqWTKx4VxzrYh7GLy6FZouW5QiYj
	9qWhB6v7+0ZZRyBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
Message-ID: <20250815112851-e613308f-d49e-44ae-b2dd-ca7946fa1fd9@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
 <86186254-b2c6-4818-af0a-4eb67d90e501@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86186254-b2c6-4818-af0a-4eb67d90e501@csgroup.eu>

Hi Christophe,

On Thu, Aug 14, 2025 at 03:43:09PM +0200, Christophe Leroy wrote:
> Le 12/08/2025 à 07:44, Thomas Weißschuh a écrit :
> > The compiler can emit absolute relocations in vDSO code,
> > which are invalid in vDSO code.
> > Detect them at compile-time.
> 
> I'm a bit puzzled with this series.
> 
> If I understand correctly, the check will be done only when you have RUST
> available ?

Yes, this new check will only be performed if a rust toolchain is available.
CONFIG_RUST however is *not* required.

> I wouldn't expect having RUST to build a C kernel.

The build will work fine without Rust present and will fall back to the
simplistic readelf test. A single report of breakage will allow us to fix the code,
not everybody needs to run the full thing.

> By the way, aren't relocations already detected by command cmd_vdso_check in
> lib/vdso/Makefile.include , using readelf ? Why is a new tool needed

The current cmd_vdso_check only validates the final vDSO image.
However that is not sufficient, as some problematic relocations will not show
up in the final image anymore but only the intermediary object files.
And there the logic is more complex than can be reasonably expressed in inline
shell scripts, see the previous revisions of this series for the attempts.
The valid relocations depend on each architecture and the specific ELF section
they appear in.
For the real example that triggered all of this, see commit
0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")

> and why does it have to be written in RUST langage ?

There is no hard requirement for Rust. I chose it for convenience of
implementation, especially around descriptive error handling and generic
functions. tglx was fine with it.


Thomas

