Return-Path: <linux-mips+bounces-3624-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA99056B7
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 17:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E00D6B2152F
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 15:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6414117F517;
	Wed, 12 Jun 2024 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AikIDcOP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ABE16F91D
	for <linux-mips@vger.kernel.org>; Wed, 12 Jun 2024 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205775; cv=none; b=ULu3t59+1jdJrbS79kri1ZymwN4TH06gAfccJ6P5y9DM/MOFxcWiJq0QBMcwMxToEDGuL7GWecn5nqR6AGfVGBpF0KsIhJrj85Vq95pnFIDAtYBzpu0uIPwwCnfm/gkSoObbsoU+/vopEAtmLDrzdlVO/Ry76OliUOheB0WuqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205775; c=relaxed/simple;
	bh=tzPtwpV4j1pdrwYCvIYwV29IQG2d6cN6yQ3kAiIoajg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dYGU9QYfVl5zexmIh2E+gErZ7kW6JnxjNvbX66fJb4rc3nGT4zutz6xf/gPTJz9bt5yIAdjGtbMDyAzFYGgc7Xkv1GkT+4TBn5kGT3cX5/qWYufdCIUgfSUq4fXlpp7AQdxmIEHBaz/38BufvaxJoVwIWqJS7zefTNW9YkaBQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AikIDcOP; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62834d556feso132643817b3.3
        for <linux-mips@vger.kernel.org>; Wed, 12 Jun 2024 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718205771; x=1718810571; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0BqD6y0/VOUpbW8YRHgmGoMOpV6WFqVjQFCsKaKlao=;
        b=AikIDcOP4Vnh4tezmavbFD+CmFuh8QjYsWGaAfFTgJDLHiaq+z3B2sp9P+0kCZ2xy9
         3tCO+xKVYFd0eXKthsvImF+ABQRWdVrt3F2FCpYz70eqr2ovLU4XHkD3cYFyDaSL4wyg
         QuGMwY1x3vEpT2QXMmKX5dsUX9QVEKYqEyHoB3LKnUngbGqAGJ/yBQSuN05/+h9gVQeR
         rQHi4jDXBf/M6JagQHlnQSr7chGNL+UQB3xrQ29/CQdttbRUQDX7jFghPWBM8COQf3o3
         QNtqfkvnMYPTZptgrGC2bDmzHN/AJqrfKjFJS0veAgU+dBtIHbD80gBP5YwmWiCss7Gr
         fAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718205771; x=1718810571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0BqD6y0/VOUpbW8YRHgmGoMOpV6WFqVjQFCsKaKlao=;
        b=ei9sl4nGIHQNNr314uYJSau8C4t67e/77hgTgSyFIZ7W5nQnyj/PtTjt+H+8QJgeZ9
         vMp0cT+bJpEt1IfJycrnBpAm/IvxMp3AgJJ1L6HFbRumN32wN2Jw+yiFxIg9ydOgDQpW
         iLESaUgz3l3UJZOO7POy3ze4ZEFslI53H0e4+THUrgWxZqklqjIsogghcTa3D5dGe41I
         DLdcqN7VcZG/5zWyzuxFo8sL/Z0FR98mMsjMeVaI/ioCzWIPjdJdzulGIVBt4wN9FcsO
         uO+GzcTJu82IuUqEQZ8SH5NYM8VzxiR4L5DizVOMifwBAX6RUZzpUgvoikSdMuUlNnl6
         ksDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFDp5hYvW+WMiIFH/vGU3PDC0sOzLQrVekjNUFWOrEd8ImHNaNQebWr0wCE9LTHPCk7bF7Oy2MkVMiZw90jxgUjoC1Sd72BUSflg==
X-Gm-Message-State: AOJu0Yzw6nK4nJzxbdPieIg4ttm7/bsdcPoGFdhMxkL0QLwTnUZAf22N
	jEg/xpf6qpTBdSvM8bykutnvbhqVgv0ekKmekNDZDU7sIuQIH+sFf38dB8ZFjcZ0Qrkl/wZ/Zj3
	62g==
X-Google-Smtp-Source: AGHT+IGTqFQO1W9uWgNfx86uFJoJR25380gE+MX0EH8aoPTaRHgwGtgxURTOkAOuuR3wa2vaOk4BcpKiUBQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:660c:b0:62f:f535:f2c with SMTP id
 00721157ae682-62ff53512f5mr5078687b3.2.1718205771477; Wed, 12 Jun 2024
 08:22:51 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:22:49 -0700
In-Reply-To: <20240419112432.GB2972@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240405115815.3226315-2-pbonzini@redhat.com>
 <20240412104408.GA27645@willie-the-truck> <86jzl2sovz.wl-maz@kernel.org>
 <ZhlLHtfeSHk9gRRO@google.com> <86h6g5si0m.wl-maz@kernel.org>
 <Zh1d94Pl6gneVoDd@google.com> <20240418141932.GA1855@willie-the-truck>
 <ZiF6NgGYLSsPNEOg@google.com> <20240419112432.GB2972@willie-the-truck>
Message-ID: <Zmm9SdVfg18RECT5@google.com>
Subject: Re: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 19, 2024, Will Deacon wrote:
> On Thu, Apr 18, 2024 at 12:53:26PM -0700, Sean Christopherson wrote:
> > On Thu, Apr 18, 2024, Will Deacon wrote:
> > > > I assume the idea would be to let arch code do single-page invalidations of
> > > > stage-2 entries for each gfn?
> > > 
> > > Right, as it's the only code which knows which ptes actually ended up
> > > being aged.
> > > 
> > > > Unless I'm having a brain fart, x86 can't make use of that functionality.  Intel
> > > > doesn't provide any way to do targeted invalidation of stage-2 mappings.  AMD
> > > > provides an instruction to do broadcast invalidations, but it takes a virtual
> > > > address, i.e. a stage-1 address.  I can't tell if it's a host virtual address or
> > > > a guest virtual address, but it's a moot point because KVM doen't have the guest
> > > > virtual address, and if it's a host virtual address, there would need to be valid
> > > > mappings in the host page tables for it to work, which KVM can't guarantee.
> > > 
> > > Ah, so it sounds like it would need to be an arch opt-in then.
> > 
> > Even if x86 (or some other arch code) could use the precise tracking, I think it
> > would make sense to have the behavior be arch specific.  Adding infrastructure
> > to get information from arch code, only to turn around and give it back to arch
> > code would be odd.
> 
> Sorry, yes, that's what I had in mind. Basically, a way for the arch code
> to say "I've handled the TLBI, don't worry about it."
> 
> > Unless arm64 can't do the invalidation immediately after aging the stage-2 PTE,
> > the best/easiest solution would be to let arm64 opt out of the common TLB flush
> > when a SPTE is made young.
> > 
> > With the range-based flushing bundled in, this?
> > 
> > ---
> >  include/linux/kvm_host.h |  2 ++
> >  virt/kvm/kvm_main.c      | 40 +++++++++++++++++++++++++---------------
> >  2 files changed, 27 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index afbc99264ffa..8fe5f5e16919 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2010,6 +2010,8 @@ extern const struct kvm_stats_header kvm_vcpu_stats_header;
> >  extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
> >  
> >  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
> > +int kvm_arch_flush_tlb_if_young(void);
> > +
> >  static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
> >  {
> >  	if (unlikely(kvm->mmu_invalidate_in_progress))
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 38b498669ef9..5ebef8ef239c 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -595,6 +595,11 @@ static void kvm_null_fn(void)
> >  }
> >  #define IS_KVM_NULL_FN(fn) ((fn) == (void *)kvm_null_fn)
> >  
> > +int __weak kvm_arch_flush_tlb_if_young(void)
> > +{
> > +	return true;
> > +}
> 
> I tend to find __weak functions a little ugly, but I think the gist of the
> diff looks good to me. Thanks for putting it together!

Circling back to this, I don't think we should pursue this specific tweak, at
least not without hard data for a concrete use case.

The clear_flush_young() hook is the only callback that overloads the return value,
e.g. for invalidate_range_start(), arch code can simply return false if the flush
has already been performed.

And clear_flush_young() _always_ operates on a single page, i.e. the range will
only ever cover a single page in the primary MMU.  It's obviously possible that
KVM's MMU has mapped a transparent hugepage using multiple smaller pages, but
that should be relatively uncommon, and probably not worth optimizing for.

