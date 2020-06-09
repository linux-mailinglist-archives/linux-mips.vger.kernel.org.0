Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE6F1F38C1
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 12:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgFIKxZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 06:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbgFIKww (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 06:52:52 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97667C08C5C3;
        Tue,  9 Jun 2020 03:52:52 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id f185so2632692wmf.3;
        Tue, 09 Jun 2020 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hJeYlzPvoPrXbT5CLnCDUqhSZEUIU0lHpQOSnzFUm8k=;
        b=Ope3F7nZyAOqCxCtvfqImTL5PCaNvV5hUSp3Syww2aYvcGIpxs16PqkIddX9TM/mtg
         fgM+3KI5+nSEaJfeAJQpbV8Ff5vgpd3rBlS26z5CwvLQN3VV34Y6PO/p8hnnnPCE+Ibu
         QFMImeKonIXiajjhc9HKn2TFIuBWHiW0by2g/Enhgm9OQjTzo1Qb2e9fb8sSxDtQWWKL
         HJkYuzndylzkqjQBaphjH40k68Qp05f3I4GkEs+fds5pPkdHTZCpkeDPGYf4g8X4UAJP
         l58PEViIlda4m/N0VPOP+axtsCOkjTM3G1HCdsDpJI8fg02FHq63IdLH4Q+dKRCCjDyB
         UagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hJeYlzPvoPrXbT5CLnCDUqhSZEUIU0lHpQOSnzFUm8k=;
        b=oE5g06MeuLJJf+w0gOqyWIgcKs78FL84noQoVzWJbMwlcrxCzhtcwdo9jeKjfMbpOK
         IRzLyqTzmGIPl8zFyGuWF2/gNHm2i1JSL/2vwL9PzAhvn3Py1MusElm4HY95ZzA0Evz2
         Wd6zrnsNB8XfeXPa2I+7C+gV6YZ4yA9rZZRY19IxJvqrutlvppalSlBmaV5efVTTYnp5
         uxk8ejvVEPnGkbwg/btsaQqYSD4+vqnhdF1GEvNA1lbvqpoIQbVsUH24rezMjjzLl3+S
         /MQYcaE+rdpSZr5binjommoVnkKfCOrWiRC2Qkk7Urn+AdMqWUH6ydHCNjgrxeCO1rvi
         L/zw==
X-Gm-Message-State: AOAM5328ckEJY7VTL+GOKAxk0W4RO3RozLL9QOWylzyittcLwcUiErZ3
        nua3lh3MJrXqdxcbnXWSgMk=
X-Google-Smtp-Source: ABdhPJxGbt0UOOxgM0BS4bHHazb7Ur81/T8ArQNZwxR28RiqxKk6WvjKmPvjkGStst5AUp6Sd6NX8Q==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr3466751wme.107.1591699970667;
        Tue, 09 Jun 2020 03:52:50 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h5sm2949931wrw.85.2020.06.09.03.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:52:50 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 4/4] mips: bmips: dts: add BCM6362 power domain support
Date:   Tue,  9 Jun 2020 12:52:44 +0200
Message-Id: <20200609105244.4014823-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609105244.4014823-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6362 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6362.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..c98f9111e3c8 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -108,6 +108,12 @@ uart1: serial@10000120 {
 			status = "disabled";
 		};
 
+		periph_pwr: power-controller@10001848 {
+			compatible = "brcm,bcm6362-power-controller";
+			reg = <0x10001848 0x4>;
+			#power-domain-cells = <1>;
+		};
+
 		leds0: led-controller@10001900 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.26.2

