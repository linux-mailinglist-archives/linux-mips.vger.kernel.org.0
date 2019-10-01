Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D487FC4348
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfJAVz1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:55:27 -0400
Received: from mail-eopbgr730120.outbound.protection.outlook.com ([40.107.73.120]:2512
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727837AbfJAVxO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9nqUkVbTQAMeP/EqPbt4ZCc7ntZuBhZ605MRf8TUdfOFvHdCT0wTHCSGSYwIIsLoOfxV6LGzxp4qIviz7VQD5nbDoYCZg0PNzueUf4wXZiD0FNhwVnuIIZ/eVShJqO+p2Fl3+uxGapkRc/42VMQ1AzMwQWo3GFPPl7/tga/qaUGka23zIoqQPBnKSwI0/8L75aCj1HC7y1XUC1YpZ6WOQsQyXAjf1DCKhATK5hVyGzm97ROi/Vzk7SsFfy3sBCVQ3RjyRTxQizBSFyne9YSEWE53kIcLX6KloUjxVITYXTkcdW46RqzHG6pV9+CqMPeqfEV/M4PR38bqioeWGhFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZijVaOdshKvJY5MXwlhr+TyDa9K427v6WimtCe1uBuo=;
 b=RiyMiM7rIa2p4Wi8TOP0oUALZCyZHVGRJCL8ogJZf418o6dSM3pY6qZF4228jBA2Ysm9u6I1ziflKAtFYhFWwI2n0VC7PPOfFUVSArH8RCXZs4Dx5QhQw0zIuzI6xuyjL+AXUHC7Z1JlNnhV9sK0kzm5dxiYMYCLvZGE0N9qCSHt5XlHtonHGqkyfvA3urOCP93tYDoCG/kP/mo3gYZy1T33k9qNY/cj1aLZTLqGTLyuee0XLJVHCb/KwgIibCumfp4vVNMzPQqC8EkwFo5vkNq9xbiQG8DGaoZJgOtO2RvmDuKy30C3dPyYHa3usAzVx5pmmX+kRdobLSCuuBsAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZijVaOdshKvJY5MXwlhr+TyDa9K427v6WimtCe1uBuo=;
 b=OeSma3KSyS3BEoIKfDXcqQi+SbWMDIHGuWnemR/rrDe+bn8aTMpMUmGsRFvbCZ2QeAOFjkUXgADuUy93FrKAZUdksVi5mPP6tg+Y9PV/V4B3DrM63UtmQbf2Y7wq/qBUVdVLVbpW8+vopO0K2GazRUL3oJG8vssOXbb6WP5xnFs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1213.namprd22.prod.outlook.com (10.172.61.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:07 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:07 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 03/36] MIPS: barrier: Add __SYNC() infrastructure
Thread-Topic: [PATCH v2 03/36] MIPS: barrier: Add __SYNC() infrastructure
Thread-Index: AQHVeKKc6Rl/g0nKvEmoZDEKJD6FHg==
Date:   Tue, 1 Oct 2019 21:53:07 +0000
Message-ID: <20191001215249.4157062-4-paul.burton@mips.com>
References: <20191001215249.4157062-1-paul.burton@mips.com>
In-Reply-To: <20191001215249.4157062-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fd0d350-ea89-4bd5-1dca-08d746b9be8b
x-ms-traffictypediagnostic: MWHPR2201MB1213:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12135D7A6CF21C886881876DC19D0@MWHPR2201MB1213.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(136003)(39840400004)(199004)(189003)(6306002)(6512007)(5640700003)(54906003)(2501003)(3846002)(6486002)(5660300002)(30864003)(6436002)(66066001)(6116002)(1076003)(50226002)(2906002)(76176011)(52116002)(6506007)(107886003)(2351001)(4326008)(6916009)(102836004)(71190400001)(8936002)(386003)(25786009)(36756003)(44832011)(8676002)(71200400001)(81166006)(81156014)(186003)(256004)(11346002)(14444005)(2616005)(7736002)(316002)(966005)(42882007)(305945005)(99286004)(66446008)(64756008)(66556008)(478600001)(66946007)(66476007)(486006)(446003)(476003)(14454004)(26005)(579004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1213;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W2Z+Nt6gpkpW9Pe4FN27YZRYO4LNbqz1n08LLuZwxkGyXHQugmypk9o8Hy4FHLpN+Y/Phk5QH+gF3QMtVj1dCjsNJOiKKE5j2UUXatMwnsdfUvi8XL7cwOIC2UX+rMkz5HplEz4FVWgTBekRFLR/NKV9Q5eQon3191xLM7/4StxKRCJvC5BBCYM1+onxcZX+fZWa+Ow9/1ysBWw3D6V4HPWg65NC4qwmZkPJQO9I5BGxx6htGRtZvz0Kc+32AdbwCf0sw0ZECmXWEFvltdu4DHhJKCdJy32nA5GDOLLlaMMBV41HVIKrIQiThOEAprVOmaB2VL2wsIyO+Nak4oQuRBMZHwWGhRISwaoTPCTGFsmH/hakPlk1XKjmqtJfhibucy9Es5npGNTUuTSjEqSMmQjym0ddZ47H/TPFTsK4R42E+PKffwNi6ePLP6bcgnwI4Hfz9lNWghw1AyvoyRx8uA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd0d350-ea89-4bd5-1dca-08d746b9be8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:07.8615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCjK89sGPdvAo6U8T+qcnZ3hS7fbKWcb+LGONNtJNUdURJq6I+V+xCqYjc3DR4P6oF4LKNriM7+iw/BauG1CZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1213
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Introduce an asm/sync.h header which provides infrastructure that can be
used to generate sync instructions of various types, and for various
reasons. For example if we need a sync instruction that provides a full
completion barrier but only on systems which have weak memory ordering,
we can generate the appropriate assembly code using:

  __SYNC(full, weak_ordering)

When the kernel is configured to run on systems with weak memory
ordering (ie. CONFIG_WEAK_ORDERING is selected) we'll emit a sync
instruction. When the kernel is configured to run on systems with strong
memory ordering (ie. CONFIG_WEAK_ORDERING is not selected) we'll emit
nothing. The caller doesn't need to know which happened - it simply says
what it needs & when, with no concern for checking the kernel
configuration.

There are some scenarios in which we may want to emit code only when we
*didn't* emit a sync instruction. For example, some Loongson3 CPUs
suffer from a bug that requires us to emit a sync instruction prior to
each ll instruction (enabled by CONFIG_CPU_LOONGSON3_WORKAROUNDS). In
cases where this bug workaround is enabled, it's wasteful to then have
more generic code emit another sync instruction to provide barriers we
need in general. A __SYNC_ELSE() macro allows for this, providing an
extra argument that contains code to be assembled only in cases where
the sync instruction was not emitted. For example if we have a scenario
in which we generally want to emit a release barrier but for affected
Loongson3 configurations upgrade that to a full completion barrier, we
can do that like so:

  __SYNC_ELSE(full, loongson3_war, __SYNC(rl, always))

The assembly generated by these macros can be used either as inline
assembly or in assembly source files.

Differing types of sync as provided by MIPSr6 are defined, but currently
they all generate a full completion barrier except in kernels configured
for Cavium Octeon systems. There the wmb sync-type is used, and rmb
syncs are omitted, as has been the case since commit 6b07d38aaa52
("MIPS: Octeon: Use optimized memory barrier primitives."). Using
__SYNC() with the wmb or rmb types will abstract away the Octeon
specific behavior and allow us to later clean up asm/barrier.h code that
currently includes a plethora of #ifdef's.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/barrier.h | 113 +----------------
 arch/mips/include/asm/sync.h    | 207 ++++++++++++++++++++++++++++++++
 arch/mips/kernel/pm-cps.c       |  20 +--
 3 files changed, 219 insertions(+), 121 deletions(-)
 create mode 100644 arch/mips/include/asm/sync.h

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index 9228f7386220..5ad39bfd3b6d 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -9,116 +9,7 @@
 #define __ASM_BARRIER_H
=20
 #include <asm/addrspace.h>
-
-/*
- * Sync types defined by the MIPS architecture (document MD00087 table 6.5=
)
- * These values are used with the sync instruction to perform memory barri=
ers.
- * Types of ordering guarantees available through the SYNC instruction:
- * - Completion Barriers
- * - Ordering Barriers
- * As compared to the completion barrier, the ordering barrier is a
- * lighter-weight operation as it does not require the specified instructi=
ons
- * before the SYNC to be already completed. Instead it only requires that =
those
- * specified instructions which are subsequent to the SYNC in the instruct=
ion
- * stream are never re-ordered for processing ahead of the specified
- * instructions which are before the SYNC in the instruction stream.
- * This potentially reduces how many cycles the barrier instruction must s=
tall
- * before it completes.
- * Implementations that do not use any of the non-zero values of stype to =
define
- * different barriers, such as ordering barriers, must make those stype va=
lues
- * act the same as stype zero.
- */
-
-/*
- * Completion barriers:
- * - Every synchronizable specified memory instruction (loads or stores or=
 both)
- *   that occurs in the instruction stream before the SYNC instruction mus=
t be
- *   already globally performed before any synchronizable specified memory
- *   instructions that occur after the SYNC are allowed to be performed, w=
ith
- *   respect to any other processor or coherent I/O module.
- *
- * - The barrier does not guarantee the order in which instruction fetches=
 are
- *   performed.
- *
- * - A stype value of zero will always be defined such that it performs th=
e most
- *   complete set of synchronization operations that are defined.This mean=
s
- *   stype zero always does a completion barrier that affects both loads a=
nd
- *   stores preceding the SYNC instruction and both loads and stores that =
are
- *   subsequent to the SYNC instruction. Non-zero values of stype may be d=
efined
- *   by the architecture or specific implementations to perform synchroniz=
ation
- *   behaviors that are less complete than that of stype zero. If an
- *   implementation does not use one of these non-zero values to define a
- *   different synchronization behavior, then that non-zero value of stype=
 must
- *   act the same as stype zero completion barrier. This allows software w=
ritten
- *   for an implementation with a lighter-weight barrier to work on anothe=
r
- *   implementation which only implements the stype zero completion barrie=
r.
- *
- * - A completion barrier is required, potentially in conjunction with SSN=
OP (in
- *   Release 1 of the Architecture) or EHB (in Release 2 of the Architectu=
re),
- *   to guarantee that memory reference results are visible across operati=
ng
- *   mode changes. For example, a completion barrier is required on some
- *   implementations on entry to and exit from Debug Mode to guarantee tha=
t
- *   memory effects are handled correctly.
- */
-
-/*
- * stype 0 - A completion barrier that affects preceding loads and stores =
and
- * subsequent loads and stores.
- * Older instructions which must reach the load/store ordering point befor=
e the
- * SYNC instruction completes: Loads, Stores
- * Younger instructions which must reach the load/store ordering point onl=
y
- * after the SYNC instruction completes: Loads, Stores
- * Older instructions which must be globally performed when the SYNC instr=
uction
- * completes: Loads, Stores
- */
-#define STYPE_SYNC 0x0
-
-/*
- * Ordering barriers:
- * - Every synchronizable specified memory instruction (loads or stores or=
 both)
- *   that occurs in the instruction stream before the SYNC instruction mus=
t
- *   reach a stage in the load/store datapath after which no instruction
- *   re-ordering is possible before any synchronizable specified memory
- *   instruction which occurs after the SYNC instruction in the instructio=
n
- *   stream reaches the same stage in the load/store datapath.
- *
- * - If any memory instruction before the SYNC instruction in program orde=
r,
- *   generates a memory request to the external memory and any memory
- *   instruction after the SYNC instruction in program order also generate=
s a
- *   memory request to external memory, the memory request belonging to th=
e
- *   older instruction must be globally performed before the time the memo=
ry
- *   request belonging to the younger instruction is globally performed.
- *
- * - The barrier does not guarantee the order in which instruction fetches=
 are
- *   performed.
- */
-
-/*
- * stype 0x10 - An ordering barrier that affects preceding loads and store=
s and
- * subsequent loads and stores.
- * Older instructions which must reach the load/store ordering point befor=
e the
- * SYNC instruction completes: Loads, Stores
- * Younger instructions which must reach the load/store ordering point onl=
y
- * after the SYNC instruction completes: Loads, Stores
- * Older instructions which must be globally performed when the SYNC instr=
uction
- * completes: N/A
- */
-#define STYPE_SYNC_MB 0x10
-
-/*
- * stype 0x14 - A completion barrier specific to global invalidations
- *
- * When a sync instruction of this type completes any preceding GINVI or G=
INVT
- * operation has been globalized & completed on all coherent CPUs. Anythin=
g
- * that the GINV* instruction should invalidate will have been invalidated=
 on
- * all coherent CPUs when this instruction completes. It is implementation
- * specific whether the GINV* instructions themselves will ensure completi=
on,
- * or this sync type will.
- *
- * In systems implementing global invalidates (ie. with Config5.GI =3D=3D =
2 or 3)
- * this sync type also requires that previous SYNCI operations have comple=
ted.
- */
-#define STYPE_GINV	0x14
+#include <asm/sync.h>
=20
 #ifdef CONFIG_CPU_HAS_SYNC
 #define __sync()				\
@@ -286,7 +177,7 @@
=20
 static inline void sync_ginv(void)
 {
-	asm volatile("sync\t%0" :: "i"(STYPE_GINV));
+	asm volatile("sync\t%0" :: "i"(__SYNC_ginv));
 }
=20
 #include <asm-generic/barrier.h>
diff --git a/arch/mips/include/asm/sync.h b/arch/mips/include/asm/sync.h
new file mode 100644
index 000000000000..7c6a1095f556
--- /dev/null
+++ b/arch/mips/include/asm/sync.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __MIPS_ASM_SYNC_H__
+#define __MIPS_ASM_SYNC_H__
+
+/*
+ * sync types are defined by the MIPS64 Instruction Set documentation in V=
olume
+ * II-A of the MIPS Architecture Reference Manual, which can be found here=
:
+ *
+ *   https://www.mips.com/?do-download=3Dthe-mips64-instruction-set-v6-06
+ *
+ * Two types of barrier are provided:
+ *
+ *   1) Completion barriers, which ensure that a memory operation has actu=
ally
+ *      completed & often involve stalling the CPU pipeline to do so.
+ *
+ *   2) Ordering barriers, which only ensure that affected memory operatio=
ns
+ *      won't be reordered in the CPU pipeline in a manner that violates t=
he
+ *      restrictions imposed by the barrier.
+ *
+ * Ordering barriers can be more efficient than completion barriers, since=
:
+ *
+ *   a) Ordering barriers only require memory access instructions which pr=
eceed
+ *      them in program order (older instructions) to reach a point in the
+ *      load/store datapath beyond which reordering is not possible before
+ *      allowing memory access instructions which follow them (younger
+ *      instructions) to be performed.  That is, older instructions don't
+ *      actually need to complete - they just need to get far enough that =
all
+ *      other coherent CPUs will observe their completion before they obse=
rve
+ *      the effects of younger instructions.
+ *
+ *   b) Multiple variants of ordering barrier are provided which allow the
+ *      effects to be restricted to different combinations of older or you=
nger
+ *      loads or stores. By way of example, if we only care that stores ol=
der
+ *      than a barrier are observed prior to stores that are younger than =
a
+ *      barrier & don't care about the ordering of loads then the 'wmb'
+ *      ordering barrier can be used. Limiting the barrier's effects to st=
ores
+ *      allows loads to continue unaffected & potentially allows the CPU t=
o
+ *      make progress faster than if younger loads had to wait for older s=
tores
+ *      to complete.
+ */
+
+/*
+ * No sync instruction at all; used to allow code to nullify the effect of=
 the
+ * __SYNC() macro without needing lots of #ifdefery.
+ */
+#define __SYNC_none	-1
+
+/*
+ * A full completion barrier; all memory accesses appearing prior to this =
sync
+ * instruction in program order must complete before any memory accesses
+ * appearing after this sync instruction in program order.
+ */
+#define __SYNC_full	0x00
+
+/*
+ * For now we use a full completion barrier to implement all sync types, u=
ntil
+ * we're satisfied that lightweight ordering barriers defined by MIPSr6 ar=
e
+ * sufficient to uphold our desired memory model.
+ */
+#define __SYNC_aq	__SYNC_full
+#define __SYNC_rl	__SYNC_full
+#define __SYNC_mb	__SYNC_full
+
+/*
+ * ...except on Cavium Octeon CPUs, which have been using the 'wmb' orderi=
ng
+ * barrier since 2010 & omit 'rmb' barriers because the CPUs don't perform
+ * speculative reads.
+ */
+#ifdef CONFIG_CPU_CAVIUM_OCTEON
+# define __SYNC_rmb	__SYNC_none
+# define __SYNC_wmb	0x04
+#else
+# define __SYNC_rmb	__SYNC_full
+# define __SYNC_wmb	__SYNC_full
+#endif
+
+/*
+ * A GINV sync is a little different; it doesn't relate directly to loads =
or
+ * stores, but instead causes synchronization of an icache or TLB global
+ * invalidation operation triggered by the ginvi or ginvt instructions
+ * respectively. In cases where we need to know that a ginvi or ginvt oper=
ation
+ * has been performed by all coherent CPUs, we must issue a sync instructi=
on of
+ * this type. Once this instruction graduates all coherent CPUs will have
+ * observed the invalidation.
+ */
+#define __SYNC_ginv	0x14
+
+/* Trivial; indicate that we always need this sync instruction. */
+#define __SYNC_always	(1 << 0)
+
+/*
+ * Indicate that we need this sync instruction only on systems with weakly
+ * ordered memory access. In general this is most MIPS systems, but there =
are
+ * exceptions which provide strongly ordered memory.
+ */
+#ifdef CONFIG_WEAK_ORDERING
+# define __SYNC_weak_ordering	(1 << 1)
+#else
+# define __SYNC_weak_ordering	0
+#endif
+
+/*
+ * Indicate that we need this sync instruction only on systems where LL/SC
+ * don't implicitly provide a memory barrier. In general this is most MIPS
+ * systems.
+ */
+#ifdef CONFIG_WEAK_REORDERING_BEYOND_LLSC
+# define __SYNC_weak_llsc	(1 << 2)
+#else
+# define __SYNC_weak_llsc	0
+#endif
+
+/*
+ * Some Loongson 3 CPUs have a bug wherein execution of a memory access (l=
oad,
+ * store or prefetch) in between an LL & SC can cause the SC instruction t=
o
+ * erroneously succeed, breaking atomicity. Whilst it's unusual to write c=
ode
+ * containing such sequences, this bug bites harder than we might otherwis=
e
+ * expect due to reordering & speculation:
+ *
+ * 1) A memory access appearing prior to the LL in program order may actua=
lly
+ *    be executed after the LL - this is the reordering case.
+ *
+ *    In order to avoid this we need to place a memory barrier (ie. a SYNC
+ *    instruction) prior to every LL instruction, in between it and any ea=
rlier
+ *    memory access instructions.
+ *
+ *    This reordering case is fixed by 3A R2 CPUs, ie. 3A2000 models and l=
ater.
+ *
+ * 2) If a conditional branch exists between an LL & SC with a target outs=
ide
+ *    of the LL-SC loop, for example an exit upon value mismatch in cmpxch=
g()
+ *    or similar, then misprediction of the branch may allow speculative
+ *    execution of memory accesses from outside of the LL-SC loop.
+ *
+ *    In order to avoid this we need a memory barrier (ie. a SYNC instruct=
ion)
+ *    at each affected branch target.
+ *
+ *    This case affects all current Loongson 3 CPUs.
+ *
+ * The above described cases cause an error in the cache coherence protoco=
l;
+ * such that the Invalidate of a competing LL-SC goes 'missing' and SC
+ * erroneously observes its core still has Exclusive state and lets the SC
+ * proceed.
+ *
+ * Therefore the error only occurs on SMP systems.
+ */
+#ifdef CONFIG_CPU_LOONGSON3_WORKAROUNDS
+# define __SYNC_loongson3_war	(1 << 31)
+#else
+# define __SYNC_loongson3_war	0
+#endif
+
+/*
+ * Some Cavium Octeon CPUs suffer from a bug that causes a single wmb orde=
ring
+ * barrier to be ineffective, requiring the use of 2 in sequence to provid=
e an
+ * effective barrier as noted by commit 6b07d38aaa52 ("MIPS: Octeon: Use
+ * optimized memory barrier primitives."). Here we specify that the affect=
ed
+ * sync instructions should be emitted twice.
+ */
+#ifdef CONFIG_CPU_CAVIUM_OCTEON
+# define __SYNC_rpt(type)	(1 + (type =3D=3D __SYNC_wmb))
+#else
+# define __SYNC_rpt(type)	1
+#endif
+
+/*
+ * The main event. Here we actually emit a sync instruction of a given typ=
e, if
+ * reason is non-zero.
+ *
+ * In future we have the option of emitting entries in a fixups-style tabl=
e
+ * here that would allow us to opportunistically remove some sync instruct=
ions
+ * when we detect at runtime that we're running on a CPU that doesn't need
+ * them.
+ */
+#ifdef CONFIG_CPU_HAS_SYNC
+# define ____SYNC(_type, _reason, _else)			\
+	.if	(( _type ) !=3D -1) && ( _reason );		\
+	.set	push;						\
+	.set	MIPS_ISA_LEVEL_RAW;				\
+	.rept	__SYNC_rpt(_type);				\
+	sync	_type;						\
+	.endr;							\
+	.set	pop;						\
+	.else;							\
+	_else;							\
+	.endif
+#else
+# define ____SYNC(_type, _reason, _else)
+#endif
+
+/*
+ * Preprocessor magic to expand macros used as arguments before we insert =
them
+ * into assembly code.
+ */
+#ifdef __ASSEMBLY__
+# define ___SYNC(type, reason, else)				\
+	____SYNC(type, reason, else)
+#else
+# define ___SYNC(type, reason, else)				\
+	__stringify(____SYNC(type, reason, else))
+#endif
+
+#define __SYNC(type, reason)					\
+	___SYNC(__SYNC_##type, __SYNC_##reason, )
+#define __SYNC_ELSE(type, reason, else)				\
+	___SYNC(__SYNC_##type, __SYNC_##reason, else)
+
+#endif /* __MIPS_ASM_SYNC_H__ */
diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index a26f40db15d0..9bf60d7d44d3 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -307,7 +307,7 @@ static int cps_gen_flush_fsb(u32 **pp, struct uasm_labe=
l **pl,
 	}
=20
 	/* Barrier ensuring previous cache invalidates are complete */
-	uasm_i_sync(pp, STYPE_SYNC);
+	uasm_i_sync(pp, __SYNC_full);
 	uasm_i_ehb(pp);
=20
 	/* Check whether the pipeline stalled due to the FSB being full */
@@ -397,7 +397,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
=20
 	if (coupled_coherence) {
 		/* Increment ready_count */
-		uasm_i_sync(&p, STYPE_SYNC_MB);
+		uasm_i_sync(&p, __SYNC_mb);
 		uasm_build_label(&l, p, lbl_incready);
 		uasm_i_ll(&p, t1, 0, r_nc_count);
 		uasm_i_addiu(&p, t2, t1, 1);
@@ -406,7 +406,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 		uasm_i_addiu(&p, t1, t1, 1);
=20
 		/* Barrier ensuring all CPUs see the updated r_nc_count value */
-		uasm_i_sync(&p, STYPE_SYNC_MB);
+		uasm_i_sync(&p, __SYNC_mb);
=20
 		/*
 		 * If this is the last VPE to become ready for non-coherence
@@ -473,7 +473,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 			      Index_Writeback_Inv_D, lbl_flushdcache);
=20
 	/* Barrier ensuring previous cache invalidates are complete */
-	uasm_i_sync(&p, STYPE_SYNC);
+	uasm_i_sync(&p, __SYNC_full);
 	uasm_i_ehb(&p);
=20
 	if (mips_cm_revision() < CM_REV_CM3) {
@@ -487,7 +487,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 		uasm_i_lw(&p, t0, 0, r_pcohctl);
=20
 		/* Barrier to ensure write to coherence control is complete */
-		uasm_i_sync(&p, STYPE_SYNC);
+		uasm_i_sync(&p, __SYNC_full);
 		uasm_i_ehb(&p);
 	}
=20
@@ -534,7 +534,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 		}
=20
 		/* Barrier to ensure write to CPC command is complete */
-		uasm_i_sync(&p, STYPE_SYNC);
+		uasm_i_sync(&p, __SYNC_full);
 		uasm_i_ehb(&p);
 	}
=20
@@ -572,13 +572,13 @@ static void *cps_gen_entry_code(unsigned cpu, enum cp=
s_pm_state state)
 	uasm_i_lw(&p, t0, 0, r_pcohctl);
=20
 	/* Barrier to ensure write to coherence control is complete */
-	uasm_i_sync(&p, STYPE_SYNC);
+	uasm_i_sync(&p, __SYNC_full);
 	uasm_i_ehb(&p);
=20
 	if (coupled_coherence && (state =3D=3D CPS_PM_NC_WAIT)) {
 		/* Decrement ready_count */
 		uasm_build_label(&l, p, lbl_decready);
-		uasm_i_sync(&p, STYPE_SYNC_MB);
+		uasm_i_sync(&p, __SYNC_mb);
 		uasm_i_ll(&p, t1, 0, r_nc_count);
 		uasm_i_addiu(&p, t2, t1, -1);
 		uasm_i_sc(&p, t2, 0, r_nc_count);
@@ -586,7 +586,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 		uasm_i_andi(&p, v0, t1, (1 << fls(smp_num_siblings)) - 1);
=20
 		/* Barrier ensuring all CPUs see the updated r_nc_count value */
-		uasm_i_sync(&p, STYPE_SYNC_MB);
+		uasm_i_sync(&p, __SYNC_mb);
 	}
=20
 	if (coupled_coherence && (state =3D=3D CPS_PM_CLOCK_GATED)) {
@@ -608,7 +608,7 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_=
pm_state state)
 		uasm_build_label(&l, p, lbl_secondary_cont);
=20
 		/* Barrier ensuring all CPUs see the updated r_nc_count value */
-		uasm_i_sync(&p, STYPE_SYNC_MB);
+		uasm_i_sync(&p, __SYNC_mb);
 	}
=20
 	/* The core is coherent, time to return to C code */
--=20
2.23.0

