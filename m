Return-Path: <linux-mips+bounces-1284-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F7847C11
	for <lists+linux-mips@lfdr.de>; Fri,  2 Feb 2024 23:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC03E1C23C5B
	for <lists+linux-mips@lfdr.de>; Fri,  2 Feb 2024 22:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7B085957;
	Fri,  2 Feb 2024 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HqcJnJXt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50DD83A09
	for <linux-mips@vger.kernel.org>; Fri,  2 Feb 2024 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706911559; cv=none; b=pu2aYPcB7M5VM15x4xH3ehyBcxjlXgeRuorQQ53t/+wrYmpULgUpA38i9mhP0afy8QzqgKXfhd+TiNSrCdf0YT+zgywzyXXkhTrsi8YSFbsrRXFtyOVt3qyNsI9pVqeKXWnx9WRk7AA4muNV//PGLJTxfQUmQ60zZeP2oasDQtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706911559; c=relaxed/simple;
	bh=vzxGVJZTyLyW5M5KJyCurL3KBonx/0+YslgCT13JXjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4PLUMyeFG7fLkXBRTT8BKzAShtAF8pcSWeXWjHJFDR2gnJhI367ICbl5JB+j7ve7ZTMBNe1xUQb9tNTGpeW7wPGWZNbDrygIcQ/9DGgYx5cIl1hwPGDo0rOgitJgbW4MkE5m5q+eFQwsnhf7m0XJ2Sh2Df1ri4rGGrBU5B6A5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=HqcJnJXt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55fc7f63639so2999125a12.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Feb 2024 14:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706911555; x=1707516355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88hcq8XgkrpsBeyZheiHmTOtZGbbdlYCkf6URsqgIp4=;
        b=HqcJnJXtG2m2Ius+OiWv5UL5wvnQRKc2wKtyGBscvipEv/S1GPAYMoOC3zzcwu7suq
         49eHVzS+58Y5d5OteUJ811C9buJqT+Je7tO0b1HNGzKubnu2S2XWem7rMXXSdTvA2hy/
         sRkoP33pMGZqoQ09wJRmMNX24D8SCzvuz87xzBbI5gOfJq2bd/FOBsnTTwJREEIP/xWn
         xp/8YMamQpoWS39JAt8NSIxE83l0DkBX1l1GtDyA/vknMQ0i9JLzshGDBFhwNMYp9Jus
         gm5hByu87TQpLjXs+HcjSVwYCAEN/+UT9VvJDX6cTd6QFrOSNokTp2QMMejoeWNYQ6zi
         YQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911555; x=1707516355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88hcq8XgkrpsBeyZheiHmTOtZGbbdlYCkf6URsqgIp4=;
        b=QMb/tPsr5fTsXHAIC1dmcZDjXWSvHsq0mZz55Xq41t/T9h8NAMGOe9zASCGgpt/wif
         wYhsF6BpOdHu6KpJYryHz6AzXoncpZBa/LVlXBAt/qganGm8pAkhkqlBhgCgWvbsEpDR
         YHOExC62oq/gj6adStIrKoZvpwChzMx9ezKSgFXd+Fhbe8mHcC3GeQKg0owpz595mhLe
         IuUVwWq2+HvCuTlZf6Ikxit4g/SbvspiYw/ve4ZVRvasXXx9rhf3y3VuKhWpjdvewJvB
         NeWDWfC2FUQgU6KS8MV2ckYJcG922i2jwxCGUA6HPNt1oabGKL4D+dm1wb7z+scvoxph
         yZqA==
X-Gm-Message-State: AOJu0YyxJYmEGD7Bk8duvQPoO8DHxPI3A7bEZO1U4FlnbWHhNT7GsQzG
	gBe98Csv5/aTVkAJ5AKUUomXdilADTNCLuP0fPwh80gdZGcYA9/eJn73XJ8UDyd/T1B9oRLzwoc
	q9HJ7qf0aRxl0FqR8BbJMX/VDGgRqxIcXszcIAQ==
X-Google-Smtp-Source: AGHT+IEdra/txPxsHeiEZSIqeLcoax0q8b5/TdMlKdrQpsLC9Bhy0DO41JjMt0QszL6IyZw4hoGkwwrYDp1u0lZqAvA=
X-Received: by 2002:a17:906:2455:b0:a2e:94a0:93b4 with SMTP id
 a21-20020a170906245500b00a2e94a093b4mr4841883ejb.61.1706911555736; Fri, 02
 Feb 2024 14:05:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com> <Zbuy1E7mz9Oui1Dl@andrea> <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
In-Reply-To: <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 2 Feb 2024 23:05:44 +0100
Message-ID: <CAHVXubjzpTru3Tn+nmv=GwG0YWxnkeYYT1KOJW5a27H2EDAZ0Q@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive sfence.vma
 for new userspace mappings with Svvptc
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 4:42=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosinc.=
com> wrote:
>
> Hi Andrea,
>
> On Thu, Feb 1, 2024 at 4:03=E2=80=AFPM Andrea Parri <parri.andrea@gmail.c=
om> wrote:
> >
> > On Wed, Jan 31, 2024 at 04:59:29PM +0100, Alexandre Ghiti wrote:
> > > The preventive sfence.vma were emitted because new mappings must be m=
ade
> > > visible to the page table walker but Svvptc guarantees that xRET act =
as
> > > a fence, so no need to sfence.vma for the uarchs that implement this
> > > extension.
> >
> > AFAIU, your first submission shows that you don't need that xRET proper=
ty.
> > Similarly for other archs.  What was rationale behind this Svvptc chang=
e?
>
> Actually, the ARC has just changed its mind and removed this new

The wording was incorrect here, the ARC did not state anything, the
author of Svvptc proposed an amended version of the spec that removes
this behaviour and that's under discussion.

> behaviour from the Svvptc extension, so we will take some gratuitous
> page faults (but that should be outliners), which makes riscv similar
> to x86 and arm64.
>
> >
> >
> > > This allows to drastically reduce the number of sfence.vma emitted:
> > >
> > > * Ubuntu boot to login:
> > > Before: ~630k sfence.vma
> > > After:  ~200k sfence.vma
> > >
> > > * ltp - mmapstress01
> > > Before: ~45k
> > > After:  ~6.3k
> > >
> > > * lmbench - lat_pagefault
> > > Before: ~665k
> > > After:   832 (!)
> > >
> > > * lmbench - lat_mmap
> > > Before: ~546k
> > > After:   718 (!)
> >
> > This Svvptc seems to move/add the "burden" of the synchronization to xR=
ET:
> > Perhaps integrate the above counts w/ the perf gains in the cover lette=
r?
>
> Yes, I'll copy that to the cover letter.
>
> Thanks for your interest!
>
> Alex
>
> >
> >   Andrea

