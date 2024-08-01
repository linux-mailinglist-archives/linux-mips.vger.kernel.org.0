Return-Path: <linux-mips+bounces-4661-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9994527D
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 20:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231CE1C20F13
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 18:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005B6145352;
	Thu,  1 Aug 2024 18:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GiWQMw0D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6587D143747
	for <linux-mips@vger.kernel.org>; Thu,  1 Aug 2024 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722535294; cv=none; b=fBHD+1Mf8OXTVa7f3aPq/x9rZZ6CsALV9JCivnBiIcYtA63rp+wo18dh6QK+qINEu67KeKCPuSFtz5+WNhp1xhH0sDT1eJxRz7Ep9XhpHtR3+tqmKERCItOzSEFOL9DYe3vzzBjF7jF38I3v0/r58vJDmTQuai+heI3KkMpVGO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722535294; c=relaxed/simple;
	bh=B4USJ3DcoEtC2grgJaNeehMjrX/R6yyLoOz0nwuEw9c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sCYzOOq/lWYxSdUt5TRv0M2ysvO2DKO3vlqFQCM9iHpoJ5fPOivT+CTm38PM+dSmhYzQXhsQydlmc/ul9DM8haOAtVNov2q5DiSnnfFKzkUyrQk+SwK0n8L/xOnaGaz6fCuoOpS2IqKIojrzlzEur2c+hiXBzK6B+FLXpmJnlUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiWQMw0D; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7163489149fso7121676a12.3
        for <linux-mips@vger.kernel.org>; Thu, 01 Aug 2024 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722535292; x=1723140092; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xl2Pju3NY9Fnm1xajnPNr4ZOFDET+sfv7XV8JXyIerc=;
        b=GiWQMw0D++CU3TjETx4tWGapTpULxvaI7JV6Y8bd9exHIvcVe2KloKaCc3sl+3L6Tr
         whnLzZIhzEez/vMO/EbpvHmq2wAgGJ4BG7oR6m6qaFWee2Z3VYCc2MgzVvBjWx0iICfw
         nZJ2uXfG1mZU5NCb98GEcsgaV5BQ1TqtHNsVSOT2VTUCyt4pZ1J7vd37da6yjBlA3a/L
         mU0Uxp+3lg8sOhDEfbThyyiskc0dco8Lp+UcfcgVENf11NBLbyPVCLIYm3d+74/+wk1+
         szSkSkwBii8fJgyIYuhcHHQLyaXYegcbx8WIUKUe7Q1/CPGjkNJdQheQCVyL4TGy5rZS
         6CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722535292; x=1723140092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xl2Pju3NY9Fnm1xajnPNr4ZOFDET+sfv7XV8JXyIerc=;
        b=JAKMqHJpcvVwbJD3fQoZKcWmNAIbQHjPrMuV2m/5ZKKQA74xD1thxRUuBkOfJpwvXT
         Z+Vc+nxcjf3hPX/wfTOu6TDg5gZOCfs0eQ9Pk8PEgsN9xauAQGqehHRIr48AGOVMqiHc
         0f2fYKmT7k4Sci9wZJZxtaXGC2CTLb0Jzq6WxItKI2s2HBspTLfGrIQBfICdJFXvMUJy
         eLqo2iqgS/eQtvxIinG7mV3FgzasLUEITzyUK/tD5pr6q4K/8B+ZAeyKpAkWQj1u4T4L
         DZ6Fzeo3E8pW2V+/ZvgER2mZ9HsE09dqRcDv8oh6nxY8bk1tunVrpXQqySHW3VCHfGRG
         UZUA==
X-Forwarded-Encrypted: i=1; AJvYcCUzZBeaeknIgd1+QBkSbtIXahK4nMDiXCGzIWMs4FySmHFmGtaqnDEAjad2d2GRF1xFqyeqCap1prbiEgcP9plbmVI6jbhY+ObZ0w==
X-Gm-Message-State: AOJu0YxOWEgSA4mVpPXodYNJZGYPnpPHJeGarW3b9+IYEUBMa1IaFSAl
	/gUif7jnp7EzL6onD638r+7eeGDhf3G9kDYgN4GQ0z1XRQjXPgshlsARyIsAdFXH8MuNiOb7nWz
	X2w==
X-Google-Smtp-Source: AGHT+IF64U8Ib+bNIe3iPxoSzJOvvilQGXPjPZq7Y/8acNPwlcg0hACHnvmYPGnFv3dx9aufX4l27GJDySU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6252:0:b0:75a:b299:85b6 with SMTP id
 41be03b00d2f7-7b74669c7b3mr1534a12.2.1722535291408; Thu, 01 Aug 2024 11:01:31
 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:01:30 -0700
In-Reply-To: <yq5aikwku25o.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
 <yq5aikwku25o.fsf@kernel.org>
Message-ID: <ZqvNekQAjs-SN-se@google.com>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
From: Sean Christopherson <seanjc@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> > writing guest memory without marking the gfn as dirty in the memslot could
> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> > and presumably the only use case for copy MTE tags _to_ the guest is when
> > restoring state on the target.
> >
> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/guest.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index e1f0ff08836a..962f985977c2 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >  
> >  	mutex_lock(&kvm->slots_lock);
> >  
> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> > +		ret = -EBUSY;
> > +		goto out;
> > +	}
> > +
> >
> 
> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?

No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
relevant.

> Should all those pin request fail if kvm->nr_memslots_dirty_logging != 0? 

No, the conflict with dirty logging is specifically that this code doesn't invoke
mark_page_dirty().  And it can't easily do that, because there's no loaded ("running")
vCPU, i.e. doing so would trip this WARN:

#ifdef CONFIG_HAVE_KVM_DIRTY_RING
	if (WARN_ON_ONCE(vcpu && vcpu->kvm != kvm))
		return;

	WARN_ON_ONCE(!vcpu && !kvm_arch_allow_write_without_running_vcpu(kvm)); <====
#endif

