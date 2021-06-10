Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698403A3675
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 23:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhFJVrw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 17:47:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23102 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231355AbhFJVrk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Jun 2021 17:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623361543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sg0e7jXQsTWhtJdkPVNcldGSCJQVzZfo88rGKEyxbVM=;
        b=jF0km8g4p89mBhncdGbC1/Vg5ETEzZF00pe+w/WdilVR7Ux17nxM3V3BO//XUmDMZQUg2H
        22p8+VrTeI3qjV/ffpXIy8nIt1CG8s0Kw2UrVS7x35vHgfDwkC4I1sk8vnMbah81ugmy7X
        S8n0kWWgQlxIG3COtd67pFg2iRtKcAA=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-rPVXrDJSO0uWUzYmbcL63Q-1; Thu, 10 Jun 2021 17:45:41 -0400
X-MC-Unique: rPVXrDJSO0uWUzYmbcL63Q-1
Received: by mail-oi1-f198.google.com with SMTP id a29-20020a544e1d0000b02901eef9e4a58cso1899595oiy.3
        for <linux-mips@vger.kernel.org>; Thu, 10 Jun 2021 14:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sg0e7jXQsTWhtJdkPVNcldGSCJQVzZfo88rGKEyxbVM=;
        b=f5Yhw8ImQYzinaWnoWUms3magg4IhVq5i+077PIPbnu32Uqqln5/rZmpkdE+4vFs6z
         NO51+Du2rNLpN7ZdyZ1i0RqyLCkDkiXlXwrfwCgsCBtRCl8Uv+1mu5Nj6FBAXzx9Cm3I
         uw1H4M1Cuy9nbBJsa/4H7aUCKboXaOapqcAF0qaNVfVsrPUYMvki+IsDq14A7+xEVjNx
         kprXgO2e3ylIbRrsgjL+y58AhyOPBxE/iYD7URbJJhrIMgv0tvLMGqIiwK/u6a4DA15N
         Rl9e1N/NUEiVoLmdhI7EzWEn5MzexhLHdghdqB3arbKzrjj3gtehx6nHWS4/jlhsgiiD
         lteg==
X-Gm-Message-State: AOAM530mVgmBaNy1B65oP6yPcYIHKYlJcOWmlJxBw0Ygtk8+j459uqJl
        dViFrMzTcbZIDvU0VHOF0GMoKJO2rw5gYewjEsIddvXk/Bg/LMY+yvAzZxp26SkoJEnOgl3DIFm
        Oe0xPxAGmzUE0KOnYpy4A5A==
X-Received: by 2002:a9d:6087:: with SMTP id m7mr370767otj.318.1623361541281;
        Thu, 10 Jun 2021 14:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXb9l1V2GdEF4zDsZ9LozrWKOCTW8y6roYjcLTL2ZDJoW3I+XShj/h6JSCX5VGU9bVCgQ4yA==
X-Received: by 2002:a9d:6087:: with SMTP id m7mr370744otj.318.1623361541117;
        Thu, 10 Jun 2021 14:45:41 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 14:45:40 -0700 (PDT)
From:   trix@redhat.com
To:     robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
        lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, nbd@nbd.name,
        lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
        kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
        matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        zhangqing@loongson.cn, jbhayana@google.com, sean.wang@mediatek.com,
        shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
        shorne@gmail.com, gsomlo@gmail.com,
        pczarnecki@internships.antmicro.com, mholenko@antmicro.com,
        davidgow@google.com
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, Tom Rix <trix@redhat.com>
Subject: [PATCH 3/7] drivers/soc/litex: fix spelling of SPDX tag
Date:   Thu, 10 Jun 2021 14:44:34 -0700
Message-Id: <20210610214438.3161140-5-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tom Rix <trix@redhat.com>

checkpatch looks for SPDX-License-Identifier.
So change the '_' to '-'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/litex/Kconfig  | 2 +-
 drivers/soc/litex/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/litex/Kconfig b/drivers/soc/litex/Kconfig
index e7011d665b151..c03b1f816cc08 100644
--- a/drivers/soc/litex/Kconfig
+++ b/drivers/soc/litex/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License_Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0
 
 menu "Enable LiteX SoC Builder specific drivers"
 
diff --git a/drivers/soc/litex/Makefile b/drivers/soc/litex/Makefile
index 98ff7325b1c07..aeae1f4165a70 100644
--- a/drivers/soc/litex/Makefile
+++ b/drivers/soc/litex/Makefile
@@ -1,3 +1,3 @@
-# SPDX-License_Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_LITEX_SOC_CONTROLLER)	+= litex_soc_ctrl.o
-- 
2.26.3

