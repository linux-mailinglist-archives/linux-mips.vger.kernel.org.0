Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 669131E1384
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 19:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389620AbgEYRmY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 13:42:24 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:48890 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389348AbgEYRmY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 May 2020 13:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590428534; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WUGaynRLAt4hNNQ3ZwtjFrnVP7l8OxM7M2JwLPdQUmc=;
        b=EgEo1mMXSMR5o+eLiHSLfzqVtBtdpZBTttvYcgE/2Us0mjfG44zqnath4veZhrgLq2xiCu
        uw4b6Glw8aLvLSnZzC6OcQMI8BKsin9nA1YFleOWC4kyOORXQjFr32/bwzzEiJRwkXDXJT
        pMoBLVCEqAhCRuaZ0ywEQ11Tsnho5JQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me, devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] MIPS: ingenic: Add support for GCW Zero prototype
Date:   Mon, 25 May 2020 19:41:54 +0200
Message-Id: <20200525174155.457491-2-paul@crapouillou.net>
In-Reply-To: <20200525174155.457491-1-paul@crapouillou.net>
References: <20200525174155.457491-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for the GCW Zero prototype. The only (?) difference is that
it only has 256 MiB of RAM, compared to the 512 MiB of RAM of the retail
device.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/gcw0_proto.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/gcw0_proto.dts

diff --git a/arch/mips/boot/dts/ingenic/gcw0_proto.dts b/arch/mips/boot/dts/ingenic/gcw0_proto.dts
new file mode 100644
index 000000000000..02df22f8ae0f
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/gcw0_proto.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "gcw0.dts"
+
+/ {
+	model = "GCW Zero Prototype";
+};
+
+&memory {
+	/* Prototype has only 256 MiB of RAM */
+	reg = <0x0 0x10000000>;
+};
-- 
2.26.2

