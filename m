Return-Path: <linux-mips+bounces-10455-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3DDB30834
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 23:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90DA51C249EC
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 21:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F6C2DFF1D;
	Thu, 21 Aug 2025 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKYszfa7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A42D837C;
	Thu, 21 Aug 2025 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755810968; cv=none; b=s6V2DiS7PClzexYzYU71oK6ICeZDIlZAzdDVj520LOhli4VgKx/I760z0yZiIfP0QuNb9nW/owJPAORNRmC/fWdw0tO9egMaj0yg32UHKncL0xhu7ljyW2BHldxnTf88rmvJ9k/KmcHPuJ4P+kY+PTccQvSHbL/GdRJxrDLw610=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755810968; c=relaxed/simple;
	bh=66yWNnzAMgeGutikhZxcg+vm/xcsjv8NO+92CQLqj+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L80UoOX71IL0Ony/WMsIRjXpwuZC8GwMQsPgPTorTIK47qE7KGrGT9ycFSaMmby6cPSnLXbZ2gMYCVCVU0EIebJ1i4ZcYEnyR6poyaDO/7dmuyOGCz20wM7UOjArVeri+ttgyH9FARp1cynDJJOV0Ux5FuKeOTd+q1pfRjOjWH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKYszfa7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C79C4CEF4;
	Thu, 21 Aug 2025 21:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810968;
	bh=66yWNnzAMgeGutikhZxcg+vm/xcsjv8NO+92CQLqj+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cKYszfa7HOCM4dC8RjdGv7hpuvVFQ01VBOFV/Sbb+oBhSySTpc1tbuIWodOeDz4WT
	 aJiMf7RBqTe/L/Y/TCcod78yhuJv2HZE16iiq7hsKIQBxENoYnyZJqAWFYA8UBrt4R
	 Wjx5Q6YMzV5Tvzev7TzE/ToEsGozjnQcisFWmiZ6Zu+nvu+2ifN4Ka7qibNXDHuUoy
	 wxRLCAnikKFGiSrE+bzshh1ElDZHmJChwGDZi726IhQtvEzjmjuABsrof0dTGf7GLA
	 /7GwzeYV3WnivK1w32xmDRRZ6wNUhb9UB0qxYBiCewsT2Rs+ygtDK3x9cEfIhUj6uM
	 0H/8V7/zF1ITg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:42 -0700
Subject: [PATCH v2 05/12] mips: Unconditionally select
 ARCH_HAS_CURRENT_STACK_POINTER
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-bump-min-llvm-ver-15-v2-5-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=nathan@kernel.org;
 h=from:subject:message-id; bh=66yWNnzAMgeGutikhZxcg+vm/xcsjv8NO+92CQLqj+k=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLe5r2/+34JPGAh3GeQW72/mPFD5IOdzprXGOIe/t3S
 mXh4QP3O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEdJ4zMtxZvTrXS4P9fMrr
 hdvD+T+vUGdP1nVLPnXyzQxL7o3X4y8z/OGrq7wU/ZLtzGkGA8Ebtidso/RTP69neZHA+4P54b/
 7jxkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 15.0.0, the selection of
ARCH_HAS_CURRENT_STACK_POINTER can be made unconditional since it is
always true.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
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


