Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059F714601F
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 01:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgAWAy2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 19:54:28 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:52803 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgAWAy2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 19:54:28 -0500
Received: from [82.43.126.140] (helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iuQlL-0007Mx-LB; Thu, 23 Jan 2020 00:54:23 +0000
From:   Colin King <colin.king@canonical.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: octeon-irq: fix spelling mistake "to" -> "too"
Date:   Thu, 23 Jan 2020 00:54:22 +0000
Message-Id: <20200123005422.2834063-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/cavium-octeon/octeon-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index f97be32bf699..6bd1e97effdf 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -2193,7 +2193,7 @@ static int octeon_irq_cib_map(struct irq_domain *d,
 	struct octeon_irq_cib_chip_data *cd;
 
 	if (hw >= host_data->max_bits) {
-		pr_err("ERROR: %s mapping %u is to big!\n",
+		pr_err("ERROR: %s mapping %u is too big!\n",
 		       irq_domain_get_of_node(d)->name, (unsigned)hw);
 		return -EINVAL;
 	}
-- 
2.24.0

