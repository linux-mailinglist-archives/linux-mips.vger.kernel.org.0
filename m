Return-Path: <linux-mips+bounces-15179-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2bZ8BHSeO2rOaQgAu9opvQ
	(envelope-from <linux-mips+bounces-15179-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:08:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C956BCD12
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:08:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=KphrrQhF;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15179-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15179-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D9DF303EC39
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D7E2EEE94;
	Wed, 24 Jun 2026 09:02:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298A2571B8;
	Wed, 24 Jun 2026 09:02:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291755; cv=none; b=twCCrWiJ84Cnj4lK+poiwRs0UQg+bR7bgLAIFfRgQuJwmBXXldUqrVcA2xUph5u1Bqh6iTf0Efqm1kVG83CvKh/fdPc7mhn+qQ486J3RmYOZFfXzNMnj47Rj9uyF4ZDsiIjW6ANcDSwk7WAv8X89VXYadmektgfJ700sPIfVmgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291755; c=relaxed/simple;
	bh=xaugaN4SRcSWVzL8uQgwvR/d3F2J8bojv7LC0eQ6JJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P3lZWtPumIp2uPbgqfNkDA/aGDJHQPfVLpA2oHhfUV6AJrd+46fs+BZAugEqHSdBFfB/Ew3i4kpufel2I+kY90h6xuCgfE8uR1fZNbiZ40gRBPr+CdYyHlDHnEO7VHsz5ZFF3pkgY5nP9DGDtjglp5ZnFeJf4RZF1JcmqT6Ozic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=KphrrQhF; arc=none smtp.client-ip=113.46.200.221
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iGpO/CT3jlV2FyumnjfQyfpjXbKZKHQNA+rfz8fJAiw=;
	b=KphrrQhFzVOQMqKA0iEo2PFdKqmkk7UmvTlgBnIJd82Tsxa/gLl+9wZdKNN3XQCs+jW3GJQcw
	ek0ztTUD2tbOJM+2td2kz7h8HH4utdZxTsylYi1MDNLULCjcjFY4rqxOviQ6U0tuGz+iZlwrIIC
	LHKvGUtpH7jEZJGAEwK7WRg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4glbLf67BzzRhSc;
	Wed, 24 Jun 2026 16:53:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DA70A40561;
	Wed, 24 Jun 2026 17:02:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 24 Jun 2026 17:02:16 +0800
Message-ID: <e14fa721-0b97-4560-9cd4-83a736db5617@huawei.com>
Date: Wed, 24 Jun 2026 17:02:15 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<jpoimboe@kernel.org>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<ojeda@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<apatel@ventanamicro.com>, <mhklinux@outlook.com>
References: <20260618092444.1316336-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260618092444.1316336-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15179-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:jpoimboe@kernel.org,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:apatel@ventanamicro.com,m:mhklinux@outlook.com,m:menglong8d
 ong@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,gmail.com,linaro.org,google.com,arndb.de,vger.kernel.org,lists.infradead.org,ventanamicro.com,outlook.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:mid,huawei.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55C956BCD12

Please ignore this patchset, will update in v3.

On 6/18/2026 5:24 PM, Jinjie Ruan wrote:
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS, and RISC-V. This patch brings this capability to the arm64
> architecture.
> 
> Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to avoid primary SMT threads
> to boot first constraint.
> 
> And Add a 'cpu' parameter to update_cpu_boot_status() to allow updating the
> boot status at a per-CPU granularity during parallel bringup.
> 
> Rework the global `secondary_data` accessed during early boot into
> a per-CPU array `cpu_boot_data` to allow secondary CPUs to boot
> in parallel.
> 
> And reuse `__cpu_logical_map` array in the early boot code in head.S
> to resolve each secondary CPU's logical ID concurrently.
> 
> Changes in v2:
> - Remove RFC.
> - Add Tested-by.
> - Fix AI review issues in [1].
> - Add arch_cpuhp_init_parallel_bringup() to check psci boot.
> - Reuse `__cpu_logical_map` instead of a new aray.
> - Defer rcutree_report_cpu_starting() until after
>   check_local_cpu_capabilities() to prevent a potential control CPU
>   deadlock if an early capability check fails.
> - Move the assembly in head.S to a macro called `mpidr_to_cpuid`.
> - Add `SECONDARY_DATA_SHIFT` for `lsl` to access `cpu_boot_data`.
> - Add sizeof(struct secondary_data) power of 2 assert check.
> - Expand testing with more data collected from real hardware.
> 
> [1] https://sashiko.dev/#/patchset/20260611133809.3854977-1-ruanjinjie%40huawei.com
> 
> Jinjie Ruan (4):
>   cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
>   arm64: smp: Pass CPU ID to update_cpu_boot_status()
>   arm64: smp: Defer RCU reporting until after local CPU capability
>     checks
>   arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
> 
>  arch/Kconfig                    |  4 +++
>  arch/arm64/Kconfig              |  1 +
>  arch/arm64/include/asm/smp.h    | 17 ++++++++++---
>  arch/arm64/kernel/asm-offsets.c |  4 +++
>  arch/arm64/kernel/cpufeature.c  | 22 ++++++++--------
>  arch/arm64/kernel/head.S        | 36 ++++++++++++++++++++++++++
>  arch/arm64/kernel/smp.c         | 45 ++++++++++++++++++++++++++++-----
>  arch/arm64/mm/context.c         |  4 +--
>  arch/mips/Kconfig               |  1 +
>  arch/riscv/Kconfig              |  1 +
>  arch/x86/Kconfig                |  1 +
>  kernel/cpu.c                    |  6 ++++-
>  12 files changed, 119 insertions(+), 23 deletions(-)
> 


