Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEA245340B
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 15:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237336AbhKPOZJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Nov 2021 09:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44995 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237380AbhKPOZF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Nov 2021 09:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637072527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7lWWPWi0Wsw1vOClqmw0uD7Kp+n7bnIBYYv23z0XPl4=;
        b=L0io7zGs9BF6ABFiSyPGmOqoizpKVU9JanN+82x7ASHVdcqGdFFsW2G4oj3TeWgjnKkzUs
        OzXaesPvB77Ft2OZdIbarkY09wIF9zgdua1MWWwom8H8UD0RjRj2lUMsH/WiAiZgWoHMkJ
        PfbGeb0h7Pmx6VvmWouSr6l74G+kYa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-rGoQUqOlPDaEPcwErS8TUQ-1; Tue, 16 Nov 2021 09:22:01 -0500
X-MC-Unique: rGoQUqOlPDaEPcwErS8TUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18284BBEEF;
        Tue, 16 Nov 2021 14:21:59 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4179B1F429;
        Tue, 16 Nov 2021 14:21:40 +0000 (UTC)
Message-ID: <d0f41b9f-9307-3694-59c8-5a009a2f06a2@redhat.com>
Date:   Tue, 16 Nov 2021 15:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/5] KVM: Turn the vcpu array into an xarray
Content-Language: en-US
To:     Juergen Gross <jgross@suse.com>, Marc Zyngier <maz@kernel.org>,
        kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Sean Christopherson <seanjc@google.com>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        kernel-team@android.com
References: <20211105192101.3862492-1-maz@kernel.org>
 <6232cbcb-b2e2-e79f-a520-43d552f35243@suse.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <6232cbcb-b2e2-e79f-a520-43d552f35243@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/16/21 15:13, Juergen Gross wrote:
> On 05.11.21 20:20, Marc Zyngier wrote:
>> The kvm structure is pretty large. A large portion of it is the vcpu
>> array, which is 4kB on x86_64 and arm64 as they deal with 512 vcpu
>> VMs. Of course, hardly anyone runs VMs this big, so this is often a
>> net waste of memory and cache locality.
>>
>> A possible approach is to turn the fixed-size array into an xarray,
>> which results in a net code deletion after a bit of cleanup.
>>
>> This series is on top of the current linux/master as it touches the
>> RISC-V implementation. Only tested on arm64.
>>
>> Marc Zyngier (5):
>>    KVM: Move wiping of the kvm->vcpus array to common code
>>    KVM: mips: Use kvm_get_vcpu() instead of open-coded access
>>    KVM: s390: Use kvm_get_vcpu() instead of open-coded access
>>    KVM: x86: Use kvm_get_vcpu() instead of open-coded access
>>    KVM: Convert the kvm->vcpus array to a xarray
>>
>>   arch/arm64/kvm/arm.c           | 10 +---------
>>   arch/mips/kvm/loongson_ipi.c   |  4 ++--
>>   arch/mips/kvm/mips.c           | 23 ++---------------------
>>   arch/powerpc/kvm/powerpc.c     | 10 +---------
>>   arch/riscv/kvm/vm.c            | 10 +---------
>>   arch/s390/kvm/kvm-s390.c       | 26 ++++++--------------------
>>   arch/x86/kvm/vmx/posted_intr.c |  2 +-
>>   arch/x86/kvm/x86.c             |  9 +--------
>>   include/linux/kvm_host.h       |  7 ++++---
>>   virt/kvm/kvm_main.c            | 33 ++++++++++++++++++++++++++-------
>>   10 files changed, 45 insertions(+), 89 deletions(-)
>>
> 
> For x86 you can add my:
> 
> Tested-by: Juergen Gross <jgross@suse.com>

Heh, unfortunately x86 is the only one that needs a change in patch 4. 
I'll Cc you on my version.

Paolo

