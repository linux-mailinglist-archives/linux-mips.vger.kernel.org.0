Return-Path: <linux-mips+bounces-7662-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F1A2520E
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2025 06:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAEDA1622BB
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2025 05:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA6126BF9;
	Mon,  3 Feb 2025 05:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fGufbaGE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671278F49
	for <linux-mips@vger.kernel.org>; Mon,  3 Feb 2025 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738561409; cv=none; b=P3tZtINtIcmGNtaSOykas8rc7r9+zVrCVwNJ333IEQoCOCkjtZPy0Y2HZVLC+CXkZVz86p2b+YY8JHiX3SPv1soiauWzrn/OTqhLLzyLJaho7aHIB1VUEZETFADV7g6V8lVCcE84+UhyggaofM5pYt6gtEQEuSYJP32BCiknZTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738561409; c=relaxed/simple;
	bh=NmcLSvXof+RXtFnk6pi3gTBVMg9ZHRhnQX1L7fgcdGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IllizkXijTFxL6iS1VaErwS8luXL5hPgUXYbBvD8ZO9n2Wh68NWv8IdBSag4tR6H3W329rfK5aLdzA8OzH2jyfstQ8fOscWlilGIQBirhgeQNFTsxD5VFnssXmtS6OMmTxGn8XXZmosmyeG785WUMJZlfXBiPWifQSrRpTbQvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=fGufbaGE; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d0062fb20bso34242795ab.2
        for <linux-mips@vger.kernel.org>; Sun, 02 Feb 2025 21:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738561406; x=1739166206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=fGufbaGEkoB9wwhUDmv3ORJMmPRU9GJLjkZ3LhKzikdukXvOUWdnAQTniO5qzy6GgC
         1k+nBfKB19dksMpiMncup4YsZ5myb4LvEML3vQpXaUkFdUPoVJwDc2R7wE91FvLH4AWM
         wrlX8vdzUFeIEahw8kf9WSF3QuxRnIPVMrPuCU35Y/TE/dEAvPR7Alom24s5xzI7NWOE
         QXVjrPcshHgnorH3Dpa3qp5wlcgqfQTQyvOD8jAcILdyGFGNQ25aZb1cN9YwmnYvfuuO
         fjtI2h1dhace8kRmgUdaHPESqosIF2kNfRIGdelSbWt/GbGiPAyfhtB+X2wsofImGM/9
         Cklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561406; x=1739166206;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=W2+ADGnNL+xmVqH5k6JvP4QvJY1GcWluwTjexElLTtGE9CKOoeTHJS5y8RC57U9EYX
         zA8GSU+/ie48DtUXvVF0W1y4JOUn4BeZGPvHueIeiEpEFM1JBCzrSSVfd+95n/KboVhx
         AhnDYxnMUXUZ29hwxWs6MPhRO88/aCtd1CSqYb2L1fiyXFSXLBKwKHlOsk273IihcUQS
         8uf3kwtAHuhrUuYTrlCp5Db86htC4bbea/dwEtwFes7TI2pWV8S6iKZCTzCG6bMzdKnX
         rAEnALr/tiRFjkgC/ZqOpb8cFWOXEtroImbWdthkIhKdsMPNNyrVY4fbojtAiPrWEQEd
         UQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCXaJbQjLcCnQ8Q90zEDUTQVX4iVhbVkGKvwDeT/TO5bflcUlaWqfuYB4zp/r90ltVr3waC4cT18cxgD@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJ5sdUbVN9k3CAgplvH78QrlteZfjGqLNda4dJEGh3nDlw5Hm
	c7wOZASBULPCcULgBWqUn4oQBlZpZG44kjsK77QH0cJPjyMycenv2CN506cBhtI=
X-Gm-Gg: ASbGncs04dhYwoa1t/vG4zXDFVT0wyzWm0lgHaTGLuKuGS0qSRgil6V7rJbEnRb0Zrp
	xX7lnKBa8K5FJisCrvjx7m3gaBaGP3SB5rd+mvASgNyZx062BZHFgQNJq93Xei+NStO9GhdbHJt
	Y6w1ietps5Gip+QSfZaTCyJVp/hcSJTl2Vfc3n3ad45qo+hP/JzXftSbgz2ft6xb09c1D+j4pJf
	WliY9Kvryw+scsiHDpUuiNTX4SVj9PGv6E3R9XCZhF0GHvevdaV3RNtAx5gP3hJqU+3U8YUcL1t
	os3vk+3bWW6VCCSC/L5+/vQy/4kMDI0TAOAheas=
X-Google-Smtp-Source: AGHT+IHl4RRDfRdJ9K6Cx6v8dXThe6D880Ogx8BJ2U75l88ormi4P0wAtnHOCwaBHFLWcb6LIw7+7w==
X-Received: by 2002:a05:6e02:1fc2:b0:3ce:78ab:dcd1 with SMTP id e9e14a558f8ab-3cffe4a7bf1mr175908815ab.19.1738561406189;
        Sun, 02 Feb 2025 21:43:26 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d018c28ea5sm15310115ab.35.2025.02.02.21.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 21:43:25 -0800 (PST)
Message-ID: <44468c97-06e6-4bfe-930d-444ab7ead90d@sifive.com>
Date: Sun, 2 Feb 2025 23:43:22 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: kvm: drop 32-bit host support
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, "A. Wilcox" <AWilcox@Wilcox-Tech.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-3-arnd@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241221214223.3046298-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 2024-12-21 3:42 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> KVM support on RISC-V includes both 32-bit and 64-bit host mode, but in
> practice, all RISC-V SoCs that may use this are 64-bit:
> 
> As of linux-6.13, there is no mainline Linux support for any specific
> 32-bit SoC in arch/riscv/, although the generic qemu model should work.
> 
> The available RV32 CPU implementations are mostly built for
> microcontroller applications and are lacking a memory management
> unit. There are a few CPU cores with an MMU, but those still lack the
> hypervisor extensions needed for running KVM.
> 
> This is unlikely to change in the future, so remove the 32-bit host
> code and simplify the test matrix.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/kvm/Kconfig            |   2 +-
>  arch/riscv/kvm/aia.c              | 105 ------------------------------
>  arch/riscv/kvm/aia_imsic.c        |  34 ----------
>  arch/riscv/kvm/mmu.c              |   8 ---
>  arch/riscv/kvm/vcpu_exit.c        |   4 --
>  arch/riscv/kvm/vcpu_insn.c        |  12 ----
>  arch/riscv/kvm/vcpu_sbi_pmu.c     |   8 ---
>  arch/riscv/kvm/vcpu_sbi_replace.c |   4 --
>  arch/riscv/kvm/vcpu_sbi_v01.c     |   4 --
>  arch/riscv/kvm/vcpu_timer.c       |  20 ------
>  10 files changed, 1 insertion(+), 200 deletions(-)
> 
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 0c3cbb0915ff..7405722e4433 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on RISCV_SBI && MMU && 64BIT
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index 19afd1f23537..a399a5a9af0e 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -66,33 +66,6 @@ static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
>  	return hvictl;
>  }
>  
> -#ifdef CONFIG_32BIT
> -void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -	unsigned long mask, val;
> -
> -	if (!kvm_riscv_aia_available())
> -		return;
> -
> -	if (READ_ONCE(vcpu->arch.irqs_pending_mask[1])) {
> -		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[1], 0);
> -		val = READ_ONCE(vcpu->arch.irqs_pending[1]) & mask;
> -
> -		csr->hviph &= ~mask;
> -		csr->hviph |= val;
> -	}
> -}
> -
> -void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -
> -	if (kvm_riscv_aia_available())
> -		csr->vsieh = ncsr_read(CSR_VSIEH);
> -}
> -#endif
> -
>  bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  {
>  	int hgei;
> @@ -101,12 +74,6 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  	if (!kvm_riscv_aia_available())
>  		return false;
>  
> -#ifdef CONFIG_32BIT
> -	if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
> -	    (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask)))
> -		return true;
> -#endif
> -
>  	seip = vcpu->arch.guest_csr.vsie;
>  	seip &= (unsigned long)mask;
>  	seip &= BIT(IRQ_S_EXT);
> @@ -128,9 +95,6 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
>  	if (!kvm_riscv_aia_available())
>  		return;
>  
> -#ifdef CONFIG_32BIT
> -	ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
> -#endif
>  	ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
>  }
>  
> @@ -147,22 +111,10 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
>  		nacl_csr_write(nsh, CSR_VSISELECT, csr->vsiselect);
>  		nacl_csr_write(nsh, CSR_HVIPRIO1, csr->hviprio1);
>  		nacl_csr_write(nsh, CSR_HVIPRIO2, csr->hviprio2);
> -#ifdef CONFIG_32BIT
> -		nacl_csr_write(nsh, CSR_VSIEH, csr->vsieh);
> -		nacl_csr_write(nsh, CSR_HVIPH, csr->hviph);
> -		nacl_csr_write(nsh, CSR_HVIPRIO1H, csr->hviprio1h);
> -		nacl_csr_write(nsh, CSR_HVIPRIO2H, csr->hviprio2h);
> -#endif

One minor cleanup: since this patch removes all accesses to these 32-bit-only
high-half CSRs, the corresponding members should also be removed from struct
kvm_vcpu_aia_csr in asm/kvm_aia.h.

Regards,
Samuel


