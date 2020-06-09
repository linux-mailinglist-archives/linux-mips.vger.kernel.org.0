Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5271F4027
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731180AbgFIQDb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 12:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731093AbgFIQCy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:02:54 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EFEC03E97C;
        Tue,  9 Jun 2020 09:02:53 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t18so21937013wru.6;
        Tue, 09 Jun 2020 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wql0nseKPHNVpMK7v44I3yXow2YiJmwlmAW5MLi37LA=;
        b=pWbPhkaTHiBj/Bf6dnMoo7/4PMpfE/fZtYYoqtYbesjNeKeGwsi4x7A9PguTA25qAs
         EO5IamlBUphfGQFDgP1OnWe3wsnDfD56r49Ty8SRNZxzxfJACMELjztYF9tqvbVcGDGc
         evjYIdSEIxnQDFyL/BIGVGTuwFnSEK1N67Xqzz8t94EJ+d7UwnEFZOSMXJ2a79DuCm6p
         CdStSnTRh44w20misckeVRsAis6JpIPmWgfoCfx5MR5Wzyt0oAHGi+FJ0xWs0nCf0B7K
         F+d+se1HFQeB3w+4uvehu8meHHWFOSRmPcSCgv0vTSGgNMPV2R4hQlNYzlOgZ+ZZXhdC
         Tsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wql0nseKPHNVpMK7v44I3yXow2YiJmwlmAW5MLi37LA=;
        b=eVtCYm30KuGstSTgH7WtXfwaIxhqXP/9gi9Z8Ie1/U2w5h2NxUyKY3TSeWKC6a8z9f
         CS0pDGy23HI3fQ/ugWOKEL59Lpxx7MGopCfHGqLiRH2dzPgzlGdOIxoRS18jVElWdhnn
         /LDI7w5VwdTRmMsI+mC7jcKMZek4T18H0+kb15opTdhXI6C1l3YNdmfsjB0YIdwakuaI
         LdzBz9IKeeiN632/j9yveMb4/S+7ntnKE4QoszoAMhpd6RFBiqs6hsrBTkuTfHpDnf8Q
         slT/2dmL6o2o1J44tsSlWfBkQxcleMqalmi5mgThCd1Jt+wkvgWhR6myVfVDJUk+sY4L
         ubQA==
X-Gm-Message-State: AOAM5323dxu/T74Ci9BonofFWwNJ5qGSzfoGFTEBdwPVjMcvHSBvMiDG
        O9bwlFrvA/sj90mfc5bh8NE=
X-Google-Smtp-Source: ABdhPJx3tEwheDv/TsBaOYIF52VoU/X/lwBR3ioCoJwOEEkg5esB5UKX617kj6Ve3x7pPA45eRLLRg==
X-Received: by 2002:adf:f601:: with SMTP id t1mr5212856wrp.244.1591718571541;
        Tue, 09 Jun 2020 09:02:51 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id y14sm3341864wma.25.2020.06.09.09.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:02:51 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 4/7] mips: bmips: dts: add BCM6328 reset controller support
Date:   Tue,  9 Jun 2020 18:02:41 +0200
Message-Id: <20200609160244.4139366-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609160244.4139366-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6328 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6328.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index af860d06def6..590118cf5c12 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -57,6 +57,12 @@ clkctl: clock-controller@10000004 {
 			#clock-cells = <1>;
 		};
 
+		periph_rst: reset-controller@10000010 {
+			compatible = "brcm,bcm6345-reset";
+			reg = <0x10000010 0x4>;
+			#reset-cells = <1>;
+		};
+
 		periph_intc: interrupt-controller@10000020 {
 			compatible = "brcm,bcm6345-l1-intc";
 			reg = <0x10000020 0x10>,
-- 
2.26.2

