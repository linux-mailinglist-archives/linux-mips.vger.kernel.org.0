Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D531AFCA9
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 19:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDSR1T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 13:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725932AbgDSR1T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 19 Apr 2020 13:27:19 -0400
X-Greylist: delayed 393 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 19 Apr 2020 10:27:19 PDT
Received: from mail.blocktrron.ovh (mars.blocktrron.ovh [IPv6:2001:41d0:401:3000::cbd])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762A0C061A0C;
        Sun, 19 Apr 2020 10:27:19 -0700 (PDT)
Received: from dbauer-t470.home.david-bauer.net (p200300E53F42450099DED5C33771392C.dip0.t-ipconnect.de [IPv6:2003:e5:3f42:4500:99de:d5c3:3771:392c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.blocktrron.ovh (Postfix) with ESMTPSA id 1A7CF1E431;
        Sun, 19 Apr 2020 19:20:44 +0200 (CEST)
From:   David Bauer <mail@david-bauer.net>
To:     devicetree@vger.kernel.org
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] dt-bindings: mips: add missing ath79 SoCs
Date:   Sun, 19 Apr 2020 19:20:32 +0200
Message-Id: <20200419172032.100463-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The binding document was not updates since 2015.
This adds Qualcomm Atheros SoCs which hit the market since then.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 Documentation/devicetree/bindings/mips/ath79-soc.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/ath79-soc.txt b/Documentation/devicetree/bindings/mips/ath79-soc.txt
index 88a12a43e44e..7dc56f26882a 100644
--- a/Documentation/devicetree/bindings/mips/ath79-soc.txt
+++ b/Documentation/devicetree/bindings/mips/ath79-soc.txt
@@ -17,5 +17,11 @@ value must be one of the following values:
 - qca,ar9341
 - qca,ar9342
 - qca,ar9344
+- qca,qca9531
+- qca,qca9533
 - qca,qca9556
+- qca,qca9557
 - qca,qca9558
+- qca,qca9561
+- qca,qca9563
+- qca,tp9343
-- 
2.26.1

