Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33D01F1566
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2020 11:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgFHJ2l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Jun 2020 05:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgFHJ2k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Jun 2020 05:28:40 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9CCC08C5C3;
        Mon,  8 Jun 2020 02:28:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c71so14598348wmd.5;
        Mon, 08 Jun 2020 02:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zpW4ldQgtWr6e60zpYiLkfjKjsub3mqIjp9lUDBs9Lc=;
        b=nprEhsuPcx2W5AMM0OqjLGb+owEEq+0KLA71gLV2fTq/B7mVPCssqzpAn98c266ebU
         OVgFJb37xyEwAVBdwe+/U6oDUij0r5HW95PuIbSJmyQa5om0E+3bCedKcle5KfVYDJXN
         W/rzWxCoD22IHgSxjtp/P2OyZvbGsQmaUzop9mXYg2Vk352O6nTvmPZzti0ONJqXFzwC
         zYGLIpz6smGElz/W4hZXHVllI7CrOh09UEsaqWrFbfyX83pMPCZJl007oPLKXTKQWyIa
         DiF8ns8fo4OhQWUl1BRP8Zge1M79/Cwx7tzFenSPdGBX7V6zn+9gyrJdPXJVJ62NT3f4
         jbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zpW4ldQgtWr6e60zpYiLkfjKjsub3mqIjp9lUDBs9Lc=;
        b=bXkIcvVv5uLuRUr6Xn7dXjVCcGvFPV0UQQDl2eP6SwBB58injyG+ehsmAUiC60Q6/p
         yliqpFNzQPtHuwqn8xChCQEWk+J5E3C+BcifbXWp+agxOFS59vtlVy7gBZJZVr1ZhPll
         ngUL2vpnT9zVJzh0KI1cYCSWImouWsSUUWzM/iFC/YnClVa7sPo0ABNrg8k/wpeg33A8
         wjFBoDCnj+TqDnUEanSxiXemutFIiqiUFxBS2vrNV+G9GdJj2OpvTrtJ7YfASZvAsVO4
         44kx82Diag10eUoYsRGqHGtXHRK9DJUbwaufb+dC9oKCB++eNPwjd4Gak4aKeQfEiUCX
         LgmQ==
X-Gm-Message-State: AOAM5336y/aT5vZiuknoCayY0ygBxiPvooWybZxQPYZCLsvnv8KbNHLm
        KeT0i9dkLAl1lOCrs/Jif8I=
X-Google-Smtp-Source: ABdhPJyUA36lnoRXlk8KkiYJyzRhtLivy3TSuijUYNgv+dWPltHeM5dYr2IDichDx9OmB9Tfx0C8Zw==
X-Received: by 2002:a1c:7917:: with SMTP id l23mr16823230wme.117.1591608517282;
        Mon, 08 Jun 2020 02:28:37 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id p16sm24516605wru.27.2020.06.08.02.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:28:36 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] MIPS: BCM63xx: improve CFE version detection
Date:   Mon,  8 Jun 2020 11:28:35 +0200
Message-Id: <20200608092835.3377581-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are some CFE variants that start with 'cfe-vd' instead of 'cfe-v', such
as the one used in the Huawei HG556a: "cfe-vd081.5003". In this case, the CFE
version is stored as is (string vs number bytes).

Some newer devices have an additional version number, such as the Comtrend
VR-3032u: "1.0.38-112.118-11".

Finally, print the string as is if the version doesn't start with "cfe-v" or
"cfe-vd", but starts with "cfe-".

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 36ec3dc2c999..38f812383998 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -763,11 +763,25 @@ void __init board_prom_init(void)
 
 	/* dump cfe version */
 	cfe = boot_addr + BCM963XX_CFE_VERSION_OFFSET;
-	if (!memcmp(cfe, "cfe-v", 5))
-		snprintf(cfe_version, sizeof(cfe_version), "%u.%u.%u-%u.%u",
-			 cfe[5], cfe[6], cfe[7], cfe[8], cfe[9]);
-	else
+	if (strstarts(cfe, "cfe-")) {
+		if(cfe[4] == 'v') {
+			if(cfe[5] == 'd')
+				snprintf(cfe_version, 11, "%s",
+					 (char *) &cfe[5]);
+			else if (cfe[10] > 0)
+				snprintf(cfe_version, sizeof(cfe_version),
+					 "%u.%u.%u-%u.%u-%u", cfe[5], cfe[6],
+					 cfe[7], cfe[8], cfe[9], cfe[10]);
+			else
+				snprintf(cfe_version, sizeof(cfe_version),
+					 "%u.%u.%u-%u.%u", cfe[5], cfe[6],
+					 cfe[7], cfe[8], cfe[9]);
+		} else {
+			snprintf(cfe_version, 12, "%s", (char *) &cfe[4]);
+		}
+	} else {
 		strcpy(cfe_version, "unknown");
+	}
 	pr_info("CFE version: %s\n", cfe_version);
 
 	bcm63xx_nvram_init(boot_addr + BCM963XX_NVRAM_OFFSET);
-- 
2.26.2

