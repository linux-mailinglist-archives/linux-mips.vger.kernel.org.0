Return-Path: <linux-mips+bounces-4595-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA193942068
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 21:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 074D81C2122F
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2024 19:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECE2189B97;
	Tue, 30 Jul 2024 19:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S5ZTCDgP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC531AA3F1
	for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 19:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722366942; cv=none; b=scjHNwy8pkoA0Ss+Bf/SNgqCy++oayise/9N8+Kk/V4tPcuF4SlCA4llXxygirGcgVTkUJ37WwSJeYGoSRH9YfRhq9c5PvADZfBnedrMLC5QkmMoxM2lhYGHC0vfU4BRxR8xk2xsJA7BjjbL7Mr2SoTpULbJAcufsM3FvNCziag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722366942; c=relaxed/simple;
	bh=PETnK4VwC/UhIxIqGvXyjWJId5AWW0Ewo3pA8BJW22I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C4WZXvxdSY0ETwECti6X0sQFZIJwu44efI+2SFKeNOkr/6fcCxuwEcY/KQxmnjVtr6Qs24qC1tF08GcLpKBs5zYuC0euxB9fMd+Df4bgNBIyOc7swaSmC4UdqjaCOcnZfEPxl5ws5elyuVrSI5ny3D18aU0Ca7LHeKoRETJAaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S5ZTCDgP; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0b3d35ccfbso5498890276.3
        for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2024 12:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722366940; x=1722971740; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=S5ZTCDgPsH6EKImwBd5iINDaD2hRZ61tabcEsa/6THUwe2NbZb6lIISjl+EW4bwZg7
         ffTtnwZouu8/On3aKf0QeOsxZNCFwo8jL1PlEC4KrzkmNnQFR0WER0F9UZSOc2ie6UK5
         OqL8G9sUbLeSyidEaobP36gOyNsklBHEz2O7wg69/ddSlftGVAzWqeFb9HMgn776KgEY
         uYJPdGsBIbMkZojbYYvHotZbiaCZXUe86s10FnStjPFaLGLoAT+gdNJveYK+B7PRMf/5
         lRMvbCnLKfSTKrmVdzwDwUkxvx5bgP92m8lZ89i3/MpNsl+GK7wahITBTwCEO5yQvGTW
         gOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722366940; x=1722971740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=aacdux+8uZ6m+cWlz0kzQa1oZf80EWHHme+YP/2WzblaWnJQKSXHczLcoNa3VzSl/t
         sMhIHNG2eZjAnkvttCzWrlCIAN1j0ERj+W1SAOZyY3gXt+SIntb9z6tnYey3lNp0elEF
         nKgTkHUtY/KiWkN7joaCTy7mb+7YctXQKcqYT9TZFtqAys27faiAT1w9FnfR56pLliG8
         HCsEqoj7JW38LJXK9wwhTnX4M5yrEx2cdh6002EpydpK3Jfx+LqHvMxQYj/t2vIYB+nf
         9wR6+Dw/SxptgYK1IXO9Y6b5xC0BYr4clMeNacLZD5xF9AiXWD/ce4ZofwTYSgVO+w/V
         TX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU27JnRz1K/P1y4Vy/SOx4OkgsoY/odB7PI2N7dpafOz6quv27am6TWhNAKlVxfE9dNKTrTJ69v3lYf6yHeAQmqTCiAX8ZlTT8+RQ==
X-Gm-Message-State: AOJu0Yyz/xuYo00CMYu7WjYkdJOzHHBu5ebiyntqCtsX3yiYkp8pZBsg
	4ZfIds5/gXgvGsQ7J6KFFlwYiKwWZ0x0OcLDpdixyd0ysWEP2C8d/TMozfD5si/yeQb5gDMeZlr
	MfA==
X-Google-Smtp-Source: AGHT+IG9SmfuMb4gtd0Ao4BPZkLVByP1qx5TNQuKOL4wYDlOLmXqkqaZZiuA2JFi0z3WenSC5NZXiGCdyNk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b8f:b0:e03:59e2:e82 with SMTP id
 3f1490d57ef6-e0b545a3f3dmr19046276.10.1722366939560; Tue, 30 Jul 2024
 12:15:39 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:15:38 -0700
In-Reply-To: <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-49-seanjc@google.com>
 <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Message-ID: <Zqk72jP1c8N0Pn1O@google.com>
Subject: Re: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page
 to common KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Move KVM x86's helper that "finishes" the faultin process to common KVM
> > so that the logic can be shared across all architectures.  Note, not all
> > architectures implement a fast page fault path, but the gist of the
> > comment applies to all architectures.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
> >   include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
> >   2 files changed, 28 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 95beb50748fc..2a0cfa225c8d 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4323,28 +4323,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> >   static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
> >   				      struct kvm_page_fault *fault, int r)
> >   {
> > -	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
> > -			    r == RET_PF_RETRY);
> > -
> > -	if (!fault->refcounted_page)
> > -		return;
> > -
> > -	/*
> > -	 * If the page that KVM got from the *primary MMU* is writable, and KVM
> > -	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
> > -	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
> > -	 * the GFN is write-protected.  Folios can't be safely marked dirty
> > -	 * outside of mmu_lock as doing so could race with writeback on the
> > -	 * folio.  As a result, KVM can't mark folios dirty in the fast page
> > -	 * fault handler, and so KVM must (somewhat) speculatively mark the
> > -	 * folio dirty if KVM could locklessly make the SPTE writable.
> > -	 */
> > -	if (r == RET_PF_RETRY)
> > -		kvm_release_page_unused(fault->refcounted_page);
> > -	else if (!fault->map_writable)
> > -		kvm_release_page_clean(fault->refcounted_page);
> > -	else
> > -		kvm_release_page_dirty(fault->refcounted_page);
> > +	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
> > +				 r == RET_PF_RETRY, fault->map_writable);
> 
> Does it make sense to move RET_PF_* to common code, and avoid a bool
> argument here?

After this series, probably?  Especially if/when we make "struct kvm_page_fault"
a common structure and converge all arch code.  In this series, definitely not,
as it would require even more patches to convert other architectures, and it's
not clear that it would be a net win, at least not without even more massaging.

