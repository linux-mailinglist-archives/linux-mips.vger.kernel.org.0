Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831C61EE9E4
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2020 19:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgFDR5k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jun 2020 13:57:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60451 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730309AbgFDR5k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Jun 2020 13:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591293458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FksnhBO6vS/Ap/hKpam5K+PoYAuOG4Rfq572TxOAyTg=;
        b=U7A0TuTGRMwuZ/hmqIc+hLl3Uve0+rrJUCVNao+v1XX1b8Y3jdYT1hP56HTUdxbmkHgk8+
        OXPuek3JgowzE63E12ob3JVoKDi0xqFRumHGFqfZta/Cw1+davI/fO8WMfFX2eKLnBChi6
        Unda+Fh4Ntw2hujt43guSRvZykrBIy0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-_kAfzmV5MnGf15K2BmwaBw-1; Thu, 04 Jun 2020 13:57:34 -0400
X-MC-Unique: _kAfzmV5MnGf15K2BmwaBw-1
Received: by mail-wm1-f69.google.com with SMTP id f62so2025379wme.3
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2020 10:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FksnhBO6vS/Ap/hKpam5K+PoYAuOG4Rfq572TxOAyTg=;
        b=hqSOrKNl/3LS3kkI61VdlyKkeSlkuZsav8uBiBtYCXM2d1jLWryVNN3qBZS1eEqhxm
         49hmQZzkPQOGLCC34nhTTt3ZO3FCXh/xT0I9SylgZTVmA4/quS5vdyYd16x4SR9SQpf7
         9gbND3skbvsumJOmHnq+slFFe1/D8/KGun/d0ifSLe5gw/S41rpiPK3m+mzTnjAziSwg
         2HdzGvF/mgesf6d3fsWQYa9Zu+HP12f9nA/LRSMYcka5XqBcGbrj54xRy4KYrUXyIQMD
         pSGQU9A7a2rMvY1xuXI4V80YhMdePr+gSzKSU75IuoCw9b01EmMTGQITH44oRf2kY/kR
         IiNA==
X-Gm-Message-State: AOAM5337Fy2opyeFqIiqZ+iVuSS/Cb9cbZJihmIWY4RAoB6SKLE7Jynn
        YOY7I1c7oyp1VklTHSJACarrxKVH5oRccj8V4bKFW37REXx9r7Mh8+XhOceQCtbbfBai77ZtGhk
        CTjBxYesu5q32IjcSPXo/Gg==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr5552337wmg.68.1591293453368;
        Thu, 04 Jun 2020 10:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOGKSvoIoXAWEbKHBYSbX8H32Swgs+id+2H5vtlJpeMc9ijfIwfsCbIQxP4TuqOuWT6aI2Bg==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr5552320wmg.68.1591293453077;
        Thu, 04 Jun 2020 10:57:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a0c0:5d2e:1d35:17bb? ([2001:b07:6468:f312:a0c0:5d2e:1d35:17bb])
        by smtp.gmail.com with ESMTPSA id n23sm8155508wmc.0.2020.06.04.10.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 10:57:32 -0700 (PDT)
Subject: Re: [PATCH V7 00/15] KVM: MIPS: Add Loongson-3 support (Host Side)
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1590220602-3547-1-git-send-email-chenhc@lemote.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d702015b-ab5a-77ae-de24-e248c38030f7@redhat.com>
Date:   Thu, 4 Jun 2020 19:57:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1590220602-3547-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23/05/20 09:56, Huacai Chen wrote:
> We are preparing to add KVM support for Loongson-3. VZ extension is
> fully supported in Loongson-3A R4+, and we will not care about old CPUs
> (at least now). We already have a full functional Linux kernel (based
> on Linux-5.4.x LTS) and QEMU (based on 5.0.0) and their git repositories
> are here:
> 
> QEMU: https://github.com/chenhuacai/qemu
> Kernel: https://github.com/chenhuacai/linux
> 
> Of course these two repositories need to be rework and not suitable for
> upstream (especially the commits need to be splitted). We show them here
> is just to tell others what we have done, and how KVM/Loongson will look
> like.
> 
> Our plan is make the KVM host side be upstream first, and after that,
> we will make the KVM guest side and QEMU emulator be upstream.
> 
> V1 -> V2:
> 1, Remove "mips: define pud_index() regardless of page table folding"
>    because it has been applied.
> 2, Make Loongson-specific code be guarded by CONFIG_CPU_LOONGSON64.
> 
> V2 -> V3:
> 1, Emulate a reduced feature list of CPUCFG.
> 2, Fix all possible checkpatch.pl errors and warnings.
> 
> V3 -> V4:
> 1, Emulate LOONGSON_CFG0/LOONGSON_CFG3 in CPUCFG correctly.
> 2, Update commit messages to explain Loongson-3 Virtual IPI.
> 3, Add Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>.
> 
> V4 -> V5:
> 1, Fix a typo.
> 2, Update MAINTAINERS.
> 
> V5 -> V6:
> 1, Fix a mismatch during rebasing.
> 2, Add Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>.
> 
> V6 -> V7:
> 1, Rebase on latest mips-next (Config6 feature bits definition updated).

Queued, thanks.  Please check the queue branch of kvm.git.

Paolo

> Xing Li(2):
>  KVM: MIPS: Define KVM_ENTRYHI_ASID to cpu_asid_mask(&boot_cpu_data)
>  KVM: MIPS: Fix VPN2_MASK definition for variable cpu_vmbits
> 
> Huacai Chen(13):
>  KVM: MIPS: Increase KVM_MAX_VCPUS and KVM_USER_MEM_SLOTS to 16
>  KVM: MIPS: Add EVENTFD support which is needed by VHOST
>  KVM: MIPS: Use lddir/ldpte instructions to lookup gpa_mm.pgd
>  KVM: MIPS: Introduce and use cpu_guest_has_ldpte
>  KVM: MIPS: Use root tlb to control guest's CCA for Loongson-3
>  KVM: MIPS: Let indexed cacheops cause guest exit on Loongson-3
>  KVM: MIPS: Add more types of virtual interrupts
>  KVM: MIPS: Add Loongson-3 Virtual IPI interrupt support
>  KVM: MIPS: Add CPUCFG emulation for Loongson-3
>  KVM: MIPS: Add CONFIG6 and DIAG registers emulation
>  KVM: MIPS: Add more MMIO load/store instructions emulation
>  KVM: MIPS: Enable KVM support for Loongson-3
>  MAINTAINERS: Update KVM/MIPS maintainers
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  MAINTAINERS                          |   4 +-
>  arch/mips/Kconfig                    |   1 +
>  arch/mips/include/asm/cpu-features.h |   3 +
>  arch/mips/include/asm/kvm_host.h     |  52 +++-
>  arch/mips/include/asm/mipsregs.h     |   7 +
>  arch/mips/include/uapi/asm/inst.h    |  11 +
>  arch/mips/kernel/cpu-probe.c         |   2 +
>  arch/mips/kvm/Kconfig                |   1 +
>  arch/mips/kvm/Makefile               |   5 +-
>  arch/mips/kvm/emulate.c              | 503 ++++++++++++++++++++++++++++++++++-
>  arch/mips/kvm/entry.c                |  19 +-
>  arch/mips/kvm/interrupt.c            |  93 +------
>  arch/mips/kvm/interrupt.h            |  14 +-
>  arch/mips/kvm/loongson_ipi.c         | 214 +++++++++++++++
>  arch/mips/kvm/mips.c                 |  49 +++-
>  arch/mips/kvm/tlb.c                  |  41 +++
>  arch/mips/kvm/trap_emul.c            |   3 +
>  arch/mips/kvm/vz.c                   | 237 ++++++++++++-----
>  18 files changed, 1092 insertions(+), 167 deletions(-)
>  create mode 100644 arch/mips/kvm/loongson_ipi.c
> --
> 2.7.0
> 

