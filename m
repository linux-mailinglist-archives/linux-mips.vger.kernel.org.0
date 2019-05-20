Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E624223885
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2019 15:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389581AbfETNnr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 May 2019 09:43:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34900 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388208AbfETNnr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 May 2019 09:43:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id m3so1711021wrv.2
        for <linux-mips@vger.kernel.org>; Mon, 20 May 2019 06:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QfhVu7i0f7PGhiAFSRgiVL/qFyH0Mxci0ZH8NmzFfa0=;
        b=KWweO5ssQpn3leeeZLhCmcJfKhbxOh/xUbF/A4ytW1a5GZjDf4uWUSwAtTPg6rjDtj
         7ZxxQfug608rrLJcJ0uXFroT2lRasKr765kX50mV/i028KP5wRNd3993wWEWV6+tLBW8
         EMzwr5xhxO24CW71zxInF57w0bCcx4bfj0q/QzVXYfuKrj98katTI3D0jwZlIWHYlzsK
         qkGcbzTmjlQ7CLBCn6BfDPPJjF5Mn5FCevb8jvCmi5cu8t/LMPolWhfZQr0vAvG2JALA
         jE6La2xr+Li6aWjLWEdeBJ/Uh/ckKpSVSqyFe2E3Dhs+lo45H63ixB6K29VSWrP3p1FR
         rfvQ==
X-Gm-Message-State: APjAAAVfhpcTfnF6LPCp/4wH6ke1VSJmoHjT/XN/aasl88ihjhbxGBmX
        ytQ35xAyYh4ppten6+W2KyVSOA==
X-Google-Smtp-Source: APXvYqwhMW4qTcPvNNhvZyg7Nr2Dre/Plb85jfTr32mjs9jJbdCtxJLLOLvDyzXXb3guDMS7YvWryA==
X-Received: by 2002:a5d:688f:: with SMTP id h15mr7859695wru.44.1558359825304;
        Mon, 20 May 2019 06:43:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac04:eef9:b257:b844? ([2001:b07:6468:f312:ac04:eef9:b257:b844])
        by smtp.gmail.com with ESMTPSA id x22sm16824884wmi.4.2019.05.20.06.43.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 06:43:44 -0700 (PDT)
Subject: Re: [PATCH] KVM: Directly return result from
 kvm_arch_check_processor_compat()
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Joerg Roedel <joro@8bytes.org>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry@arm.com>,
        Suzuki K Pouloze <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linux-s390@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu
References: <20190420051817.5644-1-sean.j.christopherson@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <050c13ef-6797-bff9-58a9-674f6fee9d72@redhat.com>
Date:   Mon, 20 May 2019 15:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190420051817.5644-1-sean.j.christopherson@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/04/19 07:18, Sean Christopherson wrote:
> Add a wrapper to invoke kvm_arch_check_processor_compat() so that the
> boilerplate ugliness of checking virtualization support on all CPUs is
> hidden from the arch specific code.  x86's implementation in particular
> is quite heinous, as it unnecessarily propagates the out-param pattern
> into kvm_x86_ops.
> 
> While the x86 specific issue could be resolved solely by changing
> kvm_x86_ops, make the change for all architectures as returning a value
> directly is prettier and technically more robust, e.g. s390 doesn't set
> the out param, which could lead to subtle breakage in the (highly
> unlikely) scenario where the out-param was not pre-initialized by the
> caller.
> 
> Opportunistically annotate svm_check_processor_compat() with __init.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
> 
> Tested on VMX only.
> 
>  arch/mips/kvm/mips.c             | 4 ++--
>  arch/powerpc/kvm/powerpc.c       | 4 ++--
>  arch/s390/include/asm/kvm_host.h | 1 -
>  arch/s390/kvm/kvm-s390.c         | 5 +++++
>  arch/x86/include/asm/kvm_host.h  | 2 +-
>  arch/x86/kvm/svm.c               | 4 ++--
>  arch/x86/kvm/vmx/vmx.c           | 8 ++++----
>  arch/x86/kvm/x86.c               | 4 ++--
>  include/linux/kvm_host.h         | 2 +-
>  virt/kvm/arm/arm.c               | 4 ++--
>  virt/kvm/kvm_main.c              | 9 ++++++---
>  11 files changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 6d0517ac18e5..1c22b938c550 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -123,9 +123,9 @@ int kvm_arch_hardware_setup(void)
>  	return 0;
>  }
>  
> -void kvm_arch_check_processor_compat(void *rtn)
> +int kvm_arch_check_processor_compat(void)
>  {
> -	*(int *)rtn = 0;
> +	return 0;
>  }
>  
>  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 92910b7c5bcc..7b7635201739 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -425,9 +425,9 @@ int kvm_arch_hardware_setup(void)
>  	return 0;
>  }
>  
> -void kvm_arch_check_processor_compat(void *rtn)
> +int kvm_arch_check_processor_compat(void)
>  {
> -	*(int *)rtn = kvmppc_core_check_processor_compat();
> +	return kvmppc_core_check_processor_compat();
>  }
>  
>  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index c47e22bba87f..96a1603ecf10 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -903,7 +903,6 @@ extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
>  extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
>  
>  static inline void kvm_arch_hardware_disable(void) {}
> -static inline void kvm_arch_check_processor_compat(void *rtn) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_vcpu_uninit(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 28f35d2b06cb..4c50bd533ebc 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -221,6 +221,11 @@ int kvm_arch_hardware_enable(void)
>  	return 0;
>  }
>  
> +int kvm_arch_check_processor_compat(void)
> +{
> +	return 0;
> +}
> +
>  static void kvm_gmap_notifier(struct gmap *gmap, unsigned long start,
>  			      unsigned long end);
>  
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 8d68ba0cba0c..02ba99ef8c5f 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -995,7 +995,7 @@ struct kvm_x86_ops {
>  	int (*disabled_by_bios)(void);             /* __init */
>  	int (*hardware_enable)(void);
>  	void (*hardware_disable)(void);
> -	void (*check_processor_compatibility)(void *rtn);
> +	int (*check_processor_compatibility)(void);/* __init */
>  	int (*hardware_setup)(void);               /* __init */
>  	void (*hardware_unsetup)(void);            /* __exit */
>  	bool (*cpu_has_accelerated_tpr)(void);
> diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
> index 406b558abfef..236e2fc0edec 100644
> --- a/arch/x86/kvm/svm.c
> +++ b/arch/x86/kvm/svm.c
> @@ -5859,9 +5859,9 @@ svm_patch_hypercall(struct kvm_vcpu *vcpu, unsigned char *hypercall)
>  	hypercall[2] = 0xd9;
>  }
>  
> -static void svm_check_processor_compat(void *rtn)
> +static int __init svm_check_processor_compat(void)
>  {
> -	*(int *)rtn = 0;
> +	return 0;
>  }
>  
>  static bool svm_cpu_has_accelerated_tpr(void)
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index d8f101b58ab8..7d0733b8f383 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6720,22 +6720,22 @@ static int vmx_vm_init(struct kvm *kvm)
>  	return 0;
>  }
>  
> -static void __init vmx_check_processor_compat(void *rtn)
> +static int __init vmx_check_processor_compat(void)
>  {
>  	struct vmcs_config vmcs_conf;
>  	struct vmx_capability vmx_cap;
>  
> -	*(int *)rtn = 0;
>  	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
> -		*(int *)rtn = -EIO;
> +		return -EIO;
>  	if (nested)
>  		nested_vmx_setup_ctls_msrs(&vmcs_conf.nested, vmx_cap.ept,
>  					   enable_apicv);
>  	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
>  		printk(KERN_ERR "kvm: CPU %d feature inconsistency!\n",
>  				smp_processor_id());
> -		*(int *)rtn = -EIO;
> +		return -EIO;
>  	}
> +	return 0;
>  }
>  
>  static u64 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index c09507057743..6214c27b0c2a 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9042,9 +9042,9 @@ void kvm_arch_hardware_unsetup(void)
>  	kvm_x86_ops->hardware_unsetup();
>  }
>  
> -void kvm_arch_check_processor_compat(void *rtn)
> +int kvm_arch_check_processor_compat(void)
>  {
> -	kvm_x86_ops->check_processor_compatibility(rtn);
> +	return kvm_x86_ops->check_processor_compatibility();
>  }
>  
>  bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 640a03642766..0ddef348b9b0 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -842,7 +842,7 @@ int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
>  int kvm_arch_hardware_setup(void);
>  void kvm_arch_hardware_unsetup(void);
> -void kvm_arch_check_processor_compat(void *rtn);
> +int kvm_arch_check_processor_compat(void);
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
>  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index be4ec5f3ba5f..67ecadbd8961 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -105,9 +105,9 @@ int kvm_arch_hardware_setup(void)
>  	return 0;
>  }
>  
> -void kvm_arch_check_processor_compat(void *rtn)
> +int kvm_arch_check_processor_compat(void)
>  {
> -	*(int *)rtn = 0;
> +	return 0;
>  }
>  
>  
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4bb20f2b2a69..41effae3f9ec 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4135,6 +4135,11 @@ static void kvm_sched_out(struct preempt_notifier *pn,
>  	kvm_arch_vcpu_put(vcpu);
>  }
>  
> +static void check_processor_compat(void *rtn)
> +{
> +	*(int *)rtn = kvm_arch_check_processor_compat();
> +}
> +
>  int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  		  struct module *module)
>  {
> @@ -4166,9 +4171,7 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  		goto out_free_0a;
>  
>  	for_each_online_cpu(cpu) {
> -		smp_call_function_single(cpu,
> -				kvm_arch_check_processor_compat,
> -				&r, 1);
> +		smp_call_function_single(cpu, check_processor_compat, &r, 1);
>  		if (r < 0)
>  			goto out_free_1;
>  	}
> 

Queued for 5.3, thanks.

Paolo
