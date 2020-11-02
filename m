Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0680A2A360A
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 22:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgKBVee (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 16:34:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgKBVee (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Nov 2020 16:34:34 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C0CC0617A6;
        Mon,  2 Nov 2020 13:34:33 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id cw8so7325739ejb.8;
        Mon, 02 Nov 2020 13:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbufLgqiyIIbCZK3mBvFwqqjvux2J/0hEM6rbWN5xzk=;
        b=TJFiOQMtl8XoozaF4vgsO/YTQhAiAIqRV25Z/KYPOTgdIbLz3AgGPVdtZWnYiC6uTC
         qW3BWtPbMeZVhOHiukak0XOpNJtlZceHBTe/7fvPxQe+oMxvLAo07uygi8UqvTgOHhan
         bYlJZyIGMmfaTQK2VOrDVsFGYSO4xnnStMIax70+aWuPORRYzdQx+igLIHWDQUvMR2c5
         FGdqi/tqOq6BznfqE+m76t1MxHxwDvVycgvu6JpKPsrjRn/JytOu+0nveyTPx+787OqP
         0agbnoQt6F7d4M1PGht5ReiZ8adn3SAEWtL48hn6Fvp+9V/27zpHbYUeHcztxkYzuiJW
         8Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbufLgqiyIIbCZK3mBvFwqqjvux2J/0hEM6rbWN5xzk=;
        b=t40V9qih0qQ3l6lLvOU1COwNJ0CCgzjmn1CBd7kWVxc5zI3Lrmr4shUCMfpmg7/mDt
         HpMbgEqEDz1+s5C5YCRUI8IU9PJT0jz8MCWEkQdarsWn5osMibTHolcUNdF0CSb3ZPbr
         u/SHrWXH1BFAlqUlzCnwZNX5d+ot1NeYUisV73O+bVbfJAkMPXAlfoYvVsSa2OsJ5V6B
         /y2nxHcM6x/3O49MrXBoZaehWXrKrQ4gpxygOuqjM/gfbNZ4pNhozMiAdsYmiF3fKXZh
         qEdN7RGFShgwsHYDozKHQ1uz+5fcVk06QkcdkDqJMBPpN0G5FudHLK+UDKcobV9Cz1Oi
         goTQ==
X-Gm-Message-State: AOAM530ezPlZqejVJEmCQwROA/dgKWplkIhLqoBS8XQ3vjGVrLP0eTZq
        nRKZIDTGCWdsOF9F3bS37+vZxAikZ9Jksw==
X-Google-Smtp-Source: ABdhPJyxBXeO5UZXcYcQlsT9kE/rY+XRUZL/IQvV6PJTy6Iz0jey5Ktjxya9vz0/8Jrme6uh1TAwiA==
X-Received: by 2002:a17:906:adcd:: with SMTP id lb13mr7223544ejb.362.1604352871990;
        Mon, 02 Nov 2020 13:34:31 -0800 (PST)
Received: from necip-pc.vpn.ucf.edu ([85.153.224.24])
        by smtp.gmail.com with ESMTPSA id nu20sm9913087ejb.109.2020.11.02.13.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 13:34:31 -0800 (PST)
From:   Necip Fazil Yildiran <fazilyildiran@gmail.com>
To:     zajec5@gmail.com
Cc:     hauke@hauke-m.de, ralf@linux-mips.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@pgazz.com, jeho@cs.utexas.edu,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: [PATCH] MIPS: BCM47XX: fix kconfig dependency bug for BCM47XX_BCMA
Date:   Tue,  3 Nov 2020 00:34:01 +0300
Message-Id: <20201102213400.356591-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When BCM47XX_BCMA is enabled and BCMA_DRIVER_PCI is disabled, it results
in the following Kbuild warning:

WARNING: unmet direct dependencies detected for BCMA_DRIVER_PCI_HOSTMODE
  Depends on [n]: MIPS [=y] && BCMA_DRIVER_PCI [=n] && PCI_DRIVERS_LEGACY [=y] && BCMA [=y]=y
  Selected by [y]:
  - BCM47XX_BCMA [=y] && BCM47XX [=y] && PCI [=y]

The reason is that BCM47XX_BCMA selects BCMA_DRIVER_PCI_HOSTMODE without
depending on or selecting BCMA_DRIVER_PCI while BCMA_DRIVER_PCI_HOSTMODE
depends on BCMA_DRIVER_PCI. This can also fail building the kernel.

Honor the kconfig dependency to remove unmet direct dependency warnings
and avoid any potential build failures.

Fixes: c1d1c5d4213e ("bcm47xx: add support for bcma bus")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=209879
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 arch/mips/bcm47xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm47xx/Kconfig b/arch/mips/bcm47xx/Kconfig
index 6889f74e06f5..490bb6da74b7 100644
--- a/arch/mips/bcm47xx/Kconfig
+++ b/arch/mips/bcm47xx/Kconfig
@@ -27,6 +27,7 @@ config BCM47XX_BCMA
 	select BCMA
 	select BCMA_HOST_SOC
 	select BCMA_DRIVER_MIPS
+	select BCMA_DRIVER_PCI if PCI
 	select BCMA_DRIVER_PCI_HOSTMODE if PCI
 	select BCMA_DRIVER_GPIO
 	default y
-- 
2.25.1

