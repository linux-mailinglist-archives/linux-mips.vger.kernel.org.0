Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9673B7F07E
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 11:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730790AbfHBJ35 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Aug 2019 05:29:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:55200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbfHBJ34 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Aug 2019 05:29:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6EC9421783;
        Fri,  2 Aug 2019 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564738195;
        bh=HP3/a2oZIL74Jk6LrFo/J/9++kAyvAYs/l+UguAunkM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qfeMe/qcYWtf53z3Z9dF+oxGOcJaUAjCrGcvyULlxDBqw36yQU/hChfAu0qTelaID
         AQinUj+FtVVIUkZhspjFMhGHrN/Vdn4Xy9kV9Z5cgxDvejZLF7uVIenpCf4bBryTIS
         npr/gwuhMBk+ptEwJPy9Nyab4WzCSqGcusck5tcw=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Stefan Hellermann <stefan@the2masters.de>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.4 001/158] MIPS: ath79: fix ar933x uart parity mode
Date:   Fri,  2 Aug 2019 11:27:02 +0200
Message-Id: <20190802092203.934918516@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802092203.671944552@linuxfoundation.org>
References: <20190802092203.671944552@linuxfoundation.org>
User-Agent: quilt/0.66
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[ Upstream commit db13a5ba2732755cf13320f3987b77cf2a71e790 ]

While trying to get the uart with parity working I found setting even
parity enabled odd parity insted. Fix the register settings to match
the datasheet of AR9331.

A similar patch was created by 8devices, but not sent upstream.
https://github.com/8devices/openwrt-8devices/commit/77c5586ade3bb72cda010afad3f209ed0c98ea7c

Signed-off-by: Stefan Hellermann <stefan@the2masters.de>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/mach-ath79/ar933x_uart.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ath79/ar933x_uart.h b/arch/mips/include/asm/mach-ath79/ar933x_uart.h
index c2917b39966b..bba2c8837951 100644
--- a/arch/mips/include/asm/mach-ath79/ar933x_uart.h
+++ b/arch/mips/include/asm/mach-ath79/ar933x_uart.h
@@ -27,8 +27,8 @@
 #define AR933X_UART_CS_PARITY_S		0
 #define AR933X_UART_CS_PARITY_M		0x3
 #define	  AR933X_UART_CS_PARITY_NONE	0
-#define	  AR933X_UART_CS_PARITY_ODD	1
-#define	  AR933X_UART_CS_PARITY_EVEN	2
+#define	  AR933X_UART_CS_PARITY_ODD	2
+#define	  AR933X_UART_CS_PARITY_EVEN	3
 #define AR933X_UART_CS_IF_MODE_S	2
 #define AR933X_UART_CS_IF_MODE_M	0x3
 #define	  AR933X_UART_CS_IF_MODE_NONE	0
-- 
2.20.1



