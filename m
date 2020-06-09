Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758FC1F4021
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbgFIQDT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 12:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731043AbgFIQCz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:02:55 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E54AC08C5C4;
        Tue,  9 Jun 2020 09:02:55 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id d128so3718477wmc.1;
        Tue, 09 Jun 2020 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v7+g5Y6J+VIP2hyLQn1gOGrcKQu1nQn5MWWY3BJimHA=;
        b=btlSe6N5f0mgQg4Y7OSd90T4VNRMtgo8b62cGj5NRhNQoMD0bG5yfZb3txpvWR2BEu
         fxgwpVY8GRGO2M7V7O5xI5L6a+Sttal+8lDGQILB6sbNPjH+2CrP/fwfXr7UoVpRwFfs
         jh7yHVB69j8eeSjLYWlbS3Xz7ym8cF6Q7VIQtzYCDPRU1qUc5EUuOZ+6PjBrvHIJ9GUf
         y84TS3IAOKtvy0lcP15m3tR3t7YVxd//OVwSX1/8h7jrTbTeMLNVnNU8rUPJMnq+spNp
         /Poiso72FyHlTfHD4o9EMb9s2Plhsf1LeWiXKrA/HLV3FoLu8rvkGiYImpEBanad4n7i
         L3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v7+g5Y6J+VIP2hyLQn1gOGrcKQu1nQn5MWWY3BJimHA=;
        b=LSZ2AAVWtfNbgcIaJGZI/yjA4piyeCYn5D+wU6dvTNxzV7/gCICvv4uSEk3DHG7GS3
         sDCHPmqtqbq8RIOG7EKTC5D6dZ4Apj75/ABtzf0Spg+rOFafXHrtQoFzDlzZVu8epEUF
         Ns23YwgyGhvnFGhK0fpJw5PnOYZIDiW9DcxAb/AVsymqbjeoXPRKZLO4qo2iyUlB+gC7
         Tm8jrh7zYsaf7eWM+DNdA1DbqTki1B4gecuaHqrwD/aatrpFI/Kl+Dl6/YpKny9o2wAq
         AME3GsHyiP54/oEAoyglqs2gtp4AlFhur590+X1oiDrkMdUpnch70hbnU6PxRKnO6qQK
         OwSA==
X-Gm-Message-State: AOAM532UtoR/liV8IxvUmzllu0TiWOk9UIu89wcoCt0FdFGksxc9jWsD
        TOAsi+UogVpBLLuYynctv/4=
X-Google-Smtp-Source: ABdhPJwc6V6htJyseRGO6OEK+YYDPMrLt46OS61F6ysv6c4T+Rb4Dao0AS6IoQh7Z5XFtHMZkbnfaQ==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr5106166wmt.154.1591718573902;
        Tue, 09 Jun 2020 09:02:53 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id y14sm3341864wma.25.2020.06.09.09.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:02:53 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 6/7] mips: bmips: dts: add BCM6362 reset controller support
Date:   Tue,  9 Jun 2020 18:02:43 +0200
Message-Id: <20200609160244.4139366-7-noltari@gmail.com>
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

BCM6362 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6362.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..443af6b4c838 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -70,6 +70,12 @@ reboot: syscon-reboot@10000008 {
 			mask = <0x1>;
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

