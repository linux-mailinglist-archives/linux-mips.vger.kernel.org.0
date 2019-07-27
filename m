Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 571BD77898
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 14:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbfG0MEi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 08:04:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33345 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbfG0MEi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 08:04:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id h19so39724666wme.0;
        Sat, 27 Jul 2019 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2ayQhRcXrW4zQh0HGDZU8kSLd3lPT+xKspP1b4Lmso=;
        b=rnyuQCCXpdYfEWUv9YP9fIAAxOK1VzvW7Cz7LslVnAQGUTMKU8k6wir1+ptHOGdlPB
         nOGaKVunQ8jVgomgT71RUdY2GIBi5/q+V8/BR8wbHQZG9y8LjyFVbu3viMxU30Yi0gzK
         JxWZxyMkChJ8b/zRfEXZM/RMVKXjMFe3zsaV/8VNDcxLwCpWbicPsYTfAWSo3S2IZigI
         6fksCY0JKVJE4lkMx+N/vz0j52Pc2G/dTEmiksUv19/kt3bWgw9qFgulYeVxI/LwM6cX
         2brOdPZG+b/5KO6Z0cB6zBOx3cZ7gQJNTSICm06KPZS6Uvf0g3VKaLfRfVkufsz2e5Gm
         B/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2ayQhRcXrW4zQh0HGDZU8kSLd3lPT+xKspP1b4Lmso=;
        b=SqUZ6EPGFrb9j0f5b5yGzbrBqN7Hqhk0vnTUYzy/pZb18bXH095PvZxbu7TSx4f4O1
         J41OPBRRFRPTmcyLKQXoWpRz9mEf8X3MLilFEkgP0XKNWJq+hZtKq/poGCo4c+5YyHhp
         HbpLW0PaUD51/fFAm4puZ9BDC8fZ1lKUqMS1um2lQH+mKpdTHaiSf2R6IxWs8fwhLJCh
         thONBEvjdJtGd4aSCIA/2e/k75BRsJmSH8k42yzrnDA52JsVJNxUpqVauKcXdnshB9fh
         gGBbV2wxMQzXAH33Q/PDwTdda/gt82X1colRRXBsX849ldRWEn6PXlyyNDvyVKBtS/tt
         DKPQ==
X-Gm-Message-State: APjAAAWdkTpCx8eqwMtV2XRBkJ5dvsULqrrdUm+tn4jUE92VaNiBe3sX
        tnd6i41S403S4KquwlaWQIN11SpO
X-Google-Smtp-Source: APXvYqyTRFRe1ZYfpSKCINjaAEfcdzp8OBiFUU60V70zq4z7LfjnMTthzBJQ/K6XMucmzlTkX6/ZVg==
X-Received: by 2002:a7b:c04f:: with SMTP id u15mr1548562wmc.106.1564229075362;
        Sat, 27 Jul 2019 05:04:35 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id r5sm58596219wmh.35.2019.07.27.05.04.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 05:04:34 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, kishon@ti.com, paul.burton@mips.com,
        ralf@linux-mips.org
Cc:     robh+dt@kernel.org, linux-kernel@vger.kernel.org, hauke@hauke-m.de,
        mark.rutland@arm.com, ms@dev.tdt.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/4] Lantiq VRX200/ARX300 PCIe PHY driver
Date:   Sat, 27 Jul 2019 14:04:11 +0200
Message-Id: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Various Lantiq (now Intel) SoCs contain one or more PCIe controllers
and PHYs.
This adds a driver for the PCIe PHYs found on the Lantiq VRX200 and
ARX300 SoCs. GRX390 should also be supported as far as I can tell,
but I don't have any of these devices to further verify that.

I have tested this PCIe PHY driver with the out-of-tree PCIe controller
driver in OpenWrt: [0]

dependencies for this series:
none

patches 1-3 should go through the PHY tree
patch 4 should go through the mips tree

I am aware that this series is too late for the v5.3 development cycle.
Getting review comments is still appreciated so this can be queued early
in the v5.4 development cycle.


Changes since v2 at [2]:
- added Rob's Reviewed-by to the dt-bindings patch (thank you!)

Changes since v1 at [1]:
- many thanks to Rob for giving me many hints regarding the .yaml bindings!
- update the .yaml binding license to (GPL-2.0-only OR BSD-2-Clause)
- changed the property lantiq,rcu to type phandle
- add the optional big-endian and little-endian boolean properties
- use numeric values for the clock phandles in the example to make the
  dt_binding_check build happy
- replaced two mdelay(1); with usleep_range(1000, 2000); in patch #2
  (spotted and reported by Hauke off-list)


[0] https://github.com/xdarklight/openwrt/commits/lantiq-mainline-pcie-phy-20190702
[1] https://patchwork.kernel.org/cover/11028797/
[2] https://patchwork.kernel.org/cover/11031421/


Martin Blumenstingl (4):
  dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe
    PHYs
  phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY
  phy: enable compile-testing for the Lantiq PHY drivers
  MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver

 .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  |  95 ++++
 arch/mips/lantiq/xway/sysctrl.c               |  16 +-
 drivers/phy/Makefile                          |   2 +-
 drivers/phy/lantiq/Kconfig                    |  11 +
 drivers/phy/lantiq/Makefile                   |   1 +
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c   | 494 ++++++++++++++++++
 .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  |  11 +
 7 files changed, 621 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
 create mode 100644 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
 create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

-- 
2.22.0

