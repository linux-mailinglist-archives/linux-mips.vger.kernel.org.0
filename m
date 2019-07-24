Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF90E72486
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 04:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387422AbfGXCYk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jul 2019 22:24:40 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46111 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbfGXCYj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jul 2019 22:24:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id c73so20080067pfb.13;
        Tue, 23 Jul 2019 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mO5yzYTK0OikuwQh1fctNZKRgBsKpNZRnMm6UHcIdsc=;
        b=PM7WMUGD0Zm5EYKAT2FZehgSo3nHuCCm010NH5blFSwGt50UaYE3tY0t1I8q1doV+T
         SCwKhItuY+fdM6Q2tfYnJLCSw1xRh2fwlooIcMKUu1yQ6de8+/k5Z5Ace6eHhpTI3E/W
         OdP/7elMQsAjsymSpQmIsW+kORZrlZdGheH1kQqhwVkyn2W5JfPWHZ088ObKkHwvorW3
         FLfRi231oLr6OXRz/svLrVotKcWYtQ0K4tLc0+c0jJ9KnG7fTUA5J+Wz0bGTgW7kRQ71
         io8MrjK0c5TTJsrDoWZEDwI/rkYBdp+geYhyQqVjWO3mvQUE+0AA2pHXjvAEyD8k1ocZ
         FSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mO5yzYTK0OikuwQh1fctNZKRgBsKpNZRnMm6UHcIdsc=;
        b=gmxYJRzTkx7RGF5HNFrfAZBI+xBo5ZJ39yORENd5nu60IKmfMMnzdmhU0Bupr3bhT0
         RVfhydjqg9Y8jub9e8cZFuM6cv8BJL+5+F2cm1jS04R76zAmqBMuxyt3pSTT33WJfNLw
         2ggaPTx9srN0fDmH/ZW7mtjSiEcUFcUYvTnXNwUHu+uKk9i+ByExDNimu86wE53HX5Tr
         MVHSYnDs6fvWRDcqA7flGmkmexLROtqZU5ifgXG93a2+k2aBaw2WRsubAKz4KxqeE1Jv
         Frm0cWOL1pxEbc34vz6KfhfjzhBYgQb9lFHkrATNME7teE+wRDqkTReIgsGa1eiNlzBv
         pVdQ==
X-Gm-Message-State: APjAAAX3A/itmb43QZB+dodGT/IGcClsPjrydvIZFL3FgkiHz7qVPW2x
        OMxwuE2o+hjuhDLBBA35lAqx/W3JHqM=
X-Google-Smtp-Source: APXvYqyeINHHSz7n8kuFhtvdR14nRpqDfPdaNiyjuNzgOwgnrlotu7pdrNeNYXP5dQPGAWV5RKdn9Q==
X-Received: by 2002:a63:9e56:: with SMTP id r22mr22259903pgo.221.1563935078503;
        Tue, 23 Jul 2019 19:24:38 -0700 (PDT)
Received: from guoguo-omen-lan.lan ([107.151.139.128])
        by smtp.gmail.com with ESMTPSA id s185sm63468029pgs.67.2019.07.23.19.24.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 19:24:37 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list),
        linux-mips@vger.kernel.org (open list:MIPS),
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM)
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>,
        Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 5/6] staging: mt7621-dts: fix register range of memc node in mt7621.dtsi
Date:   Wed, 24 Jul 2019 10:23:09 +0800
Message-Id: <20190724022310.28010-6-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724022310.28010-1-gch981213@gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The memc node from mt7621.dtsi has incorrect register resource.
Fix it according to the programming guide.

Signed-off-by: Weijie Gao <hackpascal@gmail.com>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---

Change since v1: None.

 drivers/staging/mt7621-dts/mt7621.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index a4c08110094b..d89d68ffa7bc 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -138,7 +138,7 @@
 
 		memc: memc@5000 {
 			compatible = "mtk,mt7621-memc";
-			reg = <0x300 0x100>;
+			reg = <0x5000 0x1000>;
 		};
 
 		cpc: cpc@1fbf0000 {
-- 
2.21.0

