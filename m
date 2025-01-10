Return-Path: <linux-mips+bounces-7385-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F07BEA09A25
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 19:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2613188E0BB
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 18:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031C624B221;
	Fri, 10 Jan 2025 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FSQDr1eX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C5624B22B
	for <linux-mips@vger.kernel.org>; Fri, 10 Jan 2025 18:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534966; cv=none; b=ITBItsQ8EBN3SVZD7gJukbhES0us1toZ4TdmvU85+wQCHUk1CcrC01MSoIvQpNJUZYDhgNmJm0P38QMsoRmonNtVybaw0EZJ6OkciZ/LhsSmZEWBVprdz1KzGT2mio5b8PWed7NIcgMk7JAhhRU1u+7RfBAS+UFbua8HuosNXGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534966; c=relaxed/simple;
	bh=32Fq3qjx4GlhpQdGQFZHoMDpyKy3qYAHjbWT86t6fjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IcH8l48WxAT9bSh6DjfinSyNkrkp8d2VArAaJoWcxH46gAujLLdtvlywglmzh3tmt4fuKcdxtnTJLoNI9xaxGLFD7VtaJHFwE82EtbmH99r7mReasl5KtQB0HXZVSYd55BEHG2wleaLTmpNuGC4OqdTyATWYT1b4BbXoy9xw95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FSQDr1eX; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5d89a53fc46so2716494a12.2
        for <linux-mips@vger.kernel.org>; Fri, 10 Jan 2025 10:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534963; x=1737139763; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGIlyFkOxdGIUAlLSc7B7HeTqLb/6yPSKg6NF5x4oeg=;
        b=FSQDr1eXIPTF/WjSKIRqxmNhW1zB52+L8AlYdJSrcytiqwbse//92QWGTH9OWNhiSH
         4MwywCq5IbmQkATPAzEoZGYkEuWdnbc5+0bYnAH2AiRw6iVkfY2+YuUjzAchJ3BLsRtc
         tuXK9pu/jY6ov3cM6bzE1D0zf0KPNG5F1MvTrtMDEFuMNHLVFvY7bzZuL1seuwg/5EzS
         85Y/Z4JlnoVSEQrE7L8fmS59+bNsKFjGLgcSk4ddHpacB7/NtxfyLuE4vVIkuwHYTDai
         05MLL133xj/Rr58+wPXDb08Eu5wQMETFWRPA6+al6co3mzvBxliI97DwbPSd7Uk1noRF
         tI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534963; x=1737139763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGIlyFkOxdGIUAlLSc7B7HeTqLb/6yPSKg6NF5x4oeg=;
        b=jXtGek22LfQJUvntyrx/UPM5BLKo+HCddUsBjYdHxy/jsqIw0D/7bqUjDV0bTRlosW
         1RCJduzkF4Ddql17rHQlBUHfMmM2ahIyDbH4/NJkZeWARBJp8k9VtmXvrQbjWXVvndhY
         uBCgr3hFvcZcw5vkV8doyAAFoktY7Artrgz5Maa3+1pAM6mL5pWYJk8tLv1QigKahfNj
         La20NEJTyyGq44xygBZIJQq4D+5rNtedZNaJ8YrJIY+mUAc4tC7DoDmf8hBkAJDA24WK
         tqcEcc7pKCYYpA1odMeYCX2i9yiu2YHmTKJ/XFp3PRs6DlkwU4ackQoKk6dquBUizXBp
         VNtw==
X-Forwarded-Encrypted: i=1; AJvYcCUUudK09xc9JWjo6Jpsq8wlnIPBr4wx3ENjRj1Opup2WnJLUf4FavOvyLIovjSTQVaeu6iBM56/QyLj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/bqSJ9HeCri2F+K/FkAeo/EmFTOG2fkzjd63F6dcFD3UKtttH
	Ud5SBp8tDOoSz/4i1iHMbmNlgXqjDbuFDzcCYYkjFrOygjUwaKQmGDGzzSCf5E6qQPYiFLGj8Bd
	9JuuU5pJx+g==
X-Google-Smtp-Source: AGHT+IFRy9/+C5CnBm/ma6a3ETfEwH3prKyhyhclEMfLJAYKbacCY4ZfacRZW3At4TIIMxUaqY38zEy/zVSAnQ==
X-Received: from wmdn10.prod.google.com ([2002:a05:600c:294a:b0:436:d819:e4eb])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5848:b0:436:f3f6:9582 with SMTP id 5b1f17b1804b1-436f3f695dfmr6272215e9.8.1736534497408;
 Fri, 10 Jan 2025 10:41:37 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:49 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-23-8419288bc805@google.com>
Subject: [PATCH RFC v2 23/29] mm: asi: exit ASI before suspend-like operations
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="utf-8"

From: Yosry Ahmed <yosryahmed@google.com>

During suspend-like operations (suspend, hibernate, kexec w/
preserve_context), the processor state (including CR3) is usually saved
and restored later.

In the kexec case, this only happens when KEXEC_PRESERVE_CONTEXT is
used to jump back to the original kernel. In relocate_kernel(), some
registers including CR3 are stored in VA_CONTROL_PAGE. If
preserve_context is set (passed into relocate_kernel() in RCX), after
running the new kernel the code under 'virtual_mapped' restores these
registers. This is similar to what happens in suspend and hibernate.

Note that even when KEXEC_PRESERVE_CONTEXT is not set, relocate_kernel()
still accesses CR3. It mainly reads and writes it to flush the TLB. This
could be problematic and cause improper ASI enters (see below), but it
is assumed to be safe because the kernel will essentially reboot in this
case anyway.

Saving and restoring CR3 in this fashion can cause a problem if the
suspend/hibernate/kexec is performed within an ASI domain. A restricted
CR3 will be saved, and later restored after ASI had potentially already
exited (e.g. from an NMI after CR3 is stored). This will cause an
_improper_ ASI enter, where code starts executing in a restricted
address space, yet ASI metadata (especially curr_asi) says otherwise.

Exit ASI early in all these paths by registering a syscore_suspend()
callback. syscore_suspend() is called in all the above paths (for kexec,
only with KEXEC_PRESERVE_CONTEXT) after IRQs are finally disabled before
the operation. This is not currently strictly required but is convenient
because when ASI gains the ability to persist across context switching,
there will be additional synchronization requirements simplified by
this.

Note: If the CR3 accesses in relocate_kernel() when
KEXEC_PRESERVE_CONTEXT is not set are concerning, they could be handled
by registering a syscore_shutdown() callback to exit ASI.
syscore_shutdown() is called in the kexec path where
KEXEC_PRESERVE_CONTEXT is not set starting commit 7bb943806ff6 ("kexec:
do syscore_shutdown() in kernel_kexec").

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/asi.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index a9f9bfbf85eb47d16ef8d0bfbc7713f07052d3ed..c5073af1a82ded1c6fc467cd7a5d29a39d676bb4 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -6,6 +6,7 @@
 
 #include <linux/init.h>
 #include <linux/pgtable.h>
+#include <linux/syscore_ops.h>
 
 #include <asm/cmdline.h>
 #include <asm/cpufeature.h>
@@ -243,6 +244,32 @@ static int asi_map_percpu(struct asi *asi, void *percpu_addr, size_t len)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int asi_suspend(void)
+{
+	/*
+	 * Must be called after IRQs are disabled and rescheduling is no longer
+	 * possible (so that we cannot re-enter ASI before suspending.
+	 */
+	lockdep_assert_irqs_disabled();
+
+	/*
+	 * Suspend operations sometimes save CR3 as part of the saved state,
+	 * which is restored later (e.g. do_suspend_lowlevel() in the suspend
+	 * path, swsusp_arch_suspend() in the hibernate path, relocate_kernel()
+	 * in the kexec path). Saving a restricted CR3 and restoring it later
+	 * could leave to improperly entering ASI. Exit ASI before such
+	 * operations.
+	 */
+	asi_exit();
+	return 0;
+}
+
+static struct syscore_ops asi_syscore_ops = {
+	.suspend = asi_suspend,
+};
+#endif /* CONFIG_PM_SLEEP */
+
 static int __init asi_global_init(void)
 {
 	int err;
@@ -306,6 +333,10 @@ static int __init asi_global_init(void)
 	asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd,
 		      VMEMMAP_START + (1UL << PGDIR_SHIFT));
 
+#ifdef CONFIG_PM_SLEEP
+	register_syscore_ops(&asi_syscore_ops);
+#endif
+
 	return 0;
 }
 subsys_initcall(asi_global_init)

-- 
2.47.1.613.gc27f4b7a9f-goog


