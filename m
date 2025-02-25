Return-Path: <linux-mips+bounces-7950-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C96A443D7
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 16:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D588E188A76B
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 15:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A21A26A0C7;
	Tue, 25 Feb 2025 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xBeN/Yg6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768972686B1
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740495899; cv=none; b=hZS1WWMGMvLhHzV0nhes4GWX7yk9rK5dTP0aX27za6mTEiu7yKk5ISyIvyhonK/SagysuujiA4DOXaEmVdFKblZXo59QTrviDh3KKlDldI521y/iEfRExSIT9b/QfZvjuadx/uZkT5nxIeLH1/gEfgUXK6QtG7wdqTbrduAKXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740495899; c=relaxed/simple;
	bh=vHxREudX9bj9dETQmre2TyJ+AerbIUB9johHAra0OcY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ghCD4geiREQ2ig04SmmMLrfTUUt8adc4F29h+QMAAq9m7O9l9j6ZIHLLysqbHIFLIQxG7njHswnuKE8eA0EVz/2V+SSM40iLBw+Ozcr4YhwIXZkEpV7d/1PygzLVgdd1tc/6e4zlF0IIsaTnKjiKmncwYrm3FFnlLPmbzN1oIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xBeN/Yg6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc0bc05afdso12553543a91.0
        for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740495897; x=1741100697; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=;
        b=xBeN/Yg6seyw2+zB6ZEiNjX9hpxkH/QBdcXGsrWIN7M0zfX1n3KZREQovfsb5sHBCB
         BBCj3RS0xtpAB/TaL5zpddubnYGjgCckKobWK9b5wsQqk+Iv4kahgb8m3rMVNe8dlrh7
         T78QtLJX/3Fq5wuzdvbQTR9QbEl431bQ/VPsg/4CePOy4EqfaES+j/3GWIdNyQLPrPdk
         k33GeSW1YbQTMa63TCG6yMVykOG0s3BymxU1V8p58hnBKHxjP2CgDT+FgM9T1DJ92UrO
         zYl7qOszMIfcpHt+f3UcZxQFRf7GXVQAqLJzLmTuwNF1hxdnT6YdSmFoE+o2IbCTo6M7
         Gxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495897; x=1741100697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SksBvCkZJsvM7Rmqh0mGEf+0QRJJwMrgdQAdOhKbL9I=;
        b=hL7BvBzD/mCLp6MEyznwVPRdlRNRmxAElvryex9jS9eigTYivqrmyXIbzSaVg/J/e5
         +EukIr/tST/215GbXXeBd7gMef0bhepstQoXqa8etY22DM9IKcGavGICdqvRQI/EQAxh
         COF/mdEl2/tvANlaygGE7re9ZjJNKR08syd12Ijy0UXRNKSKIsoUmwEwqgDIgB8fPav/
         JzzYdKn943iTHULAf9Zi7cOvIsOshdmeP8eUBfEf5oEflbdjPFSzXI+d6sXUl81dzPxf
         8mL04aN7gb6hbk5RML+ZkASkHZumyXTseJwtaznmguhYczBZsduriswMoLop1YN7CNBF
         F84g==
X-Forwarded-Encrypted: i=1; AJvYcCUeIG0rEoGTSujZ5F3Hbp86fKT+xfgEcL+iL/NjfmUFd4m49C/VFAC9/kX+iBTiJ+ddKG+vhsWIlRK3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq5ksZqFsm3zyFUYNR7a1DCjzVfDk6v7S5Xci4vQXbgQqbdNZO
	Ybss4ayOlk5QRuPPHObGdJuvF58/xv7Zab2AAB12jVpQcuLxkAOnl+u0TmpCQJtepAGhdFrLywx
	04w==
X-Google-Smtp-Source: AGHT+IGZHL7uZNM7BfQEbB7Kx7BtB5DxGYYXBfSiN251AAOj3wJWNSwzk9hwQvuFf2tqN0hxCASkCwncVrs=
X-Received: from pgmm27.prod.google.com ([2002:a05:6a02:551b:b0:ad5:4c6b:ab72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9d8f:b0:1f0:e430:43f8
 with SMTP id adf61e73a8af0-1f0fbff6f36mr6428815637.1.1740495896725; Tue, 25
 Feb 2025 07:04:56 -0800 (PST)
Date: Tue, 25 Feb 2025 07:04:55 -0800
In-Reply-To: <Z71072F7FMz5aq/Q@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <Z71072F7FMz5aq/Q@yzhao56-desk.sh.intel.com>
Message-ID: <Z73cF_pWIFMreOf5@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
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
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 58b82d6fd77c..045c61cc7e54 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12890,11 +12890,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
> >  		mutex_unlock(&kvm->slots_lock);
> >  	}
> >  	kvm_unload_vcpu_mmus(kvm);
> > +	kvm_destroy_vcpus(kvm);
> >  	kvm_x86_call(vm_destroy)(kvm);
> >  	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
> >  	kvm_pic_destroy(kvm);
> >  	kvm_ioapic_destroy(kvm);
> > -	kvm_destroy_vcpus(kvm);
> >  	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
> >  	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
> >  	kvm_mmu_uninit_vm(kvm);
> After this change, now the sequence is that
> 
> 1. kvm_arch_pre_destroy_vm()
> 2. kvm_arch_destroy_vm()
>    2.1 kvm_destroy_vcpus()
>    2.2 .vm_destroy hook
>    2.3 kvm_mmu_uninit_vm() --> mirror root ref is 1 upon here. Zap the mirror
>                                root and reclaim SETP page table pages.
>    2.4 .vm_free hook
> 
> Since TDX needs to reclaim the TDR page after reclaiming all other pages, we
> currently added a vm_free hook at 2.4, after 2.3.
> 
> Could we move kvm_mmu_uninit_vm() before the .vm_destroy hook and after
> kvm_destroy_vcpus()?
> 
> Or move the .vm_destroy hook after kvm_mmu_uninit_vm(), e.g. after
> kvm_page_track_cleanup()?

I would go for the first option.  I'll tack on a patch since I need to test all
of these flows anyways, and I would much prefer to change course sooner rather
than later if it doesn't work for whatever reason.

Is this comment accurate?

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1e5f6f820c0b..f5685f153e08 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12874,13 +12874,19 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
                mutex_unlock(&kvm->slots_lock);
        }
        kvm_destroy_vcpus(kvm);
+
+       /*
+        * Do final MMU teardown prior to calling into vendor code.  All pages
+        * that were donated to the TDX module, e.g. for S-EPT tables, need to
+        * be reclaimed before the VM metadata page can be freed.
+        */
+       kvm_mmu_uninit_vm(kvm);
        kvm_x86_call(vm_destroy)(kvm);
        kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
        kvm_pic_destroy(kvm);
        kvm_ioapic_destroy(kvm);
        kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
        kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
-       kvm_mmu_uninit_vm(kvm);
        kvm_page_track_cleanup(kvm);
        kvm_xen_destroy_vm(kvm);
        kvm_hv_destroy_vm(kvm);

