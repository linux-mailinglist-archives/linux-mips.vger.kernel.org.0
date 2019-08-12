Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE1E89B9D
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 12:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfHLKhI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 06:37:08 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:35316 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727276AbfHLKhI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 06:37:08 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id EB528A17E8;
        Mon, 12 Aug 2019 12:37:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id n0oPT20cvQGH; Mon, 12 Aug 2019 12:36:56 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paul.burton@mips.com>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4 v4] dt-bindings: mips: Add missing mt7688a-soc compatible
Date:   Mon, 12 Aug 2019 12:36:53 +0200
Message-Id: <20190812103655.11070-2-sr@denx.de>
In-Reply-To: <20190812103655.11070-1-sr@denx.de>
References: <20190812103655.11070-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch adds the "ralink,mt7688a-soc" compatible to the ralink DT
bindings documentation. This compatible is already used by some MIPS
boards (e.g. omega2p.dts) but not yet documented. It will also be used
by the upcoming "GARDENA smart Gateway" support.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
v4:
- New patch

 Documentation/devicetree/bindings/mips/ralink.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mips/ralink.txt b/Documentation/devicetree/bindings/mips/ralink.txt
index a16e8d7fe56c..3341945b51d9 100644
--- a/Documentation/devicetree/bindings/mips/ralink.txt
+++ b/Documentation/devicetree/bindings/mips/ralink.txt
@@ -16,3 +16,4 @@ value must be one of the following values:
   ralink,mt7620a-soc
   ralink,mt7620n-soc
   ralink,mt7628a-soc
+  ralink,mt7688a-soc
-- 
2.22.0

