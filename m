Return-Path: <linux-mips+bounces-15665-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rdhEAlAT2p/cwIAu9opvQ
	(envelope-from <linux-mips+bounces-15665-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:30:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D420E72D28A
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:30:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ezKkmXBT;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15665-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15665-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32C0D3003631
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 06:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCCE3CE0B8;
	Thu,  9 Jul 2026 06:30:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304783CEBB1;
	Thu,  9 Jul 2026 06:30:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578629; cv=none; b=BwXDA3bqywG86cpHILVYGfCs/BFEy/kjX3a31Zu5yknDtAGhIpElW120NSGJEGVmlX+JjOs0dvi5QaEU8P+F4Q8f5RGrRHixKuh6qD1vUIGXgjuwnCtlG8J62sChnBUtOZLTpEjBL4vBx5BehT1vliGFHVgw2cG3mXXDPATrwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578629; c=relaxed/simple;
	bh=6wGLoX3NXZmx8A1bQLb97P7/2XQ6DGGFwSWG+T/grFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QQzOOh4pr5eX6cqG72DdpIpqYV5+FU1wB8u7NqUwT2dMtlefo2CC5uBMSuG5WB7wla0N0cwW/xfT3f5e7opY26aHhuLCbcK5WgA7nfD6jHBnHTJpty0r96iZFqWRyMVGpTHCoLQNfoU7uT3W0lVSnYI7vodsRY67ZHgTi1nfypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ezKkmXBT; arc=none smtp.client-ip=113.46.200.216
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XPEUhf19vuUBFdiEFO1XIuZL6JrCsEiMauadhYQeXkI=;
	b=ezKkmXBTzR/qNWnLeDbF+5BJNIo8pxBj9ojrafj3ZsTNYsFYXSZEejUWq4j67MLSYDOtlML8b
	4d5j0Apq64AYWvH9mkFxelT89X6YltSvbtnX3ieBwv4tiM+7+5GgVA1Sav5ubsVZtqfEBcyCMa8
	2mgoep7V9O3WqitLx2zHOl8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4gwlGL6KHvz1T4gk;
	Thu,  9 Jul 2026 14:21:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CAD922012A;
	Thu,  9 Jul 2026 14:30:16 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 14:30:12 +0800
Message-ID: <3ac6d4be-7c57-44c2-80a0-408e2c6f8136@huawei.com>
Date: Thu, 9 Jul 2026 14:30:11 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 02/18] syscall_user_dispatch: Introduce a weak
 fallback for arch_syscall_is_vdso_sigreturn()
To: Mark Rutland <mark.rutland@arm.com>
CC: <oleg@redhat.com>, <richard.henderson@linaro.org>, <mattst88@gmail.com>,
	<linmag7@gmail.com>, <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kees@kernel.org>, <guoren@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <geert@linux-m68k.org>,
	<tsbogend@alpha.franken.de>, <James.Bottomley@hansenpartnership.com>,
	<deller@gmx.de>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
	<borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <richard@nod.at>,
	<anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
	<luto@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <chris@zankel.net>,
	<jcmvbkbc@gmail.com>, <peterz@infradead.org>, <wad@chromium.org>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>,
	<linusw@kernel.org>, <yeoreum.yun@arm.com>, <song@kernel.org>,
	<james.morse@arm.com>, <anshuman.khandual@arm.com>, <broonie@kernel.org>,
	<liqiang01@kylinos.cn>, <pengcan@kylinos.cn>, <ryan.roberts@arm.com>,
	<yangtiezhu@loongson.cn>, <sshegde@linux.ibm.com>, <mchauras@linux.ibm.com>,
	<austin.kim@lge.com>, <jchrist@linux.ibm.com>, <arnd@arndb.de>,
	<thomas.weissschuh@linutronix.de>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <jgross@suse.com>, <kas@kernel.org>,
	<x86@kernel.org>, <linux-alpha@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linux-csky@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-um@lists.infradead.org>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-3-ruanjinjie@huawei.com> <akegeU59jSK9t7FX@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akegeU59jSK9t7FX@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zytor.com,zankel.net,infradead.org,chromium.org,kylinos.cn,loongson.cn,lge.com,arndb.de,linutronix.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-15665-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mark.rutland@arm.com,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:chris@zankel.net,m:jcmvbkbc@gmail.com,m:peterz@infr
 adead.org,m:wad@chromium.org,m:thuth@redhat.com,m:ada.coupriediaz@arm.com,m:kevin.brodsky@arm.com,m:linusw@kernel.org,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,s:l
 ists@lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[83];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:from_mime,huawei.com:dkim,huawei.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D420E72D28A



On 7/3/2026 7:43 PM, Mark Rutland wrote:
> On Mon, Jun 29, 2026 at 09:06:00PM +0800, Jinjie Ruan wrote:
>> Currently, multiple architectures (LoongArch, RISC-V, S390, Powerpc)
>> provide identical stubs for arch_syscall_is_vdso_sigreturn() that simply
>> return false. This results in redundant boilerplate code across the tree.
>>
>> Introduce a default __weak implementation of
>> arch_syscall_is_vdso_sigreturn() directly in syscall_user_dispatch.c that
>> returns false. This allows architectures that do not utilize a vDSO
>> sigreturn to entirely drop their redundant inline definitions.
>>
>> Architectures requiring a specialized check (such as x86) will continue to
>> override this fallback with their strong symbol definitions.
>>
>> Clean up the redundant implementations in loongarch, riscv, s390
>> and powerpc.
> 
>> +bool __weak arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
>> +{
>> +	return false;
>> +}
> 
> If we need this, please make it:
> 
> #ifndef arch_syscall_is_vdso_sigreturn
> static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> {
> 	return false;
> }
> #endif
> 
> ... and require that architectures which need this provide a CPP
> definition.
> 
> The use of __weak is generally problematic, as it prevents the compiler
> form being able to elide code, and gets in the way of symbol resolution.
> It's perfectly fine to require that architectures need to provide a CPP
> definition alongside their own implementation of this function.
> 
> That said, as per my comment on v15, I'd prefer that for now we DO NOT
> enable syscall user dispatch on arm64, and we first make it possible for
> architecture to express whether or not they support that, even if they
> use GENERIC_ENTRY. That might mean this patch isn't necessary right now.

That sounds good. First, focus on switching to generic entry, without
having to implement syscall user dispatch immediately.

> 
> [1] https://lore.kernel.org/linux-arm-kernel/akZgV0Y4YAmB43_g@J2N7QTR9R3.cambridge.arm.com/
> 
> Mark.
> 


