Return-Path: <linux-mips+bounces-3449-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C268D6B37
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 23:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9766D2820F9
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 21:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BCA7B3EB;
	Fri, 31 May 2024 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LEAebNXp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C579B96
	for <linux-mips@vger.kernel.org>; Fri, 31 May 2024 21:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717189642; cv=none; b=iVXj4L+HjNi192hDXfZX+aPdT8z0Z9PWgCbrSU3OjSg4ZPlBFhZPSW6OYcr7gqPeTn3TXwd95SmzVI9pgqTejs+OLl5VjiYbRoDoCCFgeg21HOgR8vinc+YS3iiTnD0AKD7tv4Hh0ZInSfl4IKelFi2eVQ8ZQS6EkR8Y7WeB42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717189642; c=relaxed/simple;
	bh=Xx3RPcl1E+PKSqvPm+Il1+elz18o0K6zeYgjqcWFZiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXNSWe79Z4pu2BvwFo54bvWhX2tDBLybwL5lomeGNBaQAjX7P+uaG/DBlmD04af3DFByG+b4IY39bx99qaVgvsBEpHfvs/DrhSQD2Wxe1estC20W3796A6KlgyIEgFy37L9XGyyLsg0yJX0UjS9lRMkXfl5xFUsWeKPCL9mod+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LEAebNXp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-354f3f6c3b1so2234414f8f.2
        for <linux-mips@vger.kernel.org>; Fri, 31 May 2024 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717189638; x=1717794438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx3RPcl1E+PKSqvPm+Il1+elz18o0K6zeYgjqcWFZiw=;
        b=LEAebNXpt4QJDIJMMkcMJSfPcXLFgY+S01OYxYclGwNBqE+pQnFvqNscm9U53Jl5EK
         df6ddbQB8oYw5k2UWxgmbxcrAgJA6JXj9yw2MRmhPHNgHuga9YHW1sBTgnvkWuwYQyrm
         j6zqbVPWFauuTw86A8lG1Xs6adpZi2EEa8s/XV63WUQ89K/f849fFUET1TcEow+zhNjF
         gmDk7P1Bfeb6dOYqlCo1p3OBVGmBBcymNuV7ZK6BydcKTcGjPCYF05Dp9xNRO6ypIPzK
         0iGUuZpV7id4lLvmiboI4zDMzXK1ACgbx+LO5ovdJn4+O/u8js/hyjn8dB2UO7w82Om5
         IltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717189638; x=1717794438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx3RPcl1E+PKSqvPm+Il1+elz18o0K6zeYgjqcWFZiw=;
        b=CYxWLNwojA15ZE3sT+FSp2MpWUBoYawDj++6hNGco/gd3DHYtSxPZrlxgWrhzw4en+
         lIG5tvgnK2NK1hhBgsn9Ww+wSptiDDRGJSCiPm/RcCQWmZIeEn9hVu4oXfxYEY0yDUg3
         S58on3eCT503frIgY37M/XFNBCkw0knzS7la5N6ao9IoV5l1WwCMluZDwCFwjyloukoX
         nvGRXOUGUW7QKhrh5UiIaFUG0B7/F7/VKNYHauYS5vKio82IDhBJbRKRcHm2v1kB68AQ
         hqfQXmtwtpZ6TnenQ/yKSxF2lUB9v0aUtULiTH1ZNtYH55sdnCOBDoUFzBpnQj1NzFxO
         VX8w==
X-Forwarded-Encrypted: i=1; AJvYcCWkaWqSUehlwt127LWpEhcT1x8at8Jl7uDXnCzwRJG5eYkVtEpTdeSkC7M8PhAAYedfWk2BApao338W5hApzr2cmRNdyxqKGRHbvA==
X-Gm-Message-State: AOJu0YwVvuhMBIx3ETd9o0ojjI7A1ozv5xuXYmRYz5D9/mmjZIs29ALm
	hILlTf0CfwhXsxIbIeu0drtCzODpeszVWkrfC6jHEIcirtf/bSlrhDLnv+CAf+dXRWgX2YGYvtD
	moyKYqsFiCB+0QOO3ALgEYWlfIMLjn3Cn3lXq
X-Google-Smtp-Source: AGHT+IE03rpUbTjyQuwZWIC8g/9gHa5mH+MWE/NTSPO8cSZrAXipu4jJgjC2128Si67H3Tnp43CK2uN+A9xSwuw2ufM=
X-Received: by 2002:a5d:4cc1:0:b0:34c:d9f5:a8e with SMTP id
 ffacd0b85a97d-35e0f25b1a0mr2178382f8f.7.1717189638221; Fri, 31 May 2024
 14:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev> <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
In-Reply-To: <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 31 May 2024 14:06:49 -0700
Message-ID: <CALzav=e4PmGV6ayuMCwbKWq8EnOomYKBj-0Lj+gV-kPO=h156A@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Yu Zhao <yuzhao@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, James Houghton <jthoughton@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
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

On Fri, May 31, 2024 at 1:31=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Fri, May 31, 2024 at 1:24=E2=80=AFAM Oliver Upton <oliver.upton@linux.=
dev> wrote:
> >
> > On Wed, May 29, 2024 at 03:03:21PM -0600, Yu Zhao wrote:
> > > On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@g=
oogle.com> wrote:
> > > >
> > > > Secondary MMUs are currently consulted for access/age information a=
t
> > > > eviction time, but before then, we don't get accurate age informati=
on.
> > > > That is, pages that are mostly accessed through a secondary MMU (li=
ke
> > > > guest memory, used by KVM) will always just proceed down to the old=
est
> > > > generation, and then at eviction time, if KVM reports the page to b=
e
> > > > young, the page will be activated/promoted back to the youngest
> > > > generation.
> > >
> > > Correct, and as I explained offline, this is the only reasonable
> > > behavior if we can't locklessly walk secondary MMUs.
> > >
> > > Just for the record, the (crude) analogy I used was:
> > > Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> > > but you are only allowed to pick up 10 of them (and put them in your
> > > pocket). A smart move would be to survey the room *first and then*
> > > pick up the largest ones. But if you are carrying a 500 lbs backpack,
> > > you would just want to pick up whichever that's in front of you rathe=
r
> > > than walk the entire room.
> > >
> > > MGLRU should only scan (or lookaround) secondary MMUs if it can be
> > > done lockless. Otherwise, it should just fall back to the existing
> > > approach, which existed in previous versions but is removed in this
> > > version.
> >
> > Grabbing the MMU lock for write to scan sucks, no argument there. But
> > can you please be specific about the impact of read lock v. RCU in the
> > case of arm64? I had asked about this before and you never replied.
> >
> > My concern remains that adding support for software table walkers
> > outside of the MMU lock entirely requires more work than just deferring
> > the deallocation to an RCU callback. Walkers that previously assumed
> > 'exclusive' access while holding the MMU lock for write must now cope
> > with volatile PTEs.
> >
> > Yes, this problem already exists when hardware sets the AF, but the
> > lock-free walker implementation needs to be generic so it can be applie=
d
> > for other PTE bits.
>
> Direct reclaim is multi-threaded and each reclaimer can take the mmu
> lock for read (testing the A-bit) or write (unmapping before paging
> out) on arm64. The fundamental problem of using the readers-writer
> lock in this case is priority inversion: the readers have lower
> priority than the writers, so ideally, we don't want the readers to
> block the writers at all.
>
> Using my previous (crude) analogy: puting the bill right in front of
> you (the writers) profits immediately whereas searching for the
> largest bill (the readers) can be futile.
>
> As I said earlier, I prefer we drop the arm64 support for now, but I
> will not object to taking the mmu lock for read when clearing the
> A-bit, as long as we fully understand the problem here and document it
> clearly.

FWIW, Google Cloud has been doing proactive reclaim and kstaled-based
aging (a Google-internal page aging daemon, for those outside of
Google) for many years on x86 VMs with the A-bit harvesting
under the write-lock. So I'm skeptical that making ARM64 lockless is
necessary to allow Secondary MMUs to participate in MGLRU aging with
acceptable performance for Cloud usecases. I don't even think it's
necessary on x86 but it's a simple enough change that we might as well
just do it.

I suspect under pathological conditions (host under intense memory
pressure and high rate of reclaim occurring) making A-bit harvesting
lockless will perform better. But under such conditions VM performance
is likely going to suffer regardless. In a Cloud environment we deal
with that through other mechanisms to reduce the rate of reclaim and
make the host healthy.

For these reasons, I think there's value in giving users the option to
enable Secondary MMUs participation MGLRU aging even when A-bit
test/clearing is not done locklessly. I believe this was James' intent
with the Kconfig. Perhaps a default-off writable module parameter
would be better to avoid distros accidentally turning it on?

If and when there is a usecase for optimizing VM performance under
pathological reclaim conditions on ARM, we can make it lockless then.

