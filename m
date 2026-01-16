Return-Path: <linux-mips+bounces-12948-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A6D2ED35
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 10:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3B9A305B6D0
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 09:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE50B357A53;
	Fri, 16 Jan 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lzFJui4M"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581B1357718
	for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556066; cv=none; b=no2Ou8zdNEDB7R+d3cSAUfNhY6w+YiwMV91t8+Olsnct84dGpUo9/hkE1MjkTABafBK4zmr6LP6pXdn7k+6ApA7W/7HRuOgrZ2KCoUFvSUOmLWZ3CPJk4ylVfEEoP/2AVOsOeUNX2Xrhhnmcqagzr5Nx1ExP9gnqOMpna18nwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556066; c=relaxed/simple;
	bh=NM6q4F+2pfcBZpE6P1Uc+XKD9LINZOumvQNalN1oIgQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YPJBRNOvlQO2yWATRCWWDSrd1kpQMO+HxP9yyUMQfkliblt1APh/YnyY/iQjLJqfrNrR5Pp8f05YnyBIXfK+pXApT8RplOsqJrBJOd92ravG0zNgcySibQ0ldAe3bz6HQdg5J0AmLrMsZvFewtwXlmAiS/wuasjN/k+JKcIHkqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lzFJui4M; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430ffa9fccaso1641611f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768556062; x=1769160862; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xv9mZehuSWKkpgnhRisn4d35nxKH/bJdH2uCguWaEG0=;
        b=lzFJui4Mw5H/414z3TduY3YIUTKQTjGP1MIH86qtIX8kBcxMG3ZtPJzSqEbb0/TnZM
         8eaeRI5qnaGyzLdtLUCBh2wy1A47sq+86+zAA8JCJmASHBTM6U8STCGAV9YfUqKbA8pe
         G4WzjJ3GRqMBEMBRGAFxJFmLmCroWM6PvUHR1mwcAmZpir627OAr33azTM+Av2YIauV+
         9WPc/T+JNPm18A709Elnk2ZZcZcEx9eA0oXCGCVpuNdfTGBYq1wUYfo4HBibp0sBBf2/
         uC3Mrbhcjhy+YUCHEWZkX+PnlMPAU+1SusqegcscqRvMMNQMu5Hgh0eiV2eXGIfVudzE
         1I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556062; x=1769160862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xv9mZehuSWKkpgnhRisn4d35nxKH/bJdH2uCguWaEG0=;
        b=cxVOoJwhXUNZe4fzXmf8fScxpUgxc/EI9LNIpHqXUu7tP24h70IOnCsT6XG6pp/W62
         qd9BlcO/VZ8f+CcgVznlrfS4dUULqVXAemfb4LWld+40JSTHLgCXPS5YiabDT2BCt21z
         7Wr3vVOu+dbE+HFVSnzbh3vPR8bai3zhMNAbaKW8ah1pAY3bLeTXz7IZINFNC55nXPi1
         MdftsW74VOU8NTkb7LojKUGhiZIUET1XteWxlpElosbSx2m+quEYpAJPQYAn7oJApeX6
         DWr06NTtbVzeVVaxkSwEcmeFtYtgQnxsNett74Z8S5iat4g6UYRGrfSDHXiYtMp8H2hk
         /Nrg==
X-Forwarded-Encrypted: i=1; AJvYcCWMRPFgYikNJ5vXby4qHEvrYlNJmqw5Sk0vqd0mP8f2+lviiHbdtROimj9J34bqUn7Zy+PL3ci1UYsb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+GC6FBVFMfbZduyJVadbLIOua7/FBxEyCW8BNXYYEMWSpaffG
	IjKKK2b94xnUQZHi6JC047BISvVXH4wl0ZItQVH24Qg+wVQ5Zo6D+aNav1Mwq6euMJoWa86CQg=
	=
X-Received: from wrbcp41.prod.google.com ([2002:a05:6000:4029:b0:432:c0b9:b553])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:238a:b0:432:e00b:8680
 with SMTP id ffacd0b85a97d-43569bc54a2mr2781711f8f.31.1768556061745; Fri, 16
 Jan 2026 01:34:21 -0800 (PST)
Date: Fri, 16 Jan 2026 10:34:02 +0100
In-Reply-To: <20260116093359.2442297-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260116093359.2442297-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8138; i=ardb@kernel.org;
 h=from:subject; bh=IzuRsXHQD94wcxsjT6y4DYYcBMPmDTwaoDoXh1QUfu4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JITOLjSPiQMaxrCMB6Uu8GkoEGs2PnZy9uGy2Zrt466nW3
 Vs5J63rKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMxOMvwTyVgneejezK/z7x+
 FnKp9NvhrAAVm13sqauL5c9tYp8r5sXI0Jx//8dFnsUpV7l0r/nqf0kTf1Iz31bc13/5vMJnrA/ 5GAA=
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260116093359.2442297-6-ardb+git@google.com>
Subject: [PATCH v2 2/2] kallsyms: Get rid of kallsyms relative base
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Kees Cook <kees@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When the kallsyms relative base was introduced, per-CPU variable
references on x86_64 SMP were implemented as offsets into the respective
per-CPU region, rather than offsets relative to the location of the
variable's template in the kernel image, which is how other
architectures implement it.

This required kallsyms to reason about the difference between the two,
and the sign of the value in the kallsyms_offsets[] array was used to
distinguish them. This meant that negative offsets were not permitted
for ordinary variables, and so it was crucial that the relative base was
chosen such that all offsets were positive numbers.

This is no longer needed: instead, the offsets can simply be encoded as
values in the range -/+ 2 GiB, which is precisely what PC32 relocations
provide on most architectures. So it is possible to simplify the logic,
and just use _text as the anchor directly, and let the linker calculate
the final value based on the location of the entry itself.

Some architectures (nios2, extensa) do not support place-relative
relocations at all, but these are all 32-bit and non-relocatable, and so
there is no need for place-relative relocations in the first place, and
the actual symbol values can just be stored directly.

This makes all entries in the kallsyms_offsets[] array visible as
place-relative references in the ELF metadata, which will be important
when implementing ELF-based fg-kaslr.

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 kernel/kallsyms.c                   |  6 +-
 kernel/kallsyms_internal.h          |  1 -
 kernel/vmcore_info.c                |  1 -
 scripts/kallsyms.c                  | 64 ++++++--------------
 scripts/link-vmlinux.sh             |  4 ++
 tools/perf/tests/vmlinux-kallsyms.c |  1 -
 6 files changed, 25 insertions(+), 52 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 049e296f586c..6125724aadb1 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -151,8 +151,10 @@ static unsigned int get_symbol_offset(unsigned long pos)
 
 unsigned long kallsyms_sym_address(int idx)
 {
-	/* values are unsigned offsets */
-	return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
+	/* non-relocatable 32-bit kernels just embed the value directly */
+	if (!IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_RELOCATABLE))
+		return (u32)kallsyms_offsets[idx];
+	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
 }
 
 static unsigned int get_symbol_seq(int index)
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 9633782f8250..81a867dbe57d 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -8,7 +8,6 @@ extern const int kallsyms_offsets[];
 extern const u8 kallsyms_names[];
 
 extern const unsigned int kallsyms_num_syms;
-extern const unsigned long kallsyms_relative_base;
 
 extern const char kallsyms_token_table[];
 extern const u16 kallsyms_token_index[];
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index fe9bf8db1922..f114719f6cb5 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -238,7 +238,6 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_SYMBOL(kallsyms_token_table);
 	VMCOREINFO_SYMBOL(kallsyms_token_index);
 	VMCOREINFO_SYMBOL(kallsyms_offsets);
-	VMCOREINFO_SYMBOL(kallsyms_relative_base);
 #endif /* CONFIG_KALLSYMS */
 
 	arch_crash_save_vmcoreinfo();
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 4b0234e4b12f..37d5c095ad22 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -46,7 +46,6 @@ struct addr_range {
 };
 
 static unsigned long long _text;
-static unsigned long long relative_base;
 static struct addr_range text_ranges[] = {
 	{ "_stext",     "_etext"     },
 	{ "_sinittext", "_einittext" },
@@ -57,6 +56,7 @@ static struct addr_range text_ranges[] = {
 static struct sym_entry **table;
 static unsigned int table_size, table_cnt;
 static int all_symbols;
+static int pc_relative;
 
 static int token_profit[0x10000];
 
@@ -280,7 +280,7 @@ static void read_map(const char *in)
 static void output_label(const char *label)
 {
 	printf(".globl %s\n", label);
-	printf("\tALGN\n");
+	printf("\t.balign 4\n");
 	printf("%s:\n", label);
 }
 
@@ -343,15 +343,6 @@ static void write_src(void)
 	unsigned int *markers, markers_cnt;
 	char buf[KSYM_NAME_LEN];
 
-	printf("#include <asm/bitsperlong.h>\n");
-	printf("#if BITS_PER_LONG == 64\n");
-	printf("#define PTR .quad\n");
-	printf("#define ALGN .balign 8\n");
-	printf("#else\n");
-	printf("#define PTR .long\n");
-	printf("#define ALGN .balign 4\n");
-	printf("#endif\n");
-
 	printf("\t.section .rodata, \"a\"\n");
 
 	output_label("kallsyms_num_syms");
@@ -434,34 +425,24 @@ static void write_src(void)
 	output_label("kallsyms_offsets");
 
 	for (i = 0; i < table_cnt; i++) {
-		/*
-		 * Use the offset relative to the lowest value
-		 * encountered of all relative symbols, and emit
-		 * non-relocatable fixed offsets that will be fixed
-		 * up at runtime.
-		 */
-
-		long long offset;
-
-		offset = table[i]->addr - relative_base;
-		if (offset < 0 || offset > UINT_MAX) {
-			fprintf(stderr, "kallsyms failure: "
-				"relative symbol value %#llx out of range\n",
-				table[i]->addr);
-			exit(EXIT_FAILURE);
+		if (pc_relative) {
+			long long offset = table[i]->addr - _text;
+
+			if (offset < INT_MIN || offset > INT_MAX) {
+				fprintf(stderr, "kallsyms failure: "
+					"relative symbol value %#llx out of range\n",
+					table[i]->addr);
+				exit(EXIT_FAILURE);
+			}
+			printf("\t.long\t_text - . + (%d)\t/* %s */\n",
+			       (int)offset, table[i]->sym);
+		} else {
+			printf("\t.long\t%#x\t/* %s */\n",
+			       (unsigned int)table[i]->addr, table[i]->sym);
 		}
-		printf("\t.long\t%#x\t/* %s */\n", (int)offset, table[i]->sym);
 	}
 	printf("\n");
 
-	output_label("kallsyms_relative_base");
-	/* Provide proper symbols relocatability by their '_text' relativeness. */
-	if (_text <= relative_base)
-		printf("\tPTR\t_text + %#llx\n", relative_base - _text);
-	else
-		printf("\tPTR\t_text - %#llx\n", _text - relative_base);
-	printf("\n");
-
 	sort_symbols_by_name();
 	output_label("kallsyms_seqs_of_names");
 	for (i = 0; i < table_cnt; i++)
@@ -701,22 +682,12 @@ static void sort_symbols(void)
 	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
 }
 
-/* find the minimum non-absolute symbol address */
-static void record_relative_base(void)
-{
-	/*
-	 * The table is sorted by address.
-	 * Take the first symbol value.
-	 */
-	if (table_cnt)
-		relative_base = table[0]->addr;
-}
-
 int main(int argc, char **argv)
 {
 	while (1) {
 		static const struct option long_options[] = {
 			{"all-symbols",     no_argument, &all_symbols,     1},
+			{"pc-relative",     no_argument, &pc_relative,     1},
 			{},
 		};
 
@@ -734,7 +705,6 @@ int main(int argc, char **argv)
 	read_map(argv[optind]);
 	shrink_table();
 	sort_symbols();
-	record_relative_base();
 	optimize_token_table();
 	write_src();
 
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 4ab44c73da4d..73531cb63efc 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -143,6 +143,10 @@ kallsyms()
 		kallsymopt="${kallsymopt} --all-symbols"
 	fi
 
+	if is_enabled CONFIG_64BIT || is_enabled CONFIG_RELOCATABLE; then
+		kallsymopt="${kallsymopt} --pc-relative"
+	fi
+
 	info KSYMS "${2}.S"
 	scripts/kallsyms ${kallsymopt} "${1}" > "${2}.S"
 
diff --git a/tools/perf/tests/vmlinux-kallsyms.c b/tools/perf/tests/vmlinux-kallsyms.c
index 74cdbd2ce9d0..524d46478364 100644
--- a/tools/perf/tests/vmlinux-kallsyms.c
+++ b/tools/perf/tests/vmlinux-kallsyms.c
@@ -27,7 +27,6 @@ static bool is_ignored_symbol(const char *name, char type)
 		 * stable symbol list.
 		 */
 		"kallsyms_offsets",
-		"kallsyms_relative_base",
 		"kallsyms_num_syms",
 		"kallsyms_names",
 		"kallsyms_markers",
-- 
2.52.0.457.g6b5491de43-goog


