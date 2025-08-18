Return-Path: <linux-mips+bounces-10364-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89066B2B103
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 20:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 919947A7B33
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 18:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C68F277C88;
	Mon, 18 Aug 2025 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uz+TJsLM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF062737E7;
	Mon, 18 Aug 2025 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755543481; cv=none; b=hqhQIO1d0PquxRpTIjRhR+nviVJTsYIRyKVY5DeiVlIDml38V6wgZ1of/xAN6eiubJIdmPMTvweMt99BBo86UI3eiGOIhwRnLMjseY/6F12fqOjfXwxWI/QyS+0gaKxpzZRpje1Bab75G01cSwPVxUkse9uLoRabA28ezkKXePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755543481; c=relaxed/simple;
	bh=iSf8NbjxWft8sc/26Xjf1ql6E2qmURE4VPlw2KstR+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o+X7fvUacrS/hDRfbf03aRzeFSGKp1t/IqhJwR2QE1R6gev6RGnSLXvEIcTFc2Ulay1oMTW0e0qdOgcfmENMIB2OqUJjeJTPDSCHO4zjfiAZPmuDUUke4AwCx7Pxw5s9eXfW/Jzl7lzbj6qPnpWV92EIamSMnh/BEyGsTIN3gRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uz+TJsLM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549A9C4CEED;
	Mon, 18 Aug 2025 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543480;
	bh=iSf8NbjxWft8sc/26Xjf1ql6E2qmURE4VPlw2KstR+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uz+TJsLMHeO3a0fpmfNBwSynX6EL0fMknQHvgakcZxd7+FpuIg1FDH9n0iFHhjC+G
	 PBzNSAsx7Z6EhgQmTR+oez5UzZrCDr56LvxpdsvWG7jWb2eJehFjjEcpXgMEQUr4Mn
	 luz6hI7FEC14EuNenqRIIv7urSnIQ0jT1f48PKUiZqGy5APMkTZKTgTUs1eOOi+TTg
	 WLeHXrLFjaGDxyCzhxShdocQh8Ikgq0M1/VK7eCGGLhC9PzObEMGCUZd1TLm9sfXIO
	 /zkQZfx+kBA0B4NaviaOpzyp2f6GD+lwnLX3q5Xgtu6IeFe8Kin6g4LNU5RE4pQXwV
	 yLquAfc++Kc3A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Aug 2025 11:57:21 -0700
Subject: [PATCH 05/10] mips: Unconditionally select
 ARCH_HAS_CURRENT_STACK_POINTER
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-bump-min-llvm-ver-15-v1-5-c8b1d0f955e0@kernel.org>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=nathan@kernel.org;
 h=from:subject:message-id; bh=iSf8NbjxWft8sc/26Xjf1ql6E2qmURE4VPlw2KstR+k=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmLyxd+fvDiR+bq4+u0vN8bBE4KN/+6JyNe980Vj6dFl
 4zvedSd7ihlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT+eLI8Itp4bXyG33NhduO
 flRcESkl9UejqEpuHveLlFvWiec7p8cxMvRcM31s9X66evsv5w1+LD0HjurtunI8nde9+3nFnUV
 vF3ECAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 15.0.0, the selection of
ARCH_HAS_CURRENT_STACK_POINTER can be made unconditional since it is
always true.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index caf508f6e9ec..bc7473505f4a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -6,7 +6,7 @@ config MIPS
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT
-	select ARCH_HAS_CURRENT_STACK_POINTER if !CC_IS_CLANG || CLANG_VERSION >= 140000
+	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if !64BIT
 	select ARCH_HAS_DMA_OPS if MACH_JAZZ
 	select ARCH_HAS_FORTIFY_SOURCE

-- 
2.50.1


