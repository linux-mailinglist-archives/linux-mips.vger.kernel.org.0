Return-Path: <linux-mips+bounces-15046-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7w54LoZhKmrxoQMAu9opvQ
	(envelope-from <linux-mips+bounces-15046-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 09:19:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E76866F53C
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 09:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ilvokhin.com header.s=mail header.b=sy5dx0+f;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15046-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15046-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=ilvokhin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B3B8302E327
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 07:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088C935E937;
	Thu, 11 Jun 2026 07:17:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9821635E950;
	Thu, 11 Jun 2026 07:17:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162275; cv=none; b=GC9lpDkZXL1L1nTqBTdSaJrAIdkZNmkIMmxK1/e8MFF4GnHN++LkK++I+hma/xODJC9hcLWprBQB2wJkDkcMU+nlgU27j0w+a2iNbRMp0oTOLeUMqJi/l6Tl8DdU7F+/n7t9feDOyJxkQhldgvS+o55JAODEns5MLtl1tOIQLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162275; c=relaxed/simple;
	bh=mx7Coopivs4IKxGcY9Afs8u7C5ixpvwisrBYow1ZD3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZSYYBPR49asn/MyYlbqgu18t84SfNSQADm/jCs5+W1td1y3VttJnq22R/MYuRI0tZhQhauGvz5lMMMyBLx3sxFv4W03mIfQyREb25qMimK2wrY9UbhDjX2HmUgdi1O8SROxo4f9SL9TpI52rfyKfaQzcgT/F5aWf3t+w/ZXn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=sy5dx0+f; arc=none smtp.client-ip=178.62.254.231
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id B2D35D1438;
	Thu, 11 Jun 2026 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1781162265;
	bh=SQhvUZ/DbKf6/FrlFmNBUBTYC4OnQ9SUq8CAmtvtmpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sy5dx0+foJ2ScZ4tBYFnB4DhLS92V5pg+v0SGYTkem1nbyFd6xfJTyFf9OYEhfLwJ
	 ZaAc/VbC7/EOornnQ7Y6s4ARfBsV0d9MxWFS+NCaBc1HINhdYGNHKpn29lf2DyNF1K
	 8iW896swJPRi2QnuCHQ4br1eZusJ65henUh4DGAA=
Date: Thu, 11 Jun 2026 07:17:41 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	virtualization@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v6 5/7] locking: Add contended_release tracepoint to
 qspinlock
Message-ID: <aiphFXe_TPNPxZ_n@shell.ilvokhin.com>
References: <cover.1777999826.git.d@ilvokhin.com>
 <5d7ea75ffe74a785e6b234ada9f23c6373d4b4c1.1777999826.git.d@ilvokhin.com>
 <20260513193342.GB2545104@noisy.programming.kicks-ass.net>
 <agXBb0ga_6HJrrnm@shell.ilvokhin.com>
 <20260603120811.GW3493090@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603120811.GW3493090@noisy.programming.kicks-ass.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ilvokhin.com,reject];
	URL_NUMERIC_PRIVATE_IP(0.50)[127.0.0.1];
	R_DKIM_ALLOW(-0.20)[ilvokhin.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15046-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:tsbogend@alpha.franken.de,m:jgross@suse.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:tglx@kernel.org,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:dennis@kernel.org,m:tj@kernel.org,m:cl@gentwo.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-arch@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:kernel-team@meta.com,m:paulmck@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[d@ilvokhin.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[ilvokhin.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,shell.ilvokhin.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E76866F53C

On Wed, Jun 03, 2026 at 02:08:11PM +0200, Peter Zijlstra wrote:
> Also, I think someone should go do some performance runs with
> ARCH_INLINE_SPIN_* set for x86 just like for s390.

As promised, I set ARCH_INLINE_SPIN_UNLOCK{,_BH,_IRQ,_IRQRESTORE} for
x86 and measured the effect on a few real workloads.

Short version: inlining of _raw_spin_unlock() adds measurable kernel
i-cache pressure on every workload I tried, and on a
kernel-i-cache-bound one (nginx connection churn) it costs ~1.27%
throughput. I did not find a workload where it helps.

HOW BENCHMARKS WERE CHOSEN

The cost of inlining unlock is text footprint increase. Every unlock
site grows, and the extra bytes compete for the shared L1i. The bill is
paid by unrelated code, in both kernel and userspace.

Locktorture and similar microbenchmarks can't see this, because they
usually hammer a tiny loop that stays L1i-resident, so they measure
fast-path cycles, where inlining (fewer instructions per unlock) looks
neutral-to-good.

To make the cost visible, the workload has to have real instruction
cache pressure. To achieve that, it has to touch a lot of code.

A good way to screen benchmarks: look for high tma_frontend_bound
fraction from 'perf stat -M TopdownL1' and simultaneously require it to
spend non-trivial time in the kernel (be syscall-heavy).

SETUP

Hardware: 2x Intel Xeon Gold 6138 (Skylake-SP), 20 cores/socket, 40C/80T
with kernel built from locking/core branch. Baseline _raw_spin_unlock()
is out-of-line via UNINLINE_SPIN_UNLOCK=y. Experiment adds the four
selects above (exact patch is at the end of this message). Cache
geometry (lscpu -C):

NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL  SETS PHY-LINE COHERENCY-SIZE
L1d       32K     1.3M    8 Data            1    64        1             64
L1i       32K     1.3M    8 Instruction     1    64        1             64
L2         1M      40M   16 Unified         2  1024        1             64
L3      27.5M      55M   11 Unified         3 40960        1             64

Per run I collected cycles, instructions and L1i-misses. To stay within
the available PMU counters, each run used only 3 events: cycles,
instructions and one L1i filter (:u or :k). The NMI watchdog was off and
every run reported 100% counter enablement (no multiplexing). Userspace
and kernel misses therefore come from separate runs. Each benchmark was
run 20x per side: 10 with the :u counter, 10 with :k.  Cycles,
instructions and throughput are pooled across all 20, each L1i split
comes from its 10.

KERNEL IMAGE SIZE

To give a sense of the code-footprint increase, scripts/bloat-o-meter on
vmlinux, GCC 11, x86_64, defconfig + CONFIG_PARAVIRT_SPINLOCKS=y:

    Total: Before=23838694, After=23977159, chg +0.58%

ROCKSDB (DELETESEQ)

    db_bench -benchmarks=deleteseq

Metric                       Baseline      Experiment     Delta   Sig
----------------------------------------------------------------------
Instructions (total)    9,574,476,543   9,573,602,441    -0.01%   flat
L1i-miss :k (kernel)      198,588,165     216,672,536    +9.11%   **
L1i-miss :u (userspace)   593,276,235     616,433,813    +3.90%   **
Throughput ops/s            431,398         432,897      +0.35%   ns
Cycles (total)          4,681,002,302   4,665,106,876    -0.34%   ns
IPC                          2.045           2.052       +0.33%   ns
Time elapsed (s)            2.4012          2.3865       -0.62%   ns
----------------------------------------------------------------------
L1i-miss: higher = worse. Throughput: higher = better.
** = beyond per-run noise (+-0.1..0.36%), ns = within noise.

At constant instructions, inlining raises L1i misses +9.11% (kernel) and
+3.90% (userspace), both well beyond noise. Throughput, cycles, IPC and
wall-time all stay within run-to-run noise. So the i-cache cost is real,
but at IPC ~2 db_bench isn't fetch-bound at the app level, so it doesn't
surface.

No benefit from _raw_spin_unlock() inlining.

KERNEL BUILD

Building locking/core (defconfig), GCC 11.

    make -j80

Metric              Baseline      Experiment     Delta   Sig
-------------------------------------------------------------
L1i-miss :k          36.72G        37.51G       +2.16%   **
L1i-miss :u         246.99G       246.06G       -0.38%   **
Sys (s)             478.250       482.420       +0.87%   **
Time elapsed (s)    105.221       105.373       +0.14%   ns
User (s)           4022.046      4024.012       +0.05%   flat
Cycles            8,894.10G     8,902.12G       +0.09%   flat
Instructions      8,424.28G     8,426.48G       +0.03%   flat
IPC                   0.947         0.947       -0.06%   flat
-------------------------------------------------------------
L1i-miss/Sys: higher = worse.
** = beyond per-run noise, ns = within noise.

Kernel i-cache misses (+2.16%) and sys time (+0.87%) both rise and are
significant. Wall-time and userspace L1i are flat. Kernel build is
GCC/userspace-bound (User 4022s vs Sys 478s), so the added kernel fetch
cost is real but appears to sit off the critical path.

No benefit from _raw_spin_unlock() inlining.

NGINX

I ran nginx with taskset -c 2.

    perf stat -C 2 ... -- ab -n 100000 -c 80 http://127.0.0.1:8080/

Config for nginx was the following.

  worker_processes 1;
  error_log /tmp/ngx/error.log;
  pid       /tmp/ngx/nginx.pid;
  events { worker_connections 16384; }
  http {
      access_log off;
      server { listen 8080 reuseport; location / { return 200 "ok\n"; } }
  }


I used nginx version 1.20.1 (prebuilt, from CentOS repo).

Metric              Baseline      Experiment     Delta   Sig
------------------------------------------------------------
req/s (ab)           25,113        24,795       -1.27%   **
L1i MPKI :k          70.06         72.10        +2.92%   **
L1i MPKI :u          20.16         20.66        +2.50%   **
instructions          5.86G         5.83G       -0.50%   **
L1i-miss :k           0.41G         0.42G       +2.44%   **
L1i-miss :u           0.12G         0.12G       +1.95%   **
cycles                4.82G         4.81G       -0.28%   ns
IPC                   1.215         1.213       -0.22%   ns
perf time (s)         4.077         4.129       +1.26%   **
failed reqs              0             0          -      valid
------------------------------------------------------------
req/s: higher=better. MPKI: higher=worse.
** = beyond per-run noise, ns = within noise.

nginx connection-churn is the one workload that is genuinely
kernel-fetch-bound: MPKI:k ~70 and IPC ~1.2 (vs db_bench's 2.05). Here
the cost surfaces: req/s −1.27%. Misses rise in both domains (+2.9%
MPKI:k, +2.5% MPKI:u). Unlike kernel build, userspace is hit too,
because nginx runs user and kernel hot on the same core and the kernel
bloat pollutes the shared L1i.

And the kicker: instructions fell 0.5% (inlining removed the call/ret)
yet throughput dropped.

Caveat: ab is single-threaded, so it seems the worker core is
under-saturated: cycles is flat (−0.28%, ns) while wall-time rose
(+1.26%).

Measurable throughput regression from _raw_spin_unlock() inlining.

CONCLUSION

Inlining _raw_spin_unlock() raises kernel L1i misses on every workload.
It's an unconditional cost. Whether it costs the application throughput
depends on how kernel-fetch-bound the workload is.
  
The cost is real everywhere. It only surfaces as throughput regression
where the kernel is on the fetch critical path. And inlining did not
help in any workload I measured. The one micro-effect inlining produced
(-0.5% instructions on nginx) was erased by the added i-cache pressure.


From 99502328caed3c195e20cf194a1e8aa1563f3896 Mon Sep 17 00:00:00 2001
From: Dmitry Ilvokhin <d@ilvokhin.com>
Date: Thu, 4 Jun 2026 07:43:00 -0700
Subject: [PATCH] x86/locking: Inline the spin_unlock()

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 arch/x86/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fdaef60b46d6..c9a0638225fd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -113,6 +113,10 @@ config X86
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAVE_EXTRA_ELF_NOTES
+	select ARCH_INLINE_SPIN_UNLOCK
+	select ARCH_INLINE_SPIN_UNLOCK_BH
+	select ARCH_INLINE_SPIN_UNLOCK_IRQ
+	select ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE
 	select ARCH_MEMORY_ORDER_TSO
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
-- 
2.53.0-Meta


