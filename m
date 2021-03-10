Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0217334556
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 18:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhCJRox (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 12:44:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29096 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233219AbhCJRof (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 12:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615398272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hU8ekKHxTbztMp+pHZxvBx516z1N7ENAuWaGaufXY5Q=;
        b=CEHzgvOKJDFpIF6H0RidinLI8oPLMJGZtuWkmT3J3grxhKl1hmMEBRUMN4kB75HH51cbLp
        N4eBk/9h4eaAqPfbG+3qOo8TDwn/U+D7ZMTYfWqTNfl1D6Q69/LjHXXxCI1RZVtNc7xBFU
        1mrFsQI4lpiyWOSODYqfK2+f0HtBGyo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-K_0KynVjOeaO30HryHJfxQ-1; Wed, 10 Mar 2021 12:44:31 -0500
X-MC-Unique: K_0KynVjOeaO30HryHJfxQ-1
Received: by mail-ej1-f70.google.com with SMTP id fy8so7545923ejb.19
        for <linux-mips@vger.kernel.org>; Wed, 10 Mar 2021 09:44:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hU8ekKHxTbztMp+pHZxvBx516z1N7ENAuWaGaufXY5Q=;
        b=e6LfYm1FPUEjBW7KlHhyaLTTTSN96hJajqlrZ6nDMtSqXzjo5D9+8ZKNIaDHfzwW8v
         Ju7gnmBQn0oRoX+yhoZZGffgFdtuofz1aimPHHccgEZLOXyUarvOJvluxSF63qoNBp+f
         jHSwcvKdWHzftI6owVKtLnOhUiG+yxnNLq8yD/XsYRqDFkpb1tdGUllscj5aLNDZpySY
         7FAw+N4sXYZXqzs/cd4VyUihhRYR61kIBIL8i/mMRx8LHHCsCdI8A6UbwNJ0j3gxa0bN
         Gu5QTVxcoeFKwncSEJXhU49Z3vkolvqxz87oGXo4DSgIT862Uyyahq19MGXWVtCKRuy8
         xKKA==
X-Gm-Message-State: AOAM533ORRizHSFfoTS8Z9BepZGMUNxCiPQFB+15riELEKa7s8j2vzEz
        +yr8XHUUSCECDhKw29a+fWJ+kN8wVc8i/60zfdwzgGdhMkY7X6Aw/cUp+/1turk6aFFeaRmuz3o
        7WK+g7xf3iOeTDoyTs214sg==
X-Received: by 2002:aa7:ca02:: with SMTP id y2mr4748916eds.53.1615398270276;
        Wed, 10 Mar 2021 09:44:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG/7Jpsz0wHHG4vrGLPJ/mZ70rGmjD1p1cn8m5yCq4LyuA7dJeziZrVH9s6TVL8ShkHCSIiQ==
X-Received: by 2002:aa7:ca02:: with SMTP id y2mr4748899eds.53.1615398270150;
        Wed, 10 Mar 2021 09:44:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id 90sm11387479edr.69.2021.03.10.09.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 09:44:29 -0800 (PST)
Subject: Re: [RFC PATCH 3/4] KVM: stats: Add ioctl commands to pull statistics
 in binary format
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
        KVM ARM <kvmarm@lists.cs.columbia.edu>,
        Linux MIPS <linux-mips@vger.kernel.org>,
        KVM PPC <kvm-ppc@vger.kernel.org>,
        Linux S390 <linux-s390@vger.kernel.org>,
        Linux kselftest <linux-kselftest@vger.kernel.org>,
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
 <875z1zxb11.wl-maz@kernel.org>
 <a475d935-e404-93dd-4c6d-a5f8038d8f4d@redhat.com>
 <8735x3x7lu.wl-maz@kernel.org>
 <2749fe68-acbb-8f4d-dc76-4cb23edb9b35@redhat.com>
 <871rcmhq43.wl-maz@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fd37d21f-f3ae-d370-f8e1-cf552be3b2ee@redhat.com>
Date:   Wed, 10 Mar 2021 18:44:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <871rcmhq43.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/03/21 18:31, Marc Zyngier wrote:
>> Maintaining VM-global counters would require an atomic instruction and
>> would suffer lots of cacheline bouncing even on architectures that
>> have relaxed atomic memory operations.
> Which is why we have per-cpu counters already. Making use of them
> doesn't seem that outlandish.

But you wouldn't be able to guarantee consistency anyway, would you? 
You *could* copy N*M counters to userspace, but there's no guarantee 
that they are consistent, neither within a single vCPU nor within a 
single counter.

>> Speed/efficiency of retrieving statistics is important, but let's keep
>> in mind that the baseline for comparison is hundreds of syscalls and
>> filesystem lookups.
>
> Having that baseline in the cover letter would be a good start, as
> well as an indication of the frequency this is used at.

Can't disagree, especially on the latter which I have no idea about.

Paolo

