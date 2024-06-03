Return-Path: <linux-mips+bounces-3467-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D18FA64C
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 01:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41C9E1C20B68
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2024 23:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E5683CD6;
	Mon,  3 Jun 2024 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TsCD3X39"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4520482487
	for <linux-mips@vger.kernel.org>; Mon,  3 Jun 2024 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717456641; cv=none; b=MdhwCVPal5BlpFu7rHImx9+dUyBXvlshuzHTmKatNymZ5M3yOR0WFHXXgU7YNLoKOxV4tYOeYP3ZuDKVIiJRuzIhK3O9/xaCbiq9flvt1bN1+R0Tbf8l78Nw+X5fpyI8LKgGNU/WdzUXY119p9jp5xBfoy7TMLxD9sCQVMR4wY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717456641; c=relaxed/simple;
	bh=4jxu/JsmVRXCfHV8AURZSjnWZ5s+7pAtAjdq2rTVOys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siMMnRm337Go0NvBfnHZ54885tFqsd4a8K+5KW08Oh19VwMpoH/iQOEQVoDXdojgsAEGIyhlESzTD7YJj7UoK/Sk184MBPLjb5YRQFmN9ZqtJP4+HmzutsSSYQZYrymooCxkNsReatPXUdRaIGLWCW9Geu6BuvWmdPBJ39LfBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TsCD3X39; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43dfe020675so127201cf.0
        for <linux-mips@vger.kernel.org>; Mon, 03 Jun 2024 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717456638; x=1718061438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDykUGLfvL3M1lWs+oKStYngTbEIAr5rRwVrwRKKurY=;
        b=TsCD3X39LP8tV3l7f2iR3mcypPK7mKBvNY7Yb1kno6zjCY+ahkEdZH+Tb3ZXeX8y9V
         QlTZqhb9FU2anXOZ4UKsKSq+hKW4yHQdoH3g3w4jpGi9YAGUKUlPlc8SJKzTk6kFFJ0i
         ofCiVWu5IVdLJDFyaYt9T1PGYzMxtTvOR7XzK4z5oIbM6V/SOm9hCqP+1GyLvrVnFTai
         M4pz06qrW9UEFY52eV61AHq9jmY4xIlYsH31lXecxPK+wpc4oMmR6cBaT2MorErS6uDB
         Co6PuvnRmwSKmuc/CKVTVXPKBlC61gzo6R++VZ4l99yA7xmQoLnUQI+rvzuJMJOfnXG+
         8G1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717456638; x=1718061438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDykUGLfvL3M1lWs+oKStYngTbEIAr5rRwVrwRKKurY=;
        b=DzH4RQUvACCa8jHtAMlNehhofTbIcG1n76dgC9l7jo7fymVEed5f98Su7rxba+AeLe
         9naBovf1QwLEAfB2x3rNoLkBZh3iS/lbB4MuTQpTLo+zgcd7j3zE216xxZUN1AJge4IL
         vaaoWOGO4zlgTwYkKRZBx8mgmFDu6TaW6evZz2/+5m5UxX04zsU3aG12lCpRHZLjK9Kz
         LZ0zbmIomdgyY/T1Oel69fod1v7GKD83RVD8Q3jA+T38RANbixXiqct3NcI5gXqO1IQd
         mD2/v9BouhDRJRPjJ6XXm3rQZ9yXMmDr/GD/Fzhr0mz9ZtUOnPVzTPxdM8oS9WIwVjPY
         fiEA==
X-Forwarded-Encrypted: i=1; AJvYcCVj1jsVF2iZ4Rk4cg0CcTYz+e+YmI5JTLf+WCZh6VAs2yTHGDh5BLHJfkVnMSaZ1JuYyoQgSlI5+rgfbgsK65mlJiWLjToEMwqVXQ==
X-Gm-Message-State: AOJu0YwNvLkPH5SMvNBmBx0alWGSaJXcKc+kDbxtrTxSgXvc7e7Leqkb
	LIJTqDqKiAYktW/3nwSH5eUG3HhC5ggR7fWW9yk8ATBwXStwm+2wQkZducnIcxwKRavGOy3eSsO
	QioUi/qC3/CaReWscjbPFXQv0ueG3sxnxAmSr
X-Google-Smtp-Source: AGHT+IERlDy+7BDKGdKU12nHNHCd2TlJ06DKBFhjKpTdcIQ5T8pyrt6cuvlCSmsOxFEEGgqtt5PP7LKTO7CDtdLxk+8=
X-Received: by 2002:a05:622a:4ccc:b0:43a:aa3f:917a with SMTP id
 d75a77b69052e-4401e68c145mr1144381cf.27.1717456637692; Mon, 03 Jun 2024
 16:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
 <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com> <Zl5LqcusZ88QOGQY@google.com>
In-Reply-To: <Zl5LqcusZ88QOGQY@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 3 Jun 2024 16:16:41 -0700
Message-ID: <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Sean Christopherson <seanjc@google.com>
Cc: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Mon, Jun 3, 2024 at 4:03=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Jun 03, 2024, James Houghton wrote:
> > On Thu, May 30, 2024 at 11:06=E2=80=AFPM Yu Zhao <yuzhao@google.com> wr=
ote:
> > > What I don't think is acceptable is simplifying those optimizations
> > > out without documenting your justifications (I would even call it a
> > > design change, rather than simplification, from v3 to v4).
> >
> > I'll put back something similar to what you had before (like a
> > test_clear_young() with a "fast" parameter instead of "bitmap"). I
> > like the idea of having a new mmu notifier, like
> > fast_test_clear_young(), while leaving test_young() and clear_young()
> > unchanged (where "fast" means "prioritize speed over accuracy").
>
> Those two statements are contradicting each other, aren't they?

I guess it depends on how you define "similar". :)

> Anyways, I vote
> for a "fast only" variant, e.g. test_clear_young_fast_only() or so.  gup(=
) has
> already established that terminology in mm/, so hopefully it would be fam=
iliar
> to readers.  We could pass a param, but then the MGLRU code would likely =
end up
> doing a bunch of useless indirect calls into secondary MMUs, whereas a de=
dicated
> hook allows implementations to nullify the pointer if the API isn't suppo=
rted
> for whatever reason.
>
> And pulling in Oliver's comments about locking, I think it's important th=
at the
> mmu_notifier API express it's requirement that the operation be "fast", n=
ot that
> it be lockless.  E.g. if a secondary MMU can guarantee that a lock will b=
e
> contented only in rare, slow cases, then taking a lock is a-ok.  Or a sec=
ondary
> MMU could do try-lock and bail if the lock is contended.
>
> That way KVM can honor the intent of the API with an implementation that =
works
> best for KVM _and_ for MGRLU.  I'm sure there will be future adjustments =
and fixes,
> but that's just more motivation for using something like "fast only" inst=
ead of
> "lockless".

Yes, thanks, this is exactly what I meant. I really should have "only"
in the name to signify that it is a requirement that it be fast.
Thanks for wording it so clearly.

>
> > > > I made this logic change as part of removing batching.
> > > >
> > > > I'd really appreciate guidance on what the correct thing to do is.
> > > >
> > > > In my mind, what would work great is: by default, do aging exactly
> > > > when KVM can do it locklessly, and then have a Kconfig to always ha=
ve
> > > > MGLRU to do aging with KVM if a user really cares about proactive
> > > > reclaim (when the feature bit is set). The selftest can check the
> > > > Kconfig + feature bit to know for sure if aging will be done.
> > >
> > > I still don't see how that Kconfig helps. Or why the new static branc=
h
> > > isn't enough?
> >
> > Without a special Kconfig, the feature bit just tells us that aging
> > with KVM is possible, not that it will necessarily be done. For the
> > self-test, it'd be good to know exactly when aging is being done or
> > not, so having a Kconfig like LRU_GEN_ALWAYS_WALK_SECONDARY_MMU would
> > help make the self-test set the right expectations for aging.
> >
> > The Kconfig would also allow a user to know that, no matter what,
> > we're going to get correct age data for VMs, even if, say, we're using
> > the shadow MMU.
>
> Heh, unless KVM flushes, you won't get "correct" age data.
>
> > This is somewhat important for me/Google Cloud. Is that reasonable? May=
be
> > there's a better solution.
>
> Hmm, no?  There's no reason to use a Kconfig, e.g. if we _really_ want to=
 prioritize
> accuracy over speed, then a KVM (x86?) module param to have KVM walk nest=
ed TDP
> page tables would give us what we want.
>
> But before we do that, I think we need to perform due dilegence (or provi=
de data)
> showing that having KVM take mmu_lock for write in the "fast only" API pr=
ovides
> better total behavior.  I.e. that the additional accuracy is indeed worth=
 the cost.

That sounds good to me. I'll drop the Kconfig. I'm not really sure
what to do about the self-test, but that's not really all that
important.

