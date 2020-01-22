Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93128145E19
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 22:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbgAVVd4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 16:33:56 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38927 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgAVVdz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 16:33:55 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so718300wrt.6;
        Wed, 22 Jan 2020 13:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xlgFMAe3CXQknrnEstYCKTiflc61mrdbI7J8/Qg+nfc=;
        b=qEEMJ6KodmkvEJk1ow/4ZKAnTI/+H6b+jITcODtPTnFG7MbwU8vSoV3D3TA2z18VpH
         Qj3xLLnnzOIPwu4i2XVGV0RSirNHV5z2pjrXdtHHEKy4ajyrfF0jcLGrQFCz4RjL8CJq
         7rgJlD6O0efiLXmbrARGJb4TnLTmkfqwjWrhr80/Zm2pho9vAb0ra57H3ANhd1gjqjYD
         BDEcLrSeor0SU5F1OIYlsj3aWLyOKHkcKSn+vdRKsdTf+NQNjd7vg7sM322tvfC6vnQU
         XjZxjC/AXQS//GBtBjQDuusPXj2WqjFs2OB7XJ7anmX40ZE13bJF7Kwc34cSZdI1jFG4
         R12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xlgFMAe3CXQknrnEstYCKTiflc61mrdbI7J8/Qg+nfc=;
        b=UuQ22+JIMDelXuoa7SmbAwMY2LZ7llsQAy5PAc/tXYqdI98h2Esa6MrDl0nZgAmlf6
         kvQa8i7v3jtmucdC5offedYmHhB0226QICxs8U5VihcuGBQn1IO7+KgymaIbKuJ3TzJ9
         mA4h9ZfWUOg9gPe0BeYNseSJq+gBjm6qPEg9kwCrVfekPqRu0I57O6c30S290HKlItEw
         UNIw2wkU+fp2cgJBFzegwdCylj3JLbVl65QfEmRVPdeyeiopdlQ/szUB+6fUFFkythPx
         cxOBm08qnxZbppN1ujZwXr4ucwzKUBq/guOJK7k+sz7zQxzxIXHhTmV2uis81Mv9wu2/
         Fc4w==
X-Gm-Message-State: APjAAAWiGz3+LMAG0TIXxKzcDt9ie1Vq3/jwlI0zo85LYhRx0fd0BLmc
        SP0YZo5zvfzvEdYMGSrYalwVH16U
X-Google-Smtp-Source: APXvYqzpnqhxzhO0Avyv6Bhhwq2PJP8KkLIfadSmpO8fWsYydMZxekW0ght2Xvxur4m5mB8jgzv7HQ==
X-Received: by 2002:adf:e290:: with SMTP id v16mr13843989wri.16.1579728833822;
        Wed, 22 Jan 2020 13:33:53 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id w8sm6474630wmd.2.2020.01.22.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 13:33:53 -0800 (PST)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH V4 1/3] dt: bindings: brcmnand: Add support for flash-edu
Date:   Wed, 22 Jan 2020 16:33:11 -0500
Message-Id: <20200122213313.35820-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122213313.35820-1-kdasu.kdev@gmail.com>
References: <20200122213313.35820-1-kdasu.kdev@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding support for EBI DMA unit (EDU).

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/brcm,brcmnand.txt          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 82156dc8f304..05651a654c66 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -35,11 +35,11 @@ Required properties:
                      (optional) NAND flash cache range (if at non-standard offset)
 - reg-names        : a list of the names corresponding to the previous register
                      ranges. Should contain "nand" and (optionally)
-                     "flash-dma" and/or "nand-cache".
-- interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
-                     FLASH_DMA_DONE
-- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done", if broken out as
-                     individual interrupts.
+                     "flash-dma" or "flash-edu" and/or "nand-cache".
+- interrupts       : The NAND CTLRDY interrupt, (if Flash DMA is available)
+                     FLASH_DMA_DONE and if EDU is avaialble and used FLASH_EDU_DONE
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done" or "flash_edu_done",
+                     if broken out as individual interrupts.
                      May be "nand", if the SoC has the individual NAND
                      interrupts multiplexed behind another custom piece of
                      hardware
-- 
2.17.1

