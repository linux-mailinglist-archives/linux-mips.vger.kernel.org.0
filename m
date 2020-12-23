Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3EB2E177F
	for <lists+linux-mips@lfdr.de>; Wed, 23 Dec 2020 04:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgLWCSZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 21:18:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:45448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727990AbgLWCSY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Dec 2020 21:18:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5112C2222D;
        Wed, 23 Dec 2020 02:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608689841;
        bh=ujoq2AeYSKSnolLItAFtjYIMJgf20e1hS9qUJL0oRQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X5ePFQ9IM75n1poMgGWoVTK7bk1LRWc2TRa/hlu8OP5+xOF9hyHaz6BQ8t2IXFXkR
         kuRK6JhqVrIKr0Ng3qTB40QX9WHG5fxSUgR2RLxVcY+jEQx347MA+a9EyqWr1sdYK/
         B5yTPJupNXHnOTxFPNvarBtbE/gwR/6Lsq1myMhfN1nFRR27juAyf8DjAQipn00UNV
         2r/Bo6KWQGyVpC++6qvky2dQ7rSsFBuI/m8e5reTaSZqUyDllJy9MMMfzcZN4lkqgF
         E+wsstU7WaMGcmcMFz79G3qqqdontgPxO/1Pi26cN8YejIaCy6PviOmySbOdHgWg6V
         3s3Ln7Fj/SI6Q==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Qinglang Miao <miaoqinglang@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 041/217] mips: cm: add missing iounmap() on error in mips_cm_probe()
Date:   Tue, 22 Dec 2020 21:13:30 -0500
Message-Id: <20201223021626.2790791-41-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Qinglang Miao <miaoqinglang@huawei.com>

[ Upstream commit 2673ecf9586551c5bcee499c1cc1949f6f7cc9a1 ]

Add the missing iounmap() of iounmap(mips_gcr_base) before
return from mips_cm_probe() in the error handling case.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/mips-cm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index f60af512c8773..90f1c3df1f0e4 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -266,6 +266,7 @@ int mips_cm_probe(void)
 	if ((base_reg & CM_GCR_BASE_GCRBASE) != addr) {
 		pr_err("GCRs appear to have been moved (expected them at 0x%08lx)!\n",
 		       (unsigned long)addr);
+		iounmap(mips_gcr_base);
 		mips_gcr_base = NULL;
 		return -ENODEV;
 	}
-- 
2.27.0

