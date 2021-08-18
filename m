Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE21B3EFD7F
	for <lists+linux-mips@lfdr.de>; Wed, 18 Aug 2021 09:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239137AbhHRHMc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Aug 2021 03:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238923AbhHRHMW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Aug 2021 03:12:22 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4733BC061764;
        Wed, 18 Aug 2021 00:11:48 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso1116844wms.2;
        Wed, 18 Aug 2021 00:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jx/CrfRtgZg0fhLWPEZELhCRotSUzUbzYQJoKW1l1OI=;
        b=KQSPrIpPfwd0cJf81dUNYjJ4aF50uf3aTuQ1KaRApqzTNh1vazqp5Lftw6empRmWk8
         66gRP/Rea58sd8gngP1jqnug2mhyBeSLQ0cwWlazW2y1gYF3WSSOWbfNuPLClW2Q+KGK
         IelTiav85/wZKwlnwHh0HnbAl7DiabMLsXQyzBEXNBfMcvUwoYQ3fjhYF6xDpX71VXqZ
         QK5LoLHpAtdEb9gW7ROX8p1oPbjGDtXJboaoIRt5Q5LJ+0s9ygG/+Sm2vK/XgEE3Xz3q
         9a5n+TA9av/OT15PFLt4xuhT/hnZ/bLwl93lieFK/aNl94vV2ZYlGc72PXBdHJjMUsXM
         uaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jx/CrfRtgZg0fhLWPEZELhCRotSUzUbzYQJoKW1l1OI=;
        b=BgKU8+PL6Ev/q8WnIISsYrYIlMunLLoOObcgxtRuOwEbHIFbO6k/ymKZu7wbZF695Z
         j7lksHyWy1YuY/zZBXeDckHwuh5fGkDjkVgpE6GsA/pQu66YGcwt1QhFB8R2KuLu1rLW
         8BYxsy5gceh/p6r4DTIM6G9UrENXumLz4N+2Ig6HUGlrQX3LSyM1pqEtIuwKLwLKQmyZ
         mo1pov+wualy9Z6rwVYwDb6xSMaKZcTmCzkwKZUR3cw7guy1oa5qubjr5yQvdGzx4lLh
         q+dqg/HL3x1t6///2zZ7bMBa1Ha8d5IZyee3P0fB4Yy2A/vT0w5Y4rkzUWya2UnXZOWQ
         ywjA==
X-Gm-Message-State: AOAM530R5RkYcYOJAXneb44EA0FGiWms4yXVb+ozLvl3ZjbHkvJWTgu4
        b2/dVlLVD/pcTyo1lt4zeaQ=
X-Google-Smtp-Source: ABdhPJw1vjCsrfwuBPcFn4nxAXgXJcrIqOv7tPsxX7mC+ZKDglmmjLXZZ06BbJPpyMVRZV6jui8i1Q==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr7020495wmj.151.1629270706863;
        Wed, 18 Aug 2021 00:11:46 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id r10sm4925729wrp.28.2021.08.18.00.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:11:46 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/3] usb: host: remove line for obsolete config USB_HWA_HCD
Date:   Wed, 18 Aug 2021 09:11:36 +0200
Message-Id: <20210818071137.22711-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
References: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 71ed79b0e4be ("USB: Move wusbcore and UWB to staging as it is
obsolete") misses to adjust some part in ./drivers/usb/host/Makefile.

Hence, ./scripts/checkkconfigsymbols.py warns:

USB_HWA_HCD
Referencing files: drivers/usb/Makefile

Remove the missing piece of this code removal.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/usb/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 3e2cc95b7b0b..643edf5fe18c 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -31,7 +31,6 @@ obj-$(CONFIG_USB_SL811_HCD)	+= host/
 obj-$(CONFIG_USB_ISP1362_HCD)	+= host/
 obj-$(CONFIG_USB_U132_HCD)	+= host/
 obj-$(CONFIG_USB_R8A66597_HCD)	+= host/
-obj-$(CONFIG_USB_HWA_HCD)	+= host/
 obj-$(CONFIG_USB_FSL_USB2)	+= host/
 obj-$(CONFIG_USB_FOTG210_HCD)	+= host/
 obj-$(CONFIG_USB_MAX3421_HCD)	+= host/
-- 
2.26.2

