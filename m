Return-Path: <linux-mips+bounces-8927-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4284AAADC6
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 04:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09D0B1BA1523
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 02:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C976630DE1F;
	Mon,  5 May 2025 23:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwR6zRaq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519D2FA13F;
	Mon,  5 May 2025 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487398; cv=none; b=UF0OFja39PmmjEFsJaEwlc7aQhU8w0V+TI8li6dhgj1J9+96GdOd+0ml2G/vZHy+eDuuIUIkjrS+tZNuNkGtPJCpnxpF1Ajn5kGQXiGOwQAElLLPxQ2i79eMs9xf8xAc3lWx0rHLQ1yt7spcECbcr3FkqB3WkVUkZQBMJ6zMV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487398; c=relaxed/simple;
	bh=aaoHzeX9kNdyJ+UGNMNnz6IM+kfANJ9lmqLQLCXrsqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qk8TNGl5ri+Xx74NP1hDCjxmhSClppAqwnHeqRih0ph9taF9ayWsjrwiq/f6T9G6OkQwEh+LH98pTTZF6QO3SyrgHJUm1r0d8+Rc7zbHl8LO+OYV6cW3UNEUKYesRgWwv2BLNIOqEpBekiRyQbif65oeQTZuEjbBemj0mpIJ9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwR6zRaq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFC1C4CEE4;
	Mon,  5 May 2025 23:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487397;
	bh=aaoHzeX9kNdyJ+UGNMNnz6IM+kfANJ9lmqLQLCXrsqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HwR6zRaqCZ5TvupCLYYKUhrzA6+1GqhVaJBTeb61lIGMdqE/pB7n2tnkNeY/EDvoq
	 9Ey4X+EzAYnuLOZJpiGX8v16j7NVqmZ3nBRVhwggHASdpKXBW3SYwboBPU7cFN1UyJ
	 6Cs9vn8yk/Uy0TSOZtpJ3JVmJlSmM+eWguUE0aRwxXvV2qam8hhPpEfiMOVbfVO2OU
	 st3NjJOIfgS2eSlKL5VLIjh1ycYEQHcvAFRg9wa5cEvWKLhXFWBgfMXUv9/wPdaEZB
	 X1MfghXVXyzA8J3tP+WyeULWJ73xHvnR94zsmUtPzcOrYbnnzDpkRjI8RMH4m7bj4A
	 oJbuTphdkFkzQ==
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
Subject: [PATCH AUTOSEL 5.4 47/79] MIPS: Use arch specific syscall name match function
Date: Mon,  5 May 2025 19:21:19 -0400
Message-Id: <20250505232151.2698893-47-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
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


