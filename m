Return-Path: <linux-mips+bounces-3485-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 707918FBFEF
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jun 2024 01:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9488C1C22898
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 23:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F1214D28E;
	Tue,  4 Jun 2024 23:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WaaQfQUC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2614D43D
	for <linux-mips@vger.kernel.org>; Tue,  4 Jun 2024 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717544220; cv=none; b=qwge996Whnoxbc/dOMfRYkV0JGgfh31RJynIWi6ubd+cHBVQH292zpGPGjSnvFvoUwejqkIaP6LFftUj1HvUy05refpZKKeqaQ2QD5qjkEd4FkU5hJJjdjGaQWz2PaT6rfXDs0TuOR/DkILa8KkvChnmwawGi4nJoNTJiWRY6gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717544220; c=relaxed/simple;
	bh=qmv+9P9Yb6Ks0sGqgE9BZpW8i9Nv7p16qdK82LX6Qiw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PaVT1PODo9XaJuCTdPtmw9YYOXZsVgUZzPey1cDi+XlGKmQsCIF7MWs0YB91IDqToOuvt0a6wEwGqwhg7JFb0P4GjQLtUkcBT4gkkEn7+EzouuFdsgr9cg9DePMIeANirdvuT7Vj5G6sGbeBGzYa6+lEA0vzd5DF8Q5D50dpdaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WaaQfQUC; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfa5743655eso10581972276.1
        for <linux-mips@vger.kernel.org>; Tue, 04 Jun 2024 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717544218; x=1718149018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6cRhpzsCNepMdsrfgI93QBKDGHo0p9E5+86VMMwQfk=;
        b=WaaQfQUC5wwAgKRF7/a1+AMO76efMejXegLwy004BcievMIkUzCcPEC2rEzfIySVlL
         3hbb0rfzxe9Aq11MSdCViu//gaBSEkPYGume2BkBOzzdHAoeudm1fSgil1aUakenO4WO
         wF8GpgPh4ZEMMrvvpSg4f7VrMt3G0NvqhuAMLjokdBeab8DuFf6XenpPsJWIIOAT5VD1
         1NwsZ00rJWQI0RJnKC0Tyhq/Gf245hgYp8bByOMg1eApJoA+bSsfjrbeeJZ1yBBt+HLz
         uUjog0DfjEG5dUwrenzSUcw9CJQzebEfZGin1tIusTumwRX4KSVUiPxIx9IVotPykifh
         4/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717544218; x=1718149018;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p6cRhpzsCNepMdsrfgI93QBKDGHo0p9E5+86VMMwQfk=;
        b=Ce1eKjDH6N5oRhyJ8RfryznAySROnTMSOXcCCFkKGCJ6qC82vInaoKTi98ge9HMJ9/
         PTB7Ks7GiaVz3LOJN/bL5rofR0++7fAcCEjE1LL6lMs5BwAolB/rMK2kd1RQET8Mw7fg
         IKOZWLAbUvelFwTpM2vDIVv4o+1dW0eQR/7p40WMhqDrG8b2LSxoI54o7f6M2w+A1FMl
         sa2hLDOvC57E0L7qg3vQvUhEAVfON7ccu93qWy0fVQhZ3KCGKveaq9P6iP20rA/H0MGP
         LbXwMQVhYrKtoaEfdlOTuoHvJEi6t1+Ekrv9U4fIg31GLUjORAs0gchydzac7UyAR0J8
         8Qog==
X-Forwarded-Encrypted: i=1; AJvYcCU91xkjw8nMDNM7Wp4bRcGfpZOJG6PQ5UgOKxdB0LSkMHigtKU2QXuVzoC6VJBGhfmTQynFfsH0XSlv/+cdd9FCgA8Oh1KBZrVajg==
X-Gm-Message-State: AOJu0YxhjQsxjddz6UIj7p2stsA5DNQR6WpG3vRhrKCo1EP9FghPXPbq
	0fXhHGvXARwpmmpBlea114XgAnLkxejs5RBTBIXzbFyDB7Wc+3o8sfFvBII5jQ+26Z2vGRkDG0n
	fpQ==
X-Google-Smtp-Source: AGHT+IGvDf74cxgWq1gEKNpKx7itTcK7riRR46b0a169PbO8HQdl4CdVTPFkPhLbD8V/0e9PxPNrLdgSGrY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1142:b0:df7:9ac4:f1b2 with SMTP id
 3f1490d57ef6-dfacac478ebmr240926276.5.1717544218030; Tue, 04 Jun 2024
 16:36:58 -0700 (PDT)
Date: Tue, 4 Jun 2024 16:36:56 -0700
In-Reply-To: <Zl-cjHVKaQ0iQE5d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com> <Zlog5Yk_Pjq0jQhC@linux.dev>
 <Zloicw4IU8_-V5Ns@linux.dev> <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
 <Zl-cjHVKaQ0iQE5d@linux.dev>
Message-ID: <Zl-lGLv5PbEUYspD@google.com>
Subject: Re: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024, Oliver Upton wrote:
> On Tue, Jun 04, 2024 at 03:20:20PM -0700, James Houghton wrote:
> > On Fri, May 31, 2024 at 12:18=E2=80=AFPM Oliver Upton <oliver.upton@lin=
ux.dev> wrote:
> > >
> > > On Fri, May 31, 2024 at 12:11:33PM -0700, Oliver Upton wrote:
> > > > On Wed, May 29, 2024 at 06:05:09PM +0000, James Houghton wrote:
> > > Oh, and the WARN_ON() in kvm_pgtable_stage2_test_clear_young() is bog=
us
> > > now. Maybe demote it to:
> > >
> > >   r =3D kvm_pgtable_walk(...);
> > >   WARN_ON_ONCE(r && r !=3D -EAGAIN);
> >=20
> > Oh, indeed, thank you. Just to make sure -- does it make sense to
> > retry the cmpxchg if it fails? For example, the way I have it now for
> > x86[1], we retry the cmpxchg if the spte is still a leaf, otherwise we
> > move on to the next one having done nothing. Does something like that
> > make sense for arm64?
>=20
> At least for arm64 I do not see a need for retry. The only possible
> races are:
>=20
>  - A stage-2 fault handler establishing / adjusting the mapping for the
>    GFN. If the guest is directly accessing the GFN in question, what's
>    the point of wiping out AF?
>=20
>    Even when returning -EAGAIN we've already primed stage2_age_data::youn=
g,
>    so we report the correct state back to the primary MMU.
>=20
>  - Another kvm_age_gfn() trying to age the same GFN. I haven't even
>    looked to see if this is possible from the primary MMU POV, but in
>    theory one of the calls will win the race and clear AF.
>=20
> Given Yu's concerns about making pending writers wait, we should take
> every opportunity to bail on the walk.

+1.  The x86 path that retries is, for all intents and purposes, limited to=
 Intel
CPUs that don't support EPT A/D bits, i.e. to pre-HSW CPUs.  I wouldn't mak=
e any
decisions based on that code.

