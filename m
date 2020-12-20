Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4702DF4D7
	for <lists+linux-mips@lfdr.de>; Sun, 20 Dec 2020 10:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbgLTJjD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Dec 2020 04:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgLTJi5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Dec 2020 04:38:57 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616AAC0611C5;
        Sun, 20 Dec 2020 01:37:36 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id y17so7635812wrr.10;
        Sun, 20 Dec 2020 01:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m10UBKJBthWio+4ksO5Z9Dkd3ZlCqAP161BEeEUt8Io=;
        b=Fg56ouWKeELsC3gulKYGH9X/1JCpTssb5w30C25D0v76Pjnli6Uid5/0e7Z8z6Xuau
         r/a7ztFYheYj7ZabNG1i64tAhiO04ld/eDKQHFTJ0IPBsNAej89wj+ytt+Mk5/vYY9JU
         rgboWdBMEBXH+U7+O5ZShKd/uev3uq/MLq5xi8ODeW8JaZCO9OKci5f3rtIjpz0GTD5I
         bY9xLWnqvpG00iEx0eudZ8nKMvFXvoFyFUONVz6EBqZgUH9qxruf6OOn8sBNhRnWmSiw
         kXAtKJCVEJRc6bKrDJgbNmXuh5ou/nqwF/YuC8uHyJVZzi8aw7VmOqJ9B7duOX72IzUI
         CcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m10UBKJBthWio+4ksO5Z9Dkd3ZlCqAP161BEeEUt8Io=;
        b=L9EcBgUQJSg7SvV7FOY9BkYqBIVzhDVG6w47ZZfm3IoE7VEcYETB9ApuzGBFDWAQCM
         Q1mXWq7oh6y01iMCnlgRSop8YItOwS0hKSTfbVhs/UikMaXuDKZv1gVdQIbHCQ2OOEMq
         oXBAudon9o84GA7xAxaVvSCkSvEGpiyKPnBK14bZbq2eNrqYRVHqVsfN3YPpIvAjVg1x
         EG2kaOZoxD3PXCHnnHhvv/DWHoryMte0gO1Ivw3VbB6G9MgWRPb+xEkreN122oSqF12K
         sP5LImTnAGOAtw+tVoTCTJ1JrvSc4a3D0ei5MPvRNZdeEhbC5beMMHXSZ7qj2IQXaC2e
         OCPw==
X-Gm-Message-State: AOAM531Mv18v5RA9IY0j6ixl+l8FR1z7BHGTh8JVk1+M1bXrvjciQYCM
        a7ysIrImTyhAXaDWl7SO9mo=
X-Google-Smtp-Source: ABdhPJxgna1g9KEcF/nCu2xv/8twa9Rpyn+HagZQsSNOiyywJOhPxqAqkl2Z21X2KWIrXD4FBS18WA==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr12816468wrw.372.1608457055138;
        Sun, 20 Dec 2020 01:37:35 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id o8sm21288819wrm.17.2020.12.20.01.37.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Dec 2020 01:37:34 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        neil@brown.name
Subject: [PATCH v5 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Sun, 20 Dec 2020 10:37:24 +0100
Message-Id: <20201220093724.4906-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding myself as maintainer for mt7621 clock driver.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5eafee83bc6..f0c51d9760ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11247,6 +11247,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

