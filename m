Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240C02CF2A5
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 18:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388524AbgLDRFr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 12:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388516AbgLDRFq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Dec 2020 12:05:46 -0500
Received: from latitanza.investici.org (latitanza.investici.org [IPv6:2001:888:2000:56::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C62EC0613D1
        for <linux-mips@vger.kernel.org>; Fri,  4 Dec 2020 09:05:00 -0800 (PST)
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 4CnfFD0z88z8shw;
        Fri,  4 Dec 2020 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
        s=stigmate; t=1607101456;
        bh=uCxL4ML99SaQcfK9xq45I+PMG7IFylh5UnD0dOSencg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=slNUhh0QlyQxC6cLNojs2ZOUNY2iK2sFSY4J0zEmd6KN8IwBR5Dz5ymAsTAXf3n0n
         49+L2mp7prZeQOoVTadCxnIztqS6xgkhVrcMuEdRc5WTPRRFp2yDc84K9bqkXfOZFy
         EO72gqadgNisKjYMhPuKd6O0/UKXgaiK7fP4gX+k=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: laniel_francis@privacyrequired.com) by localhost (Postfix) with ESMTPSA id 4CnfFC26JPz8sfb;
        Fri,  4 Dec 2020 17:04:15 +0000 (UTC)
From:   laniel_francis@privacyrequired.com
To:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Francis Laniel <laniel_francis@privacyrequired.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 02/12] mips: Replace strstarts() by str_has_prefix().
Date:   Fri,  4 Dec 2020 18:03:08 +0100
Message-Id: <20201204170319.20383-3-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
References: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Francis Laniel <laniel_francis@privacyrequired.com>

The two functions indicates if a string begins with a given prefix.
The only difference is that strstarts() returns a bool while str_has_prefix()
returns the length of the prefix if the string begins with it or 0 otherwise.

Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>
---
 arch/mips/bcm47xx/board.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm47xx/board.c b/arch/mips/bcm47xx/board.c
index 35266a70e22a..c21a15b581f6 100644
--- a/arch/mips/bcm47xx/board.c
+++ b/arch/mips/bcm47xx/board.c
@@ -243,7 +243,7 @@ static __init const struct bcm47xx_board_type *bcm47xx_board_get_nvram(void)
 
 	if (bcm47xx_nvram_getenv("hardware_version", buf1, sizeof(buf1)) >= 0) {
 		for (e1 = bcm47xx_board_list_hardware_version; e1->value1; e1++) {
-			if (strstarts(buf1, e1->value1))
+			if (str_has_prefix(buf1, e1->value1))
 				return &e1->board;
 		}
 	}
@@ -251,7 +251,7 @@ static __init const struct bcm47xx_board_type *bcm47xx_board_get_nvram(void)
 	if (bcm47xx_nvram_getenv("hardware_version", buf1, sizeof(buf1)) >= 0 &&
 	    bcm47xx_nvram_getenv("boardnum", buf2, sizeof(buf2)) >= 0) {
 		for (e2 = bcm47xx_board_list_hw_version_num; e2->value1; e2++) {
-			if (!strstarts(buf1, e2->value1) &&
+			if (!str_has_prefix(buf1, e2->value1) &&
 			    !strcmp(buf2, e2->value2))
 				return &e2->board;
 		}
-- 
2.20.1

