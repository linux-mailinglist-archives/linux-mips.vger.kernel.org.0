Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADCE1F81C7
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgFMIVw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgFMIVt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:21:49 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE304C03E96F;
        Sat, 13 Jun 2020 01:21:48 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id r7so12173249wro.1;
        Sat, 13 Jun 2020 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DoN3E570Tgck4JHoiO1BCeh8lVyob2ymeZAqeFZLRCw=;
        b=KomVBFFEY01cn8qSaSpGn2bs8xen61b+GAcvHrWP+OfLcrS6sP1Phif43oers7ruDb
         T2wlM1GJUgypfJiDuo48Flonu/oIoA7rcqXZQSGxku5/WUPPHz1PuniJ6yy7Tmu41usc
         zgBa5H9UVIOwVd4+UAZAbq+K4lplYo4k2bQGQrg0qRAj8FoB/yZuPDqN//vW6Qhj7sVn
         b9VyVNZwi8Li3wlcaJv5dCxlGUlpXyzA5p+oMNv02yku0mm/roOY7qMwcP76PmwtQjo6
         Gy/TAdVzLbLDtztYvhynIIahb+SxlgHpACpvqRqLPxJZAvkzm9Lsz5+7rmXrMahhNf3G
         vkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DoN3E570Tgck4JHoiO1BCeh8lVyob2ymeZAqeFZLRCw=;
        b=R/FVcylb60FEHOMn/pYjdgPq3qJTU6ucQIWGF+spjoxDzWZofcSB6ovkFSPaE0p8Xf
         YAd4TLgbNpFqvjndLcjEKTjIGO6gwLQv8iEoHYb6WEjjI22jfQTBcbi9wM5j58nylQq+
         C6IjFFIVioB/NpLc2AHDQ0NUL/8MuqUzGy/PgEtktIE/rSbuRRqL03oTMdXNgSDqNyvR
         FVsu8xnycoqXrLi6G6pdcpAMynX4SmQsVABxHvgTRhjdjrwHJyg3UdEh7sLkpSarvgMM
         yYofPhreMWSjcmMU5z41kr0LoSNPPlqyTEamVjCNEAB0HMpewJ1d0W9LPYvYaCgk4Uwr
         MZNw==
X-Gm-Message-State: AOAM533mCKuE/zy2z6ORf7Lu4Pmuh/yjSTiwMw0RbfaXjMkBRGrxHWR1
        mZ9b1RblfB9bTDix+YXylJ8=
X-Google-Smtp-Source: ABdhPJxVr3xsef7IJjNafvsri58MYOPMlv8KhrwExQB+Z43DqwlLLdXVJPToW24b08dF7kNNarUJjg==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr17856525wrt.381.1592036506938;
        Sat, 13 Jun 2020 01:21:46 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id n189sm12243603wmb.43.2020.06.13.01.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:21:46 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 3/9] mips: bmips: add BCM6362 power domain definitions
Date:   Sat, 13 Jun 2020 10:21:34 +0200
Message-Id: <20200613082140.2009461-4-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613082140.2009461-1-noltari@gmail.com>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6362 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: Remove "dts: " from commit title.
 v3: Separate dt-bindings definitions from power domain .dtsi support.

 include/dt-bindings/soc/bcm6362-pm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm6362-pm.h

diff --git a/include/dt-bindings/soc/bcm6362-pm.h b/include/dt-bindings/soc/bcm6362-pm.h
new file mode 100644
index 000000000000..d087ba63c7a1
--- /dev/null
+++ b/include/dt-bindings/soc/bcm6362-pm.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM6362_PM_H
+#define __DT_BINDINGS_BMIPS_BCM6362_PM_H
+
+#define BCM6362_POWER_DOMAIN_SAR	0
+#define BCM6362_POWER_DOMAIN_IPSEC	1
+#define BCM6362_POWER_DOMAIN_MIPS	2
+#define BCM6362_POWER_DOMAIN_DECT	3
+#define BCM6362_POWER_DOMAIN_USBH	4
+#define BCM6362_POWER_DOMAIN_USBD	5
+#define BCM6362_POWER_DOMAIN_ROBOSW	6
+#define BCM6362_POWER_DOMAIN_PCM	7
+#define BCM6362_POWER_DOMAIN_PERIPH	8
+#define BCM6362_POWER_DOMAIN_ADSL_PHY	9
+#define BCM6362_POWER_DOMAIN_GMII_PADS	10
+#define BCM6362_POWER_DOMAIN_FAP	11
+#define BCM6362_POWER_DOMAIN_PCIE	12
+#define BCM6362_POWER_DOMAIN_WLAN_PADS	13
+
+#endif /* __DT_BINDINGS_BMIPS_BCM6362_PM_H */
-- 
2.27.0

