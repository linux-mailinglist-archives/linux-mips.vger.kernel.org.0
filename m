Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6BD4398B9
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 16:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbhJYOhV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 10:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20058 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232403AbhJYOhU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Oct 2021 10:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635172497;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gyRr+oxbdq+D1XVZyshzBJhdWV6eJMpRCL2oDxsSBbM=;
        b=SQBkGLBaOxog2hLaf6YXCS+UY/ndEWjokIqxk8Ws8KqvyTEE0Co3Z7LtBTIp697U1HlcgV
        DbTijGyr0ZSgkptCt4zGUrPXkUOcf8Ijn+i1BCLw8Bp7+I2iJW+Lhv0qI9q2PEV85OkVUT
        aMLTaFhNymZBkzU0xhx83l44CfHd3SE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-XMewfGLQMSaShLqa_6DMMQ-1; Mon, 25 Oct 2021 10:34:56 -0400
X-MC-Unique: XMewfGLQMSaShLqa_6DMMQ-1
Received: by mail-ed1-f69.google.com with SMTP id s12-20020a50dacc000000b003dbf7a78e88so10117783edj.2
        for <linux-mips@vger.kernel.org>; Mon, 25 Oct 2021 07:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gyRr+oxbdq+D1XVZyshzBJhdWV6eJMpRCL2oDxsSBbM=;
        b=eUfGY2a09NVUPKyNWE53IkxVD/Lsy+tPx0hlaQMdY3pLPJ1oAheYVpMwigobP07lRc
         MqnM6TajOmFuqxWch31oXXNDP9bNzd4ZmPz9RXaI8c0PXiNcKCe56d3NVAPdwRlrzqX6
         PAwQH3eQvFgq2T9BMWxqmPP9AtO9irHTc7X6m1QRawZYSrLTwjgNqUwGsMS/7aqswxij
         x/iCZZvxio9PPeIRk5xyFsq/sP10Qmhb1NV/LgwWajiQmxpBRF1D41yBE6YLoMgUPBju
         wmCUF8MvQgSdrlFQw4xrLukwz2MlLHgf3fuqrOBDpcZAVyoUfC2mloR5g/ejloTYjvCI
         KtHQ==
X-Gm-Message-State: AOAM532byvF6+dsBhptqU+vowjiJ8m7odyd2NIi/nABLlJCgXcH/vD0E
        7vJxS5+x/Fp2tVxtBqBPHm0T9g3Em9PuOUfdEK00i8gg31H3ZayJgSAZd7K/RElD83s9mUJoNSU
        FyWzLE549gxjKCP+eMaBHtA==
X-Received: by 2002:a05:6402:5112:: with SMTP id m18mr26543479edd.101.1635172494825;
        Mon, 25 Oct 2021 07:34:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1PVpqtFTaT+fZx+ngmF47w1xHlBRHe6pB6EMZ006WM53WXRFnHCfF7AOxx4PQB6o6e4saOQ==
X-Received: by 2002:a05:6402:5112:: with SMTP id m18mr26543421edd.101.1635172494578;
        Mon, 25 Oct 2021 07:34:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m15sm10124432edd.5.2021.10.25.07.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:34:53 -0700 (PDT)
Message-ID: <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
Date:   Mon, 25 Oct 2021 16:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
Cc:     James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Atish Patra <atish.patra@wdc.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Matlack <dmatlack@google.com>,
        Oliver Upton <oupton@google.com>,
        Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-40-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-40-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/10/21 04:12, Sean Christopherson wrote:
> +		/*
> +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
> +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
> +		 * is guaranteed to see the event request if triggering a posted
> +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.

This explanation doesn't make much sense to me.  This is just the usual 
request/kick pattern explained in 
Documentation/virt/kvm/vcpu-requests.rst; except that we don't bother 
with a "kick" out of guest mode because the entry always goes through 
kvm_check_request (in the nVMX case) or sync_pir_to_irr (if non-nested) 
and completes the delivery itself.

In other word, it is a similar idea as patch 43/43.

What this smp_wmb() pair with, is the smp_mb__after_atomic in 
kvm_check_request(KVM_REQ_EVENT, vcpu).  Setting the interrupt in the 
PIR orders before kvm_make_request in this thread, and orders after 
kvm_make_request in the vCPU thread.

Here, instead:

> +	/*
> +	 * The implied barrier in pi_test_and_set_on() pairs with the smp_mb_*()
> +	 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU is
> +	 * guaranteed to see PID.ON=1 and sync the PIR to IRR if triggering a
> +	 * posted interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
> +	 */
>  	if (vcpu != kvm_get_running_vcpu() &&
>  	    !kvm_vcpu_trigger_posted_interrupt(vcpu, false))
> -		kvm_vcpu_kick(vcpu);
> +		kvm_vcpu_wake_up(vcpu);
>  

it pairs with the smp_mb__after_atomic in vmx_sync_pir_to_irr().  As 
explained again in vcpu-requests.rst, the ON bit has the same function 
as vcpu->request in the previous case.

Paolo

> +		 */
>   		kvm_make_request(KVM_REQ_EVENT, vcpu);

