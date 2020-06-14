Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2AC1F87EA
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 10:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgFNI7c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 04:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgFNI65 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 04:58:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6D4C03E96F;
        Sun, 14 Jun 2020 01:58:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so14057756wrp.2;
        Sun, 14 Jun 2020 01:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z46IL+NfP+j1u2ta2mEQ0OsNNK1eTDRdh2B8eGPgsro=;
        b=J2dAsF/zL/mQtILhuSpX+NmgenXxkCF0Tm5t6aRlvlTmJ3ymdUl6T14ZOaiQBEXDON
         afFDDrsXji1ZIZW4vzL2Qjb37dlBjKq6tIOMQ9xviuc/bseobUkZQuiHWXFVEZsTaXVy
         LWL1CEiMUz4tYeauz+glu4VMqO7EBN6zBSTpZ51laoXC+0Tn6HvDUE5pCtNy5/0akTCl
         KxtDFdUB5aDXXrkNoanBs5L1PYPFGp4a680KBkEkKosOwNP7VbUlYK+jHpICCc4XsRol
         zklIIZwSmrtkf68NZyzJHUn/Y8v+Hdq6jVEOrAw3CpLMWoR/OiMuhqP+2IbFR/KzceSb
         JBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z46IL+NfP+j1u2ta2mEQ0OsNNK1eTDRdh2B8eGPgsro=;
        b=GL/KnqY+1s57zgVMPHl52cXJjSMYnKLXhLZjJfpkehitgfwx9TxEQfrfQjoull3Gmb
         qkjAS1NCK9pOhRWPI2ADf0ZngmSWQXtpwfVThWsQer9r2ZwsvfTGYLlwSv3k/8iV7ta8
         vV47lTG7XzzJnbhJNwGVKM+ZVk1BkmtHp78GRrSNOv+6egrJ5ZpJp3q1kY1z3ypJwNqI
         KYvX0ImNPDeyptY80+zMRIk6PQVzWGChOjjE3dduqzLRx6oGascruqeGdobppdcFY1UX
         PmuWuRCx8yQpMBTgg24PZiETpRFsJXzWL5VTl9Wr6u3jMYrTYm3wkAC/h0Fn/+BynWm6
         miQA==
X-Gm-Message-State: AOAM530mBb78oUMjmsc1KbTZUxjGpzdh51vaVjEBkUQc3P1WnNL00B6v
        BuHtjjAZuHbxrBqqwph/OIc=
X-Google-Smtp-Source: ABdhPJw6hkucQQnnu9sLeXNYDfbPCWuNqXe6C76m54Ogkfs9CjiOlvbf/Znd81cx8yYPX2KvRE1mWg==
X-Received: by 2002:a5d:4404:: with SMTP id z4mr24000670wrq.189.1592125136101;
        Sun, 14 Jun 2020 01:58:56 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id u4sm17174043wmb.48.2020.06.14.01.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 01:58:55 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v5 1/9] mips: bmips: select ARCH_HAS_RESET_CONTROLLER
Date:   Sun, 14 Jun 2020 10:58:44 +0200
Message-Id: <20200614085852.2130147-2-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614085852.2130147-1-noltari@gmail.com>
References: <20200613083813.2027186-1-noltari@gmail.com>
 <20200614085852.2130147-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This allows to add reset controllers support.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v5: no changes
 v4: no changes
 v3: no changes
 v2: no changes

 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6fee1a133e9d..b1840119cb64 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -227,6 +227,7 @@ config ATH79
 
 config BMIPS_GENERIC
 	bool "Broadcom Generic BMIPS kernel"
+	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	select ARCH_HAS_PHYS_TO_DMA
 	select BOOT_RAW
-- 
2.27.0

