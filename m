Return-Path: <linux-mips+bounces-10245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC82B24407
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 10:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9975C7BAE25
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 08:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF88A2ECEBD;
	Wed, 13 Aug 2025 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t3ZaanvF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E1zvWv48"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C2B22425B;
	Wed, 13 Aug 2025 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755072968; cv=none; b=Up/Vi/MQ2ic8h02iuhgbVoZceW6WCbuIerErgpv+6k8tlE7W5f4B4mIvDbkIyZcfWGDYptbH8RWOy2wBdQW+xDvTCVTn4bo5KuGPVFwFTrWZJOVdGZhYpffriyAQT1aRSbNPWFBtp1O4sCu3i53B85XICY6+rrXfZzLZ0+z+tXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755072968; c=relaxed/simple;
	bh=qLk7KTbjb9ze2aC5zK7QVoAdhOj3IvIDiRP14d2KdAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hortiraxeFtIBlhaLKLKfEEzJn3lu3DeetG23uNMPdOO8cbXhdV4KclU4IZaxZBingC4SRmO50Cf+QsWjAX16zsTtfK2gONBVaienq6IIPmDrbjgs4tT8XIPgoXW9LMw9Ub3ijyCwSfUDwW2dn4wZJUG3s9sXzutk8xNnqA9FO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t3ZaanvF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E1zvWv48; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 13 Aug 2025 10:16:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755072965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgBW8b/WLrVQq0BHMU+zEk/Lyyfrm6a/mGbcYhX7PWw=;
	b=t3ZaanvFJHTW1l1H2nSwoa1VFh8EVFo/BJn0UMRG7bq78PXYOpzqMO9UGefI5UiLZP7nNe
	J1FX1/E5cqcFOVpKvUjolk1j8zY71ykS0B7X6UJ1jM73mZGhOMT+2RFDhdp4Y1WmHG3lB8
	fhvgGlk/PFabS5Cn+w3uMjkgmqVzkQuRRvX4xJrjg/8hJ+0j7jOT/qLXJIWkp6a9jfxObj
	LUOs4JziO5PF87uDbwzJHBzRMHIM1CkGRGPGIwWfVdP7ckTLMMlHtUDzc+O5vxoBEjlmG7
	1skI/bKKNj/R2CTmQujVy01wAp2WhS97QfxNvozWzsRXygdxqvZz7+ZCEZyixQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755072965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgBW8b/WLrVQq0BHMU+zEk/Lyyfrm6a/mGbcYhX7PWw=;
	b=E1zvWv48KJJ+SOu4RstGU/Hts0jpCLaRVEpYFntAu8DSCAbOKCuCF3vYrHswu5Uo/Nk8OK
	GMt5eI9bpKssCIDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
Message-ID: <20250813101305-04911850-2375-4be5-9a06-ced21de3ca22@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
 <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>

On Tue, Aug 12, 2025 at 01:07:34PM +0200, Miguel Ojeda wrote:
> On Tue, Aug 12, 2025 at 7:44 AM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > Kbuild and Rust folks: This contains custom definitions of hostprog
> > bindgen and rust library commands.
> > These are currently only defined inside the subsystem directory.
> > Let me know if they should go into scripts/Makefile.host.
> 
> Glad to see more Rust host progs :)
> 
> Keeping them local may be a bit easier initially to land, I guess
> (e.g. no docs), and then we can generalize when needed later.

I'm happy to do the docs etc. I only wanted to avoid doing all that work,
only for it to stay a subsystem-local solution.

Also it would be nice to have a Kconfig symbol, RUSTC_CAN_LINK or similar,
which indicates that the rust compiler can build host programs.

> By the way, for consistency with elsewhere, probably we want
> `HOSTRUSTLIB` -> `HOSTRUSTC L`. Though I am thinking to remove the `L`
> anyway since eventually a lot of code will be "lib".

Ack.

