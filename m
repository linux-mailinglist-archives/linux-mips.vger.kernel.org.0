Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE25421B016
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 09:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgGJHXk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jul 2020 03:23:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21243 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726773AbgGJHXj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jul 2020 03:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594365817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9rlNnRbRqtwxX9xwOw7BiMZzCXRPe3JkOPdkKEm94pM=;
        b=O+jWM1QM66E2kPLncznS5d+YYxuDQ7TtkrAwngHQvmb3R9pqpA6FkDQa33cj4WtskKWRdU
        bkbIisz1mUKiBVJV+euDZ3hQiy994ZE07hPoOsgb3NdTf4HC72JWKWkOqw3wgMNnASmNvz
        FUYMEy19yZjG1I/HPVtzgi9K+79vPIg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-AnFILPQNN9-gKws7SPmgYA-1; Fri, 10 Jul 2020 03:23:36 -0400
X-MC-Unique: AnFILPQNN9-gKws7SPmgYA-1
Received: by mail-wm1-f72.google.com with SMTP id g187so5615975wme.0
        for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2020 00:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9rlNnRbRqtwxX9xwOw7BiMZzCXRPe3JkOPdkKEm94pM=;
        b=rmYxx3EGZsDiinL1xS823KsLfYFcVk+H1PiSvmwYPgx/amVOEgpJu2MFARkKyNa7pZ
         j0kyQdmerNyeBQe0Zfb5uIfKrrhYOxSzH338dml0WuhkdvjJFrBv17g/PNL3G0y/cCTV
         URwZENagMM3Sxev3p+Lmv5aSbpviepo9fiUlOY5uNeR1JGl8PPNrNY2T4RjXoNYpW/Ds
         1FhKce3ZLE9fT/EeWpRek+4yvKfvYQBeionf7lDHgX2N2M+u6NTthjwnWrnQOMInlLzW
         zPKqHYFH1+k6Hpe6arZlQas0QZQQZ3n5BlUy0a1lkSaH/gHw2hlEU/To6pOKWlDtPc45
         PUlw==
X-Gm-Message-State: AOAM532qyPjlXVmqI/R8opoWiwq2UgVdfzcEFjxBNA8crMGNAdoSbufZ
        bmwnsF7wQ+CECFEcXxtcnbxMBiMQeejpjTBo0PniGe2+3U067eCoGgKZ7EX4WeUds8Q23M0b9F/
        QFW4a+/wDEt0V9kjJoUl37A==
X-Received: by 2002:a05:6000:1143:: with SMTP id d3mr54505537wrx.235.1594365810610;
        Fri, 10 Jul 2020 00:23:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5gKoesIIGwDsggi1LxHDAmw11dsdUiy6Tv9bIEijXeDfWJZHy6OtV2T4NmFlW7hWej+34Gw==
X-Received: by 2002:a05:6000:1143:: with SMTP id d3mr54505524wrx.235.1594365810390;
        Fri, 10 Jul 2020 00:23:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id b184sm8664696wmc.20.2020.07.10.00.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 00:23:29 -0700 (PDT)
Subject: Re: [PATCH] KVM: MIPS: Fix build errors for 32bit kernel
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1594365797-536-1-git-send-email-chenhc@lemote.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f7266f18-6f8d-0224-1675-c2a514cf0c5b@redhat.com>
Date:   Fri, 10 Jul 2020 09:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594365797-536-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/07/20 09:23, Huacai Chen wrote:
> Commit dc6d95b153e78ed70b1b2c04a ("KVM: MIPS: Add more MMIO load/store
> instructions emulation") introduced some 64bit load/store instructions
> emulation which are unavailable on 32bit platform, and it causes build
> errors:
> 
> arch/mips/kvm/emulate.c: In function 'kvm_mips_emulate_store':
> arch/mips/kvm/emulate.c:1734:6: error: right shift count >= width of type [-Werror]
>       ((vcpu->arch.gprs[rt] >> 56) & 0xff);
>       ^
> arch/mips/kvm/emulate.c:1738:6: error: right shift count >= width of type [-Werror]
>       ((vcpu->arch.gprs[rt] >> 48) & 0xffff);
>       ^
> arch/mips/kvm/emulate.c:1742:6: error: right shift count >= width of type [-Werror]
>       ((vcpu->arch.gprs[rt] >> 40) & 0xffffff);
>       ^
> arch/mips/kvm/emulate.c:1746:6: error: right shift count >= width of type [-Werror]
>       ((vcpu->arch.gprs[rt] >> 32) & 0xffffffff);
>       ^
> arch/mips/kvm/emulate.c:1796:6: error: left shift count >= width of type [-Werror]
>       (vcpu->arch.gprs[rt] << 32);
>       ^
> arch/mips/kvm/emulate.c:1800:6: error: left shift count >= width of type [-Werror]
>       (vcpu->arch.gprs[rt] << 40);
>       ^
> arch/mips/kvm/emulate.c:1804:6: error: left shift count >= width of type [-Werror]
>       (vcpu->arch.gprs[rt] << 48);
>       ^
> arch/mips/kvm/emulate.c:1808:6: error: left shift count >= width of type [-Werror]
>       (vcpu->arch.gprs[rt] << 56);
>       ^
> cc1: all warnings being treated as errors
> make[3]: *** [arch/mips/kvm/emulate.o] Error 1
> 
> So, use #if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ) to
> guard the 64bit load/store instructions emulation.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: dc6d95b153e78ed70b1b2c04a ("KVM: MIPS: Add more MMIO load/store instructions emulation")
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/kvm/emulate.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index 5ae82d9..d242300c 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -1722,6 +1722,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
>  			  vcpu->arch.gprs[rt], *(u32 *)data);
>  		break;
>  
> +#if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ)
>  	case sdl_op:
>  		run->mmio.phys_addr = kvm_mips_callbacks->gva_to_gpa(
>  					vcpu->arch.host_cp0_badvaddr) & (~0x7);
> @@ -1815,6 +1816,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
>  			  vcpu->arch.pc, vcpu->arch.host_cp0_badvaddr,
>  			  vcpu->arch.gprs[rt], *(u64 *)data);
>  		break;
> +#endif
>  
>  #ifdef CONFIG_CPU_LOONGSON64
>  	case sdc2_op:
> @@ -2002,6 +2004,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
>  		}
>  		break;
>  
> +#if defined(CONFIG_64BIT) && defined(CONFIG_KVM_MIPS_VZ)
>  	case ldl_op:
>  		run->mmio.phys_addr = kvm_mips_callbacks->gva_to_gpa(
>  					vcpu->arch.host_cp0_badvaddr) & (~0x7);
> @@ -2073,6 +2076,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
>  			break;
>  		}
>  		break;
> +#endif
>  
>  #ifdef CONFIG_CPU_LOONGSON64
>  	case ldc2_op:
> 

Queued, thanks.

Paolo

