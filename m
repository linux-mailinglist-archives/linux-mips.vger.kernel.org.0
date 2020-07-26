Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E96822DBA7
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 06:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgGZEPy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 00:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgGZEPw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Jul 2020 00:15:52 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCD7C0619D2;
        Sat, 25 Jul 2020 21:15:52 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f7so1554254pln.13;
        Sat, 25 Jul 2020 21:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AHNauKg+pzBgKomC/E9u0fN8pT6l2XYrcJ9bfwf19oo=;
        b=UOlqdxAwF96Ez4btv0lRX7p12jkBkmh9nR/UBDaKr2L09+5EdsT5zXaIUE7AMSjl7E
         V8MGVeMMbDiRxgIdZYIgQhIxp+Sg9jc/CJxj0Osx+bF6JEkSALJYsQiCw1A1PGcavDej
         nW21qxFOgXlXyI+2PHBJAkuWGf7omvcYH5W0jPIvCagliFfaDS/Gh18xgO6GatZRPQuD
         ktPQFpRuzhUaHeLlMwFXx6BGFQkstnvtn14gPjO08dgXhNB7wOIt6vabgevqcMQcYlcH
         HikeC8WTG8D2flC6Qv7H56jFcOjkBYk8HVTyC4W6xsLvccMf8tCx9qax3TNY1AK1ioAP
         N17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AHNauKg+pzBgKomC/E9u0fN8pT6l2XYrcJ9bfwf19oo=;
        b=MXO/8yKx3Fr6KiI1kzdtf6B/slDpLb3Xwdtzy4fyjY8NnEIN4YR8boQ1FugS+nBfzc
         Inx+UJoxrhJmk6qX9COC0TmgBljLBoysg7j0w/BqUALgHGj2PfMJZZ/SyPg+YSFwGuT7
         9KT6ojYKoUf+FD6zgDtshvIJUj/P8DUjRPxEAXR1QzTCOGGo+VyfVEbW7bpHpOF0DRdQ
         xhNcBmIqnmfc949g0J0KDGRzFyYx1oEPkUQz37dF/9Rs31Ccu9TGLPzi7tI3N0oZ9fGJ
         YSJu4/BCoKeh26mZ6uI+Wh9zGc+7RFjVqYh5Arg1Hc9eEBpR8WpPyDF7O54bsyDQ4+zz
         JJ7w==
X-Gm-Message-State: AOAM5324eznwfK3MT71zgKmgFQACRM37BEQNzPTFPfzv3Sby/iaO8ZNE
        rlUCfqNPiECjTBB4uhJHLGt+Q56G
X-Google-Smtp-Source: ABdhPJz1Ju3upEoGdk1TgEwGv1VlvqoeSZUnFu2oCbe3HyL6uoeLWNol5m23a+47FX9WIM7oFDqj2A==
X-Received: by 2002:a17:90b:3684:: with SMTP id mj4mr13117814pjb.66.1595736952441;
        Sat, 25 Jul 2020 21:15:52 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id d16sm10725568pfo.156.2020.07.25.21.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 21:15:51 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org (open list:BROADCOM BCM47XX MIPS
        ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] firmware: bcm47xx_sprom: Fix -Wmissing-prototypes warnings
Date:   Sat, 25 Jul 2020 21:15:20 -0700
Message-Id: <20200726041521.5398-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200726041521.5398-1-f.fainelli@gmail.com>
References: <20200726041521.5398-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

bcm47xx_sprom.h did not include a prototype for bcm47xx_fill_sprom()
therefore add one, and make sure we do include that header to fix
-Wmissing-prototypes warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/firmware/broadcom/bcm47xx_sprom.c |  1 +
 include/linux/bcm47xx_sprom.h             | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/firmware/broadcom/bcm47xx_sprom.c b/drivers/firmware/broadcom/bcm47xx_sprom.c
index 4787f86c8ac1..14fbcd11657c 100644
--- a/drivers/firmware/broadcom/bcm47xx_sprom.c
+++ b/drivers/firmware/broadcom/bcm47xx_sprom.c
@@ -27,6 +27,7 @@
  */
 
 #include <linux/bcm47xx_nvram.h>
+#include <linux/bcm47xx_sprom.h>
 #include <linux/bcma/bcma.h>
 #include <linux/etherdevice.h>
 #include <linux/if_ether.h>
diff --git a/include/linux/bcm47xx_sprom.h b/include/linux/bcm47xx_sprom.h
index b0f4424f34fc..f8254fd53e15 100644
--- a/include/linux/bcm47xx_sprom.h
+++ b/include/linux/bcm47xx_sprom.h
@@ -9,9 +9,19 @@
 #include <linux/kernel.h>
 #include <linux/vmalloc.h>
 
+struct ssb_sprom;
+
 #ifdef CONFIG_BCM47XX_SPROM
+void bcm47xx_fill_sprom(struct ssb_sprom *sprom, const char *prefix,
+			bool fallback);
 int bcm47xx_sprom_register_fallbacks(void);
 #else
+static inline void bcm47xx_fill_sprom(struct ssb_sprom *sprom,
+				      const char *prefix,
+				      bool fallback)
+{
+}
+
 static inline int bcm47xx_sprom_register_fallbacks(void)
 {
 	return -ENOTSUPP;
-- 
2.17.1

