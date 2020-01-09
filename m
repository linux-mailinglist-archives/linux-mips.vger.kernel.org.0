Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECB17135954
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgAIMen (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:38026 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730964AbgAIMeK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id F1884B220E;
        Thu,  9 Jan 2020 12:34:05 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] MIPS: SGI-IP27: Use union instead of typedef
Date:   Thu,  9 Jan 2020 13:33:45 +0100
Message-Id: <20200109123353.5656-9-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109123353.5656-1-tbogendoerfer@suse.de>
References: <20200109123353.5656-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The upcoming header files for SGI-IP35 shouldn't add new typedef. To
be able to share ip27-hubio.c we need to access register layouts no
longer via a typedef.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip27/ip27-hubio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-hubio.c b/arch/mips/sgi-ip27/ip27-hubio.c
index 298cfdf8b44e..8352eb6403b4 100644
--- a/arch/mips/sgi-ip27/ip27-hubio.c
+++ b/arch/mips/sgi-ip27/ip27-hubio.c
@@ -84,7 +84,7 @@ unsigned long hub_pio_map(nasid_t nasid, xwidgetnum_t widget,
  */
 static void hub_setup_prb(nasid_t nasid, int prbnum, int credits)
 {
-	iprb_t prb;
+	union iprb_u prb;
 	int prb_offset;
 
 	/*
@@ -137,7 +137,7 @@ static void hub_setup_prb(nasid_t nasid, int prbnum, int credits)
 static void hub_set_piomode(nasid_t nasid)
 {
 	u64 ii_iowa;
-	hubii_wcr_t ii_wcr;
+	union hubii_wcr_u ii_wcr;
 	unsigned i;
 
 	ii_iowa = REMOTE_HUB_L(nasid, IIO_OUTWIDGET_ACCESS);
-- 
2.24.1

