Return-Path: <linux-mips+bounces-14499-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP8aCDnu+2m0IgAAu9opvQ
	(envelope-from <linux-mips+bounces-14499-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 03:43:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A024E20DD
	for <lists+linux-mips@lfdr.de>; Thu, 07 May 2026 03:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8694301DEF8
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2026 01:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F155626F29C;
	Thu,  7 May 2026 01:43:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944AE204F8B;
	Thu,  7 May 2026 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778118197; cv=none; b=mg2BbZjAQRwCIhcCc6HpM6KPWhO2A217yZn0R5N2NDQtGwDZfh3oNbaZcyip4tmeCsvVv5dK8do49K+tyy386jVB8eay3uE7oRyD7lAaThKAz3r+8KYPROSBwsI+FiLn5q8OvLbfKUFbENUQoAq0hreZkRlJyaKozLi0QqU00HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778118197; c=relaxed/simple;
	bh=wfkzn5vEOdAO4CItueKY05cY1KoUngcW2ziIYm3VPMY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RLNSmp2Nh1l0MQkKigGHxg8QWnei6PzW2LjVakV0grH2uDsLg4kiaHy22LT/sfjY7LGhIFUorKayY445do69QSubocATAq/a/dfRiPAMWmFoVZ69lIvPdXm69lj4g+XG1ddvfl532g0pXTUgbVaFm+k2Oln31Y97guWvYR3EqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bx0eow7vtpG1UHAA--.24062S3;
	Thu, 07 May 2026 09:43:12 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxacEo7vtpjfx7AA--.25500S3;
	Thu, 07 May 2026 09:43:05 +0800 (CST)
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in
 kvm_arch_flush_shadow_all()
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Gavin Shan <gshan@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>, Ricardo Koller <ricarkol@google.com>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 James Hogan <jhogan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260504224213.1049426-1-jthoughton@google.com>
 <20260504224213.1049426-2-jthoughton@google.com>
 <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
 <aftIbW9G4RfoTuXh@google.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <833b7f62-5e9f-26e7-f60d-2ac1dd24c031@loongson.cn>
Date: Thu, 7 May 2026 09:40:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aftIbW9G4RfoTuXh@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxacEo7vtpjfx7AA--.25500S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr1rJF1DJFWxtw1UKw43twc_yoW5GFyxpF
	WUC3WqgrWDA340kw4kZ3WkWw1FyaykGr4UJw1Ygry5urs8Gwn3KF4SyFy0kFZ7ZrZ7GFWq
	qF45tr95Zas8ZrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2-VyUUUUU
X-Rspamd-Queue-Id: 57A024E20DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maobibo@loongson.cn,linux-mips@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14499-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[loongson.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action



On 2026/5/6 下午9:55, Sean Christopherson wrote:
> On Wed, May 06, 2026, Bibo Mao wrote:
>> On 2026/5/5 上午6:42, James Houghton wrote:
>>> kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
>>> concurrently in the event that the KVM's `mm` is __mmput() at the
>>> same time that last reference to the KVM is being dropped.
>>>
>>> T1              T2
>>> KVM_CREATE_VM
>>>                   Get VM file from T1
>>> close VM
>>> exit_mm()       close VM
>>>
>>> T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>>>       with only the KVM srcu read lock held.
>>>
>>> T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
>>>       kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
>>>       again, with only the KVM srcu read lock held.
>> By looking through the code, kvm_arch_destroy_vm() will free PGD page only,
>> page table walking is executing in deleting memslot or exit_mm().
>>
>> With normal code, life cycle of VM is something like this:
> 
> Not necessarily.  Abruptly closing the VM, as described below, is also "normal"
> (though likely uncommon).
> 
>>    KVM_CREATE_VM
>>      Create_VCPUs
>>      Create memslots
>>      Destroy_VCPUs
> 
> This is incorrect.  KVM doesn't provide any way for userspace to destroy vCPUs.
> Userspace can fully release every vCPU fd, but the vCPU object within KVM stays
> alive (and indirectly reachable) until the VM is destroyed.
yes, that is so. For users, there is vCPU fd release interface. As for 
vCPU object release, it is kind of internal implementation in KVM.
> 
>>      Destroy memslots
>>    close VM
>>    exit_mm()
> 
> Note, exit_mm() may or may not be called.  E.g. there are VMMs that will destroy
> a VM and start a new one (perhaps even the same conceptual virtual machine) in
> the same process / mm_struct / address space.
> 
>> And there is kvm_get_kvm()/kvm_put_kvm() function call with creating/destroy
>> vCPUs, however no such operations with memslot operation. Is it possible
>> that VM is destroyed without removing memslots, such as the following
>> operation.
>>    KVM_CREATE_VM
>>      Create memslots
>>    close VM
>>    exit_mm()
> 
> Yep.  KVM cannot make any assumptions when it comes to userspace-initiated
> operations.  Even a VMM that super strictly follows the first approach may exit
> abruptly, without destroying memslots, e.g. if it's OOM-killed.
oh, I see. If so, the implementation about kvm_arch_destroy_vm() on 
Loongarch is problematic, it needs consider this kind of abnormal VM 
destroy, take page table walk and free page tables. I had thought that 
memslots create/destroy should call kvm_get_kvm()/kvm_put_kvm() :(

Regards
Bibo Mao


