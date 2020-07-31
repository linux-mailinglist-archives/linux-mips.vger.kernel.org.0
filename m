Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13405233E2B
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 06:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgGaEYL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 00:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgGaEYK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 00:24:10 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A74FC061574;
        Thu, 30 Jul 2020 21:24:10 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ha11so6606857pjb.1;
        Thu, 30 Jul 2020 21:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5XLltA1o6pc+ms03acl/cow8Wgm9MAL4rEVgQOQxOXs=;
        b=R+cwfOL6NcJp8QGoq2xjIXflokIsVx622KY2RnJiZB47nBdk02++HS9e6aS+1PMzIY
         nraLIWrZfkbYexzXytN7Jzh9jt3puoZhvsin46iMRCfP6felnjw2Rj8QtfNIFvdGIm2N
         GNrWLRqnguVlwSZsgkACWyTZtoi4PY77xOB+QfaAXuV/SJiEkWhq2J0O2cmILmFBj8tp
         Y+8G43/gIKYEVnWlnnRQvxOfz5Ge/mBqTJsP/SXd14TVYKFv5Gy5Oyfnio6/R47E63Fc
         hfS0L+oE+dccYvVS52TkqUPd7aj/iyo1ukRdR77nIsWaJDT5QdTaXdqErF0GnO07uGcs
         FMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5XLltA1o6pc+ms03acl/cow8Wgm9MAL4rEVgQOQxOXs=;
        b=pTiDCtoNNEmd7xluHeXJDlHy1z80Zd58bgzuERh1S4KNcox+ipr/adU0/9X9VV0WAI
         u4+t5AyBK+3h/eAxKUHG5MOwyVdtcsIUzmGVpobNyObjAoYGi2WD4C2RwSS+WKMGht8j
         6Lsff3bwf8BJiUtP7EmyJHWoRLP+ZS0JMVEHNh5lOSxqWFhvTYI/HyJIfjYDdWJtj7UV
         QOLWdA3sWjzDIFGDOlADzE2dezBoIZJYUEXu1Qfoz7iRLQZFTfEPTh8Z/20cg6oeqczi
         Q6MnjYRkLVVUqwbPHDinNsMjEJIe+FA0MdY0SqctC9Vp91b83ClUx48KHwXfU0KNUEVf
         WZ0A==
X-Gm-Message-State: AOAM533NYGt9kNJHL6iL0Bn/iK2aWSNGp7QFeU54d+t0BkTi7wTTC5fk
        P2HM1LMQkPRqrhyupTHFn0A=
X-Google-Smtp-Source: ABdhPJzn9ymAVeVuY+l9qZQU/oBRkPls19wH8CecqTiZHvsbi9pPXSDVLn0xlFP+JWf46iB4vrsaow==
X-Received: by 2002:a63:6d48:: with SMTP id i69mr1984205pgc.354.1596169449711;
        Thu, 30 Jul 2020 21:24:09 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id w3sm8149192pff.56.2020.07.30.21.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 21:24:09 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: BMIPS: Disable pref 30 for buggy CPUs
Date:   Thu, 30 Jul 2020 21:24:01 -0700
Message-Id: <20200731042401.22871-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Disable pref 30 by utilizing the standard quirk method and matching the
affected SoCs: 7344, 7346, 7425.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/bmips/setup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 19308df5f577..df0efea12611 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -110,6 +110,20 @@ static void bcm6368_quirks(void)
 	bcm63xx_fixup_cpu1();
 }
 
+static void bmips5000_pref30_quirk(void)
+{
+	__asm__ __volatile__(
+	"	li	$8, 0x5a455048\n"
+	"	.word	0x4088b00f\n"	/* mtc0 $8, $22, 15 */
+	"	nop; nop; nop\n"
+	"	.word	0x4008b008\n"	/* mfc0 $8, $22, 8 */
+	/* disable "pref 30" on buggy CPUs */
+	"	lui	$9, 0x0800\n"
+	"	or	$8, $9\n"
+	"	.word	0x4088b008\n"	/* mtc0 $8, $22, 8 */
+	: : : "$8", "$9");
+}
+
 static const struct bmips_quirk bmips_quirk_list[] = {
 	{ "brcm,bcm3368",		&bcm6358_quirks			},
 	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
@@ -120,6 +134,9 @@ static const struct bmips_quirk bmips_quirk_list[] = {
 	{ "brcm,bcm6368",		&bcm6368_quirks			},
 	{ "brcm,bcm63168",		&bcm6368_quirks			},
 	{ "brcm,bcm63268",		&bcm6368_quirks			},
+	{ "brcm,bcm7344",		&bmips5000_pref30_quirk		},
+	{ "brcm,bcm7346",		&bmips5000_pref30_quirk		},
+	{ "brcm,bcm7425",		&bmips5000_pref30_quirk		},
 	{ },
 };
 
-- 
2.25.1

