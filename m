Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE6B35099A
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 23:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhCaVgp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 17:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48129 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232417AbhCaVgm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Mar 2021 17:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617226602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CEkfAOJSRgLmrcmogejiwM3z3x7Jp11CwOAYIRJU/eA=;
        b=V1uvJEW0kvpG1M+e31bQhBjicjCjiCOpBWu6AmCYWLLEn9gYeuaAA/YIVSfObeqtNMs4vK
        lF7wCl7/qZJ+SpLyKqyGCy2byrDBJ8vBUrnGSFAchNQpIWttsxac+8pYUUTjl6uZYRoGR+
        SZwhD1XXLesNu+1HtNcUiHw0AcjbaHw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Gca008E0PSaMiRsSzLLxoA-1; Wed, 31 Mar 2021 17:36:37 -0400
X-MC-Unique: Gca008E0PSaMiRsSzLLxoA-1
Received: by mail-wr1-f72.google.com with SMTP id m23so1624573wrh.7
        for <linux-mips@vger.kernel.org>; Wed, 31 Mar 2021 14:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CEkfAOJSRgLmrcmogejiwM3z3x7Jp11CwOAYIRJU/eA=;
        b=Qii3T9J3r9GJlIFqsa1GW6mIhGWeuUsKQkiT+lnNV/KZgJaelu/YWUYXLxYP6atHsK
         UFBnCYTdJcP37LRjLsalsKL+9vvRZs2XpdEOhTynuJn6RTkVAUJMf/FppoVJ7aI3uoL+
         rOXTVP8XskKTYXeJXCN4efWSSl25IoCITWFwR3o2Il8IXg/VVqvbZ2o0gN25O2FhviPm
         n8kpa1q+I158alGiqbSoVCHVq0NBmIiq3HypMS9HngZHs0tyjBhA34QDghPF3glMSa3r
         D9VxVmOUJh4f+yzrhT4oCrW9XZxrOnil5m253pJ/iEK93DcZyauemFjJNFKSMTir+ayD
         IYkQ==
X-Gm-Message-State: AOAM532CvtSM26IelL3DqpMyO1pOOJcxezscytH7OO3hh8WlGePfjB4c
        76dIZG7gzjFlFnC4uRmdzOxHN+TtiInv1M7o4Fcmb9wa0PSWycRP3D6dhUbkVyXoRnBPbf+9Yfl
        +Qt9mfxU7KWJ1K83jOBD4TA==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr5824708wru.401.1617226596849;
        Wed, 31 Mar 2021 14:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxj/Cy9ZlL8PU/jQIPYrj7YXyx+xnD7LhAYpJqpR2c8LjROVyn4i4Jg6Wqcll5JYmuGcjgzQ==
X-Received: by 2002:a5d:6a81:: with SMTP id s1mr5824690wru.401.1617226596681;
        Wed, 31 Mar 2021 14:36:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id u63sm5728603wmg.24.2021.03.31.14.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 14:36:36 -0700 (PDT)
Subject: Re: [PATCH 16/18] KVM: Don't take mmu_lock for range invalidation
 unless necessary
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Gardon <bgardon@google.com>
References: <20210326021957.1424875-1-seanjc@google.com>
 <20210326021957.1424875-17-seanjc@google.com>
 <6e7dc7d0-f5dc-85d9-1c50-d23b761b5ff3@redhat.com>
 <YGSmMeSOPcjxRwf6@google.com>
 <56ea69fe-87b0-154b-e286-efce9233864e@redhat.com>
 <YGTRzf/4i9Y8XR2c@google.com>
 <0e30625f-934d-9084-e293-cb3bcbc9e4b8@redhat.com>
 <YGTkLMAzk88wOiZm@google.com> <YGToGBvdfPiCr3WA@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <743a31e7-03ba-0c64-86ac-c5a0aac4121c@redhat.com>
Date:   Wed, 31 Mar 2021 23:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGToGBvdfPiCr3WA@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/03/21 23:22, Sean Christopherson wrote:
> On a related topic, any preference on whether to have an explicit "must_lock"
> flag (what I posted), or derive the logic based on other params?
> 
> The helper I posted does:
> 
> 	if (range->must_lock &&
> 	    kvm_mmu_lock_and_check_handler(kvm, range, &locked))
> 		goto out_unlock;
> 
> but it could be:
> 
> 	if (!IS_KVM_NULL_FN(range->on_lock) && !range->may_block &&
> 	    kvm_mmu_lock_and_check_handler(kvm, range, &locked))
> 		goto out_unlock;
> 
> The generated code should be nearly identical on a modern compiler, so it's
> purely a question of aesthetics.  I slightly prefer the explicit "must_lock" to
> avoid spreading out the logic too much, but it also feels a bit superfluous.

I do as well, but I hope we don't need any lock after all as in the 
email I've just sent.

Paolo

