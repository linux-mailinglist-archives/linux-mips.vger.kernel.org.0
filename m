Return-Path: <linux-mips+bounces-4727-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BE09485E6
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 01:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BACD1F234CE
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2024 23:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B870716F27E;
	Mon,  5 Aug 2024 23:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nsqM4WvI"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53116CD0E
	for <linux-mips@vger.kernel.org>; Mon,  5 Aug 2024 23:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722900370; cv=none; b=IkqtVLhl0Aqvzgnh03EiLGUCjiz+OFZ/e3iXXis0M8TXpzp2yRs3cUnFn7BD8T8tRzMIGvdBJsWc3HZAFDgCDcfPDb4kbeSniwJM445hAXM/v7eXatNSTMm4iXaO3JCmU5oaGOHbTggilbDBvWzHs2+2krQ0E1E6aEa+vrXKjqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722900370; c=relaxed/simple;
	bh=NZCRFKbIN8PF8TtGzo0TuabedSFqMXcg0tKfwiHnKPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4iM6GmWurcOkJVNV3mtPMTkHUl7A9uthab4Hu/OJWed7bPO2VyLuAkPPpI9WoQ/WBiWgsC5JNRtAkJxypoDFfo/51CK7Axp5Ay0tspKvbrN0UofOwdBw8wafdL/WxwdsQkxHJpCiMxTEo1O8RgTQYeBIoz3+rQlNPJqy52EBDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nsqM4WvI; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 5 Aug 2024 23:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722900362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mfeo2RqmDWupNPy1ZQ9DQzaW41XBFzcKm+dZAjG39w=;
	b=nsqM4WvIeqvYHal0R7bad4sl2RiCqdaEThtnF1PVGpbpIk6TP7/CSQ1lcdBlex5IzcKPCb
	7g4CjFX6c6eUuhlGombjt0+/nOmNqPRG0qjhofrleHk8DYNXPAn7Q/OhxjYef93ialM8P+
	YvQTTQKWBorXAs+vuLMxHvrpEon2vKo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
Message-ID: <ZrFfgzRbiqT-Zi2O@linux.dev>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-55-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-55-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT

[+cc Fuad]

Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
the page as dirty out of the critical section") that restructuring
around the MMU lock was helpful for reuse (presumably for pKVM), but I
lack the context there.

On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> page/folio dirty after it has been written back can make some filesystems
> unhappy (backing KVM guests will such filesystem files is uncommon, and

typo: s/will/with/

> the race is minuscule, hence the lack of complaints).  See the link below
> for details.
> 
> This will also allow converting arm64 to kvm_release_faultin_page(), which
> requires that mmu_lock be held (for the aforementioned reason).
> 
> Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/mmu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 22ee37360c4e..ce13c3d884d5 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	}
>  
>  out_unlock:
> +	if (writable && !ret)
> +		kvm_set_pfn_dirty(pfn);

I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
a reference.

> +	else
> +		kvm_release_pfn_clean(pfn);
> +
>  	read_unlock(&kvm->mmu_lock);
>  
>  	/* Mark the page dirty only if the fault is handled successfully */
> -	if (writable && !ret) {
> -		kvm_set_pfn_dirty(pfn);
> +	if (writable && !ret)
>  		mark_page_dirty_in_slot(kvm, memslot, gfn);
> -	}
>  
> -	kvm_release_pfn_clean(pfn);
>  	return ret != -EAGAIN ? ret : 0;
>  }
>  
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 

-- 
Thanks,
Oliver

