Return-Path: <linux-mips+bounces-14472-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPVYBRc0+mlLKwMAu9opvQ
	(envelope-from <linux-mips+bounces-14472-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 20:16:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A734B4D28C4
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 20:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15CD8300D77A
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 18:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71AA4963B6;
	Tue,  5 May 2026 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kY6Usk7j"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDC31F9BA
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005012; cv=none; b=m9tCHvJkhkOuUVdCkJlrkCMByi4aqDsZp4SToYi3hLV9JqvR/GV9Sl6yH7vv0rkv02WekcBPFxl1d18egKZzwUqGZrgYZSq2b8cdXe++BelejuwqdMTPTKuHupOuJttbO4+qDgIVp9UZLJ4PWYM3nijw5UFkYQ6T54D4X/hQVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005012; c=relaxed/simple;
	bh=jJt54MpFxQg6JNI2urKnLlI3egsp9pP5s8P+shBJ5y4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qLz/KeuRKmsPSu/THvHZmFYOvZfSmZE3tSDz6pYrDWChNfMggFbL3D+DhoCzv2rBg/ErX37aRC2yERmDKlxvPoPA8lukEPY1PpJiLOdAhQljaaE8jZ1uNev5mX6P3ZIfURZJX26XXQOF8xbOHJRYsaxQHpJR7RGGc1f8Cl+qx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kY6Usk7j; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b461b36990so61426705ad.3
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778005011; x=1778609811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luNYyBAnxJ4nZFqNusK+zieJvfObwASYFJHRx4I4bUc=;
        b=kY6Usk7jrWMpapK4HX7ghYKfEabNMDy5qQqMp6EqUfRdSJmFQAAzRgM7Wog3gFB2ea
         qHNToW8uhPX8AEHobgjY0BjfumailYHKW4aLUR7Z8i8sVKwMWp5DAPQHjx5kOWGu113C
         3M98RzS4iY7bk/kzW2S0YSTTPR0z5IPzNXl8lE9C7c2nDY2kzAf9vBaKt3IUNOHicMJL
         OzjF/ayfthQabpIzQSX+/mqabx1HOIg+HqDjhHrLpgJXDXNx1gBFgTTFz9A0eXs/9AGw
         FgGQixTlrm9TkkGJD1ebfHii9bWzBmQkJD3SCbY64TwV98fCgjneYlIMoq61xaBJXH2V
         sZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005011; x=1778609811;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=luNYyBAnxJ4nZFqNusK+zieJvfObwASYFJHRx4I4bUc=;
        b=gUgwxnJpzncKapbUfBhoHlqjHgM0tQz/4Fxs/hEw3qkl6m0EaxwlWxIpERYRZmi6wh
         HFOnrsPF11I4Aev1IRJWqN1srqqroAhE4iMYGT2/4WaYw3RfdnXOr2na0DVIWQFYfYO2
         hPaIJ7avFi5m0nJVYMjFGBLQUaP5z0BMKPfFky342PPrCn2/2xyKJ/XaSPrs43WOuvbo
         tOxZyteJ2EvCZyUGQ4qxu90cjEzUl0NkT4C86mJetPPPGdOOHf4hIeNuEVZtKCrKoxsH
         nDcRQMED1ex1drCNINXHpc2jykuwyJxtrHGm4mEKazC1M95Dg2Li8yw6ttYx/PqiIOkF
         CD5A==
X-Forwarded-Encrypted: i=1; AFNElJ8VLwpoPWOsRmpgwieRiOd0VB0aUiFWs+dEFYS43ytCc3+JgHdcIsFJ+EA8CHmGeSn54XtgrblszS3M@vger.kernel.org
X-Gm-Message-State: AOJu0YxxwXLmfp29kgzDLVGYojIXszBxkyo1kW0DG4YryxDhUIiun8PB
	bSrtyxXvpg5/tdoUqeuKM1kM+zH/BtR9p5dpTr0mQ9SjxagSFyoQP51fbnTNjZnyGC0m/u9PY4P
	qxX+OPA==
X-Received: from plof8.prod.google.com ([2002:a17:902:8608:b0:2b2:5117:a3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b03:b0:2b9:ff02:a15a
 with SMTP id d9443c01a7336-2ba794c3003mr848615ad.9.1778005010714; Tue, 05 May
 2026 11:16:50 -0700 (PDT)
Date: Tue, 5 May 2026 11:16:50 -0700
In-Reply-To: <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
 <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Message-ID: <afo0Er7R4MnMP0MB@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A734B4D28C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14472-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]

On Tue, May 05, 2026, James Houghton wrote:
> On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
> > kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_=
lock,
> > but not mmu_lock.
>=20
> Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
> documented as being protected by kvm->slots_lock; we should be holding
> it here. But we cannot take it here because we are already holding the
> KVM srcu lock.
>=20
> > IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.=
  I don't
> > entirely get the motivation for aggressively freeing the cache.  The ca=
che will
> > only be filled if KVM actually does eager page splitting, so it's not l=
ike KVM is
> > burning pages for setups that will never use the cache.
> >
> > Maybe I'm underestimating how many pages arm64 needs in the worst case =
scenario?
> > (I can't follow the math, too many macros).  But if KVM is configuring =
the cache
> > with a capacity that's _so_ high that the "wasted" memory is problemati=
c, then we
> > probably should we revisit the capacity and algorithm.  E.g. if KVM is =
splitting
> > from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on =
arm64), then
> > we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.
>=20
> I'm not sure I've fully understood the point you're making, but I
> *think* we can just drop the
>     kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
> line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
> destroyed anyway.

It's not that simple.  KVM arm64 allows userspace to reconfigure the capaci=
ty of
the cache via KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE.  kvm_vm_ioctl_enable_cap(=
)
currently allows userspace to do that so long as there are no memslots.
__kvm_mmu_topup_memory_cache() will (rightly) yell and fail if it's called =
with
the "wrong" capacity, so we'd need to sort that out.

The other issue is that it's not clear to me what happens for large "chunk"=
 sizes.
If KVM is splitting from 1GiB (or whatever huge-hugepage sizes are supporte=
d on
arm64) all the way to 4KiB, e.g. to optimize against break-before-make, the=
n the
capacity of the cache could be significant, e.g. MiB of memory or worse.  M=
y read
of things is that purging the cache when dirty logging is disabled is a gua=
rd
against consuming too much memory when the chunk size is large.

