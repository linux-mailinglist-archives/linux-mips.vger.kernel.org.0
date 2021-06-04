Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026F239B3D0
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 09:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhFDH0W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 03:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52135 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230104AbhFDH0V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 03:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622791475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ElFb664kDca3zTUpMXZCL5Csjp2/nyoNDD9HukhmOHM=;
        b=TnlVERX2WCccv73rRj+yMV72uhH/2GHU7sl8HB55t/ERJoXUzRYdL/CuKMoJrLWVT78foe
        XFg/BBEKf6L66s5ompGQJrLedD+9pEWksjvkh/xoghLGBf6cL0dryFAkhNicq74W/M5dOg
        2TuKJjL2eZ7HY8FgemWzln8LNQavm6k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-gBKFN0n3NnaQBTEIJJC4HQ-1; Fri, 04 Jun 2021 03:24:34 -0400
X-MC-Unique: gBKFN0n3NnaQBTEIJJC4HQ-1
Received: by mail-ej1-f70.google.com with SMTP id o5-20020a1709068605b02904034c0d7648so1294113ejx.8
        for <linux-mips@vger.kernel.org>; Fri, 04 Jun 2021 00:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ElFb664kDca3zTUpMXZCL5Csjp2/nyoNDD9HukhmOHM=;
        b=jJVexjJkicjpTzkXffT5Hn7uniTDpqGLitIslQHFFW3vUj9ScQ4Fw0JVFD29rEL8LH
         2fPSGiaUinclVLot6rZmOKbsbY5Gdg15h/vsxfVJzZRO2OTbgQ756jNzFhuMs49qpHzE
         Yw6Kx75tZxEQ0UfwtScut6USU/HtEemxzKIVn4I+E1AL/35u17r7h7/aHQoKewN1hV0v
         cHI+tyuzHp6pUn9iiAfS9BirYtO+7voYPWYOuzoqoKC1jp8teDoJcFgalyTCGGpf4vCI
         U+ClszUAh1TknGgre29qPn9BQ0sATeCmqp1DsnS/cxYyIbkwsH4QLG0+9tQ9Iy1IssJ9
         gMQQ==
X-Gm-Message-State: AOAM533S5hwuPUA24gMv/Mlm0GLp+T/ftkeudv1/z9BsXzO2UUrtIVxN
        6zp+Y2DSvPfxY3Dkj6iS6PFXwAm2gaCewuYHJekcAdKomISQUU3+CT2Jy52Vjwr+JjLGNavuaR1
        e7e2zz7+el0AyQYIVxOiyJA==
X-Received: by 2002:a17:906:1401:: with SMTP id p1mr2849922ejc.526.1622791472785;
        Fri, 04 Jun 2021 00:24:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf6cQzWkBIEpZuWDj8mD3YKNJZw3J7U1/Ic7+UpRFaWTIKLqYoDPaxKjav78eW5CkReqQfnw==
X-Received: by 2002:a17:906:1401:: with SMTP id p1mr2849903ejc.526.1622791472650;
        Fri, 04 Jun 2021 00:24:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id nc26sm2296091ejc.106.2021.06.04.00.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 00:24:32 -0700 (PDT)
Subject: Re: [RFC][PATCH] kvm: add suspend pm-notifier
To:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Suleiman Souhlal <suleiman@google.com>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linux-s390@vger.kernel.org,
        Sean Christopherson <seanjc@google.com>,
        Jim Mattson <jmattson@google.com>
References: <20210603164315.682994-1-senozhatsky@chromium.org>
 <87a6o614dn.fsf@vitty.brq.redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e4b4e872-4b22-82b7-57fc-65a7d10482c0@redhat.com>
Date:   Fri, 4 Jun 2021 09:24:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87a6o614dn.fsf@vitty.brq.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/06/21 09:21, Vitaly Kuznetsov wrote:
>>   
>>   	preempt_notifier_inc();
>> +	kvm_init_pm_notifier(kvm);
>>   
> You've probably thought it through and I didn't but wouldn't it be
> easier to have one global pm_notifier call for KVM which would go
> through the list of VMs instead of registering/deregistering a
> pm_notifier call for every created/destroyed VM?

That raises questions on the locking, i.e. if we can we take the 
kvm_lock safely from the notifier.

Paolo

