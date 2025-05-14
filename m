Return-Path: <linux-mips+bounces-9010-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A21AB6F81
	for <lists+linux-mips@lfdr.de>; Wed, 14 May 2025 17:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DF7E189E330
	for <lists+linux-mips@lfdr.de>; Wed, 14 May 2025 15:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2505128C864;
	Wed, 14 May 2025 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfItV8za"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5082628B4EF;
	Wed, 14 May 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235696; cv=none; b=TZDvha3Mm9Z2JbP8lnZ6i98dy7ZT6Qlq8guoXX9AVQe4bYywmzdqUQ/Ala2ecLCHqdFfW2CTVKcCrWUCLn7JaWuLVXXPyXwxkarMdQo8DqBwuHW2s8EVIbcIVyNVPw7maeja16xsBpJnw0sQ7EMjS6rDHMZwHx4AdDd6gTM3EcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235696; c=relaxed/simple;
	bh=W83BuCBEGVgUrqk/CNpFhmFYGiaT4zNHiSxidabkeh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HOt3JT1/EAZ4Fq1/0kLaq/LRVPt+L4d3BPyY5p3TMT/zHwM73THYiRi6fCx8tK5V3l0vVg9P+QCbc52cgsusdqJbmeHeM6LaRbYtMywz1e66XR7E8ekwlVd1/iDCtuv3R4NOajKMzI9tFIUM8foMB1Wwub3lAbQyBOi4nM2ecc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfItV8za; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747235694; x=1778771694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W83BuCBEGVgUrqk/CNpFhmFYGiaT4zNHiSxidabkeh4=;
  b=HfItV8zaUDR2/Hsmt8TfopWtM632WmtUQekS+MbI+qLhCltntLSsp2SC
   JXxMeV1UsXmcuzUt/GtC+WjBLFcul6xeq+0xtNjMVZ1TEIQWiX5+Yrvlf
   v+vIYR1WtIcms+vuoL0xx4MXLpm6gMDU/QToQGGqOR0mdkU/C7leIjdnd
   Ht1wDwz8uie6S0K6dHKtrXu/d1Ywf2SMlyt0KuOI1qHqMsjBlqFXHoZhU
   y1wKaTKBjql9+oS8zNdv70sR2X7b+dp26mrEi57dVaZhZPX0RpNHNv7Zw
   /m0bYEnycqvOusW3qFHwvFlEcIU5LbcBjq1xPScCqweISvEYj8Uw+esAc
   w==;
X-CSE-ConnectionGUID: tR8n6SjbR9GF+mfoivqczg==
X-CSE-MsgGUID: 6bDVnvpPQyG6gPhhpTQlhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49072816"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49072816"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:14:48 -0700
X-CSE-ConnectionGUID: r2MKxGuURU68vDYrBO+sLQ==
X-CSE-MsgGUID: B0QC86l3RLCRt+rPAsb38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142939181"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2025 08:14:48 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	irogers@google.com,
	mark.rutland@arm.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: eranian@google.com,
	ctshao@google.com,
	tmricht@linux.ibm.com,
	Kan Liang <kan.liang@linux.intel.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: [PATCH V2 15/15] mips/perf: Remove driver-specific throttle support
Date: Wed, 14 May 2025 08:14:01 -0700
Message-Id: <20250514151401.2547932-16-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250514151401.2547932-1-kan.liang@linux.intel.com>
References: <20250514151401.2547932-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The throttle support has been added in the generic code. Remove
the driver-specific throttle support.

Besides the throttle, perf_event_overflow may return true because of
event_limit. It already does an inatomic event disable. The pmu->stop
is not required either.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/kernel/perf_event_mipsxx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
index c4d6b09136b1..196a070349b0 100644
--- a/arch/mips/kernel/perf_event_mipsxx.c
+++ b/arch/mips/kernel/perf_event_mipsxx.c
@@ -791,8 +791,7 @@ static void handle_associated_event(struct cpu_hw_events *cpuc,
 	if (!mipspmu_event_set_period(event, hwc, idx))
 		return;
 
-	if (perf_event_overflow(event, data, regs))
-		mipsxx_pmu_disable_event(idx);
+	perf_event_overflow(event, data, regs);
 }
 
 
-- 
2.38.1


