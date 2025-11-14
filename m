Return-Path: <linux-mips+bounces-12241-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B26CEC5CCEB
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 12:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C9B273483F6
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 11:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF29314A91;
	Fri, 14 Nov 2025 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Stpm2Cw2"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07B313E28;
	Fri, 14 Nov 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118827; cv=none; b=rKUSggeU1i1ASSmHSdNMJS74ODCQQBye7/60siWxjjc1D65h6Cw4e0vL7IHGtrNtst1Cc4T6+X/tWzwfx/RC7Xx1hw9mFPjNXL0dXL6xLGD7V8BRka2jDr+bo91Ubi7agZFA+VgXDJC69+Pi+twRp4FXvvCfOldvAnr0h3muEQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118827; c=relaxed/simple;
	bh=EYs+NC2RFO1p4rbWGSdZNR9Qrr0rr7K1E/8shVZXtMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMk8QsIQvSHuCNBePyDHbQzMGSuWoTO8fdQU+3YZmnRTgFjlNjSfI8wiLyNRZzsQZNH3j74BUbjRkzkikq/rFuGpbmIHs1rJAbn5l+QRZnYCSzIxWIwXu+o/XEwuWrxJRx/OkjfAPEKw+lN/2U00zHv9ozuSgEyjSFUFDgLpGiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Stpm2Cw2; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7tXlmZ+pRF9jtuKn/rsOIXurW72jRhlWkLmUc3dGBwY=;
	b=Stpm2Cw2eR2J2rbFTzOawJSjf+8nVr0S2DRH8c9JHKG+fa285HvCdFhAMOTsWRsfTG7RAJ
	jloMnHkECy68rT0g0QHXnxlcRLoj/F48niZL+Kl1UjiVPo0BMgqdyzoUeUTD8/BUmGQpnX
	MUXmRasI8N65oN5LGgdju7vLVsDd3dI=
From: Qi Zheng <qi.zheng@linux.dev>
To: will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	dev.jain@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 0/7] enable PT_RECLAIM on all 64-bit architectures
Date: Fri, 14 Nov 2025 19:11:14 +0800
Message-ID: <cover.1763117269.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Qi Zheng <zhengqi.arch@bytedance.com>

Hi all,

This series aims to enable PT_RECLAIM on all 64-bit architectures.

On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of empty PTE
page table pages (such as 100GB+). To resolve this problem, we need to enable
PT_RECLAIM, which depends on MMU_GATHER_RCU_TABLE_FREE.

Therefore, this series first enables MMU_GATHER_RCU_TABLE_FREE on all 64-bit
architectures, and finally makes PT_RECLAIM depend on MMU_GATHER_RCU_TABLE_FREE
&& 64BIT. This way, PT_RECLAIM can be enabled by default on all 64-bit
architectures.

Comments and suggestions are welcome!

Thanks,
Qi

Qi Zheng (7):
  alpha: mm: enable MMU_GATHER_RCU_TABLE_FREE
  arc: mm: enable MMU_GATHER_RCU_TABLE_FREE
  loongarch: mm: enable MMU_GATHER_RCU_TABLE_FREE
  mips: mm: enable MMU_GATHER_RCU_TABLE_FREE
  parisc: mm: enable MMU_GATHER_RCU_TABLE_FREE
  um: mm: enable MMU_GATHER_RCU_TABLE_FREE
  mm: make PT_RECLAIM depend on MMU_GATHER_RCU_TABLE_FREE && 64BIT

 arch/alpha/Kconfig                   | 1 +
 arch/alpha/include/asm/tlb.h         | 8 +++++---
 arch/arc/Kconfig                     | 1 +
 arch/arc/include/asm/pgalloc.h       | 9 ++++++---
 arch/loongarch/Kconfig               | 1 +
 arch/loongarch/include/asm/pgalloc.h | 6 ++++--
 arch/mips/Kconfig                    | 1 +
 arch/mips/include/asm/pgalloc.h      | 6 ++++--
 arch/parisc/Kconfig                  | 1 +
 arch/parisc/include/asm/tlb.h        | 6 ++++--
 arch/um/Kconfig                      | 1 +
 arch/x86/Kconfig                     | 1 -
 mm/Kconfig                           | 6 +-----
 13 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.20.1


