Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E5F2AF61
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2019 09:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfE0H3m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 May 2019 03:29:42 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:47006 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbfE0H3m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 May 2019 03:29:42 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 6E06AA0AE8;
        Mon, 27 May 2019 09:29:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id O8TUNVHo2oZw; Mon, 27 May 2019 09:29:31 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paul.burton@mips.com>,
        Harvey Hunt <harvey.hunt@imgtec.com>,
        John Crispin <john@phrozen.org>
Subject: [PATCH 1/9] MIPS: ralink: mt7628a.dtsi: Add SPDX GPL-2.0 license identifier
Date:   Mon, 27 May 2019 09:29:22 +0200
Message-Id: <20190527072930.9844-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As done in commit b24413180f56 ("License cleanup: add SPDX GPL-2.0
license identifier to files with no license"), this patch adds the SPDX
license identifier to mt7628a.dtsi, which is currently still missing
this identifier.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: John Crispin <john@phrozen.org>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 9ff7e8faaecc..3e88c8d496e4 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
-- 
2.21.0

