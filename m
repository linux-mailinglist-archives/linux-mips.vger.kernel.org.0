Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375DE439817
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 16:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhJYOJK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 10:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50023 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231134AbhJYOJJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Oct 2021 10:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635170807;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FblMqi74l2aNQDmIbjX/cagfl890xy4Kf5Rp2sw8Ik4=;
        b=iybnwA0ZadanTHPHXV9Sbz8JrJm508VE747MwvM0WjR6zQ0H7YDqd8ZruBnkQ8FFxyEkLe
        EgxdHniFGcd9Kn9JX9OlnRN8CIce0gmXIzCQlA1kEkpfoB6YZQAZlGvUeoCF65178Zytrj
        D7Zwzzcgb/nbyViN/FOhKcEzj6+6j48=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-Z6GVGFU9NXyGJj_7P6w--g-1; Mon, 25 Oct 2021 10:06:46 -0400
X-MC-Unique: Z6GVGFU9NXyGJj_7P6w--g-1
Received: by mail-ed1-f72.google.com with SMTP id s12-20020a50dacc000000b003dbf7a78e88so10031718edj.2
        for <linux-mips@vger.kernel.org>; Mon, 25 Oct 2021 07:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FblMqi74l2aNQDmIbjX/cagfl890xy4Kf5Rp2sw8Ik4=;
        b=MrBrFZF3DJiHP+ZaVPoFWzVH1ZbDLSwI1JjmHaUvugPKcjNKvQAtOBBRp/iftgtNF8
         X+jiF1HZ4XMIoiQj99qIrgvznG37NQ640cGuCBJHiCoO0EE0bb83KFR+iqjHvtkVPQew
         tLKK6tkcKSxxox5a5NYQLrNmKf+0PmDTjdHKF6SUgafvDtmTuJfEFpMWaa/HjkB11KlK
         v6CpikZBwY0Qg2dhuJ58u0gW+h8Hf/TBMqsxSiVO7XoBYA4fKAt+1yBknNd/pDBrMcMt
         1z7oomf8iWLsL0q0qJ3tReGXwk3ykvzXVmbFQur9ZnKlcHlhpJh/H/PVtCFzYsLey7OZ
         qhyA==
X-Gm-Message-State: AOAM533xp29pg26qU1HtvWT9xhTtWhmk1kM5SGkGoT0QBQo3Out3X6jY
        aqQEJsgitsjG1HFeRziONrZ1WH9SEUfIhHNwQizv1l1/raQGdnCx29DMTVRHZt6CyxwtN+m+PBN
        w6jPB61HeVvQPJ8cbNNGVSw==
X-Received: by 2002:a50:fb02:: with SMTP id d2mr11770112edq.100.1635170804930;
        Mon, 25 Oct 2021 07:06:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ2X8dAbxM+1kv2smymvR7I3dtS7qD9GGOcFC9wjjp+md9MuSuvCzqRB05il5WqZEpIp8nlw==
X-Received: by 2002:a50:fb02:: with SMTP id d2mr11770084edq.100.1635170804745;
        Mon, 25 Oct 2021 07:06:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id o3sm7472237eju.123.2021.10.25.07.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:06:44 -0700 (PDT)
Message-ID: <591073c1-b520-21de-8573-ddb83950e9f1@redhat.com>
Date:   Mon, 25 Oct 2021 16:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 19/43] KVM: Add helpers to wake/query blocking vCPU
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
 <20211009021236.4122790-20-seanjc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-20-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/10/21 04:12, Sean Christopherson wrote:
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 7e8396f74010..addd53b6eba6 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -649,7 +649,6 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>   {
>   	struct arch_timer_cpu *timer = vcpu_timer(vcpu);
>   	struct timer_map map;
> -	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
>   
>   	if (unlikely(!timer->enabled))
>   		return;
> @@ -672,7 +671,7 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>   	if (map.emul_ptimer)
>   		soft_timer_cancel(&map.emul_ptimer->hrtimer);
>   
> -	if (rcuwait_active(wait))
> +	if (kvm_vcpu_is_blocking(vcpu))
>   		kvm_timer_blocking(vcpu);
>   
>   	/*

So this trick is what you're applying to x86 too instead of using 
vmx_pre_block, I see.

Paolo

