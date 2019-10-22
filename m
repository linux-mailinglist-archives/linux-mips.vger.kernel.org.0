Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA27E0777
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 17:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbfJVPbC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 11:31:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46776 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732239AbfJVPbC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Oct 2019 11:31:02 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A94823688E
        for <linux-mips@vger.kernel.org>; Tue, 22 Oct 2019 15:31:01 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id b10so2328874wmh.6
        for <linux-mips@vger.kernel.org>; Tue, 22 Oct 2019 08:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bYuISgCPeW5+MVYfOIxCD24v5h78aw8/fY5c9Ec2zaE=;
        b=LGXFaWqqARq6ernSvRS2pdwWg53Y016TLoYHQa92Dolr4G8L2RksHOVaOuIfnR78zQ
         47xbrMbQUFJtmFolQNDF4hqr0/MUCNrKJ0S5Etm1ZdPvPxlYwZ24ghI2E+0GkDBNTftS
         8ZTxbx4H/2x2nNarfNBu2U3a/8ge5ROi4UeDJiWVEQMFNrD/j3sFeRLrZTuwpoQVnJdl
         E3f86ZieBoUgdm1628DcYRpgilP8PvBDi5RWoSjTPn/360M13AIfZfKamvvfPJ4RQXJ2
         sG0tkMBLModyMBRR96QZOO9oh9eL54BSDJZST1Wj+A7q6wF3LsMtunu8XlfinECaBe4u
         +yVA==
X-Gm-Message-State: APjAAAXuM81epPG7Csy5O4yigDVZ81VhG7eb82G7PPnZLdQrk1Rh56CL
        jETuWL9bzNKOiQEcorH4ZEb4ywenwL03bqEogZVukbqimCZ6w374c6HTmiVS1xRuIumglTlZw+L
        Ck8kggCtYKm3i/EvH+4Mj6g==
X-Received: by 2002:a7b:c4c6:: with SMTP id g6mr3605227wmk.126.1571758260025;
        Tue, 22 Oct 2019 08:31:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRNIaPW2VC3E0u/tx9jObrvh39A/kSU1/g2oCY4LzK3jFChqIF1uPjGeoTV55xRLqzG4HUGw==
X-Received: by 2002:a7b:c4c6:: with SMTP id g6mr3605195wmk.126.1571758259666;
        Tue, 22 Oct 2019 08:30:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c0e4:dcf4:b543:ce19? ([2001:b07:6468:f312:c0e4:dcf4:b543:ce19])
        by smtp.gmail.com with ESMTPSA id i18sm17512175wrx.14.2019.10.22.08.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2019 08:30:59 -0700 (PDT)
Subject: Re: [PATCH v2 14/15] KVM: Terminate memslot walks via used_slots
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     James Hogan <jhogan@kernel.org>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org
References: <20191022003537.13013-1-sean.j.christopherson@intel.com>
 <20191022003537.13013-15-sean.j.christopherson@intel.com>
 <642f73ee-9425-0149-f4f4-f56be9ae5713@redhat.com>
 <20191022152827.GC2343@linux.intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <625e511f-bd35-3b92-0c6d-550c10fc5827@redhat.com>
Date:   Tue, 22 Oct 2019 17:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191022152827.GC2343@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/10/19 17:28, Sean Christopherson wrote:
> On Tue, Oct 22, 2019 at 04:04:18PM +0200, Paolo Bonzini wrote:
>> On 22/10/19 02:35, Sean Christopherson wrote:
>>> +static inline int kvm_shift_memslots_forward(struct kvm_memslots *slots,
>>> +					     struct kvm_memory_slot *new)
>>> +{
>>> +	struct kvm_memory_slot *mslots = slots->memslots;
>>> +	int i;
>>> +
>>> +	if (WARN_ON_ONCE(slots->id_to_index[new->id] == -1) ||
>>> +	    WARN_ON_ONCE(!slots->used_slots))
>>> +		return -1;
>>> +
>>> +	for (i = slots->id_to_index[new->id]; i < slots->used_slots - 1; i++) {
>>> +		if (new->base_gfn > mslots[i + 1].base_gfn)
>>> +			break;
>>> +
>>> +		WARN_ON_ONCE(new->base_gfn == mslots[i + 1].base_gfn);
>>> +
>>> +		/* Shift the next memslot forward one and update its index. */
>>> +		mslots[i] = mslots[i + 1];
>>> +		slots->id_to_index[mslots[i].id] = i;
>>> +	}
>>> +	return i;
>>> +}
>>> +
>>> +static inline int kvm_shift_memslots_back(struct kvm_memslots *slots,
>>> +					  struct kvm_memory_slot *new,
>>> +					  int start)
>>
>> This new implementation of the insertion sort loses the comments that
>> were there in the old one.  Please keep them as function comments.
> 
> I assume you're talking about this blurb in particular?
> 
> 	 * The ">=" is needed when creating a slot with base_gfn == 0,
> 	 * so that it moves before all those with base_gfn == npages == 0.

Yes, well all of the comments.  You can also keep them in the caller, as
you prefer.

Paolo

