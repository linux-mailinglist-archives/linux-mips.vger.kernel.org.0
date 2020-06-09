Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880051F401F
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 18:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbgFIQDS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 12:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731099AbgFIQC4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 12:02:56 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C178C05BD1E;
        Tue,  9 Jun 2020 09:02:56 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id r15so3679783wmh.5;
        Tue, 09 Jun 2020 09:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I5TgqtUcoSDCGd1XsLCeUnMBkkLfe9Ti30ndFZ9mRFQ=;
        b=omRBVvveJWlGhEfAO1hhezfW3xH7CZYBvg0yUCFRV37L+FfqXKp45wZC+wlu9WiKaw
         SnYvmcv78BLE48W6sDO7/boMV0ZSn2aAtv657AGFsjhk2G4pBv54MBpec6GeYG2Ex+ni
         Tl338GjmIxHim65Olo3yH2WqG5qAaZ6s4/msJ/EadQEK5H6aT3v7YYgAcns+jHGjvitn
         WrdwHBsAJ6eURJwo9c+tbb1Cn4Habpr9sPrbefR1xRWB7CGEPvJ2DSaIHjcOsqk1NqEN
         mlqxyQf+m5FQlJWMCSHgMvh9uQMzpRIhzk0VKs8hXbI9xBHUt4EnjztxHc8IfAnNqt4W
         rpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I5TgqtUcoSDCGd1XsLCeUnMBkkLfe9Ti30ndFZ9mRFQ=;
        b=QhiO03eqvbqC6LFdicTjFsId3IoJpALWCOw2s5VT4yAZkqrZA/wVtJ3j4lhyoTmn3K
         diVUU/4iZiU+wULo8Mv/SikCpvxUNKY57iZVkhLMxjuTXgK0Km1I9hwodcrIO7wtkKSR
         CyzZ4uNI5qbEG1ErvFNeRpQbAM352m5/PaPUDEfhT4VghvwVsLVuDIgQlS4IBXJuBqZ5
         3m5bwzhFdV+Lo/WxKd8aeI7RnZpnU4ZoJyvkk7Y7A+7h2UQsjI/gD/aUV7I+nQ0SFHjx
         p/TLI6PV614bdoVWsTD3AYejthSsNbrC/BpOS37iFg8w9yAYuUz5PzRH7Wx5m93B+Q8E
         yc8Q==
X-Gm-Message-State: AOAM532lCZUgcsiVUpCiXCGSFsVoyOcy+aceMNzGukJjJbSYebREsb1C
        8Wqac0Jssk0A8KPXEnNB1zU=
X-Google-Smtp-Source: ABdhPJz00vjGhON8Tl9YBth+uFyRVvdWIAjE3wgpDZ5VQJzCJNxl11fYvbnA8FkGTUP3VewJDorBeg==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr4808519wmb.150.1591718574905;
        Tue, 09 Jun 2020 09:02:54 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id y14sm3341864wma.25.2020.06.09.09.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 09:02:54 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 7/7] mips: bmips: dts: add BCM6368 reset controller support
Date:   Tue,  9 Jun 2020 18:02:44 +0200
Message-Id: <20200609160244.4139366-8-noltari@gmail.com>
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

BCM6368 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6368.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index 449c167dd892..52c19f40b9cc 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
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

