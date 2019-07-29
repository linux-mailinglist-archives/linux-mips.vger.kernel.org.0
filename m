Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBD678452
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 07:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfG2FJI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 01:09:08 -0400
Received: from mail.coding4coffee.org ([5.9.171.142]:41484 "EHLO
        mail.coding4coffee.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfG2FJI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jul 2019 01:09:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.coding4coffee.org (Postfix) with ESMTP id 6288EDAF;
        Mon, 29 Jul 2019 07:09:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at coding4coffee.org
Received: from mail.coding4coffee.org ([127.0.0.1])
        by localhost (mail.coding4coffee.org [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id kHIT8exP3m3L; Mon, 29 Jul 2019 07:09:05 +0200 (CEST)
Received: from coding4coffee.org (x2f7fde8.dyn.telefonica.de [2.247.253.232])
        by mail.coding4coffee.org (Postfix) with ESMTPSA id 3206FDA4;
        Mon, 29 Jul 2019 07:09:05 +0200 (CEST)
From:   Fabian Mewes <architekt@coding4coffee.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabian Mewes <architekt@coding4coffee.org>
Subject: [PATCH v2] MIPS: Kconfig: remove HAVE_LATENCYTOP_SUPPORT
Date:   Mon, 29 Jul 2019 07:08:34 +0200
Message-Id: <20190729050834.22827-1-architekt@coding4coffee.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <77754e88-ff5d-2021-60f5-80417d61763c@cogentembedded.com>
References: <77754e88-ff5d-2021-60f5-80417d61763c@cogentembedded.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

HAVE_LATENCYTOP_SUPPORT was removed all together in da48d094ce5d7
("Kconfig: remove HAVE_LATENCYTOP_SUPPORT"). This commit removes
a leftover in the MIPS Kconfig.

Signed-off-by: Fabian Mewes <architekt@coding4coffee.org>
---
v1..v2: specify commit's summary enclosed in ("")

 arch/mips/Kconfig |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd..4958734 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3069,10 +3069,6 @@ config STACKTRACE_SUPPORT
 	bool
 	default y
 
-config HAVE_LATENCYTOP_SUPPORT
-	bool
-	default y
-
 config PGTABLE_LEVELS
 	int
 	default 4 if PAGE_SIZE_4KB && MIPS_VA_BITS_48
-- 
2.11.0

