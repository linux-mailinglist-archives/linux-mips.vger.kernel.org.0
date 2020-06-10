Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599591F5928
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbgFJQdY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730711AbgFJQdL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:33:11 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3380AC03E96B;
        Wed, 10 Jun 2020 09:33:11 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id q25so2425988wmj.0;
        Wed, 10 Jun 2020 09:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fqwKTvqJkGg3U39QHZ2bKv0DfMfv0d599Yf7DOdzpvw=;
        b=eukpjncHy/Z2w4gkNI7k+0tLZ6Ll2oFh7hiKhksiX9cQXuPjsjvZGSz3ypxGgD43fn
         5QlWh82VBRBB2RZw2vPHWEARMYAHknyofH4axCdXpSPI+9Bkd7mYX7Gl5KS9MyWKJPm3
         f+UzP46peTVtPgyuXNg5HcUhhrWiwoUpkcHp48cINjBG957UlFJr7t7gq1L+9BcesOaD
         Yw+XJlUQXSw7ILVvpYwEJ8PvOYejEjnfZvNqG5JkJkJIj2CICW2051lReK5MDHuVnfPH
         jOpzyl7wKj3RoAKsYkNPNC0SNOz7WUbHciux4YDazXKQo6a2MYvqllIBbcyEpQ7uE2im
         gG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fqwKTvqJkGg3U39QHZ2bKv0DfMfv0d599Yf7DOdzpvw=;
        b=eu4PItyk8nmNjH664YiF4xqu2sqQAlhGrJKHW5Sem1d1IU2RRNewgnDMqPqsQtU4xa
         CaqBGqA3c4tu8TEcddZu1neWOMoiaarwQRhubS70bLVAs79is4e9Gm8gdKXXexjwawyF
         6JGRxGDMr6M+xDn25EHwl7MGctYDfVXo5T/Y7euMmdeLjF6lrnVnJuzjEtz4M0JbIFnJ
         nxwORsXTUjyiPtsxDWbvmMfhvC/Dhbxdm9sGMC9kjcUaQbK9v4Ho23yPOhY0d+gl6gs6
         vEInaCLzvfw1NDMdSAhxje/ZYeesWNq75MMqmZxTTTtJUe5V38oFpHMm1UEkKbT94hgx
         jOwQ==
X-Gm-Message-State: AOAM531ADosw2/4wVToqXR/Y+wTtuJZoGqFcOAzC21SuWWLVDhURGnvI
        0HNR2QtSEakk8GMCkc5otiU=
X-Google-Smtp-Source: ABdhPJwQCzIsG/5U9juTnJBM31DCeYFKjsEV0nQc2jBejOEFCSljh/P504f6d2eyDzSXr4iDGY5RQw==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr4051918wmf.69.1591806789797;
        Wed, 10 Jun 2020 09:33:09 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t7sm414430wrq.41.2020.06.10.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:33:09 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 6/6] mips: bmips: add BCM6318 power domain definitions
Date:   Wed, 10 Jun 2020 18:33:01 +0200
Message-Id: <20200610163301.461160-7-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610163301.461160-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200610163301.461160-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: Add BCM6318 dt-bindings header file.

 include/dt-bindings/soc/bcm6318-pm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm6318-pm.h

diff --git a/include/dt-bindings/soc/bcm6318-pm.h b/include/dt-bindings/soc/bcm6318-pm.h
new file mode 100644
index 000000000000..05931dce8333
--- /dev/null
+++ b/include/dt-bindings/soc/bcm6318-pm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM6318_PM_H
+#define __DT_BINDINGS_BMIPS_BCM6318_PM_H
+
+#define BCM6318_POWER_DOMAIN_PCIE	0
+#define BCM6318_POWER_DOMAIN_USB	1
+#define BCM6318_POWER_DOMAIN_EPHY0	2
+#define BCM6318_POWER_DOMAIN_EPHY1	3
+#define BCM6318_POWER_DOMAIN_EPHY2	4
+#define BCM6318_POWER_DOMAIN_EPHY3	5
+#define BCM6318_POWER_DOMAIN_LDO2P5	6
+#define BCM6318_POWER_DOMAIN_LDO2P9	7
+#define BCM6318_POWER_DOMAIN_SW1P0	8
+#define BCM6318_POWER_DOMAIN_PAD	9
+
+#endif /* __DT_BINDINGS_BMIPS_BCM6318_PM_H */
-- 
2.26.2

