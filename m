Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988EB43CDBF
	for <lists+linux-mips@lfdr.de>; Wed, 27 Oct 2021 17:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242805AbhJ0Pk0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 11:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39194 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238674AbhJ0PkZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Oct 2021 11:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635349080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bSqxXsSY7PzPPy6E5Cy05Nx/OdmHcN1STcnBEYyHdIs=;
        b=MbMxbXAupMhsOj7n1ORnzGUbt2FJk9mfhs1WY97br91xQhy2gI1grOuvQnxEp6LE0pzRZZ
        1ueNqOMlSarkjIx3XpEKw+UEb5n1ek2asuexqFwukbmOUCbHmkd+mobwHsmwa1bWXKCwn1
        2CRz2Zv9n8TOyxe7u0sslDWf0CgTm/E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ecKLpOb3N1mHAoJ415w9Tw-1; Wed, 27 Oct 2021 11:37:58 -0400
X-MC-Unique: ecKLpOb3N1mHAoJ415w9Tw-1
Received: by mail-ed1-f72.google.com with SMTP id m16-20020a056402431000b003dd2005af01so2712850edc.5
        for <linux-mips@vger.kernel.org>; Wed, 27 Oct 2021 08:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bSqxXsSY7PzPPy6E5Cy05Nx/OdmHcN1STcnBEYyHdIs=;
        b=V9Ear7F+dMSYsjm7/WJfqYBsycCtdBjQ0aT0/YSiX0242kvMtljqzyww6yiy5ur105
         quk0k64X7GKoSolaZVycaF/T+bsIjvr/iO9xC4LzSgNDDr+szHKH15MRKk1X494Z4rr3
         3pAvgFBoYpFph0HbQgqzWv2EjnQHsdXLhnZ5DsYQlNfl61wP4SD4ab88AjQuXQo/WaIw
         xcw++oP9P8nm7nY5YzNDs8tardOzFfCXnIuPUNgGVlXZLsJrl9YhEULuMSQBXc2eTZsf
         8HdNVGWSFHDxg3zuN+ODOm48nF1KPz1KauY6ofFSGG69k5Q84MusO61rwhNRsI5nTTVC
         +FJg==
X-Gm-Message-State: AOAM5336qU3SH+EFkNC46w82jZtsj2KJzlMeiBXrT2XLDYlB32FukG1N
        Dsfwml0J8hld1G8VpZTTIRQsqKe9EpSokXPgUj0jTWQR86BZ6Qh7BcVT490SdSTFAPO/B4FCMQR
        EfJO2DIj0a/yaeKpRZzx4IA==
X-Received: by 2002:a05:6402:520f:: with SMTP id s15mr19650588edd.376.1635349077546;
        Wed, 27 Oct 2021 08:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcV3ajcrSuCCBMr6jO83QbO8KNKYMvLx5Z90JLfoEGGYsQl7acheIlREFbLHWM9uSofWHX3A==
X-Received: by 2002:a05:6402:520f:: with SMTP id s15mr19650552edd.376.1635349077353;
        Wed, 27 Oct 2021 08:37:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id h7sm218074edt.37.2021.10.27.08.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 08:37:56 -0700 (PDT)
Message-ID: <5b8f554b-5bbc-e257-12d0-800ec82489d0@redhat.com>
Date:   Wed, 27 Oct 2021 17:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        James Morse <james.morse@arm.com>,
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
 <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
 <YXllGfrjPX1pVUx6@google.com>
 <ecec4d7d-13dd-c992-6648-3624d7c14c24@redhat.com>
 <YXlwH2vWILFS9QOG@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXlwH2vWILFS9QOG@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27/10/21 17:28, Sean Christopherson wrote:
> On Wed, Oct 27, 2021, Paolo Bonzini wrote:
>> On 27/10/21 16:41, Sean Christopherson wrote:
>>> The other thing I don't like about having the WARN in the loop is that it suggests
>>> that something other than the vCPU can modify the NDST and SN fields, which is
>>> wrong and confusing (for me).
>>
>> Yeah, I can agree with that.  Can you add it in a comment above the cmpxchg
>> loop, it can be as simple as
>>
>> 	/* The processor can set ON concurrently.  */
>>
>> when you respin patch 21 and the rest of the series?
> 
> I can definitely add a comment, but I think that comment is incorrect.

It's completely backwards indeed.  I first had "the hardware" and then 
shut down my brain for a second to replace it.

> So something like this?
> 
> 	/* ON can be set concurrently by a different vCPU or by hardware. */

Yes, of course.

Paolo

