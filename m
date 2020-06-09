Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FD91F3CDF
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729739AbgFINnA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729136AbgFINmo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:44 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68AFC08C5C2;
        Tue,  9 Jun 2020 06:42:43 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q25so3225536wmj.0;
        Tue, 09 Jun 2020 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=agumoCX/gITs54EaA5i01A+uQtLiK9FiNBGsMq0jTL4=;
        b=FTqP8Sy1h93z4+C+HpRRHM3ixzp5nP9O37ClBJ1RVGapK231kRY9ud0dxbVvwkXllz
         zafqvqkMH/Y8gNQutPv81R6xvKrxnelmWS38ieXVrm/NVoTfrb6YXGzVPdhyM3i5hgoj
         HEqsiLq2TzqHGWSRZV7NcijrRKhOZiE+U+jwnb5Vk9RpHreX9mBD1yEr6vPPsHOC/zMC
         d9u/MhKzQWvI5GE51UJaxrN2HF+e8BK58pKBqetQ1qzA2O9mti+3/lpcAWivS3EBF6I5
         qbW2jR54gIS7U/2t9721LaZ8IomuWyaz6nUBfTbvbU3xQcKtJA/1Nvg8sqRn0EaT0xTK
         gIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=agumoCX/gITs54EaA5i01A+uQtLiK9FiNBGsMq0jTL4=;
        b=qPWLQg0jv54En49gsNl7H4KNlNFbb2E1Lz+p8UFMvysjZItaYGVEdKSc9zgIdC+hFl
         JNr3w8L+Q45XFFBquTXN6oQ9scGKVwJfRqP42WmQJe9q2WfWDaDU0VLZmQGqFn8/0pSg
         ffgkP2RLYbWNDEVRI43nG4UHgr5iFHXOkgndxWof9ES5UCgXgYVUod8PJucsoiXQUi1s
         cR/DzONA0iDtaoCiEUXuN4E9772SjUMj7PLLouLjEqQNDgic7N7rQbq4zpOB7G5qfhdc
         doQCpApAPMLQGjd50+v8vdkvvNn53Zw2fOtL0uHwvdJi1zLj6zQ10c7EoEhv6CIMx7af
         W9hw==
X-Gm-Message-State: AOAM5334HbhF/mn0esLaMPZruKfyxchiTyEtuhQIQ1rWQzO9mNbiiEn0
        E34R+g1Lt5nRXr/cO99UGcg=
X-Google-Smtp-Source: ABdhPJwWzjv4TCgkefiEcfF6BE08JESg/W/AwzD5Bj1LQJsL8kqUGpAwnqJPj6FANVyzQ/SrbIJTJQ==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr3942015wmb.138.1591710161728;
        Tue, 09 Jun 2020 06:42:41 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:41 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 7/7] mips: bmips: dts: add BCM6368 reset controller support
Date:   Tue,  9 Jun 2020 15:42:32 +0200
Message-Id: <20200609134232.4084718-8-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609134232.4084718-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
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

