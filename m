Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE29044E4BA
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 11:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhKLKls (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 05:41:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56713 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232841AbhKLKls (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Nov 2021 05:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636713537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=46oPanpNXibKa0tnHojCAVl1G+VIp/9kz1W1tOMUA/o=;
        b=RIHbK9CZaTMA+YP2nbDvx38BNIVV7Pp8EA5L4C8kTdbkTOWtB0RIhNN13qUVyvYWa0+Dwv
        16dYXwXlKWwxg4Zeo9H+Gbrn3Vi8TRfiRSSZ70qPi4JlEbXlg9jUsYq1KGMGEVRSO8onYo
        dXhsFIpdvbs7P81MzLHi8cJ+QV2esbA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-nsgC2AMmONKnkWaNcuNDEQ-1; Fri, 12 Nov 2021 05:38:56 -0500
X-MC-Unique: nsgC2AMmONKnkWaNcuNDEQ-1
Received: by mail-ed1-f69.google.com with SMTP id i22-20020a05640242d600b003e28aecc0afso7928779edc.1
        for <linux-mips@vger.kernel.org>; Fri, 12 Nov 2021 02:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=46oPanpNXibKa0tnHojCAVl1G+VIp/9kz1W1tOMUA/o=;
        b=jkUGPCaOAWh4tM/mImb4ITCkQCjwM7O+0zxEQmnNl5MJYZenRoNIZjPhXouzm2Envq
         2s6HYVhjN2eO3rA6UWCMGvdbaQpPNntGFBNPJSuE1F8/ZGJPxbhfQCFUQcywfnMv9edo
         ANveoTQd0v7sF9FiE4941ijJSfrLm4cC6wycKTi+3QmoNny0wMWc1yidrYF31MU7NStV
         ycBjJrlTCkUsIWBIMM6gS/Nc35CKJoa32WaBpJAs67yAsXHYp3KvYBp8U1EA39mnjYVb
         kJSGyTTNW0tVpvDoOP8jrHbtS8RQaj2CkExflKq4WNnpfSs2+FwJ8VajmUQoYJ1QxDAg
         ZN1A==
X-Gm-Message-State: AOAM533KndcxMiKSJ6lnfWqHyg9/YKI3hDI40Seldx2Qed9ReLNBRWhW
        cJSFos8IJ2hnvAH5nI6PLjGSt69vDzplQzpO6nsBtcX9HUlUob3aVU6xmuacqlf2ZqxW56+yTPc
        1AELVhAOx2X6egRlGKFYbTw==
X-Received: by 2002:aa7:d941:: with SMTP id l1mr11835613eds.85.1636713535287;
        Fri, 12 Nov 2021 02:38:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9layiD+6Vv4+AU3/Qy6m1v3qARXE9JoqZtCdClcHuoufFeEjkx3MDLgO30N9JpFidH7eEUw==
X-Received: by 2002:aa7:d941:: with SMTP id l1mr11835576eds.85.1636713535102;
        Fri, 12 Nov 2021 02:38:55 -0800 (PST)
Received: from gator.home (cst-prg-92-133.cust.vodafone.cz. [46.135.92.133])
        by smtp.gmail.com with ESMTPSA id a15sm2912187edr.76.2021.11.12.02.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 02:38:54 -0800 (PST)
Date:   Fri, 12 Nov 2021 11:38:51 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
Message-ID: <20211112103851.pmb35qf5bvcukjmg@gator.home>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <20211111162746.100598-2-vkuznets@redhat.com>
 <a5cdff6878b7157587e92ebe4d5af362@kernel.org>
 <875ysxg0s1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875ysxg0s1.fsf@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 12, 2021 at 10:51:10AM +0100, Vitaly Kuznetsov wrote:
> Marc Zyngier <maz@kernel.org> writes:
> 
> > Hi Vitaly,
> >
> > On 2021-11-11 16:27, Vitaly Kuznetsov wrote:
> >> It doesn't make sense to return the recommended maximum number of
> >> vCPUs which exceeds the maximum possible number of vCPUs.
> >> 
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >>  arch/arm64/kvm/arm.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> >> index 7838e9fb693e..391dc7a921d5 100644
> >> --- a/arch/arm64/kvm/arm.c
> >> +++ b/arch/arm64/kvm/arm.c
> >> @@ -223,7 +223,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
> >> long ext)
> >>  		r = 1;
> >>  		break;
> >>  	case KVM_CAP_NR_VCPUS:
> >> -		r = num_online_cpus();
> >> +		if (kvm)
> >> +			r = min_t(unsigned int, num_online_cpus(),
> >> +				  kvm->arch.max_vcpus);
> >> +		else
> >> +			r = min_t(unsigned int, num_online_cpus(),
> >> +				  kvm_arm_default_max_vcpus());
> >>  		break;
> >>  	case KVM_CAP_MAX_VCPUS:
> >>  	case KVM_CAP_MAX_VCPU_ID:
> >
> > This looks odd. This means that depending on the phase userspace is
> > in while initialising the VM, KVM_CAP_NR_VCPUS can return one thing
> > or the other.
> >
> > For example, I create a VM on a 32 CPU system, NR_VCPUS says 32.
> > I create a GICv2 interrupt controller, it now says 8.
> >
> > That's a change in behaviour that is visible by userspace
> 
> Yes, I realize this is a userspace visible change. The reason I suggest
> it is that logically, it seems very odd that the maximum recommended
> number of vCPUs (KVM_CAP_NR_VCPUS) can be higher, than the maximum
> supported number of vCPUs (KVM_CAP_MAX_VCPUS). All userspaces which use
> this information somehow should already contain some workaround for this
> case. (maybe it's a rare one and nobody hit it yet or maybe there are no
> userspaces using KVM_CAP_NR_VCPUS for anything besides complaining --
> like QEMU).
> 
> I'd like KVM to be consistent across architectures and have the same
> (similar) meaning for KVM_CAP_NR_VCPUS.

KVM_CAP_NR_VCPUS seems pretty useless if we just want to tell userspace
the same thing it can get with _SC_NPROCESSORS_ONLN. In fact, if userspace
knows something we don't about the future onlining of some pcpus, then
maybe userspace would prefer to check _SC_NPROCESSORS_CONF.

> 
> > which I'm keen on avoiding. I'd rather have the kvm and !kvm cases
> > return the same thing.
> 
> Forgive me my (ARM?) ignorance but what would it be then? If we go for
> min(num_online_cpus(), kvm_arm_default_max_vcpus()) in both cases, cat
> this can still go above KVM_CAP_MAX_VCPUS after vGIC is created?

So the GIC version case looks like the type of thing that could make
KVM_CAP_NR_VCPUS useful, i.e. being able to tell userspace a maximum
number of vcpus supported for a given configuration. However, even
in that case the concept of "recommended" number doesn't make sense,
because, for the GICv2 example, a VM cannot configure more than 8 VCPUs,
so it's a real limit, not a recommendation. Maybe KVM_CAP_NR_VCPUS should
just be left alone, but deprecated, and, if there's need, a new CAP could
be created for a config-vcpu-max.

Thanks,
drew

