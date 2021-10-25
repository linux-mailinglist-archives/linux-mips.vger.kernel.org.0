Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF599439AF4
	for <lists+linux-mips@lfdr.de>; Mon, 25 Oct 2021 17:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhJYQAK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 12:00:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40279 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232909AbhJYQAH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Oct 2021 12:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635177465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MCI+8dQa/U6UbsL5gbfoLfO4WAaUcQYsMls2gbgANLc=;
        b=d5fBTafVsle7rlJGdQNqsXio/F72LOo2tQDiG5d8pnwkxANT5JCfW5IUfmH6YSz68+2OF2
        lAqa8X9kupvqCKBQnpBdImbNZ51Ze4GOgRx9pIDgn+blDJGJf+IJq2SdetOZO6PUGA7yLL
        C/y2qcIGdg5S5spV4/4PRPahunXd4rs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-znvLlqGBNB2yRrPtYtWH5w-1; Mon, 25 Oct 2021 11:57:43 -0400
X-MC-Unique: znvLlqGBNB2yRrPtYtWH5w-1
Received: by mail-wm1-f72.google.com with SMTP id k126-20020a1ca184000000b003231d0e329bso3668025wme.4
        for <linux-mips@vger.kernel.org>; Mon, 25 Oct 2021 08:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MCI+8dQa/U6UbsL5gbfoLfO4WAaUcQYsMls2gbgANLc=;
        b=Pn5Z7FB23lPqIeVovIo2y1UZ0gSZbvje3srF2WfsL+38U/1DSqKVYSa/lLFv8pe5ak
         5mclq7DzrPDkACIlWwbwI+cJ+84+9nfXNZxByPUpcX+N9V30OAWQL0TOva3fxz9s1fV7
         rQFgDYaM60N8lvOvaLtYM4+Qasj1NI/ral3Y8AoMjQy9FYO0ZVoR19tH2WgfZvkNoMDP
         CiHiNGrW5TSDn5loFF87FRW0RanUq+U8467meJrCt6eluBkOD3Xn7nt3j1Um4+2v87Oq
         3grGLeV6BPhIwzjvXv2v78gU4qr3TE0u8R8zS3qxLi5h3QvC0LH5x2WeXIAJAQ/xLyAj
         k6wQ==
X-Gm-Message-State: AOAM531p2LtFbscU/y7aOtSJ3RZw2K6A06+/eTvpFKylOIHQQbqqyJIs
        Xc5qYrQFx0a8iqFXkFPDt5N9BcLRgznTjZ+q2zniFVp5vWjU6t3D847zSWSYuAu2wdCxqZ1IGbB
        O1NRf46KnnntXzTlwVuQmSw==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr20601934wme.3.1635177462565;
        Mon, 25 Oct 2021 08:57:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTyw0n0fr/6Esub1t61IkuBW8xshfxOi+C+/6mJQnqMkQEum3VdKMAAqawVcu+H74+uWZwJg==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr20601909wme.3.1635177462345;
        Mon, 25 Oct 2021 08:57:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id q18sm19326723wmc.7.2021.10.25.08.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 08:57:41 -0700 (PDT)
Message-ID: <e9509fb0-54f3-ca86-57b7-8b6d5de240b7@redhat.com>
Date:   Mon, 25 Oct 2021 17:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 37/43] KVM: SVM: Unconditionally mark AVIC as running
 on vCPU load (with APICv)
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
 <20211009021236.4122790-38-seanjc@google.com>
 <acea3c6d-49f4-ab5e-d9fe-6c6a8a665a46@redhat.com>
 <YXbRyMQgMpHVQa3G@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YXbRyMQgMpHVQa3G@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25/10/21 17:48, Sean Christopherson wrote:
> On Mon, Oct 25, 2021, Paolo Bonzini wrote:
>> On 09/10/21 04:12, Sean Christopherson wrote:
>>> +	/* TODO: Document why the unblocking path checks for updates. */
>>
>> Is that a riddle or what? :)
> 
> Yes?  I haven't been able to figure out why the unblocking path explicitly
> checks and handles an APICv update.
> 

Challenge accepted.  In the original code, it was because without it 
avic_vcpu_load would do nothing, and nothing would update the IS_RUNNING 
flag.

It shouldn't be necessary anymore since commit df7e4827c549 ("KVM: SVM: 
call avic_vcpu_load/avic_vcpu_put when enabling/disabling AVIC", 
2021-08-20), where svm_refresh_apicv_exec_ctrl takes care of the 
avic_vcpu_load on the next VMRUN.

Paolo

