Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B96B91523F7
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 01:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgBEAMB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Feb 2020 19:12:01 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:56304 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbgBEALk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Feb 2020 19:11:40 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E35A2891B1;
        Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1580861498;
        bh=IhPUhSSDDjQoI0blZkV3gyPDHloqc6R5MelhKc8cWFM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=l9IwziBNV7daVS32v9VJ/xGypl/Zxjuwkzs0eANRDZldiOA3avA5A8I3WKOXeFNVS
         leJd3SRTm3tScvndA/x1t01aQtR+f7leARFMKODol06K+4E3HYUmhSkpeKXHzHVNsw
         ooLe9JHTWWJrbvdolvCh5wFYjNCBFQsSAFypJ1r17SZtwjIdWzN4qcUWU73OWJNUDB
         dRX7AsLL6dBP3uaGw/BOjoR637ObySZfefArhO4oMkP7D9E6YOmcPWsaij+PpU7JA1
         XgweN7BpRSN99g9/J5f6PO3ZGfG2SFZ+LoVfS4f+9Mg8j6NBz0mCchh5m5Gh2ErN1H
         rTarg1hIF/j3Q==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e3a083b0000>; Wed, 05 Feb 2020 13:11:39 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 348F913EEDE;
        Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id A4B97280038; Wed,  5 Feb 2020 13:11:38 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregkh@linuxfoundation.org, ralf@linux-mips.org,
        paulburton@kernel.org, linux@roeck-us.net,
        dan.carpenter@oracle.com, willy@infradead.org
Cc:     linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 6/6] Revert "staging/octeon: Mark Ethernet driver as BROKEN"
Date:   Wed,  5 Feb 2020 13:11:16 +1300
Message-Id: <20200205001116.14096-7-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
References: <20200205001116.14096-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit 075a1e87d1e2358d0b0301ac8f8e7f25051decf1. Now that
the build issues have been fixed we can resume build testing.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/staging/octeon/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/octeon/Kconfig b/drivers/staging/octeon/Kcon=
fig
index e7f4ddcc1361..5319909eb2f6 100644
--- a/drivers/staging/octeon/Kconfig
+++ b/drivers/staging/octeon/Kconfig
@@ -3,7 +3,6 @@ config OCTEON_ETHERNET
 	tristate "Cavium Networks Octeon Ethernet support"
 	depends on CAVIUM_OCTEON_SOC || COMPILE_TEST
 	depends on NETDEVICES
-	depends on BROKEN
 	select PHYLIB
 	select MDIO_OCTEON
 	help
--=20
2.25.0

