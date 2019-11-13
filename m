Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9124FAF21
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2019 11:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbfKMK5I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Nov 2019 05:57:08 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45123 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbfKMK5H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Nov 2019 05:57:07 -0500
Received: by mail-pf1-f195.google.com with SMTP id z4so1397089pfn.12
        for <linux-mips@vger.kernel.org>; Wed, 13 Nov 2019 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=G6fU2jiu3dJQMWc2Snrc3nEuYdUb5v2i1mbF7lHdPNU=;
        b=XdZ3aHbilosw1Qsmp4yqJ+GmOMAbQVH+tVENp3MjPPL80sv2o3z5tTxLQ9ckWYbqJP
         hcnxH4Vnqli+myYeygELQV5Pb652UM1bQk2ozJjZB7+7zLydeVty+2n2tR2XSL0w8IoT
         kF0OKA0bGUzWO7HtQRe9i6EETFmBrtOYfvc7gfeRhB3RUB2igCusAjtjfGlVGOxPu+2d
         3sB0DU8yr4n7xA21iyM4XOkNRN9beZKVueto7SK8AySqOJ7YeFa+wbwI9SVYjZx6MXfZ
         BmBEFZC1jrjouNFnGb3CXLaWZisYgVIhqZSn8peZxR+oZcYQTDQGVukmibyZIGv7Bq90
         hgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=G6fU2jiu3dJQMWc2Snrc3nEuYdUb5v2i1mbF7lHdPNU=;
        b=WSJv7wyqPu+wjrZwvABRWKCqkh7gUierTXjhpSiG6zQS/vOkIpGcom/toLrew1S7B1
         argp2zp5ZQc2Si/fWpX8PRfGJoIbrhgfZ+wCjtEzRIhasOIMQxKVvTaHU69XvTvGQGP1
         rv3pceNH1T4aSr/lBQagd3oyVG7uljZa07pPVkRWkVh479VFU1WPyOhBUmeaMywdbsLG
         m5+My2vs2obTisekNXzYD8IEjw66yNhmaU+3MGPcQ0P/lCh1uOQG6XHwNy1DwxTVThHa
         EOkEc7/GRDUK6VfuuKQkGslT5n0Ji2qMHfbCeaXhyeI/I1IM1NnW3BMevptXpJ7ZYeoy
         hJPw==
X-Gm-Message-State: APjAAAXGmLf6mxoUfhGOfF65lI6kzC4/rnCOSW7QtBT5uZ6A8EQDBuBv
        w1RJcSI+H6lSH6fePURiONdZjw==
X-Google-Smtp-Source: APXvYqxzzZMvRbWf2vVOoMM2l2M3qf4AXN/5TO45rWHTPABWPBMfwNT9I+LVXwWv9RLyGzpyqaNtzg==
X-Received: by 2002:a65:62d2:: with SMTP id m18mr2941029pgv.117.1573642626289;
        Wed, 13 Nov 2019 02:57:06 -0800 (PST)
Received: from localhost.localdomain ([49.207.52.194])
        by smtp.gmail.com with ESMTPSA id u24sm1931009pgf.6.2019.11.13.02.57.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 02:57:05 -0800 (PST)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Stable <stable@vger.kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] MIPS: BCM63XX: fix switch core reset on BCM6368
Date:   Wed, 13 Nov 2019 16:27:00 +0530
Message-Id: <1573642620-31192-1-git-send-email-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Jonas Gorski <jonas.gorski@gmail.com>

commit 8a38dacf87180738d42b058334c951eba15d2d47 upstream.

The Ethernet Switch core mask was set to 0, causing the switch core to
be not reset on BCM6368 on boot. Provide the proper mask so the switch
core gets reset to a known good state.

Fixes: 799faa626c71 ("MIPS: BCM63XX: add core reset helper")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: linux-mips@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
Cherry-picked from lede/openwrt https://git.lede-project.org/?p=source.git.
Build tested on v4.{19,14,9,4}.y and v3.18.y for ARCH=mips bcm63xx_defconfig.

 arch/mips/bcm63xx/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm63xx/reset.c b/arch/mips/bcm63xx/reset.c
index a2af38cf28a7..64574e74cb23 100644
--- a/arch/mips/bcm63xx/reset.c
+++ b/arch/mips/bcm63xx/reset.c
@@ -120,7 +120,7 @@
 #define BCM6368_RESET_DSL	0
 #define BCM6368_RESET_SAR	SOFTRESET_6368_SAR_MASK
 #define BCM6368_RESET_EPHY	SOFTRESET_6368_EPHY_MASK
-#define BCM6368_RESET_ENETSW	0
+#define BCM6368_RESET_ENETSW	SOFTRESET_6368_ENETSW_MASK
 #define BCM6368_RESET_PCM	SOFTRESET_6368_PCM_MASK
 #define BCM6368_RESET_MPI	SOFTRESET_6368_MPI_MASK
 #define BCM6368_RESET_PCIE	0
-- 
2.7.4

