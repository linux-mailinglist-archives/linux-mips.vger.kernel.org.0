Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6C41BF47
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2019 23:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfEMVxZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 17:53:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44142 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfEMVxZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 May 2019 17:53:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id z16so7435674pgv.11;
        Mon, 13 May 2019 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Af+6okQBbBqI283SlkSp5KD4CPy+AkHPzwyEcYQ+9Mg=;
        b=O8I4XgVOCq74r1feptf9zgrHpt+U2iBYWs7/dKmUqEO2eqiOnOXtCBz3KC2sAI9Ofg
         4AZnd1Yk9AZNzgyR3VeDDvu8v2JoVVFB/dhQdMWGdcVk7gm+gs5OuVO21mon5ULj33Bv
         6Cvx5mt45jq1Tlc7oJuSd/ZiIbqZTn+lQ1amW5YtrZmIECmeEHT+9fLtWrw2UR7tET9w
         mxT9sjR5o/bJmE/ghiyCVdzcq/XK7QGZtDZemzhOmczjy50wUFP0KKmnrZr+blMafYKc
         ZcsUEzfZiWsaTqaY7e002vRgdV6JAMUQTHTe6oZIbPZiFunn6fXPVKCYvMk/82rRG3xj
         JP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Af+6okQBbBqI283SlkSp5KD4CPy+AkHPzwyEcYQ+9Mg=;
        b=IuxbEF3+sun1gW65gLAxfXHzMo+1xeqv7XcUJ9cwO/4ugqNNtmlDuwBymWAxMZprDu
         lv0QXfAiQSJdLyebUplxUi0pVk5jTgKpL895NUYveNeBLLsq533GCV2oMhpMX8OED6/g
         00NGG0zUvthtqt5zieHQr3GLFlpq18zExrAjuVb0NBSKaVtSqy6lX5leNCr5aIgXKW6l
         ZoSwae8v2aKRuhIuN9n1MMsV+b9IfjGWlYP8adfdfwEbmRoQRYKeDpMubZa674wlbfyd
         FjEqbZadMvbCbCTxpu6AhdsErajde3UQ2oCS961IxUTfFuuwJbimSfPUdUV+Bjq57BfI
         kRtw==
X-Gm-Message-State: APjAAAVSOSDi8NnT5zYkwp5M/RCucXCQvCinuL9GAGN+OZUoRuYFk+kD
        Ij6V/oDUnw/NJaguL+4nHKo=
X-Google-Smtp-Source: APXvYqxQfC7rxTwzqnurcGJCKorLWeHY83pWqcRsPzAnMoDQiajt5AJ/SVJ9Hn1lxg1NpzzxhtNboQ==
X-Received: by 2002:a63:6a41:: with SMTP id f62mr34252054pgc.392.1557784404434;
        Mon, 13 May 2019 14:53:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id h11sm13761369pfn.170.2019.05.13.14.53.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 14:53:23 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org (open list:BROADCOM NVRAM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] firmware: bcm47xx_nvram: Allow COMPILE_TEST
Date:   Mon, 13 May 2019 14:52:50 -0700
Message-Id: <20190513215250.19246-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190513215250.19246-1-f.fainelli@gmail.com>
References: <20190513215250.19246-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow building building the BCM47xx NVRAM and SPROM drivers using
COMPILE_TEST.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/firmware/broadcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/broadcom/Kconfig b/drivers/firmware/broadcom/Kconfig
index f77cdb3a041f..c041dcb7ea52 100644
--- a/drivers/firmware/broadcom/Kconfig
+++ b/drivers/firmware/broadcom/Kconfig
@@ -1,6 +1,6 @@
 config BCM47XX_NVRAM
 	bool "Broadcom NVRAM driver"
-	depends on BCM47XX || ARCH_BCM_5301X
+	depends on BCM47XX || ARCH_BCM_5301X || COMPILE_TEST
 	help
 	  Broadcom home routers contain flash partition called "nvram" with all
 	  important hardware configuration as well as some minor user setup.
-- 
2.17.1

