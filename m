Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130FA144850
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 00:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgAUXbk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jan 2020 18:31:40 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:33701 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgAUXbk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jan 2020 18:31:40 -0500
Received: by mail-il1-f194.google.com with SMTP id v15so3777505iln.0;
        Tue, 21 Jan 2020 15:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=9OWdM7jeMtF+WYXakFsc6aduNxa9sMPyI8h5Yizfygc=;
        b=gkFLEianet9wd61hyr7FjW2r9FxY2JC5paWGNccuCWxARUMU2WrHQ7izVcuL0Df63S
         +2IOhAbSOXYg59SF15BFHFExKWxWp27F7SWKZJnPjAD6j+0ALyFROT0aAFq2lMb3DFN5
         p+nZGDPlyZDf8PzPQNrBdddnXsv+DE9T9VugnfQOweW1pRgkB6w6ZbAizx8gRqpoW9NV
         DDwKR8gGFt0TgTb9KvXX8czBnhcP5qBTAGjBgBUywugZkExER5XBuQa0rKtzJAtOMGMd
         QK8SkYU8YpmW2255BNvkYDUi9M+gdVvYQilo1DGarayR+e3MMVkwOeD/M+KsOCoJrm/v
         utCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=9OWdM7jeMtF+WYXakFsc6aduNxa9sMPyI8h5Yizfygc=;
        b=k1X79qImG91O4ZtytFEpnmYkIdRtSWhTJAcojUNhBwPIB3TCiMty9kQG0R39RK13U3
         c6RrafS+AoldnmlUxgEetc3uXYCmS3/iVP1PTcJaroQTxBig40lSZMOes+UEUvT+1eOt
         PkNvHM5lHQARkN5sbBD7aLDw5YVhO0BinN98X19KM5iIeiTXq0hvl+F/2RZbpXFSV3m3
         qpFFQkjxXBcu9Y2AMpW2uNYLiUsAbSWIYSBrVEVxB8UO6wBRb1nzJnXDcKf9BPwRdIFw
         eenKD0VdkNKwym8hXATANWgrl8wKa/O7RWcrD6DnLlRetetzy2Iw31Cleb0hbAM8J9ia
         bEXQ==
X-Gm-Message-State: APjAAAXADCOvn3TiY9Wfoy5UWufl7CQm0C8SgujumFO31a245+BS1lVv
        SXLd7YY5mVoMZS75/n2PbCpaoApVEyCQX7CPnwo=
X-Google-Smtp-Source: APXvYqyRv4BHNv3ZaXTEKb81W5fmS6oWBF6Kqy7uz6LSZtFO9B0QDFpMD6FEYTHSFsBDniQu9QYRQ57FcmgQHKu2e8o=
X-Received: by 2002:a92:d3cd:: with SMTP id c13mr5391955ilh.21.1579649499513;
 Tue, 21 Jan 2020 15:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20200121200011.32296-1-kdasu.kdev@gmail.com>
In-Reply-To: <20200121200011.32296-1-kdasu.kdev@gmail.com>
From:   Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Tue, 21 Jan 2020 18:31:28 -0500
Message-ID: <CAC=U0a35ihnGfsiytqHY8mBS4raJ48DoJTVhawd=tGry57cLSQ@mail.gmail.com>
Subject: [PATCH V2 1/3] dt: bindings: brcmnand: Add support for flash-edu
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-mips@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding support for EBI DMA unit (EDU).

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 .../devicetree/bindings/mtd/brcm,brcmnand.txt          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 82156dc8f304..05651a654c66 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -35,11 +35,11 @@ Required properties:
                      (optional) NAND flash cache range (if at
non-standard offset)
 - reg-names        : a list of the names corresponding to the previous register
                      ranges. Should contain "nand" and (optionally)
-                     "flash-dma" and/or "nand-cache".
-- interrupts       : The NAND CTLRDY interrupt and (if Flash DMA is available)
-                     FLASH_DMA_DONE
-- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done", if broken out as
-                     individual interrupts.
+                     "flash-dma" or "flash-edu" and/or "nand-cache".
+- interrupts       : The NAND CTLRDY interrupt, (if Flash DMA is available)
+                     FLASH_DMA_DONE and if EDU is avaialble and used
FLASH_EDU_DONE
+- interrupt-names  : May be "nand_ctlrdy" or "flash_dma_done" or
"flash_edu_done",
+                     if broken out as individual interrupts.
                      May be "nand", if the SoC has the individual NAND
                      interrupts multiplexed behind another custom piece of
                      hardware
--
2.17.1
