Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7D53340DA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 15:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhCJOz1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 09:55:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54884 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229790AbhCJOzG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 09:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615388105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LPQFDLvKrDj5V75j3OST6UCIU/ZY4HfSALPlvqp1Wfg=;
        b=JBQodNiSVTOD8WK+XF92kJgQOQsg0mrLMja1K6+unw7ek5h4CxkL3kuW20cbyqyO0uCQYs
        eR3kMo5QInPxwYuMoK2gx11dWiZeHWfN8bUOm3cjcCIwC9LnUYZSkaj8ZmAKUEXBTtfKYP
        aVYuKddiSIFCEYS7ei48HVc97+iaags=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-_q-UDJRqO0u18hwA7k2OdA-1; Wed, 10 Mar 2021 09:55:04 -0500
X-MC-Unique: _q-UDJRqO0u18hwA7k2OdA-1
Received: by mail-wr1-f72.google.com with SMTP id p12so5515746wrn.18
        for <linux-mips@vger.kernel.org>; Wed, 10 Mar 2021 06:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LPQFDLvKrDj5V75j3OST6UCIU/ZY4HfSALPlvqp1Wfg=;
        b=lzPlH4Vy+ZwlqJBRakYlTrWenaL7NsGVGgpB6/cJ9aDbIvQYiFnqn2H7NGJQChOKMT
         hCmPyHYWiotTJuJu6a1aiHepeWmAsJMCrlTSgEV9gEw7LltIIVfzy63Vx9BixRfUwdms
         VixR5SXHKF9G0OpwBtuO3pCpYf7FUJBCkuvxRGHQkMpzBYgITq22mr0e9nuftqPgSSEc
         NwyRTKvBSfXvX2Kgtwml7ix1PgScAGo81H6RUD/XpAnkrDtNFphHDSXjoLddWAn0idUn
         a9vW8UW4xPt9cymn99t6nwIm2TchOgB2xpWYcx3c6bbbpF/5DLoOjXHzVdLYk/vgiJK2
         kNZQ==
X-Gm-Message-State: AOAM5313N/RST2gWRpiLtz7gtjC6UXcMGz7DRcXBu5rqVH/YS5SOnkYt
        +lMN5VIfFhaME+ULsDDM85yKLGxTiC8lyOpIeBoN/hViFR6ft0xtDrO/VWcznJr7Auu+SFbmMiz
        Bjhmnm+dluN5x8afuFTenQA==
X-Received: by 2002:adf:b642:: with SMTP id i2mr3865643wre.8.1615388103108;
        Wed, 10 Mar 2021 06:55:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwp8IPvog+z5u0xHa71sLbhjUTN4LuYnyJQMDL+lgzE2lfZRrpnQ7PMYA0UId6FUANQ1ovE/g==
X-Received: by 2002:adf:b642:: with SMTP id i2mr3865612wre.8.1615388102915;
        Wed, 10 Mar 2021 06:55:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id s8sm30974435wrn.97.2021.03.10.06.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 06:55:02 -0800 (PST)
Subject: Re: [RFC PATCH 3/4] KVM: stats: Add ioctl commands to pull statistics
 in binary format
To:     Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
        KVM ARM <kvmarm@lists.cs.columbia.edu>,
        Linux MIPS <linux-mips@vger.kernel.org>,
        KVM PPC <kvm-ppc@vger.kernel.org>,
        Linux S390 <linux-s390@vger.kernel.org>,
        Linux kselftest <linux-kselftest@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210310003024.2026253-1-jingzhangos@google.com>
 <20210310003024.2026253-4-jingzhangos@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb03107c-a413-50da-e228-d338dd471fb3@redhat.com>
Date:   Wed, 10 Mar 2021 15:55:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310003024.2026253-4-jingzhangos@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/03/21 01:30, Jing Zhang wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 383df23514b9..87dd62516c8b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3464,6 +3464,51 @@ static long kvm_vcpu_ioctl(struct file *filp,
>   		r = kvm_arch_vcpu_ioctl_set_fpu(vcpu, fpu);
>   		break;
>   	}
> +	case KVM_STATS_GET_INFO: {
> +		struct kvm_stats_info stats_info;
> +
> +		r = -EFAULT;
> +		stats_info.num_stats = VCPU_STAT_COUNT;
> +		if (copy_to_user(argp, &stats_info, sizeof(stats_info)))
> +			goto out;
> +		r = 0;
> +		break;
> +	}
> +	case KVM_STATS_GET_NAMES: {
> +		struct kvm_stats_names stats_names;
> +
> +		r = -EFAULT;
> +		if (copy_from_user(&stats_names, argp, sizeof(stats_names)))
> +			goto out;
> +		r = -EINVAL;
> +		if (stats_names.size < VCPU_STAT_COUNT * KVM_STATS_NAME_LEN)
> +			goto out;
> +
> +		r = -EFAULT;
> +		if (copy_to_user(argp + sizeof(stats_names),
> +				kvm_vcpu_stat_strings,
> +				VCPU_STAT_COUNT * KVM_STATS_NAME_LEN))

The only reason to separate the strings in patch 1 is to pass them here. 
  But this is a poor API because it imposes a limit on the length of the 
statistics, and makes that length part of the binary interface.

I would prefer a completely different interface, where you have a file 
descriptor that can be created and associated to a vCPU or VM (or even 
to /dev/kvm).  Having a file descriptor is important because the fd can 
be passed to a less-privileged process that takes care of gathering the 
metrics

The result of reading the file descriptor could be either ASCII or 
binary.  IMO the real cost lies in opening and reading a multitude of 
files rather than in the ASCII<->binary conversion.

The format could be one of the following:

* binary:

4 bytes flags (always zero)
4 bytes number of statistics
4 bytes offset of the first stat description
4 bytes offset of the first stat value
stat descriptions:
   - 4 bytes for the type (for now always zero: uint64_t)
   - 4 bytes for the flags (for now always zero)
   - length of name
   - name
statistics in 64-bit format

* text:

stat1_name uint64 123
stat2_name uint64 456
...

What do you think?

Paolo

