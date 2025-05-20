Return-Path: <linux-mips+bounces-9039-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D80ABE282
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 20:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC3097B3FC9
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 18:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD33289E13;
	Tue, 20 May 2025 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k28WW5Sr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED579289370;
	Tue, 20 May 2025 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747765046; cv=none; b=P4xtXnDFX6/Nyr6BkQqUqf+8DWKNfEs9vd/bddbj68FXzPaZZEMIJerCannbJKkFih/jE7wczq+eBeVJvcQ5BRxUcY2POuad8WmNG9eTJWEfMkC17tIItbRjZcNsSujQ188YkPYKKndwdpJ6eqgBV5f/cUQS9H7KiaZm3rdomoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747765046; c=relaxed/simple;
	bh=W83BuCBEGVgUrqk/CNpFhmFYGiaT4zNHiSxidabkeh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s0Z96rhtW2BuJsOMBju9tvZfE7U3Mo5/n00ehlrNkLBeRJTbLVoAkkVz568g025K/NYlpvAotTFa7gjRAhpwlz6ZaSz9cu4Jb5mv/uOTaRqifTfMai8IEqxdaWDCQViHIh+ad7UeJHgb3zcNMMlvrCpfalpd3tdfwITh8FZfPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k28WW5Sr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747765045; x=1779301045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W83BuCBEGVgUrqk/CNpFhmFYGiaT4zNHiSxidabkeh4=;
  b=k28WW5Sr21gZcGXPKSkK/mDziqHBROdeHGkLKP6OIaZ+fJVxy6opMA1F
   2tpcvZPqBMJqoGBJrOGn/MyEVFbsKbYxCxokhdEftZ8ESowgGRbTXBfeF
   X3Wkdtik0oz//B+1s7cQrfJSZfttTZx1poI0ReIIy5a/df0jPYrZIsPuo
   +pFq+t6QlOX0ZXIJr/BLyxGe4ZZd5Je0wWk30JwHSH3diCwkSDZh0YNEq
   xkUL1kGUEbQsKU1qSw1lKeVm2c6l4sNbPRGv5YHHAF96Vc+xsEYmgYymQ
   GfPRZpm1yu3fNZ2dr/G/onrpTw1aWwWHtMa/9qVK17GO3qXFLxJmmPv3R
   Q==;
X-CSE-ConnectionGUID: Co81dHvPQImnN1Yh+cfmqg==
X-CSE-MsgGUID: 73Q3a8S3Sk6lL5+UeQ1bNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49848063"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49848063"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:17:14 -0700
X-CSE-ConnectionGUID: IRyZBA6xRXK9/tMskgqUFQ==
X-CSE-MsgGUID: MvsA5NJFQOmUedhDBhk8nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144514724"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 11:17:14 -0700
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
	leo.yan@arm.com,
	Kan Liang <kan.liang@linux.intel.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: [PATCH V4 16/16] mips/perf: Remove driver-specific throttle support
Date: Tue, 20 May 2025 11:16:44 -0700
Message-Id: <20250520181644.2673067-17-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250520181644.2673067-1-kan.liang@linux.intel.com>
References: <20250520181644.2673067-1-kan.liang@linux.intel.com>
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


