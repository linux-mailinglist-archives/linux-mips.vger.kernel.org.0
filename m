Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B81B8C5EE
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 04:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfHNCLY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Aug 2019 22:11:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727333AbfHNCLX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Aug 2019 22:11:23 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C87C20844;
        Wed, 14 Aug 2019 02:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565748682;
        bh=tp/TihEb7M9Z4ZC/KrwWjm0E5mpt+2qt7/njaZiu8yg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bq0ODtPHzagId2SqTIK0FZ2DQgwqgOWZRfsDP4XTP21zXNKmTtODInCobS8FHZLzF
         /w1pM/dGPLlGaO327xFvwpibvUFNY1/AowHQVcVUtbq/ghrSOO8OvvX/RJxQYNE1NC
         iGr8pjZOS8f7m75sh7LacLrEcEkXl5Z7G/QZBPzM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 019/123] mips: fix cacheinfo
Date:   Tue, 13 Aug 2019 22:09:03 -0400
Message-Id: <20190814021047.14828-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>

[ Upstream commit b8bea8a5e5d942e62203416ab41edecaed4fda02 ]

Because CONFIG_OF defined for MIPS, cacheinfo attempts to fill information
from DT, ignoring data filled by architecture routine. This leads to error
reported

 cacheinfo: Unable to detect cache hierarchy for CPU 0

Way to fix this provided in
commit fac51482577d ("drivers: base: cacheinfo: fix x86 with
 CONFIG_OF enabled")

Utilize same mechanism to report that cacheinfo set by architecture
specific function

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@linux.intel.com>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/cacheinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
index e0dd66881da68..f777e44653d57 100644
--- a/arch/mips/kernel/cacheinfo.c
+++ b/arch/mips/kernel/cacheinfo.c
@@ -69,6 +69,8 @@ static int __populate_cache_leaves(unsigned int cpu)
 	if (c->tcache.waysize)
 		populate_cache(tcache, this_leaf, 3, CACHE_TYPE_UNIFIED);
 
+	this_cpu_ci->cpu_map_populated = true;
+
 	return 0;
 }
 
-- 
2.20.1

