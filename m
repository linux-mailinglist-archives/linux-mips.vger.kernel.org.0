Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1D91B539
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2019 13:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfEMLrc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 07:47:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:55540 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729411AbfEMLrc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 May 2019 07:47:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 33432AD85;
        Mon, 13 May 2019 11:47:31 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kernel: only use i8253 clocksource with periodic clockevent
Date:   Mon, 13 May 2019 13:47:25 +0200
Message-Id: <20190513114725.17823-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.13.7
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

i8253 clocksource needs a free running timer. This could only
be used, if i8253 clockevent is set up as periodic.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/kernel/i8253.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/i8253.c b/arch/mips/kernel/i8253.c
index 5f209f111e59..df7ddd246eaa 100644
--- a/arch/mips/kernel/i8253.c
+++ b/arch/mips/kernel/i8253.c
@@ -32,7 +32,8 @@ void __init setup_pit_timer(void)
 
 static int __init init_pit_clocksource(void)
 {
-	if (num_possible_cpus() > 1) /* PIT does not scale! */
+	if (num_possible_cpus() > 1 || /* PIT does not scale! */
+	    !clockevent_state_periodic(&i8253_clockevent))
 		return 0;
 
 	return clocksource_i8253_init();
-- 
2.13.7

