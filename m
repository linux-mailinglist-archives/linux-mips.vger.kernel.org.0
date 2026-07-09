Return-Path: <linux-mips+bounces-15708-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DyGdDuaJT2qdjAIAu9opvQ
	(envelope-from <linux-mips+bounces-15708-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:45:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176617308DB
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 13:45:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=MAVuwFKe;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15708-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15708-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 290FD3001189
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 11:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C573E416CE6;
	Thu,  9 Jul 2026 11:45:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0503A6B81;
	Thu,  9 Jul 2026 11:45:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597535; cv=none; b=HVuTsTM1LRkxylhE6glKqQBoQXoF55LGI/yPbJ4VuuEdYeqRB+cDgeB4tFHbTNoEbOr39k9CNRo+IvrgoViDO8YotuQ1elbmH8BElVcxoPAZUEdPYbg1EQWr/0LC3HcIOGnKuxqp2sfz2BaRnk1HqBb47XJtwhw3ZEmxl3mBKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597535; c=relaxed/simple;
	bh=Un7xW4dX6fSnZGMFLW1+u2BOgsRj0P0BXsUMvJxUHA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QXgRFMPcSEe0cQv34eehp7N+lm8qUHkDzK9iP54He4JyfC23iEFqy/FB1N7DKD5sR1A9Oss/FKlVm5i7DMOEG6Y8CWE+dT1YgFY5W8IWFQ5+SeRY1VR5f0quWJffnDCg5mAu13b8LMTt8v0qaWj3jZW0LXpHvbUjF8JNmbJqSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=MAVuwFKe; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=auENchSQYPPK/iId01P0BNzV/jUSAPLGspoIqRFWkr0=;
	b=MAVuwFKesjoVK8nwyL9hjaTQK/AmChmdC+pC1jM2XPRG2r9DkpW7J8LudAKbOAyOOVJKwGesP
	fnLIBYKj6d2P3HavsKgAaNCMNvgC+1MS3lwaywLzI4DA8prq+81/QKctwv9CBy0kjeq6qGcgPy5
	4NLrZyru8O6sAjH7EZqwYn4=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gwtFm4cg3z1prLD;
	Thu,  9 Jul 2026 19:36:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 53E0B40575;
	Thu,  9 Jul 2026 19:45:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 9 Jul 2026 19:45:26 +0800
Message-ID: <be58c2a9-e9cd-4f23-ac05-273c20c3d975@huawei.com>
Date: Thu, 9 Jul 2026 19:45:25 +0800
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
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvoN5vvQaW3MdmI@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15708-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,huawei.com:from_mime,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 176617308DB



On 7/7/2026 1:39 AM, Will Deacon wrote:
> Hi Jinjie,
> 
> On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
>> On 6/24/2026 8:16 PM, Will Deacon wrote:
>>> Please just give me the time I asked for. If you want to help out in the
>>> meantime, there are plenty of patches that need reviewing...
>>
>> It was a mistake on my part, and I sincerely apologize for wasting
>> community review resources and disrupting your schedule.
>>
>> I will absolutely back off now and wait for your official series. Lesson
>> learned. Thanks for your patience and for calling me out on this.
> 
> So I've mostly got the old series back on its feet:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

Hi Will,

I tested the boot time on the HIP12 hardware based on your patch, as the
other two boards with 32 cores and 64 cores can only be booted using the
5.10 kernel，but the patches are greatly different, and the adaptation is
complex.

Bringup Time Comparison on real hardware (ms, lower is better):

 |     Platform             | Baseline|   P=0   |   P=1   | Delta(%)|
 | -------------------------| ------- | ------- | ------- | ------- |
 | 288-core server(HIP12)   | 21989.6 | 21989.7 | 12915.3 | 41.3%   |

> 
> but there are still two issues left to resolve:
> 
>   1. The printing that can happen before RCU has started. Although I've
>      reduced this somewhat, there are still error paths in e.g.
>      verify_local_cpu_capabilities() that print a message before dying.
> 
>   2. check_local_cpu_capabilities() can mutate the system capability
>      state via update_cpu_capabilities(), so it's really dodgy running
>      that prior to synchronisation.
> 
> Since you've added patches in this series that try to tackle these
> problems, I'll reply on those two so we can figure out how we would like
> to proceed.
> 
> Cheers,
> 
> Will


