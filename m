Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F451F3CEA
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbgFINnN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgFINmk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:40 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA9EC08C5C2;
        Tue,  9 Jun 2020 06:42:40 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r9so2882754wmh.2;
        Tue, 09 Jun 2020 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTQS4ri3S4zwRLzSXYgG06FTYSNEmvbRHHOfQ524uGQ=;
        b=GGsbqBVnqmcEDYl3zTmXw/Fms65Am6v8YPOg2mnuBoEfL9jJMoajR1K4YaPGutqCNc
         cgFI2zBwITq97zuWo82xPkrGkfZ18smtmLo0A44lMr/ot5sEHcq4XdJwbpxF9tmUFKUd
         5E6ktrRnUa5bvOHr0Qr+Zf+Z1nzhsrqIs0XRmHgOoDrkY1LcRF8KAdnDt3vZASiMh0NY
         loavemIbvMmdAv1V9swHjdNFtHcqwsQnpfmzshv+kPX02UYpy+9QvwReFQHo/PcZ0fQ6
         +MB7zHmcjY0YTwgzQjsP5H4voGg+mtfniTBeD4ZSvxOJR7HO5MMKY1Uf4NdDJFeArk0w
         9kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTQS4ri3S4zwRLzSXYgG06FTYSNEmvbRHHOfQ524uGQ=;
        b=LolR+vaxUi17E3qdz/FZP9CPe5Y/G6v8MQWlz2jgMw/oyI9bQ3ngnE2/oBmGrCNldo
         9tH8Fhcrhy0u3jWGj+7MTd6myJUCcrPZRL82Tp+tgkuq6eSHnhFcUXNZMUdubC+8yS/G
         WxhyW/srRas7Tn2EJECvEzT/AEjG5zjTJmk42Cr9wKH2MhBJ/91eSsqfkb+X/H5NxY3I
         MU7GNdbLH9BngwUe/kWBh5RosMLUjL+l+vMXQqe4m371vysikm8g8jLrHGPzx7QmXwb3
         s1F9JMcyGpmrLhsbikhAVRfqR4+HCXLbq9T+MMuk5tJHfuDba7eILom9IGa2zdhxQxoa
         PxJQ==
X-Gm-Message-State: AOAM530SjeEoqxeOVKx35j6dUzlDJWNcT7I5ptvLM/gjh/q2M4MWVr7H
        TSn2toHWN0wIRlpXpwNCcxw=
X-Google-Smtp-Source: ABdhPJwpvqw+jHUN8rmUPsqJb+F76lOtsGcl9UiuExpA0tcizFrukLkhym3b+0vAwPcYiK/6Dr632Q==
X-Received: by 2002:a1c:4d0a:: with SMTP id o10mr4189024wmh.150.1591710158718;
        Tue, 09 Jun 2020 06:42:38 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:38 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 4/7] mips: bmips: dts: add BCM6328 reset controller support
Date:   Tue,  9 Jun 2020 15:42:29 +0200
Message-Id: <20200609134232.4084718-5-noltari@gmail.com>
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

BCM6328 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
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

