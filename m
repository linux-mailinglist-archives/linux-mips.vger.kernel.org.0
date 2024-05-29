Return-Path: <linux-mips+bounces-3394-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B648D414F
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2024 00:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0C3C2891E2
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2024 22:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B3C16EC0C;
	Wed, 29 May 2024 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bGgjGF9A"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C316A362
	for <linux-mips@vger.kernel.org>; Wed, 29 May 2024 22:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717021327; cv=none; b=cc3O+gYmGuKQAYIkhTD3LVANUXopOoSELhcnWoUfpBLv0GsrxLg1RnFbfgso7vsHdQQ7Pcy5y6M3vX3kHzbahEXPSIqbe8GZ+0CXIqJd4FoVNwHbTzJ8BHlykE7L8cm4E0z1+bTGncFcGca0+AXN06VRJh77ySt3g2mBRGudfD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717021327; c=relaxed/simple;
	bh=dXNFpCWaiUyGAgeRu6GIx1Hrfse/W7At5lQK/blkjT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5fLvS+bPwHXe/V8uvrLvq9UucYjSPyDdb8OqvMkaItebgVWxOMvabMiE4+0vmmvrZBnIlqXUOmBHi9wplJUGsoLEvKktbEwwed4v8mVi6YQxA/ZAggDdd3w2GYXwildm4d53RGnYU7Ej4mFUZKdQ4aSRODKuEVXTh0Nut/q2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bGgjGF9A; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42012c85e61so30155e9.0
        for <linux-mips@vger.kernel.org>; Wed, 29 May 2024 15:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717021324; x=1717626124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXNFpCWaiUyGAgeRu6GIx1Hrfse/W7At5lQK/blkjT8=;
        b=bGgjGF9AaueUMAZLtXjk1b1SwXKDTY+Ic57wr+Zje1024RXJVGuQBCJ7H5uLPc/wDY
         MV8ASZ/oJ6OaTS2w4jWGoASCGYTqDwJTioVRtk4kHokTBb6n6LsR7roWakWmoC0rGF1r
         FIAXHgw+Wl0foeAHKhVfP9MbKhf6KEOuZLp4JiQfeg/0eDrm3OYwCLvjC7LDIlNga1p9
         cv7eZXz1wsrkZLQc6sYKx4M4GBSJjU6+Sfi71OKpoAekK7iv4zfAcwVNr89vIPoQkn/6
         pyEfTNuLdGTV5nGV1Iv/DWkHkFI8XHEGgBTwghpcD5LHPo+EsOME5SJJ/Y8eG8NocmQC
         nBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021324; x=1717626124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXNFpCWaiUyGAgeRu6GIx1Hrfse/W7At5lQK/blkjT8=;
        b=oSUFr/2zEWSX1Ehgbh4aD3IZVPHOZ9C3++w99Dopl84AUxDMRvNXWK6cwAJtOzXOi3
         glPcyLy+cWvu3zZJdrnnnEdACqee3SJqYzd4cvfaP4hxJXQ0cVBvcDm6FbvELccYul/8
         lKmqCVNEbL4M5T1rk5jiiwUmogLIVjUp1FkPZh5ajVDom5OO6CJxxtwP4gyulB9gas8u
         VzsHcuWkwwhox9i5vcBglYutSF3ejWh+a7hxFy7fjNs4gHCCJioT195gXxvb5SWkaKvS
         aUPr7psGWDIx3oHBd5T/cO2A1eZ3MBPz6MqWkAUuLBNMGrxx/irT3/yLG2AfpDS0Fueb
         ifmg==
X-Forwarded-Encrypted: i=1; AJvYcCWtUSU/OKMsXqZ/e+VajQj7a/Zoq81sXcDQXmQHnukKjClD/092sSUK2lGZUw0x2SP5l6uHk1RE1vkNeqfvpwGeXuLoTUG6u37Q8A==
X-Gm-Message-State: AOJu0YxA+cTtFQ3Mk6hpQg+8tp3sNpPZWO2gJI609b882jNA8a02Hj6m
	1EdxosiDaIvylR356l5T32PxJtUNANv/yBbyZ56VcR/yDYBTpf7baU/mOjzSTNaJrCeoAtTzzDn
	lQ1Ls7XZyiQCZJXuN3UsOLB26fvRt3U7gr9iB
X-Google-Smtp-Source: AGHT+IFqO7VFkypiYSn9vKfdPJnK37iD9z235VYJwF+JX9IAWq7RbNTOv7CYeuUojcdBQo9JI7fHcGh5LBFn8OI6V7U=
X-Received: by 2002:a05:600c:2146:b0:41b:8715:1158 with SMTP id
 5b1f17b1804b1-4212761becfmr670735e9.6.1717021322997; Wed, 29 May 2024
 15:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com>
In-Reply-To: <ZlelW93_T6P-ZuSZ@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 29 May 2024 16:21:24 -0600
Message-ID: <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 3:59=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, May 29, 2024, Yu Zhao wrote:
> > On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@goo=
gle.com> wrote:
> > >
> > > Secondary MMUs are currently consulted for access/age information at
> > > eviction time, but before then, we don't get accurate age information=
.
> > > That is, pages that are mostly accessed through a secondary MMU (like
> > > guest memory, used by KVM) will always just proceed down to the oldes=
t
> > > generation, and then at eviction time, if KVM reports the page to be
> > > young, the page will be activated/promoted back to the youngest
> > > generation.
> >
> > Correct, and as I explained offline, this is the only reasonable
> > behavior if we can't locklessly walk secondary MMUs.
> >
> > Just for the record, the (crude) analogy I used was:
> > Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> > but you are only allowed to pick up 10 of them (and put them in your
> > pocket). A smart move would be to survey the room *first and then*
> > pick up the largest ones. But if you are carrying a 500 lbs backpack,
> > you would just want to pick up whichever that's in front of you rather
> > than walk the entire room.
> >
> > MGLRU should only scan (or lookaround) secondary MMUs if it can be
> > done lockless. Otherwise, it should just fall back to the existing
> > approach, which existed in previous versions but is removed in this
> > version.
>
> IIUC, by "existing approach" you mean completely ignore secondary MMUs th=
at don't
> implement a lockless walk?

No, the existing approach only checks secondary MMUs for LRU folios,
i.e., those at the end of the LRU list. It might not find the best
candidates (the coldest ones) on the entire list, but it doesn't pay
as much for the locking. MGLRU can *optionally* scan MMUs (secondary
included) to find the best candidates, but it can only be a win if the
scanning incurs a relatively low overhead, e.g., done locklessly for
the secondary MMU. IOW, this is a balance between the cost of
reclaiming not-so-cold (warm) folios and that of finding the coldest
folios.

Scanning host MMUs is likely to be a win because 1) there is usually
access locality 2) there is no coarsed locking. If neither holds,
scanning secondary MMUs would likely be a loss. And 1) is generally
weaker for secondary MMUs, since it's about (guest) physical address
space.

