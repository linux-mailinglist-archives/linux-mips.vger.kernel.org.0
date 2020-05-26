Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08D91BD22E
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 04:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgD2CU3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 22:20:29 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:38163 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726430AbgD2CU3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 22:20:29 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R731e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01355;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0Tx-0ovS_1588126817;
Received: from 30.27.118.60(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0Tx-0ovS_1588126817)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 29 Apr 2020 10:20:19 +0800
Subject: Re: [PATCH v2 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
To:     Thomas Huth <thuth@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>
Cc:     pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
        mpe@ellerman.id.au, benh@kernel.crashing.org,
        frankja@linux.ibm.com, david@redhat.com, heiko.carstens@de.ibm.com,
        gor@linux.ibm.com, sean.j.christopherson@intel.com,
        vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
        joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com, maz@kernel.org,
        james.morse@arm.com, julien.thierry.kdev@gmail.com,
        suzuki.poulose@arm.com, christoffer.dall@arm.com,
        peterx@redhat.com, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200422125810.34847-1-tianjia.zhang@linux.alibaba.com>
 <20200422125810.34847-2-tianjia.zhang@linux.alibaba.com>
 <20200422154543.2efba3dd.cohuck@redhat.com>
 <dc5e0fa3-558b-d606-bda9-ed281cf9e9ae@de.ibm.com>
 <20200422180403.03f60b0c.cohuck@redhat.com>
 <5e1e126d-f1b0-196c-594b-4289d0afb9a8@linux.alibaba.com>
 <20200423123901.72a4c6a4.cohuck@redhat.com>
 <71344f73-c34f-a373-49d1-5d839c6be5f6@linux.alibaba.com>
 <1d73b700-4a20-3d7a-66d1-29b5afa03f4d@de.ibm.com>
 <73f6ecd0-ac47-eaad-0e4f-2d41c2b34450@redhat.com>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <1b8167f2-eb91-5f17-8dc4-dcfaa5bbb075@linux.alibaba.com>
Date:   Wed, 29 Apr 2020 10:20:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <73f6ecd0-ac47-eaad-0e4f-2d41c2b34450@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2020/4/26 20:59, Thomas Huth wrote:
> On 23/04/2020 13.00, Christian Borntraeger wrote:
>>
>>
>> On 23.04.20 12:58, Tianjia Zhang wrote:
>>>
>>>
>>> On 2020/4/23 18:39, Cornelia Huck wrote:
>>>> On Thu, 23 Apr 2020 11:01:43 +0800
>>>> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:
>>>>
>>>>> On 2020/4/23 0:04, Cornelia Huck wrote:
>>>>>> On Wed, 22 Apr 2020 17:58:04 +0200
>>>>>> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>>>>    
>>>>>>> On 22.04.20 15:45, Cornelia Huck wrote:
>>>>>>>> On Wed, 22 Apr 2020 20:58:04 +0800
>>>>>>>> Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:
>>>>>>>>       
>>>>>>>>> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
>>>>>>>>> structure. Earlier than historical reasons, many kvm-related function
>>>>>>>>
>>>>>>>> s/Earlier than/For/ ?
>>>>>>>>       
>>>>>>>>> parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time.
>>>>>>>>> This patch does a unified cleanup of these remaining redundant parameters.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>>>>>>>>> ---
>>>>>>>>>     arch/s390/kvm/kvm-s390.c | 37 ++++++++++++++++++++++---------------
>>>>>>>>>     1 file changed, 22 insertions(+), 15 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
>>>>>>>>> index e335a7e5ead7..d7bb2e7a07ff 100644
>>>>>>>>> --- a/arch/s390/kvm/kvm-s390.c
>>>>>>>>> +++ b/arch/s390/kvm/kvm-s390.c
>>>>>>>>> @@ -4176,8 +4176,9 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
>>>>>>>>>         return rc;
>>>>>>>>>     }
>>>>>>>>>     -static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>>>>>>>>> +static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
>>>>>>>>>     {
>>>>>>>>> +    struct kvm_run *kvm_run = vcpu->run;
>>>>>>>>>         struct runtime_instr_cb *riccb;
>>>>>>>>>         struct gs_cb *gscb;
>>>>>>>>>     @@ -4235,7 +4236,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>>>>>>>>>             }
>>>>>>>>>             if (vcpu->arch.gs_enabled) {
>>>>>>>>>                 current->thread.gs_cb = (struct gs_cb *)
>>>>>>>>> -                        &vcpu->run->s.regs.gscb;
>>>>>>>>> +                        &kvm_run->s.regs.gscb;
>>>>>>>>
>>>>>>>> Not sure if these changes (vcpu->run-> => kvm_run->) are really worth
>>>>>>>> it. (It seems they amount to at least as much as the changes advertised
>>>>>>>> in the patch description.)
>>>>>>>>
>>>>>>>> Other opinions?
>>>>>>>
>>>>>>> Agreed. It feels kind of random. Maybe just do the first line (move kvm_run from the
>>>>>>> function parameter list into the variable declaration)? Not sure if this is better.
>>>>>>>    
>>>>>>
>>>>>> There's more in this patch that I cut... but I think just moving
>>>>>> kvm_run from the parameter list would be much less disruptive.
>>>>>>     
>>>>>
>>>>> I think there are two kinds of code(`vcpu->run->` and `kvm_run->`), but
>>>>> there will be more disruptive, not less.
>>>>
>>>> I just fail to see the benefit; sure, kvm_run-> is convenient, but the
>>>> current code is just fine, and any rework should be balanced against
>>>> the cost (e.g. cluttering git annotate).
>>>>
>>>
>>> cluttering git annotate ? Does it mean Fix xxxx ("comment"). Is it possible to solve this problem by splitting this patch?
>>
>> No its about breaking git blame (and bugfix backports) for just a cosmetic improvement.
> 
> It could be slightly more than a cosmetic improvement (depending on the
> smartness of the compiler): vcpu->run-> are two dereferences, while
> kvm_run-> is only one dereference. So it could be slightly more compact
> and faster code.
> 
>   Thomas
> 

If the compiler is smart enough, this place can be automatically 
optimized, but we can't just rely on the compiler, if not? This requires 
a trade-off between code cleanliness readability and breaking git blame.
In addition, I have removed the changes here and sent a v4 patch. Please 
also help review it.

Thanks and best,
Tianjia
