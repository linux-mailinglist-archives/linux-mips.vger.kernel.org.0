Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 994674844D
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2019 15:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfFQNoI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jun 2019 09:44:08 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52005 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfFQNoI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jun 2019 09:44:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so9351564wma.1
        for <linux-mips@vger.kernel.org>; Mon, 17 Jun 2019 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=the2masters.de; s=mail;
        h=from:to:subject:date:message-id;
        bh=GHWGqj0k+ijkQmtd20sUl8pGKSDw8BEQoFmOATgYAzk=;
        b=t/AH9Q1xWH5oSy86Q0I9V1A8N8y17wJkTfWTAJvnjMEJ/WmC1s0bxqp3q5OHtPrEwr
         Md95/cxwcBCtg9zwfkZC2merdSIngfvyG6eYd0b2ZZlUPozgCM3aJ235MgOPqHolzfjR
         hR3GMIKOi2uB3PYQxNLTZ4rhtl/814rrOtgxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=GHWGqj0k+ijkQmtd20sUl8pGKSDw8BEQoFmOATgYAzk=;
        b=CK7yWebNl/Q0ahDQdkZxYQj2/7MNqZfmP/Awl/sHjBq/2ZZj52DKXqyYSQ1vVnVVu6
         Q7aVneWazSk3ldDDE8xWNJrtVIwEax0pziyyQajaEm8jkIUJ5npXvApT1PAk7yy5bBVU
         voSsmdi6VKC1tz5hTvT2v122dxv3EQMmVE0QTpNyDuFRDYROR/NN9IrLMEnbRdJNtwNb
         Ov8QYXmes47uV9Qfz85L5zyY2aTu0jQ1U4Iwldhc7TcoLrRfzUd1Qq79ma+Z9+PTRjFJ
         teaoSCzsEc28vncsL63DsE9OZzv97bDMxuQdASAvOkTIRu76mmVLrEB3U7hHOz2+rrHO
         vNOQ==
X-Gm-Message-State: APjAAAUWnelz1tXNO8e57B6d7FyIUtTWPjBqI2OqtypL0A7W5EWabT1k
        sAS5dlz4M3IZ//7GvQ+h3dN3CIg/7YM=
X-Google-Smtp-Source: APXvYqydTk3jIyRiH+jy/dDNjUGq3QhE6z3pEJaStGcKcvy/PhhL86p5M6cvgCWFd7/WYal/mKp56Q==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr20154311wmj.13.1560779045987;
        Mon, 17 Jun 2019 06:44:05 -0700 (PDT)
Received: from devel.fritz.box (p200300D13BCA7B00505400FFFE8F3C0F.dip0.t-ipconnect.de. [2003:d1:3bca:7b00:5054:ff:fe8f:3c0f])
        by smtp.googlemail.com with ESMTPSA id z6sm12869460wrw.2.2019.06.17.06.44.04
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 06:44:05 -0700 (PDT)
From:   Stefan Hellermann <stefan@the2masters.de>
To:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: ath79: fix ar933x uart parity mode
Date:   Mon, 17 Jun 2019 15:43:59 +0200
Message-Id: <20190617134359.5968-1-stefan@the2masters.de>
X-Mailer: git-send-email 2.11.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While trying to get the uart with parity working I found setting even
parity enabled odd parity insted. Fix the register settings to match
the datasheet of AR9331.

A similar patch was created by 8devices, but not sent upstream.
https://github.com/8devices/openwrt-8devices/commit/77c5586ade3bb72cda010afad3f209ed0c98ea7c

Signed-off-by: Stefan Hellermann <stefan@the2masters.de>
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
2.11.0

