Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A33341631C
	for <lists+linux-mips@lfdr.de>; Thu, 23 Sep 2021 18:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242376AbhIWQYl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Sep 2021 12:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42006 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242287AbhIWQYZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Sep 2021 12:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632414173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u6pqfNeOt8tL2GBP0sFXaQoAOnZO3+YJ2VkaCjJ0uXk=;
        b=XdtjIdWErE8Z5lXHRAg1BgUF3cZ7I7FwDJ/JTqOUW91kFdvDcyquh8NgDlQ/HEKbMbo71N
        /cu+F2cW4gyAkjGF5W4Ac47BQ20z9uovgOqNkIYg53vglbDub/h4HUIlFBiTg5SXX0nxrt
        yRpxi17pBalI6JbTh+sbi9j2SnqcQ7Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-rWz0o2PhNI21gA83uu0K5w-1; Thu, 23 Sep 2021 12:21:47 -0400
X-MC-Unique: rWz0o2PhNI21gA83uu0K5w-1
Received: by mail-ed1-f69.google.com with SMTP id n5-20020a05640206c500b003cf53f7cef2so7294512edy.12
        for <linux-mips@vger.kernel.org>; Thu, 23 Sep 2021 09:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u6pqfNeOt8tL2GBP0sFXaQoAOnZO3+YJ2VkaCjJ0uXk=;
        b=8EVL9Htr05ZhOWlNX5kqYVbDP6c7iIvWB9v+0aqp/gFlVDYsLwrbkJTByw2Adkwfv4
         IzwBPBS8BuS2I5HJU7Bkt+PnLbB8PxE0eHzGi9qLTYx2Ao6W92HOMcRE9wyl0up8C9Lp
         UBOXbNFycijk0s0LFZQAlDcWnsHR3QwPCvnMl7wPTvtan7JJp+e/q4QftH3bnJd+1rFd
         Ft1Q/ac5yJsdumMCSL+q+fNQTXBcB02DiVpBxow69YH1hqfJy6Joj9rSvYSO7CCaYSBe
         jlrCqCYsXdpKvoaRKzqh7+toDOPJRe6oC9lhnsVuXj4GRNIcaINsV/uArN1Go10TBsIQ
         uiYQ==
X-Gm-Message-State: AOAM530ZyrOqRaqd+eivGkhy6FK8IqZJzRwnloBLIF2PRH86qUIsoOsf
        L5+oEPjJ8U/Det0jsBk+EfZADJC0ox1lfUfNTHaV2bvMouI0WVk6cQP6WIl9gtoB9KDsCP6S7wW
        Ejnim3mL4vTkjXFXXU9UF5w==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr6462179edq.31.1632414106417;
        Thu, 23 Sep 2021 09:21:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrEzjHXWR+VYrKJT7i95j45MgVWMJnN/dFXr62alQzAy8bfphi2nG6GFcipGwzTPlE6aJKZg==
X-Received: by 2002:a50:fb06:: with SMTP id d6mr6462153edq.31.1632414106210;
        Thu, 23 Sep 2021 09:21:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id e13sm3352440eje.95.2021.09.23.09.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 09:21:45 -0700 (PDT)
Subject: Re: [PATCH 0/2] kvm: fix KVM_MAX_VCPU_ID handling
To:     Juergen Gross <jgross@suse.com>, kvm@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org
Cc:     Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210913135745.13944-1-jgross@suse.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75959861-6644-aa9a-5e81-a25f864d74ab@redhat.com>
Date:   Thu, 23 Sep 2021 18:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913135745.13944-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/09/21 15:57, Juergen Gross wrote:
> Revert commit 76b4f357d0e7d8f6f00 which was based on wrong reasoning
> and rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS in order to avoid the
> same issue in future.
> 
> Juergen Gross (2):
>    x86/kvm: revert commit 76b4f357d0e7d8f6f00
>    kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
> 
>   Documentation/virt/kvm/devices/xics.rst            | 2 +-
>   Documentation/virt/kvm/devices/xive.rst            | 2 +-
>   arch/mips/kvm/mips.c                               | 2 +-
>   arch/powerpc/include/asm/kvm_book3s.h              | 2 +-
>   arch/powerpc/include/asm/kvm_host.h                | 4 ++--
>   arch/powerpc/kvm/book3s_xive.c                     | 2 +-
>   arch/powerpc/kvm/powerpc.c                         | 2 +-
>   arch/x86/include/asm/kvm_host.h                    | 2 +-
>   arch/x86/kvm/ioapic.c                              | 2 +-
>   arch/x86/kvm/ioapic.h                              | 4 ++--
>   arch/x86/kvm/x86.c                                 | 2 +-
>   include/linux/kvm_host.h                           | 4 ++--
>   tools/testing/selftests/kvm/kvm_create_max_vcpus.c | 2 +-
>   virt/kvm/kvm_main.c                                | 2 +-
>   14 files changed, 17 insertions(+), 17 deletions(-)
> 

Queued, thanks.

Paolo

