Return-Path: <linux-mips+bounces-4725-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9193F948549
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 00:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471841F2355C
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2024 22:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4696116D9DC;
	Mon,  5 Aug 2024 22:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n2S1Pfro"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B926816D4C1
	for <linux-mips@vger.kernel.org>; Mon,  5 Aug 2024 22:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722895765; cv=none; b=H3WHc5+f8d9bKDeifXiTINVEBjKha/HxhFGfk7OxEcLv+Ly0h25pkbP8EKfbUPt2eYJSsKEXtvQPq0FlmHbMwHIwomiOM2jfK74ay0TxKM7nGNUs1VHzSAMxU+4noWMl2ocuU86h0orl6HteFLmDGQnaeKv0FmtJFNbE73tpdp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722895765; c=relaxed/simple;
	bh=dmDvoV7DR66fW1rp/kKa2yAHHnKdcTd2T9VoWrRsnCs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tbAKN6W1UyfHSrRaUJ/M+55Tl/LQcij+9uqU365H7K0FmoI8Of4pkZXHb4x3yKesJdydzCG9z6GjFtgcmUkn928UaG9C7b15dQLDbIW8xECWjV9Pk8ekRyrN8tD0AwvLPNcV1sN4tS3TaOw90qJZW2hISSnfml2nUQA2XDpeBSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n2S1Pfro; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-70f0a00eb16so4570572b3a.1
        for <linux-mips@vger.kernel.org>; Mon, 05 Aug 2024 15:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722895763; x=1723500563; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C2PiU8MTrEuvmn4oJRZEcNoPreaY/lLc5L+V0JuLroE=;
        b=n2S1Pfroj5GXc+AKmy97SqSqzhAatmtf6hSTbALfmWnl9FxJKmiV1UCBwSGSfwf8oN
         Zi9T6k66nDLL4H6wo9mFdf57vAhKbwYdnNHWTuMWYQz21ys2LETaeQ0wnqzAPVU7HXGk
         oGCOEcmJjmjnLRDJKSQF6RuoaOt5VvLien3b4rVqpBmK0hnKXY9XBzeN/7q8f6RYAf9L
         JKIzyUcKEZ5OJMcnhpRplUpEaJNMON8BUmhP126Sqr2k9Asmac+7h0ZA+vLQSDy8U9R2
         meRUTX0uq/MK/7IxffkTHph07HsMKzoEgpQ1FpV3OB8yL2kT5AzL67wlxHwLdPXoG8Qy
         cujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722895763; x=1723500563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2PiU8MTrEuvmn4oJRZEcNoPreaY/lLc5L+V0JuLroE=;
        b=f3Tpl6182LNWV8wv6OpjODkuzqMIKv3rlKPdwbkkWTTJQ+VwoqSH+0q/MeJ9c62a+Z
         SJik5+Vdv3mcmBcjCOupTPFWkIDCEDv2S7dgNVSiH2JAHYxZSx4QuNsmn52SXNHqf2Fo
         LvKBZD0K18Hjo7GnbZHmJ/YkSvpmxBoG8LTH/3NBYk9Ta0yrjnwF5Ufg4XE4x43aaBfP
         KFZNz6CyM39PrNK8rX+qUqa9WOMcw1SfSKqYraTmyOBVFQrbu787aZvslhf95HCFxU13
         XEVu20ljBSwfc25tXd6UYlqnxov4Ka4Daw9OWibh+3v/Tmk7iSjLI+xnUOLf8eg5t/eg
         BjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRvq6mLjPSqeGtCws0mIno73p6EMr+k9i4slv20tmYkh1pIj5Y65/L0DYycvKHZiP4xQ0Mjf/FY66yq8ewj0V4k3w13C1nNxZuvQ==
X-Gm-Message-State: AOJu0Yx9s7xZ26EoNK10PMbBOrmOBzdhjojw+SQI+FvTdo5V7QndXZLx
	Bkwy15DGWDAfa8XTVU9dIH6VwsPdVt5fcGVMFJO7aebDS5Qjf+/RwJO+pFCbwd9mhhp3w3CR3cr
	Sgg==
X-Google-Smtp-Source: AGHT+IFHGqnQ2aZELEsNF/YUFUu/OdaSqANvJ2o5+KNT08fnEczrxRkzi5g08NacDnyiiIzp3YSr6oxKzK4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f0e:b0:710:4d08:e41f with SMTP id
 d2e1a72fcca58-7106d08296emr87588b3a.4.1722895762937; Mon, 05 Aug 2024
 15:09:22 -0700 (PDT)
Date: Mon, 5 Aug 2024 15:09:21 -0700
In-Reply-To: <yq5a5xsftna9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
 <yq5aikwku25o.fsf@kernel.org> <ZqvNekQAjs-SN-se@google.com> <yq5a5xsftna9.fsf@kernel.org>
Message-ID: <ZrFNkSU4-0Hli7JC@google.com>
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

On Mon, Aug 05, 2024, Aneesh Kumar K.V wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
> >> Sean Christopherson <seanjc@google.com> writes:
> >> 
> >> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> >> > writing guest memory without marking the gfn as dirty in the memslot could
> >> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
> >> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> >> > and presumably the only use case for copy MTE tags _to_ the guest is when
> >> > restoring state on the target.
> >> >
> >> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> >> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> >> > ---
> >> >  arch/arm64/kvm/guest.c | 5 +++++
> >> >  1 file changed, 5 insertions(+)
> >> >
> >> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> >> > index e1f0ff08836a..962f985977c2 100644
> >> > --- a/arch/arm64/kvm/guest.c
> >> > +++ b/arch/arm64/kvm/guest.c
> >> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >> >  
> >> >  	mutex_lock(&kvm->slots_lock);
> >> >  
> >> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> >> > +		ret = -EBUSY;
> >> > +		goto out;
> >> > +	}
> >> > +
> >> >
> >> 
> >> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?
> >
> > No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
> > relevant.
> 
> What I meant was, should we consider mte_copy_tags_from_user() as one
> that update the page contents (even though it is updating tags) and
> use kvm_follow_pfn() with kfp->pin = 1 instead?

Yes, that's my understanding as well.  However, this series is already ludicruosly
long, and I don't have the ability to test the affected code, so rather than blindly
churn more arch code, I opted to add a FIXME in patch 76 instead.

https://lore.kernel.org/all/20240726235234.228822-76-seanjc@google.com

