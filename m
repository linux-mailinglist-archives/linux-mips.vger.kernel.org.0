Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC403552DE
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 13:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343582AbhDFLzU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 07:55:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32368 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243381AbhDFLzU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Apr 2021 07:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617710112;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zk7owICe1peTttMqo4Erpsflm67yyAvd+UqYuEsUbmk=;
        b=cLBqsD6jCcX7knfHDDMhm1h6AJC3Ir6urEURlAMhDjYfso8j9o1qKyG/QuWhd4lGDUW/jO
        2q1Z0AW2a9uTJ9paR6cD46NQCE+KK3JYKBqikNtN8B3nv+X7Mo6XTGQPG4Lwil1gGuOg6B
        JJpd9Hkz6J5FB+2EI4lyKdU1DEM7/GI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-BbcrPt31NDmzQuPgV0tDYg-1; Tue, 06 Apr 2021 07:55:10 -0400
X-MC-Unique: BbcrPt31NDmzQuPgV0tDYg-1
Received: by mail-ej1-f70.google.com with SMTP id bg7so5382299ejb.12
        for <linux-mips@vger.kernel.org>; Tue, 06 Apr 2021 04:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zk7owICe1peTttMqo4Erpsflm67yyAvd+UqYuEsUbmk=;
        b=JhYHCvHsIUS2hAkqlFCpaWor8A71uN1gK9ul/k3R94lZ0bcUwUWIN9vEBvQLu9J6nr
         Emz2Gjw5sSf84Y+O1ZCS68t+yw6OHIoh726yavWuOhhCSihEIYZEN6TQvs5vLVyrK9Zo
         knfKAcls2tnoE3l1d3yjcje2CtCWG5IKU/nFPVECa+ex2myuoRw1UItJKXCG1lgWD3bQ
         L/q1XTxCQBU0D98YBi48EB16KPL2SwODPylwgHtg3ocQTqHOIgTZp7wAWjBrj7ytcH11
         UpgM6ad9Jz+LcKNOz4onB0mh/RD1y9AMDS3P7vyb3/4jCFxaHp0nekZJUDyxf4S5bkC3
         Q0og==
X-Gm-Message-State: AOAM530thSsnfqu43iXxcqJVOKiuhn/I1IzMqUff5bqYMagXphLIkm6y
        dIJK0TqOFm/BcoeflutR97FwQJ9ISAYfslHf8qUefWsMtpDkPNsqkpY1Ik+u3TeDYr3HywCs41J
        UztYKYQYCGtg+spnHw9YwF2BcsmJt7JXmoUUvzLbDk8iKgZWPqMxaaBf3D8SJX6Hcm9awy+Wtdw
        ==
X-Received: by 2002:a05:6402:1051:: with SMTP id e17mr37550611edu.42.1617710108584;
        Tue, 06 Apr 2021 04:55:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt7vEfqu3E+EtKca7ic/h5hAW9ZOPJVZtu/P5HkIDCwYCqlti8U5tedxVhNiXf8T7tpyjU7A==
X-Received: by 2002:a05:6402:1051:: with SMTP id e17mr37550593edu.42.1617710108364;
        Tue, 06 Apr 2021 04:55:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id w25sm8547061edq.66.2021.04.06.04.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 04:55:07 -0700 (PDT)
Subject: Re: [PATCH 2/4] KVM: MIPS: rework flush_shadow_* callbacks into one
 that prepares the flush
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        seanjc@google.com, "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20210402155807.49976-1-pbonzini@redhat.com>
 <20210402155807.49976-3-pbonzini@redhat.com>
 <CAAhV-H4wskLvGD1hhuS2ZDOBNenCcTd_K8GkYn1GOzwnEvTDXQ@mail.gmail.com>
 <aab8a915-6e73-3cba-5392-8f940479a011@redhat.com>
 <CAAhV-H72z9DbbV=_fEhCeeOaP8fQ_qtr4rQMD=f5n08ekG=Ygw@mail.gmail.com>
 <510e59e7-91b0-6754-8fb5-6a936ef47b3c@redhat.com>
 <20210406113957.GB8277@alpha.franken.de>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c0b70a90-3388-858d-2da7-4d7b62fda6db@redhat.com>
Date:   Tue, 6 Apr 2021 13:55:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210406113957.GB8277@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/04/21 13:39, Thomas Bogendoerfer wrote:
> On Tue, Apr 06, 2021 at 08:05:40AM +0200, Paolo Bonzini wrote:
>> On 06/04/21 03:36, Huacai Chen wrote:
>>>> I tried the merge and it will be enough for Linus to remove
>>>> arch/mips/kvm/trap_emul.c.  So I will leave it as is, but next time I'd
>>>> prefer KVM MIPS changes to go through either my tree or a common topic
>>>> branch.
>>> Emmm, the TE removal series is done by Thomas, not me.:)
>>
>> Sure, sorry if the sentence sounded like it was directed to you.  No matter
>> who wrote the code, synchronization between trees is only the maintainers'
>> task. :)
> 
> Sorry about the mess. I'll leave arch/mips/kvm to go via your tree then.

No problem.  In this specific case, at some point I'll pull from 
mips-next, prior to sending the pull request to Linus.  It will look 
just like other KVM submaintainer pulls.

Paolo

