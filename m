Return-Path: <linux-mips+bounces-15273-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m0BHAS9xQmpu7QkAu9opvQ
	(envelope-from <linux-mips+bounces-15273-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:20:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 694676DB18E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:20:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ggJG6jKI;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15273-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15273-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71875313DC5B
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA17405840;
	Mon, 29 Jun 2026 13:06:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D0405852;
	Mon, 29 Jun 2026 13:06:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738406; cv=none; b=RoQHUwcg1xIr8Bj709qESInM49ECavI7IUZ9oUUlylHrwvDOsrXqCdKBApAF69UnYYtErTI8/fUE6OlsXI4WU7hECtDfUwrn0yXreyl/Oi83Kihvhqrc6ubfD3/HUlZpG26SghO4M4TF1C0JZMCAZGUAm/FTJfE4JOHbj8/VLI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738406; c=relaxed/simple;
	bh=E6yBxDsbIobiV3mkcGtI8sYUBhVKNigngpQ0IiMQ7RU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mq+NIyJq8jyPyz+06Fgx5vVz8djGWUwH99tA9csbTAdbO7bJW91Sz8fUxGmgcDWXXjQwK2CEYVlXicB9tr7Khg7d2mwGp6pW+EkMyY3CEeebAAdnGNIqi2HK2Q9kLHBLiLmhq+j5MYWA9MMa7FixUuGRQVazJQjHDI2oXY5alg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ggJG6jKI; arc=none smtp.client-ip=113.46.200.217
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oqt98KNiCfytd9je3A0RWaDEub1SoEsJvKXmHYAhpA0=;
	b=ggJG6jKIceMr3g60Z1K5gohGiSNMQdcy54004MjW9vQDl4Z3N88jP9qlz2LyqYwtKjt2Ro2Ql
	dcS+ZZElKSN+dQa6pVya75IHqaTPhjRhLpAzzwdE7tX8hwohhA97kSbBzrXBXKbFMyW3jMU6zI0
	YF/YokD8vYpNatFoteOUTNw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gpmXc04PFzcbRd;
	Mon, 29 Jun 2026 20:57:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id EC0DF40579;
	Mon, 29 Jun 2026 21:06:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Jun
 2026 21:06:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <richard.henderson@linaro.org>, <mattst88@gmail.com>,
	<linmag7@gmail.com>, <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kees@kernel.org>, <guoren@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <geert@linux-m68k.org>,
	<tsbogend@alpha.franken.de>, <James.Bottomley@HansenPartnership.com>,
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
	<ruanjinjie@huawei.com>, <thuth@redhat.com>, <mark.rutland@arm.com>,
	<ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>, <linusw@kernel.org>,
	<yeoreum.yun@arm.com>, <song@kernel.org>, <james.morse@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <ryan.roberts@arm.com>, <yangtiezhu@loongson.cn>,
	<sshegde@linux.ibm.com>, <mchauras@linux.ibm.com>, <austin.kim@lge.com>,
	<jchrist@linux.ibm.com>, <arnd@arndb.de>, <thomas.weissschuh@linutronix.de>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>, <jgross@suse.com>,
	<kas@kernel.org>, <x86@kernel.org>, <linux-alpha@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linux-csky@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-um@lists.infradead.org>
Subject: [PATCH v16 00/18] arm64: entry: Convert to Generic Entry
Date: Mon, 29 Jun 2026 21:05:58 +0800
Message-ID: <20260629130616.642022-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:chris@zankel.net,m:jcmvbkbc@gmail.com,m:peterz@infradead.org,m:wad@chromiu
 m.org,m:ruanjinjie@huawei.com,m:thuth@redhat.com,m:mark.rutland@arm.com,m:ada.coupriediaz@arm.com,m:kevin.brodsky@arm.com,m:linusw@kernel.org,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um
 @lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15273-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zytor.com,zankel.net,infradead.org,chromium.org,huawei.com,kylinos.cn,loongson.cn,lge.com,arndb.de,linutronix.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[84];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,huawei.com:dkim,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 694676DB18E

This is the 16th iteration of the patch series. I would like to express
my sincere gratitude to everyone who has contributed to the reviews
and testing across the previous versions, which helped significantly
refine this work.

Currently, architectures such as x86, Riscv, Loongarch use the Generic
Entry, which significantly eases maintenance burden and improves
code elegance. Given that arm64 has already successfully adopted
the Generic IRQ Entry in commit b3cf07851b6c ("arm64: entry: Switch to
generic IRQ entry"), it is now the right time to completely convert arm64
to the Generic Entry infrastructure.

The objective of this series is to bring arm64 in line with other major
architectures, reducing duplicated boilerplate code and simplifying the
sharing of future improvements in entry/exit paths, such as "Syscall User
Dispatch" and "rseq time slice extension" optimizations.

This patch set is rebased on v7.2-rc1. It contains the foundational
updates required for arm64. Following the suggestion from Linus Walleij,
these patches are being submitted separately for inclusion via
the arm64 tree.

Performance benchmarks were conducted on a "Kunpeng HIP09" platform with
kernel auditing enabled. The results are detailed below:

1. perf bench syscall usec/op (-ve is improvement)

        | Syscall | Base        | Generic Entry | change % |
        | ------- | ----------- | ------------- | -------- |
        | basic   | 0.223       | 0.218         | -2.25    |
        | execve  | 799.564     | 787.849       | -1.47    |
        | fork    | 1088.503    | 1096.920      | +0.77    |
        | getpgid | 0.218       |  0.122        | -0.47    |

2. perf bench syscall ops/sec (+ve is improvement)

        | Syscall | Base     | Generic Entry| change % |
        | ------- | -------- | ------------ | -------- |
        | basic   | 4475386  | 4578820      | +2.31    |
        | execve  | 1250     | 1269         | +1.54    |
        | fork    | 918      | 911          | -0.74    |
        | getpgid | 4587781  | 4607488      | +0.43    |

Overall, the syscall performance remains largely neutral, with minor
variations ranging from a 0.8% regression to a 2.3% improvement, which
is within normal measurement tolerance.

Tested successfully on "Kunpeng HIP09" using the following test cases:
 - stress-ng: CPU, Virtual Memory, Syscall, and Interrupt stress tests.
 - hackbench: Evaluated in both thread and pipe modes.
 - kselftests (ptrace): get_syscall_info, set_syscall_info, peeksiginfo.
 - kselftests (breakpoints): breakpoint_test_arm64.
 - kselftests (arm64/abi): syscall-abi and ptrace.
 - kselftests (arm64/fp): fp-ptrace, sve-ptrace, and za-ptrace.
 - kselftests (vDSO): vdso_test_getrandom.
 - Ptrace stress test: tracing stress-ng system calls under load.
 - Pseudo-NMI load test using perf.

Changes in v16:
- Rebased on v7.2-rc1.
- Convert __secure_computing() to return boolean as Thomas suggested.
- Introduce a weak vesion for arch_syscall_is_vdso_sigreturn()
  to simplify the code.
- Split out the implementation of arch_syscall_is_vdso_sigreturn()
  into a separate patch to facilitate reviewing.
- Break down the syscall_exit_to_user_mode_work() refactoring into
  5 smaller, bite-sized patches for easier review and justification.
- Update the comment and commit message as Ada suggeted.
- Clarify patch titles and align title prefixes for consistency.
- Collect Reviewed-by and Tesed-by.
- Link to v15: https://lore.kernel.org/all/20260511092103.1974980-1-ruanjinjie@huawei.com/

Changes in v15:
- Rebased on v7.1-rc1 and Mark's fix patch in [1].
- Solve issues Sashiko AI pointed out, "Fix potential syscall truncation
  in syscall_trace_enter()".
- Make syscall_exit_to_user_mode_work() __always_inline to keep
  the fast-path performance as Sashiko pointed out.

Changes in v14:
- Initialize ret = 0 in syscall_trace_enter().
- Split into two patch sets as Linus Walleij suggested, so this patch set
  can be applied separately to the arm64 tree.
- Rebased on arm64 for-next/core branch.
- Collect Reviewed-by and Acked-by.
- Link to v13 resend: https://lore.kernel.org/all/20260317082020.737779-15-ruanjinjie@huawei.com/

Changes in v13 resend:
- Fix exit_to_user_mode_prepare_legacy() issues.
- Also move TIF_SINGLESTEP to generic TIF infrastructure for loongarch.
- Use generic TIF bits for arm64 and moving TIF_SINGLESTEP to
  generic TIF for related architectures separately.
- Refactor syscall_trace_enter/exit() to accept flags and Use
  syscall_get_nr() helper separately.
- Tested with slice_test for rseq optimizations.
- Add acked-by.
- Link to v13: https://lore.kernel.org/all/20260313094738.3985794-1-ruanjinjie@huawei.com/

Changes in v13:
- Rebased on v7.0-rc3, so drop the firt applied arm64 patch.
- Use generic TIF bits to enables RSEQ optimization.
- Update most of the commit message to make it more clear.
- Link to v12: https://lore.kernel.org/all/20260203133728.848283-1-ruanjinjie@huawei.com/

Changes in v12:
- Rebased on "sched/core", so remove the four generic entry patches.
- Move "Expand secure_computing() in place" and
  "Use syscall_get_arguments() helper" patch forward, which will group all
  non-functional cleanups at the front.
- Adjust the explanation for moving rseq_syscall() before
  audit_syscall_exit().
- Link to v11: https://lore.kernel.org/all/20260128031934.3906955-1-ruanjinjie@huawei.com/

Changes in v11:
- Remove unused syscall in syscall_trace_enter().
- Update and provide a detailed explanation of the differences after
  moving rseq_syscall() before audit_syscall_exit().
- Rebased on arm64 (for-next/entry), and remove the first applied 3 patchs.
- syscall_exit_to_user_mode_work() for arch reuse instead of adding
  new syscall_exit_to_user_mode_work_prepare() helper.
- Link to v10: https://lore.kernel.org/all/20251222114737.1334364-1-ruanjinjie@huawei.com/

Changes in v10:
- Rebased on v6.19-rc1, rename syscall_exit_to_user_mode_prepare() to
  syscall_exit_to_user_mode_work_prepare() to avoid conflict.
- Also inline syscall_trace_enter().
- Support aarch64 for sud_benchmark.
- Update and correct the commit message.
- Add Reviewed-by.
- Link to v9: https://lore.kernel.org/all/20251204082123.2792067-1-ruanjinjie@huawei.com/

Changes in v9:
- Move "Return early for ptrace_report_syscall_entry() error" patch ahead
  to make it not introduce a regression.
- Not check _TIF_SECCOMP/SYSCALL_EMU for syscall_exit_work() in
  a separate patch.
- Do not report_syscall_exit() for PTRACE_SYSEMU_SINGLESTEP in a separate
  patch.
- Add two performance patch to improve the arm64 performance.
- Add Reviewed-by.
- Link to v8: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/

Changes in v8:
- Rename "report_syscall_enter()" to "report_syscall_entry()".
- Add ptrace_save_reg() to avoid duplication.
- Remove unused _TIF_WORK_MASK in a standalone patch.
- Align syscall_trace_enter() return value with the generic version.
- Use "scno" instead of regs->syscallno in el0_svc_common().
- Move rseq_syscall() ahead in a standalone patch to clarify it clearly.
- Rename "syscall_trace_exit()" to "syscall_exit_work()".
- Keep the goto in el0_svc_common().
- No argument was passed to __secure_computing() and check -1 not -1L.
- Remove "Add has_syscall_work() helper" patch.
- Move "Add syscall_exit_to_user_mode_prepare() helper" patch later.
- Add miss header for asm/entry-common.h.
- Update the implementation of arch_syscall_is_vdso_sigreturn().
- Add "ARCH_SYSCALL_WORK_EXIT" to be defined as "SECCOMP | SYSCALL_EMU"
  to keep the behaviour unchanged.
- Add more testcases test.
- Add Reviewed-by.
- Update the commit message.
- Link to v7: https://lore.kernel.org/all/20251117133048.53182-1-ruanjinjie@huawei.com/

Jinjie Ruan (18):
  seccomp: Convert __secure_computing() to return boolean
  syscall_user_dispatch: Introduce a weak fallback for
    arch_syscall_is_vdso_sigreturn()
  arm64: ptrace: Pass thread flags to syscall_trace_enter/exit()
  arm64: ptrace: Use syscall_get_nr() helper for syscall_trace_enter()
  arm64: ptrace: Expand secure_computing() in place
  arm64: ptrace: Use syscall_get_arguments() helper for audit
  arm64: ptrace: Protect rseq_syscall() from tracer PC modifications
  arm64: ptrace: Rename syscall_trace_exit() to syscall_exit_work()
  arm64: syscall: Rework the syscall exit path in el0_svc_common()
  arm64: ptrace: Extract syscall_exit_to_user_mode_work() helper
  arm64: ptrace: Align syscall exit work semantics with generic entry
  arm64: syscall: Use exit-specific flags check in el0_svc_common()
  arm64: syscall: Simplify el0_svc_common() syscall exit path
  arm64: syscall: Simplify syscall exit path in el0_svc_common()
  arm64: ptrace: Skip syscall exit reporting for
    PTRACE_SYSEMU_SINGLESTEP
  arm64: entry: Convert to generic entry
  arm64: Inline el0_svc_common()
  arm64: vdso: Expose sigreturn address on vdso to the kernel

 arch/alpha/kernel/ptrace.c            |   2 +-
 arch/arm/kernel/ptrace.c              |   2 +-
 arch/arm64/Kconfig                    |   2 +-
 arch/arm64/include/asm/elf.h          |   1 +
 arch/arm64/include/asm/entry-common.h |  76 +++++++++++++++++
 arch/arm64/include/asm/syscall.h      |   4 +-
 arch/arm64/include/asm/thread_info.h  |  16 +---
 arch/arm64/kernel/debug-monitors.c    |   8 ++
 arch/arm64/kernel/ptrace.c            | 115 --------------------------
 arch/arm64/kernel/signal.c            |   2 +-
 arch/arm64/kernel/syscall.c           |  30 ++-----
 arch/arm64/kernel/vdso.c              |  16 ++++
 arch/csky/kernel/ptrace.c             |   2 +-
 arch/loongarch/include/asm/syscall.h  |   5 --
 arch/m68k/kernel/ptrace.c             |   2 +-
 arch/mips/kernel/ptrace.c             |   2 +-
 arch/parisc/kernel/ptrace.c           |   2 +-
 arch/powerpc/include/asm/syscall.h    |   5 --
 arch/riscv/include/asm/syscall.h      |   5 --
 arch/s390/include/asm/syscall.h       |   5 --
 arch/sh/kernel/ptrace_32.c            |   2 +-
 arch/um/kernel/skas/syscall.c         |   2 +-
 arch/x86/entry/vsyscall/vsyscall_64.c |   2 +-
 arch/xtensa/kernel/ptrace.c           |   3 +-
 include/linux/entry-common.h          |   7 +-
 include/linux/seccomp.h               |  10 +--
 include/linux/syscall_user_dispatch.h |   1 +
 kernel/entry/syscall_user_dispatch.c  |   5 ++
 kernel/seccomp.c                      |  34 ++++----
 29 files changed, 154 insertions(+), 214 deletions(-)

-- 
2.34.1


