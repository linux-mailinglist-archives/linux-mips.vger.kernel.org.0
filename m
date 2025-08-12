Return-Path: <linux-mips+bounces-10235-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D1B22581
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 13:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35ACE62480A
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 11:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF6C2ED145;
	Tue, 12 Aug 2025 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZbEhp4v"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622C2ED15A;
	Tue, 12 Aug 2025 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996869; cv=none; b=TBSAnkv2a9AW5BCVbQOGOcCKLnVC6J6fAyOv66QdlLwiCfEuStpoAvK+5mSm1eS+Mgu1AyH2iq7a+xFlHoSIkxIvDn4OqOywLUNPKiGsHHiATleJdQIqZknnrnhw7HE9np+mUhkTZb5VAXiYcAYgSve31SBRlTd7YomqTZEUZ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996869; c=relaxed/simple;
	bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXt6qnyaqM9oTWgDY7v3lowa9uqIxKYzDTiOooTT/gBfW65Y2gC0DAjruZppDAHuZNtfZ/fMzxwqiridGaawPw2HZRDQPHP9wVYVHUyK/B6qsqNGM8Rm6LmjzGczHh1OB2r6zGNvRDYbJcbfBSZn5kEFQosLNkDrMSJaxd7kp7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZbEhp4v; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24286ed4505so10303595ad.3;
        Tue, 12 Aug 2025 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754996867; x=1755601667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
        b=NZbEhp4vn+EP/XmzUJFdBF80tngRBymjuHYcNg4ukpIba/WRM0CEEGOiR/GzhMEVh9
         u8WROr5Si2zb4McFRIscoUT7fgB8nalCBpqweF+yApa+psnaUSvoSuDEaIc3F5Z42dkm
         7cj04DDxC8eYINnu53+i1GR8ueB+mtzvYdMbScM0BgmAYzbh7lNcLChHhdp1olNroq2S
         jAcPYAJjCFoAmf0Sf/ooC6Dc2TGLpsAJwzP9kJjRGFQxQA3IXi9C4OKD/i5sw+HdBZ3v
         ElB/+cM2a2pGvuroznTnU6wMnY9PGyIRTHxf9FP2RXVz1IGQteCTa0sY5kzK7oQT/ZNA
         ThYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996867; x=1755601667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
        b=ancB9ImStV4gYpR53A1Eyj9ulJuIzf6DLkP7YM19DLlWCayFrhkTKV35Pgljn2Vuch
         wCrs8l8AkpQpWIx38N9ZiLMBTY0OPP8F7Y7gDYcDM03ZcWkpG15UEdY9SK6U6c3a6U00
         tRGoRGGykEuIyrLV1ipcq32HwoV9O2ttz6+NWbrAhXR1E0VRIgOLuJdHx/vbu33arnM9
         3M1dz7qgcLkiQnoSKEZOhdTuzkOCTtoj8FTLCRwsB/w95PBjGkVaTU+X+e38VVmwucSm
         +AGN8npHNnfGpdMiH4fLSu5pan7O+K/JxQFMFcPmeEk3oiOOsVVMKqyac9ARX2oumRm/
         zPyA==
X-Forwarded-Encrypted: i=1; AJvYcCUPF0r3bZI1QAHfCRaMmBIVQsJ5VWBDdVcqbuuENvEcBX37AoJubpqXhtbNNe4/QkWueF5Tku/pKNaH0xYm@vger.kernel.org, AJvYcCUQGxzxygN/rT9eGlSo0r/TkbssitpDuaNfCu0Pw29cM5icH9C0yxW8DhrcXT6EELKaa+o4iukp+8j1wS76saA=@vger.kernel.org, AJvYcCUSHtutdT0m64oM3UndSqi8hVhVYW+4dBVvCfMntz31yCKlcxIhKEs8jk+zYlNqGhq88sE0tPowDIzz3XI=@vger.kernel.org, AJvYcCVefoaZxOU58kECtiIfVxfvr5Ig0rG4RBweQroX4mMe/ioB0/ejXG9UjjfDTdnYFvqKv8+oFBorSFHH7w==@vger.kernel.org, AJvYcCXgFlttS1dWIcCq5tHPMQ7iK/cHTHOhkJWa4hohtuDqOQEjB3cRHZgEL/Vm41db1BfAmKbuxxJm0hhYKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpC2oHZBw/PTmDFhCUq6KO3juEUYhb8twDoVofAnCqq5KPoLfY
	5N4FxZnOzd0OasbVbaA15OUdawRezkxLjzCgrPdqkAcFCHv1HQITzeFnk5C2hQh765KsurNGC4H
	lYlf8DNY94CRzDgGvwf/leu5gJJmj/8w=
X-Gm-Gg: ASbGncsUeWeL9hftL5PGf/OI5axFaj/uJa/iDMKRawGtRqW1O4euIPSCzktwQY8p0Og
	Uasal2/leGF8nsDr5BzTW969BRWxBTWLj2bl8rjHjraJnH+Z4cq9x/sVgGAVoC4MgzPtVSNP9ho
	AlGtpU+7efRIIOzXfJTr5UR/azOCzdUwik0hPWFzoNXMPeMH8rPJyeBuBrKlV8wP8yl56frqUru
	XU2XHUBf1KLRldb83o=
X-Google-Smtp-Source: AGHT+IGLTgav5Ly0pJQ7DxONlyuqSGpB75/R07ZLvB4KvAdVZt2KEevtP/u+Z9PPdrxzblYTwfgzUXYmCR2PQbfj+a0=
X-Received: by 2002:a17:903:1a70:b0:240:5c13:979a with SMTP id
 d9443c01a7336-24306da5537mr4831165ad.9.1754996867136; Tue, 12 Aug 2025
 04:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 13:07:34 +0200
X-Gm-Features: Ac12FXz75fv-5GwEH7lTNJ0yhooMj6nwQ9IaaKPBS7pSI2ZcZDdB8Ex-5Z7LxRg
Message-ID: <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 7:44=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Kbuild and Rust folks: This contains custom definitions of hostprog
> bindgen and rust library commands.
> These are currently only defined inside the subsystem directory.
> Let me know if they should go into scripts/Makefile.host.

Glad to see more Rust host progs :)

Keeping them local may be a bit easier initially to land, I guess
(e.g. no docs), and then we can generalize when needed later.

By the way, for consistency with elsewhere, probably we want
`HOSTRUSTLIB` -> `HOSTRUSTC L`. Though I am thinking to remove the `L`
anyway since eventually a lot of code will be "lib".

Cheers,
Miguel

