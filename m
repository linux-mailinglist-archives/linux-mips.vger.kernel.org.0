Return-Path: <linux-mips+bounces-14471-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 475BKJMw+mkGKwMAu9opvQ
	(envelope-from <linux-mips+bounces-14471-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 20:01:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 885DB4D2727
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 20:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEF04300C03A
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 18:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62475480978;
	Tue,  5 May 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R2iPwoLr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509DF4A33EF
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004102; cv=pass; b=KI2ugZj/Iicfq4YE3KQNVyI3Pbb31jGnUdmuPQrUdTxfU+f4FnhvChhWTr1jYgXorJf1+7X5Xfu6fEKhedISf3K4saZxr2uxsHHAiX58T8WJ1ferbbeEpPYFr+zdPgYNajER40KWQBo9TSX4/k/aO/RuwrjrAFOXxmmi/yQ+5zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004102; c=relaxed/simple;
	bh=f+ypqmN+lQj0IF/Oa+7CTxDcYQldd91C7IUoR3r3pGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYlH3eEDie5b4lC0NkIDXWO0MIFkAoPoChnPTFUsxfYx7VbTQiVQZDWbF+pt1sFYywJdNH9HEt+KhLZU6g3zMIPn44Sk2+NeTSXC17tvLdJ2aL82IccmPlsfVxrBPis0KzGccv1CHvAjS2U1slMMnhV+6Kgz5ws+2MuedPkFPP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R2iPwoLr; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1003599866b.2
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 11:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778004098; cv=none;
        d=google.com; s=arc-20240605;
        b=SWncKN9ZiMScSqlxJN3hNFoi4M/t9NYZGg8PbX4oFA3RhLcrh+sJ8zTmDDic6EQUfk
         n8iqUZVyH8YvqO5Q5AVuJ6dsq+esyb4gMOP/fcT2Qm4Wqy9oflhQlLL0uvsWqbZsaEQj
         HcmJxXf3jpvX2im/PdBDEkxhUfCjSuZ4UFFUGAlW+LK4uMf55ncBHW97y7hmP9g+/ZIR
         l5GPd2Vkw8SIUWv1geWsyUfSYBmeHkk1Q59E3eMoo2bcOuhvFa7ve2r8Ezr9DZ5wdyWr
         MtahT0CK1DtrElZ9CB0Hfh1vBPhVct50rAglCe1ccxVnpQFzJCvtH+TN7k4B7gK1z06S
         IGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        fh=MkTn6+qibCLR0TGhsmJRQng9jnMZDFqUrG3MG0sd/xU=;
        b=VkCzhI5a0x/NAsrmp4OfVWTyJYuIjVpVratxW7iQVyokQmgew4zYebzep1lMMM41ro
         IJZ4fsS0P6Xndl/N/92zgR1TOyrYyriaQURrmNR6mta2BlMKv/kfVNGWPptNV5g9r5/Y
         Y9E5XPzVfk92Z4LDIU2v+S/bhWHH2H2ktzbMXApJltByrj0npnhUCpRqcPrkkMh4CGan
         ndc68BiwCfCIKJrLyuKrCmNhQo2/wtjev3BbwpX9LVYmHLQescRgUP8CwXkCRNv0ya0w
         QvZ7tmKzyw6GZWK1OBPptaxD6O5XA4CqmAMPKCJKKsLZZ5Z8+WgHuqf8OTfuL/8515xg
         NCUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778004098; x=1778608898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        b=R2iPwoLriEdbZIs7QFPcadX0XQOBNAqZKPkb4cQSOmgsII66gC+kw1VRegDRBgGNFx
         aHMgHpysJVtd92bEhROI60a5BN9PlmRal06adw60CmQFseJtTC0RUh7H+/k4tHmr274B
         e9kAAe4deDTS1ByYbJsS/kaRewxd0esQW/FRv/341oaB1D90YQ+7co57XQLf4JYfgFa/
         GuhtEbdiRngj2NpfWlswK6AloDZShpfWaM5YCRRZGlIbUBjBA1BYpk/D7ude5Jsek3tk
         GQsyc5FlbDqcM3e51HpktYcyapenoZF9WqlUIFKU0xnBWWwY0FxnS0yS7PaEuXO2Cqab
         ALqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004098; x=1778608898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQUZmjv7aHFLMaMFauN5kz/OKqGsuDJKsdlinZQqRbc=;
        b=Wa4AQ3LLktz/tOC9HbZWHesVgCl5/29ecZLE5aZ5PSzCY00P9UXb7gU3EAmCEXnSBb
         BBV00YHgMGwssKMuW87nTlzCg86nWBAq1F+nPzocZIA7tfJ/yWunbz3NaIm5oUUgqWcQ
         tsWn1D1LpdscY9fix0UMadlnWN/H32Y+/15pvQ7UpdW3+lmkExojGY9rvHjnhoC9QGtx
         9ma18GAyqre9DYrgwrBH/kxeQVCEQ+4+p4vzog/4rdjcq4Lh7lHttYwALchYBfTVMjxX
         PdBvsov2xWWsRJnnfyPFiLnt0YsOWfx2IBwBeIBemXztB2Yh0Ka4ntjm3tt7ndZnOi5q
         fnCg==
X-Forwarded-Encrypted: i=1; AFNElJ+5Sfo5uLqLNWJYaYIr3TLyz4yf7x09bRsKkXt6RaWMWiNhg2IO3oQqoDqFkr+LUCOdqPonLV/t5yCR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2GNgQ3+zaT2oGEwqrM84rFHD4N2kwNY+GzO5r9VXTufBehNj
	s/3hW7Bj7/v8xJ6D1wwt58qrZQHU4pHrJxTcALzr3O/Mq+Ozc2ZLfjF/Xc8BoaBIYpO/jOchUXd
	q44V1NBvbhRmQ7RL7WGrwEk4pbInp4RI2Otp5Z+4y
X-Gm-Gg: AeBDiev67VBeOohfJfRwCH9vZEqp9Vc7d4iEoQ5zAwsiu6YO+Q/Y4qiMWrgSDOkTcsD
	B+Lk2JemzwaJl/p/M/8MSrUR2dkZXzkHSnJDd2+67pup+z/+2AOFCrfNbyE9qi88RKRykbQrkYx
	2rPypqZ5G7SbeYiA2OKtPEY2rmE/VPfral+vNFvVFHQVZwGqdlFpkp+2jHVM6RN+LMbQYVtr6+Z
	6ftcdeI5W04FReD0x3GvS49AxadSQfeVXXyvrFv8POJdcAJGh4X9oiN75SjRjlHuVAm1HDBQadH
	zrHQWE3MGFI+e/2jZ9zLQFACernAHd7ri0XAIqAiOGUmVhL6ZSpQwgL/o2fQdMCM1V9P/AO96l0
	5RQq4/lBVqUbQ/F/ccfa2sD3k4w==
X-Received: by 2002:a17:906:9f87:b0:ba7:cc67:488b with SMTP id
 a640c23a62f3a-bbffab33111mr887380266b.5.1778004097049; Tue, 05 May 2026
 11:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504224213.1049426-2-jthoughton@google.com>
 <20260504231048.1184273-1-jthoughton@google.com> <afohshVlK9YcBk-f@google.com>
In-Reply-To: <afohshVlK9YcBk-f@google.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 5 May 2026 11:01:00 -0700
X-Gm-Features: AVHnY4J0Tr074uKX9gnTkNPmv46TNeS2NEyt9u-k5f94BeNvCS-2m8Zf89eFVRE
Message-ID: <CADrL8HX223b3YS8aHr7b=AZZ2J5ga+-SwLQX9Rs9Ep=rMM5wUA@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
To: Sean Christopherson <seanjc@google.com>
Cc: chenhuacai@kernel.org, gshan@redhat.com, jhogan@kernel.org, 
	joey.gouly@arm.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, maobibo@loongson.cn, 
	maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, ricarkol@google.com, 
	shahuang@redhat.com, stable@vger.kernel.org, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, zhaotianrui@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 885DB4D2727
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14471-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthoughton@google.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, May 5, 2026 at 10:05=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, May 04, 2026, James Houghton wrote:
> > On Mon, May 4, 2026 at 3:42=E2=80=AFPM James Houghton <jthoughton@googl=
e.com> wrote:
> > >
> > > kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> > > concurrently in the event that the KVM's `mm` is __mmput() at the
> > > same time that last reference to the KVM is being dropped.
> > >
> > > T1              T2
> > > KVM_CREATE_VM
> > >                 Get VM file from T1
> > > close VM
> > > exit_mm()       close VM
> > >
> > > T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all()=
,
> > >     with only the KVM srcu read lock held.
> > >
> > > T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
> > >     kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> > >     again, with only the KVM srcu read lock held.
> > >
> > > This leads to a potential double-free of
> > > kvm->arch.kvm_mmu_free_memory_cache and now with NV
> > > kvm->arch.nested_mmus.
>
> ...
>
> > >  void kvm_uninit_stage2_mmu(struct kvm *kvm)
> > >  {
> > > -       kvm_free_stage2_pgd(&kvm->arch.mmu);
> > > +       lockdep_assert_held_write(&kvm->mmu_lock);
> >
> > *facepalm*.... this doesn't account for the other callers of
> > kvm_uninit_stage2_mmu(). They will get lockdep warnings.
> >
> > I've attached a diff to the bottom of this reply that *does* deal with =
them.
> > :( Sorry.
>
> ...
>
> > > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > > index 883b6c1008fb..977598bff5e6 100644
> > > --- a/arch/arm64/kvm/nested.c
> > > +++ b/arch/arm64/kvm/nested.c
> > > @@ -1190,11 +1190,13 @@ void kvm_arch_flush_shadow_all(struct kvm *kv=
m)
> > >  {
> > >         int i;
> > >
> > > +       guard(write_lock)(&kvm->mmu_lock);
> > > +
> > >         for (i =3D 0; i < kvm->arch.nested_mmus_size; i++) {
> > >                 struct kvm_s2_mmu *mmu =3D &kvm->arch.nested_mmus[i];
> > >
> > >                 if (!WARN_ON(atomic_read(&mmu->refcnt)))
> > > -                       kvm_free_stage2_pgd(mmu);
> > > +                       kvm_free_stage2_pgd_locked(mmu);
> > >         }
> > >         kvfree(kvm->arch.nested_mmus);
> > >         kvm->arch.nested_mmus =3D NULL;
> > > --
> > > 2.54.0.545.g6539524ca2-goog
> >
> > And here is the diff that should fix this patch. (Sorry!!)
>
> There are more issues.  kvm->arch.mmu.split_page_cache can be freed by
> kvm_arch_commit_memory_region(), which holds slots_lock and slots_arch_lo=
ck,
> but not mmu_lock.

Thanks. I also noticed that kvm->arch.mmu.split_page_cache is
documented as being protected by kvm->slots_lock; we should be holding
it here. But we cannot take it here because we are already holding the
KVM srcu lock.

> IMO, the handling of kvm->arch.mmu.split_page_cache should be reworked.  =
I don't
> entirely get the motivation for aggressively freeing the cache.  The cach=
e will
> only be filled if KVM actually does eager page splitting, so it's not lik=
e KVM is
> burning pages for setups that will never use the cache.
>
> Maybe I'm underestimating how many pages arm64 needs in the worst case sc=
enario?
> (I can't follow the math, too many macros).  But if KVM is configuring th=
e cache
> with a capacity that's _so_ high that the "wasted" memory is problematic,=
 then we
> probably should we revisit the capacity and algorithm.  E.g. if KVM is sp=
litting
> from 1GiB =3D> 4KiB in a single pass (I can't tell if KVM does this on ar=
m64), then
> we could break that into a 1GiB =3D> 2MiB =3D> 4KiB sequence.

I'm not sure I've fully understood the point you're making, but I
*think* we can just drop the
    kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
line from kvm_uninit_stage2_mmu(). It will get freed when the VM is
destroyed anyway.

So I'm thinking of splitting this patch into two (unless someone tells
me otherwise):

1. Drop the kvm_mmu_free_memory_cache() from kvm_uninit_stage2_mmu()
    Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty
logging is enabled")

2. Grab the MMU write lock around the kvfree(nested_mmus) bit in
kvm_arch_flush_shadow_all(); do the kvfree() without holding the the
lock.
    Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested
Stage-2 mmu structures")

