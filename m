Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FAE29F054
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 16:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgJ2PoW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 11:44:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727832AbgJ2PoW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Oct 2020 11:44:22 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D9FA207DE;
        Thu, 29 Oct 2020 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603986261;
        bh=SLUJTRu29uFVuhFU51hppKaHEsWdbQ1h2/1qgOwsvBo=;
        h=From:To:Cc:Subject:Date:From;
        b=kZUUAVz9j4j8+w7jNf3cHt7Dr4CO9tS3JnhFK6GuKj8YkoT40UP/KEMlD4UM4Q/yb
         WinaJN9ccHPpd6v248zcy4B6yOTmPGDjjeWQM+vcNXKYv36BjLwJCjtQ2iQJck+NJ1
         2g/Gu7XI4yJywsNgmPjqgSnnNrZn+k7JJcmtylPU=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH v2 1/2] MAINTAINERS: Remove JZ4780 DMA driver entry
Date:   Thu, 29 Oct 2020 16:44:13 +0100
Message-Id: <20201029154414.25852-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The entry for MIPS Ingenic JZ4780 DMA driver is not up to date anymore.
Zubair Lutfullah Kakakhel's email bounces and no maintenance is
provided.

Suggested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 MAINTAINERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8a905354ee9..cbab64364ab3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8665,11 +8665,6 @@ F:	include/uapi/rdma/
 F:	samples/bpf/ibumad_kern.c
 F:	samples/bpf/ibumad_user.c
 
-INGENIC JZ4780 DMA Driver
-M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
-S:	Maintained
-F:	drivers/dma/dma-jz4780.c
-
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.25.1

