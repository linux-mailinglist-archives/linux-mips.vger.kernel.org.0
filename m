Return-Path: <linux-mips+bounces-7949-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F0A4436B
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 15:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 716CA7AE3EA
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 14:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1367726BD96;
	Tue, 25 Feb 2025 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tUcA1Bci"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0851926FA70
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494704; cv=none; b=FvC8nqI4kLZ4XW7q288F66PtEFfZB417gGnX4ViZLmW+PavRHyY8egFFWXCO1lncdtdYS/ICYP+dAKMU7qunJfql2UMd2T0MimRJ/mHlE8Gpc/DjBlOFN7a+hLwRu3LSv6DChsxYEZ6h5cFqSD4ZZn39rkzpcxM8cIVapM0tC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494704; c=relaxed/simple;
	bh=JVQ6Hr0btkRg9FyQveqK2uYTu6pLizXhjF4MAm5RJjg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CH+rm3t6+IQuagCFZK94uShiooxBUOSvmHpWFDNjruOtN/rxCjmZtwsvkK2cXmFD/YHTvesBRlyLGFOXolJROc97RAsK2dBg3BkzUoxiAvpGlL3GsLMHOUEgOacuVG0bqId9o1SBjkYUb7FQlfT6lovNOiYw67FtYIFGeneSqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tUcA1Bci; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f816a85facso11764850a91.3
        for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 06:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740494700; x=1741099500; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NffzjCDpuTmdNSnLuEbvoNsdUgp9uFncpWixfvcrqX0=;
        b=tUcA1BciX5VRiNq1kY0Uat/uX67XRbRqQaMz9De0918dbtV0JrGjP60KHiBirMVP22
         cBb4kXeEhmvFpjEG64mpOEZfTwKGc8EOVRVTHYtp4UJgK3RW31vmBYkomAxlUI25giWB
         LPZ03cESi6bCSxL/+w+nlQYiu6V4WeRuHb7ojUoWR5wkziB7CNkiSN0NjHFyd2okF5GC
         C8XshHnZcmSENOdUzrjMSwixQ9HUzhOqLPsEgJwclRubOT0bOYGa73uKlh/CXydiosoi
         6WvsqN18/A8h8d6lwZ0Rfy+lS5e0qW6UspZ+UqEaQj2fomPcDHDPy38X2o3RbHao6ISe
         lYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494700; x=1741099500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NffzjCDpuTmdNSnLuEbvoNsdUgp9uFncpWixfvcrqX0=;
        b=BRXDDhHLxG9HLHXuZeEIqnOTFEJeo6nuPOFYWgZ9FYKCjLgZxyw1Y7CYnWmEmK7ohr
         GmcwQggjQnKK47PcGvO45ZohWg4UPjj99dCMuYXxw8AbhERrdfBTl4cg8Os4n6JaJeKo
         9O9spHaQttwyvlC17cq8j2F5CiycPTo140FXJw0nP3LukQEn7MOvuQUj/SQqu9CtLj/o
         uOQMjA9gLfDmJGjTsf0p09RLl1xOGRSD+q9WlQ+wE2WXWwfzaMP2DR4iTT9Klx3qVnPN
         l2+Nznxvhz3W3tY4HbWYrZZ+I2R8hpwnM/IE6dQL5kntFavImcrRSNohiXlknToFN0p1
         XVwg==
X-Forwarded-Encrypted: i=1; AJvYcCXyBm1wsT5d1AyqSuvdZVujSq6JZC2ynOgBUihwKDqip0Gb3vN36v93Cwn/O3UVWlMWF312BsL+dq0j@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJtEf6vK73wUwLO+8Cauhdw5LG/EsnImNgmwm/A1Yexhjx3PE
	7pXrAMTnCESSbbsCr0fQGGRsuO8hzyf2m9vDXjkquKjvGY56RRHF3txWwuSJFH65k/TMv1aEjhR
	dng==
X-Google-Smtp-Source: AGHT+IG2KruXetDYoI9qbCSWmcITW+yhg6mxBcrrqoCenX7IkOOc3aJKkHxPw+LBj1f6DGaIHr4WklpxusU=
X-Received: from pjh14.prod.google.com ([2002:a17:90b:3f8e:b0:2ea:29de:af10])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:548f:b0:2ee:d7d3:3008
 with SMTP id 98e67ed59e1d1-2fce86ae5d0mr31991980a91.12.1740494700343; Tue, 25
 Feb 2025 06:45:00 -0800 (PST)
Date: Tue, 25 Feb 2025 06:44:58 -0800
In-Reply-To: <Z71tlzQJISk6PFAL@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-5-seanjc@google.com>
 <Z71tlzQJISk6PFAL@yzhao56-desk.sh.intel.com>
Message-ID: <Z73XaiRZMIi_vyvK@google.com>
Subject: Re: [PATCH 4/7] KVM: x86: Don't load/put vCPU when unloading its MMU
 during teardown
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 25, 2025, Yan Zhao wrote:
> On Mon, Feb 24, 2025 at 03:55:39PM -0800, Sean Christopherson wrote:
> > Don't load (and then put) a vCPU when unloading its MMU during VM
> > destruction, as nothing in kvm_mmu_unload() accesses vCPU state beyond the
> > root page/address of each MMU, i.e. can't possible need to run with the
> > vCPU loaded.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/x86.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 045c61cc7e54..9978ed4c0917 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12767,13 +12767,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
> >  	return ret;
> >  }
> >  
> > -static void kvm_unload_vcpu_mmu(struct kvm_vcpu *vcpu)
> > -{
> > -	vcpu_load(vcpu);
> > -	kvm_mmu_unload(vcpu);
> > -	vcpu_put(vcpu);
> > -}
> > -
> >  static void kvm_unload_vcpu_mmus(struct kvm *kvm)
> >  {
> >  	unsigned long i;
> > @@ -12781,7 +12774,7 @@ static void kvm_unload_vcpu_mmus(struct kvm *kvm)
> >  
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		kvm_clear_async_pf_completion_queue(vcpu);
> > -		kvm_unload_vcpu_mmu(vcpu);
> > +		kvm_mmu_unload(vcpu);
> What about just dropping kvm_unload_vcpu_mmu() here?
> kvm_mmu_unload() will be invoked again in kvm_mmu_destroy().
> 
> kvm_arch_vcpu_destroy() --> kvm_mmu_destroy() --> kvm_mmu_unload().

Ugh, I missed that there's yet another call to kvm_mmu_unload().  I definitely
agree with dropping the first kvm_mmu_load(), but I'll do it in a follow-up patch
so that all three changes are isolated (not doing the load/put, doing unload as
part of vCPU destruction, doing unload only once at the end).

And looking at both calls to kvm_mmu_unload(), I suspect that grabbing kvm->srcu
around kvm_mmu_destroy() is unnecessary.  I'll try cleaning that up as well.

