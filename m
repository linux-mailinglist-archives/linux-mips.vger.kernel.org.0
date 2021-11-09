Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC8E44B866
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 23:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241529AbhKIWma (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 17:42:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:58684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239932AbhKIWkK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 17:40:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C785161AFF;
        Tue,  9 Nov 2021 22:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636496615;
        bh=geWwvt+WcT0Vr9beU/Rq9/kGpE1RZ0NSTymtca8vwFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A4nfPgA4z+iscCmffEGG5SHViYJj0YbRSTHZ9CA4oh4uSGlNMRvdFhq+aGDv7AIcG
         jcet2367VyAyx/QJ6huZbDQh+rEC002bUWnRZNTIn2FPujkqaqsDTnNSmnRFIS+nBk
         EPedqGu+OKsftIkDfwtCS3mc+eqOSJ2UjwTdsaE+4ZQLsPVOizJGdkZlm19OapE4CW
         DwdjNrHXgV+r0gdntg0f0AF4hffS15WSImZTHzuOyn3T+GLJWZblwr4ALL+Y6V4puK
         UNj8lw6Sbg4Li1L5dboxmZQ26TkUjA8fH/OP+x96XsHVPB3JHHre8dEsMtXzyEFKoE
         s22IdtO8oZz9w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Bart Van Assche <bvanassche@acm.org>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, Ralf@vger.kernel.org,
        linux-mips@linux-mips.org
Subject: [PATCH AUTOSEL 4.19 16/21] MIPS: sni: Fix the build
Date:   Tue,  9 Nov 2021 17:23:05 -0500
Message-Id: <20211109222311.1235686-16-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109222311.1235686-1-sashal@kernel.org>
References: <20211109222311.1235686-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit c91cf42f61dc77b289784ea7b15a8531defa41c0 ]

This patch fixes the following gcc 10 build error:

arch/mips/sni/time.c: In function ‘a20r_set_periodic’:
arch/mips/sni/time.c:15:26: error: unsigned conversion from ‘int’ to ‘u8’ {aka ‘volatile unsigned char’} changes value from ‘576’ to ‘64’ [-Werror=overflow]
   15 | #define SNI_COUNTER0_DIV ((SNI_CLOCK_TICK_RATE / SNI_COUNTER2_DIV) / HZ)
      |                          ^
arch/mips/sni/time.c:21:45: note: in expansion of macro ‘SNI_COUNTER0_DIV’
   21 |  *(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV;
      |                                             ^~~~~~~~~~~~~~~~

Cc: linux-mips@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/sni/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sni/time.c b/arch/mips/sni/time.c
index dbace1f3e1a97..745ceb945fc50 100644
--- a/arch/mips/sni/time.c
+++ b/arch/mips/sni/time.c
@@ -18,14 +18,14 @@ static int a20r_set_periodic(struct clock_event_device *evt)
 {
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 12) = 0x34;
 	wmb();
-	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV;
+	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV & 0xff;
 	wmb();
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV >> 8;
 	wmb();
 
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 12) = 0xb4;
 	wmb();
-	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 8) = SNI_COUNTER2_DIV;
+	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 8) = SNI_COUNTER2_DIV & 0xff;
 	wmb();
 	*(volatile u8 *)(A20R_PT_CLOCK_BASE + 8) = SNI_COUNTER2_DIV >> 8;
 	wmb();
-- 
2.33.0

