Return-Path: <linux-mips+bounces-9018-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A8ABA2DF
	for <lists+linux-mips@lfdr.de>; Fri, 16 May 2025 20:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7D575060A0
	for <lists+linux-mips@lfdr.de>; Fri, 16 May 2025 18:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5082820D6;
	Fri, 16 May 2025 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zzyadty/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62728137A;
	Fri, 16 May 2025 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420173; cv=none; b=rpEjHbIqHC32+Obq0YCsVwbTfnXlox9Is2oZLuEaLNQr3ySZfarQlWcfYtv/Z3Fo1wbfVqBr9eN5ihG8Y40vqY5R+gnWBoQacII9TsBCSdteJAhVLWoPCJda3upb386n6Do+WqfbRd57tAiicB/1h7Xzgr1ZF7NUV1IhHkggdRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420173; c=relaxed/simple;
	bh=W83BuCBEGVgUrqk/CNpFhmFYGiaT4zNHiSxidabkeh4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lwz5aJa1grgz+6OXt1jN7tuQsGz2FA/6kyeFuGwNA2gCTRlM0sW46XVMN+XuMOA0Ms9jEgA9c0OxXuMsAPgxyrEdf0bcvl0cNjGUUqHsKuMfKq0BiVU8bGh2av7aujo6FJ9/eJL5wfGnEc4ORO52kAGzvBwtFmYf0F87LGXDLuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zzyadty/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747420172; x=1778956172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W83BuCBEGVgUrqk/CNpFhmFYGiaT4zNHiSxidabkeh4=;
  b=Zzyadty/ag4goQKn25udEESyhwObFVCJA07RNE+J+7syeJZUeN7ieMkt
   6+Gm/dErxEe9uy2Jzu38t4JO6g/U3spRW2WnRj1herevMbRZoIgg+8XQY
   1z+aploUOi5sUte431G9n5ybGI/ophh/tZxVsXhN2fbUzQyEmHM7JM4mb
   ftOIH/4uWfruqb2Jd7xRFxmCy0qlj+vZsU2zsY+yqPFgqTTAAa7/ZpC8B
   N2De6C7f1hf/xy6FGA8LArNbHFZuMRYgLcukuD285JuYn8NjaVGf2fwzT
   I6IAbD1akN2rjwi/R5IYIrbWq9yUsjswhd0J0oQg7uYzBqS7eEX6Uw2/X
   A==;
X-CSE-ConnectionGUID: Hm1TOsNEQuygO/raj41f1A==
X-CSE-MsgGUID: dLIykaq/QKqhhkmKiYit/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49328919"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49328919"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 11:29:26 -0700
X-CSE-ConnectionGUID: 45kEMhpORqi9xmyQRIxyyg==
X-CSE-MsgGUID: u0tF4969TS+ewt2PfEmthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="169802628"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 11:29:25 -0700
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
Subject: [PATCH V3 16/16] mips/perf: Remove driver-specific throttle support
Date: Fri, 16 May 2025 11:28:53 -0700
Message-Id: <20250516182853.2610284-17-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250516182853.2610284-1-kan.liang@linux.intel.com>
References: <20250516182853.2610284-1-kan.liang@linux.intel.com>
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


