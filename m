Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84ED2CF2AC
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 18:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731071AbgLDRF6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 12:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbgLDRF6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Dec 2020 12:05:58 -0500
Received: from latitanza.investici.org (latitanza.investici.org [IPv6:2001:888:2000:56::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3BFC061A56;
        Fri,  4 Dec 2020 09:04:40 -0800 (PST)
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 4CnfFg0NLqz8sfb;
        Fri,  4 Dec 2020 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
        s=stigmate; t=1607101479;
        bh=UdwxBvooMqxx5IHG/cr4Vy5TgCZ3SrzMXwuTOdWz9ss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nfWArkaqMQH8dswdXmU6Jfdz3NT6526m6iWoMkCcoAEefXQquMxIby8MtVehmY+S2
         L7/9Ug3O3/9WY+1+ssh6eRm3WBqdfCAxSdS+fEYVGAPbsste8y2s6dFBFsinhxrq7u
         kJlRNTR4rdbYQn0CDFm06/rcILZeiYTx4mqOOWjA=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: laniel_francis@privacyrequired.com) by localhost (Postfix) with ESMTPSA id 4CnfFf0G5fz8sj5;
        Fri,  4 Dec 2020 17:04:37 +0000 (UTC)
From:   laniel_francis@privacyrequired.com
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
Cc:     Francis Laniel <laniel_francis@privacyrequired.com>,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 09/12] mips: Replace strstarts() by str_has_prefix().
Date:   Fri,  4 Dec 2020 18:03:15 +0100
Message-Id: <20201204170319.20383-10-laniel_francis@privacyrequired.com>
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
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 01aff80a5967..85ccb2b02621 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -747,7 +747,7 @@ void __init board_prom_init(void)
 
 	/* dump cfe version */
 	cfe = boot_addr + BCM963XX_CFE_VERSION_OFFSET;
-	if (strstarts(cfe, "cfe-")) {
+	if (str_has_prefix(cfe, "cfe-")) {
 		if(cfe[4] == 'v') {
 			if(cfe[5] == 'd')
 				snprintf(cfe_version, 11, "%s",
-- 
2.20.1

