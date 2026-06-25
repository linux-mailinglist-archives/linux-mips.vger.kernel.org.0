Return-Path: <linux-mips+bounces-15198-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ntKHL+FPGowpAgAu9opvQ
	(envelope-from <linux-mips+bounces-15198-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 03:34:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F46C2288
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 03:34:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=rzPGgwZR;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15198-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15198-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C041B3034DEF
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 01:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DF636F902;
	Thu, 25 Jun 2026 01:34:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F732AABD;
	Thu, 25 Jun 2026 01:34:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782351291; cv=none; b=GOxJRPZx4kSCgOeAsAqdtS4K3gl+Z9s2P7JJOCG+t+ODO++G981suk5vERdxeKdUyHQ9gwkeCGMmrnmHLdiKNAMbR7fUpfDohVMHI7C4dkbgWn/aHSe0pkolrodrfJ+eHJycV9pT22E2Hm1W9sEvmWBQSvzDJm78ozx7akb9rs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782351291; c=relaxed/simple;
	bh=sRsHsH4psRm46JJ2K5FLISz3greY/Pbc2LkvDjqAPog=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Eed7kZPwBJzUfxszOGvZMfYg9a5CGpIjw6arC9+DK/S0+NKRIuiZ3sdv9HxGIeD4jChVc+INi6dY4nsAcGyf+pLSDLxelk2/edeIMAqOvBW7v9MVi/Dqb7zty7WUKzR6ZMESjMLFWwT2kAud58j45bBcnITfu8duBaptoSoYeys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rzPGgwZR; arc=none smtp.client-ip=113.46.200.226
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=T0BfrzIU2ix5DJskEM1Wh3op9TvYE7OUzHykA1a7KTg=;
	b=rzPGgwZRFxo1+KyN5i209/XJHzqxOl/KLFCLb88pubrzMXDJ1QXV6/T7MRXTPkry2iotj4wKz
	TR/J/r7udCZozzyPhn4OiRq3p0d+icD//XhGqHC9K+vqdT8PMw8EgILkOKp25kBBRoq9/C2/1FJ
	hoxwASCD474cVEY8GPetQ4g=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gm1Mc0NgGzKm6J;
	Thu, 25 Jun 2026 09:25:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4EF6240562;
	Thu, 25 Jun 2026 09:34:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 09:34:37 +0800
Message-ID: <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
Date: Thu, 25 Jun 2026 09:34:36 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <tsbogend@alpha.franken.de>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <menglong8.dong@gmail.com>, <oupton@kernel.org>,
	<yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>, <broonie@kernel.org>,
	<kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ajvKkLw5bL-FT5JC@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15198-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[arm.com,alpha.franken.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 192F46C2288



On 6/24/2026 8:16 PM, Will Deacon wrote:
> On Wed, Jun 24, 2026 at 05:25:25PM +0800, Jinjie Ruan wrote:
>> Support for parallel secondary CPU bringup is already utilized by x86,
>> MIPS, and RISC-V. This patch brings this capability to the arm64
>> architecture.
>>
>> Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
>> to boot first constraint.
>>
>> And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
>> the boot status at a per-CPU granularity during parallel bringup.
>>
>> Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
>> during early boot into per-CPU arrays to allow secondary CPUs to boot
>> in parallel.
>>
>> And reuse `__cpu_logical_map` array in the early boot code in head.S
>> to resolve each secondary CPU's logical ID concurrently.
>>
>> This series includes a subset of the refactoring patches proposed
>> by Will Deacon, with further adjustments.
> 
> Sheesh, Jinjie, what are you doing?
> 
> I said yesterday that I would dust off the old series after the merge
> window:
> 
>   https://lore.kernel.org/all/ajqYaklhIyvaNLlk@willie-the-truck/
> 
> "Please just give me a week or so to rebase my changes and send them out
>  for discussion"
> 
> but instead, you've posted patches from me that are missing a bunch of
> fixes that need to be folded back in:
> 
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=2d5b8df5d4e2bbc142e3b4f21cabbca96e3da79d
> 

Hi Will,

I am terribly sorry for my impatience and the confusion this has caused.
I completely misread the situation and shouldn't have posted those
incomplete patches, especially when you explicitly asked for a week to
rebase them properly.

> so now you're asking people to review incomplete patches from somebody
> else.
> 
> Please just give me the time I asked for. If you want to help out in the
> meantime, there are plenty of patches that need reviewing...


It was a mistake on my part, and I sincerely apologize for wasting
community review resources and disrupting your schedule.

I will absolutely back off now and wait for your official series. Lesson
learned. Thanks for your patience and for calling me out on this.

Best regards,
Jinjie

> 
> Will
> 


