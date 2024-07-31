Return-Path: <linux-mips+bounces-4601-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364B9428E7
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2024 10:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCE581F22152
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2024 08:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF751A7F64;
	Wed, 31 Jul 2024 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ljmJzg/4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757891A7F7F
	for <linux-mips@vger.kernel.org>; Wed, 31 Jul 2024 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413499; cv=none; b=eG0qyI26iaZfm7SPEeJkA/xgYM4IkSE5RhrU2YaW8XY3qrTaAxnLmzT4jVhIgN+Ab5dgx8qG9fp6g1yPolI3DUocQGZqYk6i9N1Rn6kG3LxX8xws4o8dyUKQvZLD9nOW3ifN+5DjvjzuO1Zwh2k2zdDbdFSKA89/4KDPqAwz//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413499; c=relaxed/simple;
	bh=7y80z9vltmygihtb/PjFOov0Ly9Wsms87Ew+RYBWeW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd8x5tD9yMSxHRdQoDo3ScR5ZJ0DcWmYB3juNfQWqbG+SYHRaF/WeoPv6IM0TnVp/RvE7A3QMWYGe7qMX1HBahuaxxFgkYqTzd6R1m+A/Jp4gmH/Tlg4P3lVXCmwKhjSdFVxQjP7jF63MZ99mw/20xnk6MIrD1Ky9OH7IhG0fac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ljmJzg/4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a79df5af51so1260320a12.0
        for <linux-mips@vger.kernel.org>; Wed, 31 Jul 2024 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722413496; x=1723018296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1i19l7d1eZbhVp7fQ4bZoRAfF6lLDsSZcH8bPmRvWiA=;
        b=ljmJzg/4owDxVh+e/Y5IplkrJqQFXrUt/UsdVFppTAHmeSuaRCs6gFJPwsUhOetk5U
         8Qi8gPqctr+dySdVxfx6WSuXd2FWZOEtU/ccypiqT/9rqLCetZzVZTeJOsSChpqURl99
         IoCakMeFMBRwcq+cVcKGmaxRlda3Rwf4zjflscBFPbezlSL1800T7SlnIV9qbhbdkIvJ
         jA/LaNY2UcABUqzCoQrXr8SXJ4xXKmHNN2687lMSz1IuDopF6H5tOxiwp67eYGyLgZzj
         8U5mURCuz8NXDdj95Pe2LS3EjEwZ30WQ4X108WbcBet/VrKo7qufR1UFCEt09DROLTHH
         rXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413496; x=1723018296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1i19l7d1eZbhVp7fQ4bZoRAfF6lLDsSZcH8bPmRvWiA=;
        b=LwAO2biQhpkJtYvkueySwMIpPzHALGz7OzVGnA/IaeAYtiBg/+JfURw3GSkzpsBuTi
         cyzfn6mpNXjjMNVxFWSuLp81KugbqFjERa6R/np1Zp6SRlHezvhIBIz+E3wT5RRxmulF
         W8sGrd+cJwNF/YFjzbEsW5/nrKtLRX2PVHLRtaWsru7wycF1gSMqiXTuEwpEx6qgUh2n
         9j18qU8m8oISDmEGa8OEz0aVF422pBQDqx90RK57cMTFQQBuSJMBiuF4HpLuJoNGsmFB
         EZ5bw+pMWf59cPOHCWpwshkn9z0Ma0YlOtiAYLkT0zvgL9MBH5s2DQiIxYB1HIyatybq
         EQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWganlS7Wx7dez6cLY0bkZ802/BsriWu0GIXHK3D7DP8Jng4gE19qIDxTSPTTW/QC4R3/sfEceHv3zZcnG4NY+SKctI8iRU14XfhA==
X-Gm-Message-State: AOJu0YzCwaACjRfUC893Iy1tWe3DvFO7wYxk+QVSObQwXm3DuyAslaeC
	cVxBfdRLqX0ACwZPsncSjc6Kl9mPC9ICxFnx6oRssJzzkADfJf14MYapThDe+D4=
X-Google-Smtp-Source: AGHT+IEAM3rgFV5Nss1oeOJc4d0T/p6GjpLY5HpQ/UfV3bepvtCwNBml7jly3uQHrfiUKxZe0LrJkQ==
X-Received: by 2002:a17:907:60cb:b0:a7d:88c4:2897 with SMTP id a640c23a62f3a-a7d88c437b8mr269366466b.2.1722413495475;
        Wed, 31 Jul 2024 01:11:35 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb8361sm734690366b.207.2024.07.31.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:11:35 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:11:34 +0200
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
Subject: Re: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff
 a stage-2 PTE is installed
Message-ID: <20240731-0456655970f6ae99f907de43@orel>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-57-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-57-seanjc@google.com>

On Fri, Jul 26, 2024 at 04:52:05PM GMT, Sean Christopherson wrote:
> Don't mark pages dirty if KVM bails from the page fault handler without
> installing a stage-2 mapping, i.e. if the page is guaranteed to not be
> written by the guest.
> 
> In addition to being a (very) minor fix, this paves the way for converting
> RISC-V to use kvm_release_faultin_page().
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/riscv/kvm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index b63650f9b966..06aa5a0d056d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		goto out_unlock;
>  
>  	if (writable) {
> -		kvm_set_pfn_dirty(hfn);
>  		mark_page_dirty(kvm, gfn);
>  		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
>  				      vma_pagesize, false, true);
> @@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		kvm_err("Failed to map in G-stage\n");
>  
>  out_unlock:
> +	if ((!ret || ret == -EEXIST) && writable)
> +		kvm_set_pfn_dirty(hfn);
> +
>  	spin_unlock(&kvm->mmu_lock);
>  	kvm_set_pfn_accessed(hfn);
>  	kvm_release_pfn_clean(hfn);
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


