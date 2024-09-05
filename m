Return-Path: <linux-mips+bounces-5359-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9964796DA67
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 15:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE6791C23120
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2024 13:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D0119DF69;
	Thu,  5 Sep 2024 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="APa+NfSb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eJpDy1DI"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26B219DF51;
	Thu,  5 Sep 2024 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543209; cv=none; b=o4PDqPn13R8Pc1h5pIbLSBX5905QllX0SlDZd5rWWlRQRY5I7+0iBRdudCvwXok0JFC5JyXjlNTg44FMfu2VWIUfLkDq6rGaLZn3PJShSKQGMXTQ0KKqsiUf42K6zyhX4zoVAr6Md+0l6RqeMBsfHYtNBYBAOZnpIVAhERh6FsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543209; c=relaxed/simple;
	bh=3K6o6Y8Ib1fJ7SBPgZmUC+L5hQTpFLi2ds4RhATIGXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0i+4X2eCbpPMiKTLSaq0P/mgbqDWZTqh3ptycVcFf1n87vZRD9JfY4hPWbzqwc9KplQiUjgklYyiOEGpHiCN/FWHJmBOXmoH0kHBPODag83Geq+FhxqF5R4HIW4oRzQELzRxI2MclA3AcBLJT3Z5QNgsgsz96YR9rxLx0zewyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=APa+NfSb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eJpDy1DI; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id DB9FF1380377;
	Thu,  5 Sep 2024 09:33:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 05 Sep 2024 09:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725543206;
	 x=1725629606; bh=rDJZVFYK8cRPG/ZY0D6is9Wvxf+gYsggMAPKn3+QD4o=; b=
	APa+NfSb+NaPKLm/clSjNyyRQ+CvPj7uuwwrPW1ZvdkK+YXVQ38ALEw8V2j2gwvb
	WUo6+NQeww4TmPli3EpBhYThuH313PSGFAcP66DxKlAWJnH0bdtL4S2VplUnl+Q/
	DTEdLI5X6VM4LFZfvw5UaPaM+bznr5/cZuKN3+jSp9KBtgpP2DcuoYUjGwNoS/lA
	mdWEsv9SrtVqpGZ7fBFFKY/oeRgfZBRvUr6jKW9sg79oROLF3rppu3LU105xE9Qb
	JsFnnf6A4qIVYduWsZpDM6NSQStF/n8ft51q0SHDfZPiJBy5B9ZDcPdEw69I8Fof
	r3cNf3pf8y6j/dUcXGazWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725543206; x=
	1725629606; bh=rDJZVFYK8cRPG/ZY0D6is9Wvxf+gYsggMAPKn3+QD4o=; b=e
	JpDy1DI6b/4LuKdnbm6qIF11FgQAC9BWgQXFmtlK+asFVAv4hBzZ0qxEdDQfEFYk
	FDNWTAUfKziw5y3BpdZPLNDS9voQOVqJ85dc5Pt1ZsdFscsArZqpPwSPyW/x1TB8
	KvnRH3vCUQBmaR+BO5YO3Hz4/6aEeBVZNisFbhJu4hwL+vAOHgKXywZT6nTjqdyp
	2rdWFOrMDkhxOP/Bno7tyN0N3gpvEQiznnGrlKFycyNegUdL8+F3pIJILgU23FgP
	2H3TM6uDwECYk+nV2oNPJL/2b+pSyfbBmD2SEbhz2xqnEOCUUizN2WjWWPU7RWlI
	SUPbEcvcwzUV2p46EqMhw==
X-ME-Sender: <xms:JrPZZge_cJIRtChuzjYjmm3lP7kL3coccN0HoQ6qGaM5WuaFkUY90A>
    <xme:JrPZZiO8CxpkS_tfHHfQahPBXmINjYRv65KyFTSN3zTo-fcDW2wp1mbPvsaWHxWHq
    kdNXJGgjcK_N1ivYrs>
X-ME-Received: <xmr:JrPZZhjlqmMJfBmcpf12pAS2prbdNWE8cvWKoU5YyOY5uPzi8621NCApkJrj-FsAJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehledgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
    necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
    gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
    tghomhdpnhgspghrtghpthhtohepgedtpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehnuggvshgruhhlnhhivghrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhi
    nhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumh
    hishdrohhrghdprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprgdrhhhinhgusghorhhgsehsrghmshhunhhgrdgtohhmpdhrtghpthhtoh
    epsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepgiek
    ieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvughsohhnrghfsehgmhgrihhlrd
    gtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:JrPZZl-HmkAm0ZhLtZr5zO_zvNu-D1qXM-qE1iTbgofI16O9mm-GTg>
    <xmx:JrPZZsvBQsE7jPzRd7swHRE9DylQmVWd_niEgzWl6ePLXl6vzbDJgg>
    <xmx:JrPZZsGBk3WayEk_UYxIcYV_ADrDoMrDVCAAEethneW6o_oVbG8d2g>
    <xmx:JrPZZrM26wSwydoF0b7vVMOXJfqn1m8zEJ0YiT6QxpBhE-BlbfBYaA>
    <xmx:JrPZZih51qc9ih9a4nU_YQPE0fyd3CfHx4-hGPNQ3LWVF2p1K4lm8PWb>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 09:33:22 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 05 Sep 2024 14:33:06 +0100
Subject: [PATCH v2 2/3] MIPS: Rename mips_instruction type to workaround
 bindgen issue
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-mips-rust-v2-2-409d66819418@flygoat.com>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
In-Reply-To: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
  Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,  Richard Weinberger <richard@nod.at>,
  Anton Ivanov <anton.ivanov@cambridgegreys.com>,
  Johannes Berg <johannes@sipsolutions.net>,
  Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
  Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,  Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
  Wedson Almeida Filho <wedsonaf@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
  =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@samsung.com>,
  Alice Ryhl <aliceryhl@google.com>,
  Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
  Steven Rostedt <rostedt@goodmis.org>,
  Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,  Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>,  Yanteng Si <siyanteng@loongson.cn>,
  Nick Desaulniers <ndesaulniers@google.com>,
  Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-um@lists.infradead.org, rust-for-linux@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6623;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=3K6o6Y8Ib1fJ7SBPgZmUC+L5hQTpFLi2ds4RhATIGXI=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSbm8WdVK9V5xz5aygReSNuw6mU0DcnMi6Eru0zOrTLe
 0pilWJ8RykLgxgXg6yYIkuIgFLfhsaLC64/yPoDM4eVCWQIAxenAEyk2ZGR4W/ywviWDQnXtuRG
 zMt6/J556pQLkY6c12unHT/tsziB8yojw+fu/Z1+G7Zm9+h+6A4RON69jd/l/cdWs0PzWUN1+iP
 +cgAA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

We have a union and a type both named after mips_instruction,
rust bindgen is not happy with this kind of naming alias.

Given that union mips_instruction is a part of UAPI, the best
thing we can do is to rename mips_instruction type.

Rename it as mips_insn, which is not conflicting with anything
and aligned with struct name here.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
	Reword commit messsage
---
 arch/mips/include/asm/dsemul.h |  2 +-
 arch/mips/include/asm/inst.h   |  6 +++---
 arch/mips/kernel/ftrace.c      |  2 +-
 arch/mips/kernel/kprobes.c     |  2 +-
 arch/mips/math-emu/cp1emu.c    | 18 +++++++++---------
 arch/mips/math-emu/dsemul.c    |  8 ++++----
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/mips/include/asm/dsemul.h b/arch/mips/include/asm/dsemul.h
index 08bfe8fa3b40..870597d6d1ad 100644
--- a/arch/mips/include/asm/dsemul.h
+++ b/arch/mips/include/asm/dsemul.h
@@ -34,7 +34,7 @@ struct task_struct;
  *
  * Return: Zero on success, negative if ir is a NOP, signal number on failure.
  */
-extern int mips_dsemul(struct pt_regs *regs, mips_instruction ir,
+extern int mips_dsemul(struct pt_regs *regs, mips_insn ir,
 		       unsigned long branch_pc, unsigned long cont_pc);
 
 /**
diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
index 2f98ced30263..0616b8eb7401 100644
--- a/arch/mips/include/asm/inst.h
+++ b/arch/mips/include/asm/inst.h
@@ -71,12 +71,12 @@
 #define I_FMA_FFMT_SFT	0
 #define MIPSInst_FMA_FFMT(x) (MIPSInst(x) & 0x00000007)
 
-typedef unsigned int mips_instruction;
+typedef unsigned int mips_insn;
 
 /* microMIPS instruction decode structure. Do NOT export!!! */
 struct mm_decoded_insn {
-	mips_instruction insn;
-	mips_instruction next_insn;
+	mips_insn insn;
+	mips_insn next_insn;
 	int pc_inc;
 	int next_pc_inc;
 	int micro_mips_mode;
diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 8c401e42301c..153c9666a77c 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -248,7 +248,7 @@ int ftrace_disable_ftrace_graph_caller(void)
 #define S_R_SP	(0xafb0 << 16)	/* s{d,w} R, offset(sp) */
 #define OFFSET_MASK	0xffff	/* stack offset range: 0 ~ PT_SIZE */
 
-unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
+static long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
 		old_parent_ra, unsigned long parent_ra_addr, unsigned long fp)
 {
 	unsigned long sp, ip, tmp;
diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
index dc39f5b3fb83..7a1b1c3674da 100644
--- a/arch/mips/kernel/kprobes.c
+++ b/arch/mips/kernel/kprobes.c
@@ -90,7 +90,7 @@ int arch_prepare_kprobe(struct kprobe *p)
 	}
 
 	if (copy_from_kernel_nofault(&prev_insn, p->addr - 1,
-			sizeof(mips_instruction)) == 0 &&
+			sizeof(kprobe_opcode_t)) == 0 &&
 	    insn_has_delayslot(prev_insn)) {
 		pr_notice("Kprobes for branch delayslot are not supported\n");
 		ret = -EINVAL;
diff --git a/arch/mips/math-emu/cp1emu.c b/arch/mips/math-emu/cp1emu.c
index 265bc57819df..bcd6a6f0034c 100644
--- a/arch/mips/math-emu/cp1emu.c
+++ b/arch/mips/math-emu/cp1emu.c
@@ -43,10 +43,10 @@
 /* Function which emulates a floating point instruction. */
 
 static int fpu_emu(struct pt_regs *, struct mips_fpu_struct *,
-	mips_instruction);
+	mips_insn);
 
 static int fpux_emu(struct pt_regs *,
-	struct mips_fpu_struct *, mips_instruction, void __user **);
+	struct mips_fpu_struct *, mips_insn, void __user **);
 
 /* Control registers */
 
@@ -846,7 +846,7 @@ do {									\
  * Emulate a CFC1 instruction.
  */
 static inline void cop1_cfc(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
-			    mips_instruction ir)
+			    mips_insn ir)
 {
 	u32 fcr31 = ctx->fcr31;
 	u32 value = 0;
@@ -903,7 +903,7 @@ static inline void cop1_cfc(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
  * Emulate a CTC1 instruction.
  */
 static inline void cop1_ctc(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
-			    mips_instruction ir)
+			    mips_insn ir)
 {
 	u32 fcr31 = ctx->fcr31;
 	u32 value;
@@ -973,7 +973,7 @@ static int cop1Emulate(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
 {
 	unsigned long contpc = xcp->cp0_epc + dec_insn.pc_inc;
 	unsigned int cond, cbit, bit0;
-	mips_instruction ir;
+	mips_insn ir;
 	int likely, pc_inc;
 	union fpureg *fpr;
 	u32 __user *wva;
@@ -1461,7 +1461,7 @@ DEF3OP(nmadd, dp, ieee754dp_mul, ieee754dp_add, ieee754dp_neg);
 DEF3OP(nmsub, dp, ieee754dp_mul, ieee754dp_sub, ieee754dp_neg);
 
 static int fpux_emu(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
-	mips_instruction ir, void __user **fault_addr)
+	mips_insn ir, void __user **fault_addr)
 {
 	unsigned int rcsr = 0;	/* resulting csr */
 
@@ -1680,7 +1680,7 @@ static int fpux_emu(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
  * Emulate a single COP1 arithmetic instruction.
  */
 static int fpu_emu(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
-	mips_instruction ir)
+	mips_insn ir)
 {
 	int rfmt;		/* resulting format */
 	unsigned int rcsr = 0;	/* resulting csr */
@@ -2899,9 +2899,9 @@ int fpu_emulator_cop1Handler(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
 			dec_insn.micro_mips_mode = 1;
 		} else {
 			if ((get_user(dec_insn.insn,
-			    (mips_instruction __user *) xcp->cp0_epc)) ||
+			    (mips_insn __user *) xcp->cp0_epc)) ||
 			    (get_user(dec_insn.next_insn,
-			    (mips_instruction __user *)(xcp->cp0_epc+4)))) {
+			    (mips_insn __user *)(xcp->cp0_epc+4)))) {
 				MIPS_FPU_EMU_INC_STATS(errors);
 				return SIGBUS;
 			}
diff --git a/arch/mips/math-emu/dsemul.c b/arch/mips/math-emu/dsemul.c
index e02bd20b60a6..d4ea2cf89006 100644
--- a/arch/mips/math-emu/dsemul.c
+++ b/arch/mips/math-emu/dsemul.c
@@ -61,8 +61,8 @@
  *   couldn't already.
  */
 struct emuframe {
-	mips_instruction	emul;
-	mips_instruction	badinst;
+	mips_insn	emul;
+	mips_insn	badinst;
 };
 
 static const int emupage_frame_count = PAGE_SIZE / sizeof(struct emuframe);
@@ -206,11 +206,11 @@ void dsemul_mm_cleanup(struct mm_struct *mm)
 	bitmap_free(mm_ctx->bd_emupage_allocmap);
 }
 
-int mips_dsemul(struct pt_regs *regs, mips_instruction ir,
+int mips_dsemul(struct pt_regs *regs, mips_insn ir,
 		unsigned long branch_pc, unsigned long cont_pc)
 {
 	int isa16 = get_isa16_mode(regs->cp0_epc);
-	mips_instruction break_math;
+	mips_insn break_math;
 	unsigned long fr_uaddr;
 	struct emuframe fr;
 	int fr_idx, ret;

-- 
2.46.0


