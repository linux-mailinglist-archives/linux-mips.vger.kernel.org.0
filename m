Return-Path: <linux-mips+bounces-15058-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x/ulE+u6Kmp5vwMAu9opvQ
	(envelope-from <linux-mips+bounces-15058-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 15:40:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC1672657
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 15:40:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=Q4cb6JW+;
	dkim=pass header.d=huawei.com header.s=dkim header.b=Q4cb6JW+;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15058-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15058-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0B5E33DF4B9
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 13:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB0E408020;
	Thu, 11 Jun 2026 13:38:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AD3408606;
	Thu, 11 Jun 2026 13:38:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185126; cv=none; b=Jo/CuvEpp+AMuFbC3OQnnoSVzPs8pBX7OZJmyzjDcrRI7lqmcFSIoueIGW2suvLunPyWZI2xcYvX3OCvkgK5pZmhXpKKVmod4DvMf0bjeOmujjx6XhNWnDXixaJ0eBVQQENXfhM3JcABdcLFRb78eahT+3GiTgTJYz1nk9zp7A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185126; c=relaxed/simple;
	bh=Y0eYG4JjRCRyiW6drRchJ7OcmOhXIR3VQR9tnjixIXU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yy9dwlYgSrCibcc4HYtbTTI1OSPxLPoO94Cv809wcw+lajReLzw7WVM8aHyEpsTzhqwwmnkkm4/m7lqMREuzQGCnxR3dJzOa7dvT9M8q8uSRNyq9u9CDtwe/BX+zKz4EJdvStQfQPx/+IJiQpBepmFcSe/3FM5UN80245waE4UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Q4cb6JW+; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Q4cb6JW+; arc=none smtp.client-ip=45.249.212.187
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=L5MJGjgiyYXsGkeqYYWhkEAYdplRJ6vM+lP/xwLDgU0=;
	b=Q4cb6JW+tb/S8ENElUjH4KZyfImN5RGVPnZfI7NXL/rAmJKrC3Sh97W+MX4BH5/cwOIWm/4Qj
	Zy2AajxJdY4DEt7ohGWoNyl6COw6QY7IpcyV2LYvtH5i74eUVyi2vf7nuTL7sDs/lbY+juMBjyZ
	RH56YBf0rJdEHJgrb8Fchew=
Received: from canpmsgout06.his.huawei.com (unknown [172.19.92.157])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gbkHZ0DgSz1BFMZ;
	Thu, 11 Jun 2026 21:38:18 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=L5MJGjgiyYXsGkeqYYWhkEAYdplRJ6vM+lP/xwLDgU0=;
	b=Q4cb6JW+tb/S8ENElUjH4KZyfImN5RGVPnZfI7NXL/rAmJKrC3Sh97W+MX4BH5/cwOIWm/4Qj
	Zy2AajxJdY4DEt7ohGWoNyl6COw6QY7IpcyV2LYvtH5i74eUVyi2vf7nuTL7sDs/lbY+juMBjyZ
	RH56YBf0rJdEHJgrb8Fchew=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gbk6b0dP8zRhQv;
	Thu, 11 Jun 2026 21:30:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AA07B40670;
	Thu, 11 Jun 2026 21:38:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Jun
 2026 21:38:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <ruanjinjie@huawei.com>, <david.kaplan@amd.com>,
	<lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>, <maz@kernel.org>,
	<timothy.hayes@arm.com>, <lpieralisi@kernel.org>, <thuth@redhat.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<tabba@google.com>, <mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH RFC 0/3] arm64: Add HOTPLUG_PARALLEL support for secondary CPUs
Date: Thu, 11 Jun 2026 21:38:06 +0800
Message-ID: <20260611133809.3854977-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:ruanjinjie@huawei.com,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,huawei.com,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15058-lists,linux-mips=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:mid,huawei.com:from_mime];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8FC1672657

Support for parallel secondary CPU bringup is already utilized by x86,
MIPS, and RISC-V. This patch brings this capability to the arm64
architecture.

Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to avoid primary SMT threads
to boot first constraint.

And Add a 'cpu' parameter to update_cpu_boot_status() to allow updating the
boot status at a per-CPU granularity during parallel bringup.

Rework the global `secondary_data` accessed during early boot into
a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
enabling the early boot code in head.S to resolve each secondary CPU's
logical ID concurrently.

Jinjie Ruan (3):
  cpu/hotplug: Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST
  arm64: smp: Pass CPU ID to update_cpu_boot_status()
  arm64: Add HOTPLUG_PARALLEL support for secondary CPUs

 arch/Kconfig                   |  4 ++++
 arch/arm64/Kconfig             |  1 +
 arch/arm64/include/asm/smp.h   | 14 +++++++++++---
 arch/arm64/kernel/cpufeature.c |  2 +-
 arch/arm64/kernel/head.S       | 23 ++++++++++++++++++++++
 arch/arm64/kernel/smp.c        | 35 ++++++++++++++++++++++++++++++----
 arch/arm64/mm/context.c        |  2 +-
 arch/mips/Kconfig              |  1 +
 arch/riscv/Kconfig             |  1 +
 arch/x86/Kconfig               |  1 +
 kernel/cpu.c                   |  6 +++++-
 11 files changed, 80 insertions(+), 10 deletions(-)

-- 
2.34.1


