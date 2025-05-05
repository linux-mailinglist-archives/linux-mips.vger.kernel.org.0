Return-Path: <linux-mips+bounces-8929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99933AAB0F4
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 05:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0EA9178E01
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 03:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4319A2C0840;
	Tue,  6 May 2025 00:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6CJxflL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E5A2BFC9F;
	Mon,  5 May 2025 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485340; cv=none; b=Phts61btIjDT0gJIzqm8nghSiAayITMlqX8P2G9qJOcYRyX59YxQNH0KSWy9claP8LkdZOcq4cFjUFC2+234abi1lxsHy5KXlap7EgdB9azVP1Z9zLleBbZA/oWUgz5r+SQm+BwnX6LesBQ2B5Cx06Xx2wD4amGgJYAQwQb0vuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485340; c=relaxed/simple;
	bh=iuQcipCRUKT1j4Ssrp9UrbZXxmmTU2FdSfPr4gHi5Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=suIWNKzkhun4rjk494TJ0NXvjmKQ+0ueKpRELSix7ZycNEtygmOktyYsWuqboyo46kMGYOfRtfoE9lH7LXjSujJcGSWWj/KAb8cM/lzDtiCiTTnhdT51edCQD09VheKub3N5MDPDECrktALWUG5QOlNjAsyiov/wnFtZBJ9SotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6CJxflL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9FDC4CEED;
	Mon,  5 May 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485339;
	bh=iuQcipCRUKT1j4Ssrp9UrbZXxmmTU2FdSfPr4gHi5Ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6CJxflL+KTvgy2RECw/fd3KXeiXfFTy4tJDMjAaEHbXJwyA0AtD/SayIscGruVnm
	 WLGDMIV96mtaSyHif9/ZnUHbDy+QxM5/zUgr1CyCKYQRETk/ez430E3e0yMjQI3KWt
	 CklBMp+d40B7RUFYryPWqB9FhcJopBfWigA+otXhIPdZ/qYXzy336oMyxp31/Mpcjm
	 l8MCxFCCfo7ICsuZv2516pjB6EYnJ57sjmJ9bcXv9v0iw4n/HJB9BDML4Hl9VnZGoX
	 uKjD7CDcdxxNuhUzCAEOt05cgtEJztGY9aZRiNEh1CeGEyqZr0yct8/d7oHyhMugFj
	 PHg5rP5dLoMlw==
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
Subject: [PATCH AUTOSEL 6.12 276/486] MIPS: Use arch specific syscall name match function
Date: Mon,  5 May 2025 18:35:52 -0400
Message-Id: <20250505223922.2682012-276-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index dc025888f6d28..b41fc10446688 100644
--- a/arch/mips/include/asm/ftrace.h
+++ b/arch/mips/include/asm/ftrace.h
@@ -91,4 +91,20 @@ void prepare_ftrace_return(unsigned long *parent_ra_addr, unsigned long self_ra,
 
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


