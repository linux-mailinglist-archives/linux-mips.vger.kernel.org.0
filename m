Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37C241971E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Sep 2021 17:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhI0PFj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 11:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55617 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234990AbhI0PFi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Sep 2021 11:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632755040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r/mgKtKp5KKfxcrjzch748kWu470axxG1OqY2NSG+pg=;
        b=YWXa4ceanug9gp8E7xrMg7zT2lRpaIvboHjTbrZkC1+iqqgD9nZhArJN0b6YZ/BhhyGY7U
        ZKdNVxm9q0pvMvapi3c3lW1RdzokydGsQ+IxZB+q/dxOmIVTA51RLe69ybLdo/PwHcYxfi
        BHU1J8Y2YbAfUpOzJtTCSd7xI7wxqu8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-MB10L-bENw2Qjvj9lCu1eg-1; Mon, 27 Sep 2021 11:03:59 -0400
X-MC-Unique: MB10L-bENw2Qjvj9lCu1eg-1
Received: by mail-wr1-f72.google.com with SMTP id z15-20020adfec8f000000b001606a799300so383214wrn.19
        for <linux-mips@vger.kernel.org>; Mon, 27 Sep 2021 08:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r/mgKtKp5KKfxcrjzch748kWu470axxG1OqY2NSG+pg=;
        b=NwoFNhMe0cLPfdGBS3AdGgu34zt4362nEQ3PxqUfLNt3rYFqHxBhISNz0ELhbkghRq
         YmEyGj1B0Dnj04WDZtDYxmsS3mraRnARrgNj70nI8r5dT4VI2Pl5j2St+McCkyXVHXoP
         HBqhE6VMWCUNzmS25gIN69fA9PTmXdogr6Z7QE9RZi+rW6q2n1BjQomsrtuY2a+NaOri
         9A0SD89q3Ki9BBtPrMwODqHASlXflGStol/WAXv0M2jJzlFUBwsqbv8TzexKokGFPdyz
         /MuQORBkieku1/XwG4uZusfOsIlIFG9pIikUt4y5DVmX9FayiwwPjwdY94II+mS/aMI9
         IwZg==
X-Gm-Message-State: AOAM532ryHP3gasovCKqu6U1Xw4j1vjB7ky1CDtmPxUuU7rLb8UDGirR
        oQhX6LTibKB3pSbBCzGybzaSPF+ISBLrJp4mrip9X4dEC6pPq8smFWmzu1d3oTRdP8gFrvg5Mqp
        EVUSnlzzyyi8zHUMxZrX6mw==
X-Received: by 2002:a7b:c209:: with SMTP id x9mr387999wmi.9.1632755038162;
        Mon, 27 Sep 2021 08:03:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEdm9plI8QQmwPL2SFhkzquOawAtG2L3LzWjsrxEcUhatBpqdEXWMPsZ+lvaoVsF5QfHy+Uw==
X-Received: by 2002:a7b:c209:: with SMTP id x9mr387973wmi.9.1632755037927;
        Mon, 27 Sep 2021 08:03:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id c9sm15544500wmb.41.2021.09.27.08.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:03:57 -0700 (PDT)
Message-ID: <f37ab68c-61ce-b6fb-7a49-831bacfc7424@redhat.com>
Date:   Mon, 27 Sep 2021 17:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: disabling halt polling broken? (was Re: [PATCH 00/14] KVM:
 Halt-polling fixes, cleanups and a new stat)
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     David Matlack <dmatlack@google.com>,
        Jon Cargille <jcargill@google.com>,
        Jim Mattson <jmattson@google.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jing Zhang <jingzhangos@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Janosch Frank <frankja@linux.ibm.com>
References: <20210925005528.1145584-1-seanjc@google.com>
 <03f2f5ab-e809-2ba5-bd98-3393c3b843d2@de.ibm.com>
 <YVHcY6y1GmvGJnMg@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YVHcY6y1GmvGJnMg@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27/09/21 16:59, Sean Christopherson wrote:
>> commit acd05785e48c01edb2c4f4d014d28478b5f19fb5
>> Author:     David Matlack<dmatlack@google.com>
>> AuthorDate: Fri Apr 17 15:14:46 2020 -0700
>> Commit:     Paolo Bonzini<pbonzini@redhat.com>
>> CommitDate: Fri Apr 24 12:53:17 2020 -0400
>> 
>>      kvm: add capability for halt polling
>> 
>> broke the possibility for an admin to disable halt polling for already running KVM guests.
>> In past times doing
>> echo 0 > /sys/module/kvm/parameters/halt_poll_ns
>> 
>> stopped polling system wide.
>> Now all KVM guests will use the halt_poll_ns value that was active during
>> startup - even those that do not use KVM_CAP_HALT_POLL.
>> 
>> I guess this was not intended?

No, but...

> I would go so far as to say that halt_poll_ns should be a hard limit on
> the capability

... this would not be a good idea I think.  Anything that wants to do a 
lot of polling can just do "for (;;)".

So I think there are two possibilities that makes sense:

* track what is using KVM_CAP_HALT_POLL, and make writes to halt_poll_ns 
follow that

* just make halt_poll_ns read-only.

Paolo

