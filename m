Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4B439D06B
	for <lists+linux-mips@lfdr.de>; Sun,  6 Jun 2021 20:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhFFSYC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Jun 2021 14:24:02 -0400
Received: from mx3.wp.pl ([212.77.101.10]:12534 "EHLO mx3.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhFFSYB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Jun 2021 14:24:01 -0400
Received: (wp-smtpd smtp.wp.pl 26224 invoked from network); 6 Jun 2021 20:15:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1623003330; bh=S2klCgJAmaBVPeN2YQ5na+TGsXxz0uC1PvtFIIoyahI=;
          h=From:To:Subject;
          b=cAl85gL/yAfswe7EVhJftNHxMp936T/W3Kfx2seFBXudWC5IACi0rv4UkhqmSl5kC
           yKWgTC/wX60wWeyvXHSoqcDzCIgnEe6Tfayec9YakHD8kNEeILAbz3BOizvOJOTYMy
           D831iVTNZOJtuzc7VOmXlG80urxDl/qAqHe3bpgI=
Received: from riviera.nat.ds.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 6 Jun 2021 20:15:30 +0200
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     tsbogend@alpha.franken.de, olek2@wp.pl, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] MIPS: smp-mt: enable all hardware interrupts on second VPE
Date:   Sun,  6 Jun 2021 20:15:25 +0200
Message-Id: <20210606181525.761333-2-olek2@wp.pl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210606181525.761333-1-olek2@wp.pl>
References: <20210606181525.761333-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: f8043a694713caab3a944cc00f95c0d9
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [MXOU]                               
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch is needed to handle interrupts by the second VPE on Lantiq.
It seems the Lantiq SoC is using all the hardware interrupt lines.
Currently changing smp_affinity to the second VPE hangs interrupts.

Tested on lantiq xRX200 and xRX330 (MIPS 34Kc core).

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/kernel/smp-mt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/smp-mt.c b/arch/mips/kernel/smp-mt.c
index 5f04a0141068..f21cd0eb1fa7 100644
--- a/arch/mips/kernel/smp-mt.c
+++ b/arch/mips/kernel/smp-mt.c
@@ -113,8 +113,7 @@ static void vsmp_init_secondary(void)
 					 STATUSF_IP4 | STATUSF_IP5 |
 					 STATUSF_IP6 | STATUSF_IP7);
 	else
-		change_c0_status(ST0_IM, STATUSF_IP0 | STATUSF_IP1 |
-					 STATUSF_IP6 | STATUSF_IP7);
+		set_c0_status(ST0_IM);
 }
 
 static void vsmp_smp_finish(void)
-- 
2.30.2

