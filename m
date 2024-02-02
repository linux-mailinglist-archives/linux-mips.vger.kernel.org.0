Return-Path: <linux-mips+bounces-1267-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE8884738B
	for <lists+linux-mips@lfdr.de>; Fri,  2 Feb 2024 16:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77C4B274EC
	for <lists+linux-mips@lfdr.de>; Fri,  2 Feb 2024 15:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52904146912;
	Fri,  2 Feb 2024 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZbKRPYqX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A4914690C
	for <linux-mips@vger.kernel.org>; Fri,  2 Feb 2024 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706888544; cv=none; b=EnlGguNRSgTXt06QcqXjBRFoE1QPGmvgX2/pYUcuh58fkfcrxOob6knBfrEnwfVkhqC/BGd8JO9f5G43FPoGr9uYpA93xh0zKLAUOPs7jqyMMLcn4eYG9R8a67CFHwUqvuMgTulKGewo32koodUoVfb0M3iAwF+GWDbzZXYfSng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706888544; c=relaxed/simple;
	bh=OiGaU8y/o6fbWR5avhxnnOCplVwis+BAgwhvIPqbVFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Csb1dBs4wVX/AtDG1tk6u89jkuddl7fs0hAPzF9vNloDCm7P+dU5aOQlccIpBdUnYkhBpR+7PO4jiYW3kRAbBnD0PP1uhIK6LFthfzbbtcJ4bDVUIt9eE/07sAzHRws2SO8oD/OI9Lq7Le+q4QGXqzPw+glFABjqJ2wuBZXUpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZbKRPYqX; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a372a3773a5so37711966b.3
        for <linux-mips@vger.kernel.org>; Fri, 02 Feb 2024 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706888540; x=1707493340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kogXmKbjRAlSmOtOOnfMNwgduTqXGjDmhtreItP19dw=;
        b=ZbKRPYqXhs8YmPNPsVlwSfGLAZDCZHigQ/DbLGx/FyTW210IuLn6oMGYNt6HA/Q1eM
         9h/OqtdDXPKjPJ1lMxqCWMel/I7jsC31bxRwPvjs93jXGhNrJIjkHXI//jQ980s9rQeX
         MtyPx/MNAIGpEjO6sBxDlQ/kBMhaosd2fnfenhXPcTiFAa8aoRjfiFXfzehISRKD88Hp
         2LQWrAwZ/IDjJR1nJPNjiAzsQFVClKV+bexyU8FhGS/MWWiyGqwP+D9uwZrZdITG11UZ
         79zlWSp0rG3kMmV77rS1K2jmNCikR8yRoz776PpCoX0xGxk+9gJzcDANGbSvxFVJwR7b
         FUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888540; x=1707493340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kogXmKbjRAlSmOtOOnfMNwgduTqXGjDmhtreItP19dw=;
        b=JwrymskHwKj3I65j7C3LnVVyjqC5dJm3SRvmQu6JixG1SUNNPV4fTBWcI5fKygbMLJ
         CK8IZ6FHSwPi3N4PI/H7YPveH1k0xV+/Fp4w9qMeiFKOFzR9L1KBlE3A02uQHv1BDZoh
         UxorKZ3jFCYusuC1fa43+pJZhS7TQjtzjzoas+LFOLFDYzMcFfZfpJaMm5qLP1ppVWWw
         kYsU2RSKs6hEiztdmbW8GVmIXa4grhnI+H4vyj/2dWiKiCeopoEx/HIEsrNMOtY8zU5g
         19HC2P3yuqsaqo3rFZTS5KFqflqDisXVUrkL6JUEV/OmPlUzd+jFXzBauhXHz9yXEDa7
         RAkg==
X-Gm-Message-State: AOJu0YyPGumcv2/Bi/YqAKCpSlzmEsSFv0vkUN/qxRjat4a+r4gfvLUk
	HiX0KvAG1KjhonYtY1N0Ge4hYWNkKSnZ/dz+TRTXRtNwbERxcjP8kEDktXBlQyHmp4zew4lEArW
	doONtsOokT/xI5runR7ZLADsHZG6Iyg2L+gbBjA==
X-Google-Smtp-Source: AGHT+IH/zecNEC28nmVGlGmSbLynz6gk5o5sKPfDBpuJdaR6b+rS66s9/R0EOFKWMVOPLIAlSXsBwV7AsTvhcGsm6n0=
X-Received: by 2002:a17:906:538f:b0:a31:8ca6:dbb0 with SMTP id
 g15-20020a170906538f00b00a318ca6dbb0mr1676412ejo.16.1706888540289; Fri, 02
 Feb 2024 07:42:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com> <Zbuy1E7mz9Oui1Dl@andrea>
In-Reply-To: <Zbuy1E7mz9Oui1Dl@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 2 Feb 2024 16:42:09 +0100
Message-ID: <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
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

Hi Andrea,

On Thu, Feb 1, 2024 at 4:03=E2=80=AFPM Andrea Parri <parri.andrea@gmail.com=
> wrote:
>
> On Wed, Jan 31, 2024 at 04:59:29PM +0100, Alexandre Ghiti wrote:
> > The preventive sfence.vma were emitted because new mappings must be mad=
e
> > visible to the page table walker but Svvptc guarantees that xRET act as
> > a fence, so no need to sfence.vma for the uarchs that implement this
> > extension.
>
> AFAIU, your first submission shows that you don't need that xRET property=
.
> Similarly for other archs.  What was rationale behind this Svvptc change?

Actually, the ARC has just changed its mind and removed this new
behaviour from the Svvptc extension, so we will take some gratuitous
page faults (but that should be outliners), which makes riscv similar
to x86 and arm64.

>
>
> > This allows to drastically reduce the number of sfence.vma emitted:
> >
> > * Ubuntu boot to login:
> > Before: ~630k sfence.vma
> > After:  ~200k sfence.vma
> >
> > * ltp - mmapstress01
> > Before: ~45k
> > After:  ~6.3k
> >
> > * lmbench - lat_pagefault
> > Before: ~665k
> > After:   832 (!)
> >
> > * lmbench - lat_mmap
> > Before: ~546k
> > After:   718 (!)
>
> This Svvptc seems to move/add the "burden" of the synchronization to xRET=
:
> Perhaps integrate the above counts w/ the perf gains in the cover letter?

Yes, I'll copy that to the cover letter.

Thanks for your interest!

Alex

>
>   Andrea

