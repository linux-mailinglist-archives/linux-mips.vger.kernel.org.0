Return-Path: <linux-mips+bounces-8925-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE73AAB02E
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 05:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B3A83AA0C3
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 03:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D443E8DA8;
	Mon,  5 May 2025 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X86ujxmZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0661A3B11C2;
	Mon,  5 May 2025 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487232; cv=none; b=hIGRmoDibC9X6XBGNqlzQzxZ0i+4GWyZ4zPYIiLqcMMD+OnxzYM1MXCFRquh3wGXnVm0HT5kKhYKhL3cfxeNsoWig8d98BFX4vpePIiA0Qw7NHlE85cNl/QexgC1s3QVHNfVNITSjn4RFmShI2zxT0S+gvgcmiUvkjBFgR8M5ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487232; c=relaxed/simple;
	bh=aaoHzeX9kNdyJ+UGNMNnz6IM+kfANJ9lmqLQLCXrsqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qjx9nL7xZtw7HksDooaGRB85P92pDrXho7zFFhmbI8c9HVmJK/tX+swGBwsCKmyw/f0aG0kN45ZslI2PIeQ+UNdLQhE/3937oeaVTpPb3xNV9LFe1+qiENA/mE2pXfbwVusJwC/LIbdgzvQ0V1LmY7Mhhafj+HZ16vRRb5eTy+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X86ujxmZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84378C4CEED;
	Mon,  5 May 2025 23:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487230;
	bh=aaoHzeX9kNdyJ+UGNMNnz6IM+kfANJ9lmqLQLCXrsqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X86ujxmZ1kQZsFVmIpIXFoGs3p4Nh3ISZ7GiGCjabc9Qj2kgY+FdV1vxzSx0aLJvH
	 ZO12SNRCzJgpDD02LxDursqSj7XiFkZ7gv1Nx0+Fre18UvscVAKp+qCzdbfLMgyBuB
	 wV8ikxeAOajk/NYjtjdQe0p14VsrQ76kIOmIIi4vYkpK1NpSzZIn1GBQ1NvfJ03Qjf
	 v47C10zXzcFhYCN18QrZBEdW+SI6WuB0dgn3/eF6ULp6KrK+Lzlygw43oaJfaPR/r2
	 7taYP9juaLTmJHgiJfExaEsgYOhS+Vw3ZDW6E3gfD04veLEDJftkf+3QAb1/ykoszO
	 gdiyGb7YR4eSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bibo Mao <maobibo@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 068/114] MIPS: Use arch specific syscall name match function
Date: Mon,  5 May 2025 19:17:31 -0400
Message-Id: <20250505231817.2697367-68-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Bibo Mao <maobibo@loongson.cn>

[ Upstream commit 756276ce78d5624dc814f9d99f7d16c8fd51076e ]

On MIPS system, most of the syscall function name begin with prefix
sys_. Some syscalls are special such as clone/fork, function name of
these begin with __sys_. Since scratch registers need be saved in
stack when these system calls happens.

With ftrace system call method, system call functions are declared with
SYSCALL_DEFINEx, metadata of the system call symbol name begins with
sys_. Here mips specific function arch_syscall_match_sym_name is used to
compare function name between sys_call_table[] and metadata of syscall
symbol.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/ftrace.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
index b463f2aa5a613..7acbe701afd69 100644
--- a/arch/mips/include/asm/ftrace.h
+++ b/arch/mips/include/asm/ftrace.h
@@ -87,4 +87,20 @@ struct dyn_arch_ftrace {
 #endif /*  CONFIG_DYNAMIC_FTRACE */
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_FUNCTION_TRACER */
+
+#ifdef CONFIG_FTRACE_SYSCALLS
+#ifndef __ASSEMBLY__
+/*
+ * Some syscall entry functions on mips start with "__sys_" (fork and clone,
+ * for instance). We should also match the sys_ variant with those.
+ */
+#define ARCH_HAS_SYSCALL_MATCH_SYM_NAME
+static inline bool arch_syscall_match_sym_name(const char *sym,
+					       const char *name)
+{
+	return !strcmp(sym, name) ||
+		(!strncmp(sym, "__sys_", 6) && !strcmp(sym + 6, name + 4));
+}
+#endif /* __ASSEMBLY__ */
+#endif /* CONFIG_FTRACE_SYSCALLS */
 #endif /* _ASM_MIPS_FTRACE_H */
-- 
2.39.5


