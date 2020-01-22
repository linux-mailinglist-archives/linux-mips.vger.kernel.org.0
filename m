Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC68145E1C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 22:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbgAVVeB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 16:34:01 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:39973 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgAVVeB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 16:34:01 -0500
Received: by mail-wm1-f49.google.com with SMTP id t14so255968wmi.5;
        Wed, 22 Jan 2020 13:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hl6268zUhL6vsoc755Rban85Ann3f6TE2I9ILOnslGg=;
        b=oucbbEHTYhjCotp2sb6ssDzQbFbvgrjA80hhWxIL7YS25Dr6LHB0jv2c3iYM073u6a
         rLmIgfT7bKkqtZpwOYM5DDT4Xqh5QYIQkkbpM4n98QjKCuDwH8zeL+VBsGJvyxI4KelX
         ZAU48wLgvuWmcPtEjQ217FAV1SIwk6NXCLY962Hz6gVBFEvStGGFwR3iAiBvp12Va12S
         4p5ByEIHGf4H8++XP3QL9c0nEJhP0rt2/tzjzkUx5cGOvPuq9pVlMPjI6Xr3E6cjFzaW
         cMrq1D4lNTGLuZRD4sB3yb+3QoWa77lwWi6GPcOWeh/TSFKynEZgCtnYxEfNo3jv4MhB
         iLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hl6268zUhL6vsoc755Rban85Ann3f6TE2I9ILOnslGg=;
        b=CU+qG5Dz1H0hc1Ji6BTYr2aSZOZvJ6pUswFc0kHd9zm4bpAjeSjCTl6J8sbFK0r19N
         kJh0A5sAfaJ/wemMRJRh0VHLtjdeWosRfh4DQ7c/e29BNK66AnSACDgV1bLKzCXQn5zc
         Yczbq5B28KCgHEmWWHvWwT0ymJQ0SqQPTyCYnmOg+xoLnchFtw6HrTHwz0dWs61od8FC
         a4ViXYjU3BkKTFjUaUQTKQ0R0Sa8I/56M1HOeWD08DBbl2TYJrrYXdd5Acn+fFQmNI1p
         hAePaExU/V8kKNMzSaC/jNRh8waPSST8iAih/Te0tamxSzY3KxfwutbtHlJ88WCk+L/u
         lD9Q==
X-Gm-Message-State: APjAAAWdCLw3RhdO9iUHHvBsRu0ehajegN4rGvRbvYqWkfvwHwd0dzQU
        Vi7bVz1Z0jMDhGiq5MPsmAmawpHX
X-Google-Smtp-Source: APXvYqxYDmvDyU69o4TjdtM3UV/rvMxrU5zBZcwAOW20EVKAyf2Sy4b1T2lknJ/zStkHla1AsR9EPw==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr191530wmi.107.1579728838954;
        Wed, 22 Jan 2020 13:33:58 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id w8sm6474630wmd.2.2020.01.22.13.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 13:33:58 -0800 (PST)
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
Subject: [PATCH V4 2/3] arch: mips: brcm: Add 7425 flash-edu support
Date:   Wed, 22 Jan 2020 16:33:12 -0500
Message-Id: <20200122213313.35820-3-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122213313.35820-1-kdasu.kdev@gmail.com>
References: <20200122213313.35820-1-kdasu.kdev@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Nand controller v5.0 and v6.0 have nand edu blocks that enable
dma nand flash transfers. This allows for faster read and write
access.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Acked-by: Paul Burton <paulburton@kernel.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 410e61ebaf9e..aa0b2d39c902 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -403,8 +403,8 @@
 			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg-names = "nand";
-			reg = <0x41b800 0x400>;
+			reg-names = "nand", "flash-edu";
+			reg = <0x41b800 0x400>, <0x41bc00 0x24>;
 			interrupt-parent = <&hif_l2_intc>;
 			interrupts = <24>;
 			status = "disabled";
-- 
2.17.1

