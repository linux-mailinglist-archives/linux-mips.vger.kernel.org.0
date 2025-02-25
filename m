Return-Path: <linux-mips+bounces-7948-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16ECA44308
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 15:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C419A7AB678
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 14:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DB2281344;
	Tue, 25 Feb 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4TBIAJdx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE3280A29
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494145; cv=none; b=CC5TABaFMQPvpNaIfkjxs53zZNmIjJrb/W6XMCd9kAl8tGwhdDUhPwgBWAA8t8cPoXpMIiqk8McjqtssDZcDOl0B/0pFeQx6z3KAtRaPcXqR2c+n1C/6H0nNt1dQflByJ2ylNfGJNZsDnMNekXRcmTsrQBVu5jY0pzjQb+yNeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494145; c=relaxed/simple;
	bh=9hyuXWtcrt6qYFRuvHO0bnjXrHF/CkXG7yP6ynsJrjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ik1BWdoE8GrPFiOKFS92bGao08UGyMsjxdDiu8MgWQooaWh0L2aDU32zFzbb4UgDGB0AyL9ETVAl6ifjhAnbhfEQP39jdTYob3jTiLqmo/hy6rlZAev2mvqVSVN/fpygnQf57cUrJdCTLlFl+f3OEbaOtfKVWD0FxxuqnZEhTzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4TBIAJdx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fbff6426f5so11862424a91.3
        for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740494142; x=1741098942; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OyWMfMyDgx+55Ind0kZ2lpQA8/mHOXTjN2aQVmO4M=;
        b=4TBIAJdxZuNNjUSEmpRBFjteVkgFAruncnIrqJ4LUXIwes9texKhNKx3yNMu5nj2Of
         +1XkL1NFqyOB7QG8mnvtMp3ijTF95zE0RA4z2SvTGB1nlPPiW9hdQLxReFkrEDpbSiSL
         VYUBQmJ7bUXnfeYuKh4q93nUVzNyWLbYgJ37mfr/ueg8MUL1N/4IODoeGagy715MnVN4
         ywbuIQyb3eZM+wwMI/jwVXmUkCe3X3S+L0yifLjE0mVl4BlROlAbA+vAY7JJmp0gOcbA
         1RMPsJLfSaT94Kzk61YdJCSnh/K5L0Gs40VHLn8BCvMlLFRT7qR9AJTDLw8cOq6Kw2ii
         0lvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494142; x=1741098942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OyWMfMyDgx+55Ind0kZ2lpQA8/mHOXTjN2aQVmO4M=;
        b=NRJLevb3IkF4zxynKVA9r2DWVmKxNlj3lqEis/15APivoOhTMl+uctHDxvZO1wMlRM
         0n0BPJhQMxAlkkhrqzw23Lt3A4qng+T4lo9f1IWkz9HPHXgGR3/7kD/wYXf9m1Lnr8Qu
         zBGAUKsle9uFOfr37BDMHTAtEKNP5UKP9xMkgE3/zQTNlvNAHzq3bK6DBle+ukYL/fxz
         edE/3eYuRs3FC9gJV/UO1Mt/rJ5H1aCRuGvoE/PljVT/Qu6cWeFsdUhLNtZDgfrQ/QUx
         jbXxVtFFEbBc4EHpCOtz91rO4olyp2/sPi4C/LFicfhtod1ciDNoq+ESOVmX7R6yKy3G
         Jl9w==
X-Forwarded-Encrypted: i=1; AJvYcCWcCA6//XOQBP6TKDC9FFE8Pzf4zX5qMWgmJKey1M6MidrloSLeDxjvmglAc9bfHBfyS5ncQCpxbCZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVjDUPaeWAUV1G6L5QpNTRozTTu8SASwQZdqDy9obRNE0CqnF
	WDVx5TDT860bkLYHZ6Ijrp6ydk3+y++gdP5ma0lFrD9aZcQlgjWobyeNzHkZv7+vWcF2yjjg/BZ
	e2Q==
X-Google-Smtp-Source: AGHT+IFXh/XOoHWCgjyYmqDQFrw6VQ+lwV1XpaGwsHvB9OE+S78BXcvOxN0p4LNeKFLBgsLwKA4Y+N0kitA=
X-Received: from pjbdj6.prod.google.com ([2002:a17:90a:d2c6:b0:2fa:1fac:269c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8e:b0:2ee:c9b6:c26a
 with SMTP id 98e67ed59e1d1-2fe68ada3bemr5889698a91.11.1740494141828; Tue, 25
 Feb 2025 06:35:41 -0800 (PST)
Date: Tue, 25 Feb 2025 06:35:40 -0800
In-Reply-To: <Z71sOEu7/ewnWZU2@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-4-seanjc@google.com>
 <Z71sOEu7/ewnWZU2@yzhao56-desk.sh.intel.com>
Message-ID: <Z73U38mSuk_tOpqT@google.com>
Subject: Re: [PATCH 3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
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
> On Mon, Feb 24, 2025 at 03:55:38PM -0800, Sean Christopherson wrote:
> > After freeing a vCPU, assert that it is no longer reachable, and that
> > kvm_get_vcpu() doesn't return garbage or a pointer to some other vCPU.
> > While KVM obviously shouldn't be attempting to access a freed vCPU, it's
> > all too easy for KVM to make a VM-wide request, e.g. via KVM_BUG_ON() or
> > kvm_flush_remote_tlbs().
> > 
> > Alternatively, KVM could short-circuit problematic paths if the VM's
> > refcount has gone to zero, e.g. in kvm_make_all_cpus_request(), or KVM
> > could try disallow making global requests during teardown.  But given that
> > deleting the vCPU from the array Just Works, adding logic to the requests
> > path is unnecessary, and trying to make requests illegal during teardown
> > would be a fool's errand.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  virt/kvm/kvm_main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 201c14ff476f..991e8111e88b 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -489,6 +489,14 @@ void kvm_destroy_vcpus(struct kvm *kvm)
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		kvm_vcpu_destroy(vcpu);
> >  		xa_erase(&kvm->vcpu_array, i);
> > +
> > +		/*
> > +		 * Assert that the vCPU isn't visible in any way, to ensure KVM
> > +		 * doesn't trigger a use-after-free if destroying vCPUs results
> > +		 * in VM-wide request, e.g. to flush remote TLBs when tearing
> > +		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
> > +		 */
> > +		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
> As xa_erase() says "After this function returns, loading from @index will return
> %NULL", is this checking of xa_load() necessary?

None of this is "necessary".  My goal with the assert is to (a) document that KVM
relies the vCPU to be NULL/unreachable and (b) to help ensure that doesn't change
in the future.  Checking xa_load() is mostly about (a).

That said, I agree checking xa_load() is more than a bit gratuitous.  I have no
objection to checking only kvm_get_vcpu().

