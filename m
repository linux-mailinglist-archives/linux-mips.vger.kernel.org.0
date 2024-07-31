Return-Path: <linux-mips+bounces-4600-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 564449428E3
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2024 10:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC93B1F23DC7
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2024 08:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E421A7F88;
	Wed, 31 Jul 2024 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XzpWOj9u"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142741A7F64
	for <linux-mips@vger.kernel.org>; Wed, 31 Jul 2024 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413480; cv=none; b=vBKBtsNesWuBJUSdhxsL2vYNY+hXcCC8rgqoB2KDRNnF13stgGlrWLxwQipIaGnMCQqLxNPiKtRT+ss2RLlMxktkMML9iOmkKeY2gHdKdKKTvT66dd9AM661UvWMx1KGKPrB5j4QjsUg75vRnODI0Cs0VuFCNlgDPZs42BHVaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413480; c=relaxed/simple;
	bh=2Gl8bDEMJ7EROOAewtyGSnYyggrq+9cliJTSl46a0AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df8/o457uARdSJ+fHSOTnhcmN++8P06A6zvjD0BoSoUrny9H8lXjxZYhjCTCqRfDSULJvQpvVX2vv7JkpFwtvQS2V0HUovEecWD70gYNaiwj+2egDWXZ6//l8/L8n7kqZQTqfNEmTrR79YKLa2FNPu++MQWzWMcaYYp2Nji5pkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XzpWOj9u; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b827so8093515a12.1
        for <linux-mips@vger.kernel.org>; Wed, 31 Jul 2024 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722413476; x=1723018276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/6o5eOKMgYVhFfCfAX4KZTyTvIb4CeiZ7EcRemTMKgE=;
        b=XzpWOj9uEN/HBmC9Nti+ZlboUO4ecfQm5gr1NLQKCQc0igzf0i5g79lvBw2D+a65WX
         /6dTtywIK7b7CvxNlUopjQwCTaWtv7bGOEzztsDGFqWJQP8Dlsc+OZnxBvgFl3f5WYW1
         oXTwrmJUAaYDjI+DI64eTa8DT0jxSX0P1IyJ5YJUWFEEt+/yK7wAe1Uvd7uk9fI2AkaT
         Nu4eyojBTu0TBMdYRwSreHYknBNCZYLJBwxEeOtvYxYLQ7PaF6W+GirnfKJAWwZdea+J
         GADeRlayoG2b6FfyGv9oRNvpxy7gfyrMJngbXCTVowCEXWwk4GQLQIgAn0Zq6616Z+Qh
         FEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413476; x=1723018276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6o5eOKMgYVhFfCfAX4KZTyTvIb4CeiZ7EcRemTMKgE=;
        b=pRNQpNfH7rWWjXEmw21gqKBziDANPqzV+dJ7I/H6bbfcCFxwFBZGBdG63tvdgA1IYr
         yTp5nR3AJjUBTOyDgVmrU4B3KN30zTSj4tCJ+qXnXD+GY9uA5KqFYc6R9wkyQVYn7Q5J
         dX1W9QgLZw/FYJAAQs55bc1hT6Gvdyqx4pajdyCEK6apawFVeMvcGZLT17w/3i53S4Oi
         /Z3cyzu7kjUvaCPu9ekodzBqcbJBqVsJHb2r4reXVK0NiCKM75JU5ZY6jKZxCD12FcPz
         Gucv/ycqHX40crBxbUZeKUSvYP3Xbbz+Rlmh2mUhwG53yyw8qsexolSnkZq1kFIwJMIN
         ODTw==
X-Forwarded-Encrypted: i=1; AJvYcCWxo0j21yh7f0fc7AOhaWoVuTExptKTcgB78xmLm9Yrja0GCIDn0/m+cRjSA+tlmhXDsj5S5HHs9PLHgx+BLPZ8XKIv/UKnoqqvxw==
X-Gm-Message-State: AOJu0YxLVvCichqJor2JtrczcDOVZG32Z8oJgrJOJAsnBqFxXBrjxWfp
	/LO7D7f5n91kBMAEsVQM8dpQqEqIQa+c3syvCv3bALSjg3aJP4rlUBdXgyW8ni8=
X-Google-Smtp-Source: AGHT+IF8KtMuBT/lx87J71F/lRrgIXThKYLKm0Q9zh/TR0QeaI4sQXL1DHSiINUT/9ZA+lMCzDpL5Q==
X-Received: by 2002:a17:907:1b26:b0:a7a:af5d:f312 with SMTP id a640c23a62f3a-a7d4011442emr913154866b.46.1722413475678;
        Wed, 31 Jul 2024 01:11:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad414e2sm738525466b.127.2024.07.31.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:11:15 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:11:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 58/84] KVM: RISC-V: Use kvm_faultin_pfn() when
 mapping pfns into the guest
Message-ID: <20240731-a5f8928d385945f049e5f96e@orel>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-59-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-59-seanjc@google.com>

On Fri, Jul 26, 2024 at 04:52:07PM GMT, Sean Christopherson wrote:
> Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
> are new APIs to consolidate arch code and provide consistent behavior
> across all KVM architectures.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/riscv/kvm/mmu.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 806f68e70642..f73d6a79a78c 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  	bool logging = (memslot->dirty_bitmap &&
>  			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
>  	unsigned long vma_pagesize, mmu_seq;
> +	struct page *page;
>  
>  	/* We need minimum second+third level pages */
>  	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> @@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  
>  	/*
>  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
> -	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
> +	 * vma_lookup() or __kvm_faultin_pfn() become stale priort to acquiring
                                                            ^ while here
						could fix this typo

>  	 * kvm->mmu_lock.
>  	 *
>  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
> @@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
> +	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>  				vma_pageshift, current);
> @@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		kvm_err("Failed to map in G-stage\n");
>  
>  out_unlock:
> -	if ((!ret || ret == -EEXIST) && writable)
> -		kvm_set_pfn_dirty(hfn);
> -	else
> -		kvm_release_pfn_clean(hfn);
> -
> +	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
>  	spin_unlock(&kvm->mmu_lock);
>  	return ret;
>  }
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

