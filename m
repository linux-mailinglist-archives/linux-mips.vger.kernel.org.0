Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D759C24232D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 02:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgHLAQ4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 20:16:56 -0400
Received: from crapouillou.net ([89.234.176.41]:52220 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbgHLAQ4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 20:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597191331; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gSExwdzJ91XLqePVYEJX4XriqNHkP8d6kf93RsxKE0Q=;
        b=GSb57nyrixbq0EF5+uAGHdWfjSmUenMg5yvx/O5k0sEropc87hLjvhdygWhChMe0kBjTRT
        SylsIuROkohASm25SX/x1R3PyQKC5GyEYl+mdizJiOslQbxMjkismQC1HMcjVdIiORYDNp
        M61+8jZ9+J49OlIGB8FZp7Pi6oOdFAw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 13/13] MAINTAINERS: Update paths to Ingenic platform code
Date:   Wed, 12 Aug 2020 02:15:10 +0200
Message-Id: <20200812001510.460382-14-paul@crapouillou.net>
In-Reply-To: <20200812001510.460382-1-paul@crapouillou.net>
References: <20200812001510.460382-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support for Ingenic chips has been moved to the generic MIPS platform.
Update the paths accordingly.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 87d26c167c99..2b4eba7e9916 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8508,8 +8508,8 @@ INGENIC JZ47xx SoCs
 M:	Paul Cercueil <paul@crapouillou.net>
 S:	Maintained
 F:	arch/mips/boot/dts/ingenic/
-F:	arch/mips/include/asm/mach-jz4740/
-F:	arch/mips/jz4740/
+F:	arch/mips/generic/board-ingenic.c
+F:	arch/mips/ingenic/Kconfig
 F:	drivers/clk/ingenic/
 F:	drivers/dma/dma-jz4780.c
 F:	drivers/gpu/drm/ingenic/
-- 
2.28.0

