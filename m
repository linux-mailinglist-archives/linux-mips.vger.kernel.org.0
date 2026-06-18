Return-Path: <linux-mips+bounces-15135-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kFWMHsC5M2oPFgYAu9opvQ
	(envelope-from <linux-mips+bounces-15135-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:26:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 286FD69ED93
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 11:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=Ro5n4Dsx;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15135-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15135-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90916302FA5F
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 09:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EA03D8914;
	Thu, 18 Jun 2026 09:26:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5A38F92F;
	Thu, 18 Jun 2026 09:26:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774771; cv=none; b=qmneSaoYR+VPVb/+fz/KLQ6lSCpE9IWkmqsX0JExV2TnHgiUI0N9h0+qiVkmeNsmo4K3JbiyL3DnLIwCrtiMnrbfucdt/nVLPsg06PXVEWND/dH5CfGYssW/1bjLrySCGT6OWqqpvYD69EpdHXKyhSbaq4anG5GunFs0+frTMFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774771; c=relaxed/simple;
	bh=J+jkQ+sXMm8l9Dh0LfGo1lXcyjA6YktgInzmY+Y4cQI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZGeN5JqwEuGez7p5AWB5zf3hCfGfrCSXPQ0xevWv74YW3CMhxh3LVEFAM3TOdJyGBDSBvhdhtKm1H96MDuHkIABRCeMbCgKwtlvtlbQ96OrB9wObsyDsfHrX4FeM0uLzT9GCX/Jci/aVQIcGrqS1wQ5fd+YDURZ0PgL33sR9l8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Ro5n4Dsx; arc=none smtp.client-ip=113.46.200.224
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FXuskZWum2eND8Kqapvq5CnQPejvfWzbZgr0VCqB+mM=;
	b=Ro5n4DsxTcv6kcYs7xwikkAk0E+3gHlYekrLI9Fnl76bnX6pYxu1ksRN3nVu/o8LEnCGulWn4
	NYHbDMn2L8ZXZbDOkC/9bxJ0EO5TjUstPmISyMxyYmOpRKKSfKS2b9EMry/A0gxrQPqInzl7H83
	eyAYjkOIHutvlhnE6ZVBqIA=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ggw9z4mYZz1cyQF;
	Thu, 18 Jun 2026 17:17:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9535440539;
	Thu, 18 Jun 2026 17:25:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jun
 2026 17:25:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
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
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/4] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Thu, 18 Jun 2026 17:24:40 +0800
Message-ID: <20260618092444.1316336-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15135-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,gmail.com,linaro.org,google.com,arndb.de,vger.kernel.org,lists.infradead.org,ventanamicro.com,outlook.com];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:jpoimboe@kernel.org,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:apatel@ventanamicro.com,m:mhklinux@outlook.com,m:ruanjinjie
 @huawei.com,m:menglong8dong@gmail.com,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:mid,huawei.com:from_mime,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 286FD69ED93

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to avoid primary SMT threads
to boot first constraint.

And Add a 'cpu' parameter to update_cpu_boot_status() to allow updating the
boot status at a per-CPU granularity during parallel bringup.

Rework the global `secondary_data` accessed during early boot into
a per-CPU array `cpu_boot_data` to allow secondary CPUs to boot
in parallel.

And reuse `__cpu_logical_map` array in the early boot code in head.S
to resolve each secondary CPU's logical ID concurrently.

Changes in v2:
- Remove RFC.
- Add Tested-by.
- Fix AI review issues in [1].
- Add arch_cpuhp_init_parallel_bringup() to check psci boot.
- Reuse `__cpu_logical_map` instead of a new aray.
- Defer rcutree_report_cpu_starting() until after
  check_local_cpu_capabilities() to prevent a potential control CPU
  deadlock if an early capability check fails.
- Move the assembly in head.S to a macro called `mpidr_to_cpuid`.
- Add `SECONDARY_DATA_SHIFT` for `lsl` to access `cpu_boot_data`.
- Add sizeof(struct secondary_data) power of 2 assert check.
- Expand testing with more data collected from real hardware.

[1] https://sashiko.dev/#/patchset/20260611133809.3854977-1-ruanjinjie%40huawei.com

Jinjie Ruan (4):
  cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
  arm64: smp: Pass CPU ID to update_cpu_boot_status()
  arm64: smp: Defer RCU reporting until after local CPU capability
    checks
  arm64: Add HOTPLUG_PARALLEL support for secondary CPUs

 arch/Kconfig                    |  4 +++
 arch/arm64/Kconfig              |  1 +
 arch/arm64/include/asm/smp.h    | 17 ++++++++++---
 arch/arm64/kernel/asm-offsets.c |  4 +++
 arch/arm64/kernel/cpufeature.c  | 22 ++++++++--------
 arch/arm64/kernel/head.S        | 36 ++++++++++++++++++++++++++
 arch/arm64/kernel/smp.c         | 45 ++++++++++++++++++++++++++++-----
 arch/arm64/mm/context.c         |  4 +--
 arch/mips/Kconfig               |  1 +
 arch/riscv/Kconfig              |  1 +
 arch/x86/Kconfig                |  1 +
 kernel/cpu.c                    |  6 ++++-
 12 files changed, 119 insertions(+), 23 deletions(-)

-- 
2.34.1


