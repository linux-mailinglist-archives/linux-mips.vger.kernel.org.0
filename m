Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7432395243
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 19:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhE3RUW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 13:20:22 -0400
Received: from aposti.net ([89.234.176.197]:37782 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229915AbhE3RUW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 13:20:22 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/8] MIPS: Kconfig: ingenic: Ensure MACH_INGENIC_GENERIC selects all SoCs
Date:   Sun, 30 May 2021 18:17:58 +0100
Message-Id: <20210530171802.23649-5-paul@crapouillou.net>
In-Reply-To: <20210530171802.23649-1-paul@crapouillou.net>
References: <20210530171802.23649-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The MACH_INGENIC_GENERIC config option must select all SoCs, in order
for all the SoC-specific drivers to become available.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/ingenic/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/ingenic/Kconfig b/arch/mips/ingenic/Kconfig
index 3238e16febd5..f595b339a4b8 100644
--- a/arch/mips/ingenic/Kconfig
+++ b/arch/mips/ingenic/Kconfig
@@ -4,9 +4,11 @@ config MACH_INGENIC_GENERIC
 	bool
 	select MACH_INGENIC
 	select MACH_JZ4740
+	select MACH_JZ4725B
 	select MACH_JZ4770
 	select MACH_JZ4780
 	select MACH_X1000
+	select MACH_X1830
 
 choice
 	prompt "Machine type"
-- 
2.30.2

