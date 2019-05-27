Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 740822B11C
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2019 11:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfE0JNg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 May 2019 05:13:36 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:43284 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbfE0JNg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 May 2019 05:13:36 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id 0B074A01FF;
        Mon, 27 May 2019 11:13:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id LBcvt69E4GPi; Mon, 27 May 2019 11:13:24 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paul.burton@mips.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: [PATCH 1/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPDX GPL-2.0 license identifier
Date:   Mon, 27 May 2019 11:13:16 +0200
Message-Id: <20190527091323.4582-1-sr@denx.de>
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
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: John Crispin <john@phrozen.org>
---
v2:
- Use Harvey's new email address (not at imgtec)
- Use correct linux-mips list address

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

