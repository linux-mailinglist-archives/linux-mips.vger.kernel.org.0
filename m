Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9656180F67
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 06:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgCKFIa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 01:08:30 -0400
Received: from smtprelay0239.hostedemail.com ([216.40.44.239]:52550 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728200AbgCKFHN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 01:07:13 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id C492A8415;
        Wed, 11 Mar 2020 05:07:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:541:800:960:967:973:982:988:989:1260:1311:1314:1345:1359:1437:1515:1534:1539:1568:1711:1714:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3865:3866:3867:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6261:9025:10004:10848:11026:11473:11658:11914:12043:12296:12297:12438:12555:12679:12895:12986:13069:13311:13357:13894:14181:14384:14394:14721:21080:21433:21627:21811:21939:30054:30090,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: title31_219eac731e337
X-Filterd-Recvd-Size: 1529
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Wed, 11 Mar 2020 05:07:10 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH -next 014/491] DECSTATION PLATFORM SUPPORT: Use fallthrough;
Date:   Tue, 10 Mar 2020 21:51:28 -0700
Message-Id: <79ddf8b6b0d77cd6489711e817fce622f8a85d0b.1583896348.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1583896344.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the various uses of fallthrough comments to fallthrough;

Done via script
Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/mips/dec/tc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/dec/tc.c b/arch/mips/dec/tc.c
index 732027c..dba583 100644
--- a/arch/mips/dec/tc.c
+++ b/arch/mips/dec/tc.c
@@ -52,7 +52,7 @@ int __init tc_bus_get_info(struct tc_bus *tbus)
 	case MACH_DS5900:
 		tbus->ext_slot_base = 0x20000000;
 		tbus->ext_slot_size = 0x20000000;
-		/* fall through */
+		fallthrough;
 	case MACH_DS5000_1XX:
 		tbus->num_tcslots = 3;
 		break;
-- 
2.24.0

