Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031F9182F22
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2020 12:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgCLL3U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Mar 2020 07:29:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44122 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgCLL3U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Mar 2020 07:29:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id l18so6919533wru.11
        for <linux-mips@vger.kernel.org>; Thu, 12 Mar 2020 04:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JVMbx8vzUPwAVXj/Kyz58ssk2X5kisp+MU9GxZrJCOg=;
        b=UFMcDxSfsWbEddWZyM0xlqNOyJJ6eHKrdZv3KcN409m+cMOfE/0sikyAIPuMB/RMhe
         0FPhgzZUAy5LHIHVS/6Dtv20XkFuwqHbemxM5PyRsrtNGw2Rayy9BiO+mrQSxl5k3blq
         mw28hltvaTmsGmVeRyQ26ZtXontu7laqmYUY3QUzs6MCOjHy1HSjItFcydiWl16q/UZo
         2RCdwVuRvOjpy/2YvKlRrGgRIcWRC1XBcBfLr+12dlvgB541gbmp9WHjfrM09oJmc1l1
         ukW5NCaPXNOcK0VeaenABO1IKVPjvKq99kYG/WrY9tkkE/l95ATYef7N/xKaR9rE43bZ
         sixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JVMbx8vzUPwAVXj/Kyz58ssk2X5kisp+MU9GxZrJCOg=;
        b=DRkFxHymg2e0YWG5lcdz7VfKBdwz13PtAVgsJtUi5ZpeukhxhzyxJtMZNMlaMD4QeF
         JBq140W1dpAxDM4eRm8VB9UnP0J15JoqNjhFapt8jhMBN8aaKvmFZTjiAVhpmh0NVwHj
         qna6lJ6Ed5CusHlJQGPsqa82299z3zNEVWEWF2tbZKqRMWqLjsciVdTTFm5r2aSuHdIw
         c9rTwvxKG4sWW+zNSbsUWBSehXbzq1tlV9x92BqXn+Xh1mW1Gd/XP+WydJ2w0zTM+JJB
         i7kaD8LKJ6M4x+T7ZZwuQ2ULnrYcG8hPe9fHIZJd2gOIft8N+rrhAqMtgNaKBgEgNv0j
         C9Jw==
X-Gm-Message-State: ANhLgQ2/gJlCjBYfwX+BiERoffZ5nP1kxVLlUzeFgjCKinm8meffDMe6
        UAfY81O/7j6E1ibGnpvA2wg=
X-Google-Smtp-Source: ADFU+vvTL1J3PMDplpN7nW+2Vgp64n4beDHsIH4LErcHa/Y6oOjwR+OeAJS6Rv1O8dnej3MTGajeRw==
X-Received: by 2002:adf:e485:: with SMTP id i5mr11151744wrm.81.1584012558492;
        Thu, 12 Mar 2020 04:29:18 -0700 (PDT)
Received: from localhost.localdomain (134.red-83-46-193.dynamicip.rima-tde.net. [83.46.193.134])
        by smtp.gmail.com with ESMTPSA id v16sm58238852wrp.84.2020.03.12.04.29.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Mar 2020 04:29:17 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Paul Burton <paul.burton@mips.com>, ralf@linux-mips.org,
        jhogan@kernel.org, john@phrozen.org, NeilBrown <neil@brown.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: ralink: mt7621: introduce 'soc_device' initialization
Date:   Thu, 12 Mar 2020 12:29:15 +0100
Message-Id: <20200312112915.2617-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

mt7621 SoC has its own 'ralink_soc_info' structure with some
information about the soc itself. Pcie controller and pcie phy
drivers for this soc which are still in staging git tree make uses
of 'soc_device_attribute' looking for revision 'E2' in order to
know if reset lines are or not inverted. This way of doing things
seems to be necessary in order to make things clean and properly.
Hence, introduce this 'soc_device' to be able to properly use those
attributes in drivers. Also set 'data' pointer points to the struct
'ralink_soc_info' to be able to export also current soc information
using this mechanism.

Cc: Paul Burton <paul.burton@mips.com>
Cc: ralf@linux-mips.org
Cc: jhogan@kernel.org
Cc: john@phrozen.org
Cc: NeilBrown <neil@brown.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/mt7621.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 9415be0d57b8..905460aeeb1f 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -7,6 +7,8 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
 
 #include <asm/mipsregs.h>
 #include <asm/smp-ops.h>
@@ -160,6 +162,33 @@ void __init ralink_of_remap(void)
 		panic("Failed to remap core resources");
 }
 
+static void soc_dev_init(struct ralink_soc_info *soc_info, u32 rev)
+{
+	struct soc_device *soc_dev;
+	struct soc_device_attribute *soc_dev_attr;
+
+	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return;
+
+	soc_dev_attr->soc_id = "mt7621";
+	soc_dev_attr->family = "Ralink";
+
+	if (((rev >> CHIP_REV_VER_SHIFT) & CHIP_REV_VER_MASK) == 1 &&
+	    (rev & CHIP_REV_ECO_MASK) == 1)
+		soc_dev_attr->revision = "E2";
+	else
+		soc_dev_attr->revision = "E1";
+
+	soc_dev_attr->data = soc_info;
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev)) {
+		kfree(soc_dev_attr);
+		return;
+	}
+}
+
 void prom_soc_init(struct ralink_soc_info *soc_info)
 {
 	void __iomem *sysc = (void __iomem *) KSEG1ADDR(MT7621_SYSC_BASE);
@@ -214,11 +243,12 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
 
 	rt2880_pinmux_data = mt7621_pinmux_data;
 
-
 	if (!register_cps_smp_ops())
 		return;
 	if (!register_cmp_smp_ops())
 		return;
 	if (!register_vsmp_smp_ops())
 		return;
+
+	soc_dev_init(soc_info, rev);
 }
-- 
2.25.1

