Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7F927247F
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 04:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387405AbfGXCYf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jul 2019 22:24:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43710 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbfGXCYe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jul 2019 22:24:34 -0400
Received: by mail-pg1-f194.google.com with SMTP id f25so20353817pgv.10;
        Tue, 23 Jul 2019 19:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ktwyRH04D76vd8HxrkIYTpUvu2EyjgpW6mXsZO8aRqs=;
        b=bXj86qDwVlxcmEZwkTYO1ID3R5d/RfMpUIEFYaqTHs+QcN7ueOzN6trv1JqWDZ+wdN
         BJzUyK9DQixKWxcXT+9wQoMP6w/mAl5I5mSh3YWlNzNM/MgP0C8s79Tua2vnO7rjDuwp
         zajOQtKUQJb3Q8OgsrO20+UYaQ39fat8dE5h0xQ5Y12Z9U+Exa2ahKbM1ZllnZIjTvO6
         cKJ8IorxZIdSa6SlK9R/v6tqCZ5MF5RvZ0Gqwrda88bG285jZE/JKf/awv2yv03M1PMo
         H6cHJP671chHA4R1eYcYAxa+EA9ipAXzFDkFYoXimnfNzo+hmmRXs3foDqGhjEvbFOAw
         H9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktwyRH04D76vd8HxrkIYTpUvu2EyjgpW6mXsZO8aRqs=;
        b=O1jdEzajiBq5bTX7RRVHzcz2vMAtQPSUE4H5sHSp4ORp1Z5QMwj0JCrOck41AntEBp
         RvGsW3hF8PONK4fpI6rN5sReUISC9r6+txwUMIQpL5ZurahkitJiqCQyTjwKoGIFCuqN
         /4x/X1Fp/4/YZ8VknN2b0FTlOclIKuZH1z8c08ZUe9HNNvG2vQucdjBwCo1zKYSzWpwm
         HEF2llpqNLPCkkb/XiONRSxtc9ADOcQ1cxk0f3QM9FyXCnouzDiu64n/AsfzovKJbGCT
         QExKvrouyRe5K6pAfAuQXCYPZMhBj9qDpSeor8invKFvdoVURtwTK9l9F/fOtilHx3HE
         H9wg==
X-Gm-Message-State: APjAAAWlpAsXxdfp2ZX/v/yAfgvrzG/b9pzIYL3Mdq8wj+EibQcPEGrh
        +qL3nVOVEfVTbCR6N+1OigCOes9a16o=
X-Google-Smtp-Source: APXvYqxLSQOIANvqYjlgJb9DQr5bEktP8PDOAkWZF4jXqbyizFuCcfn+MRUYzoYSiBURF6hiZ0XUTw==
X-Received: by 2002:a17:90a:c391:: with SMTP id h17mr85850435pjt.131.1563935073533;
        Tue, 23 Jul 2019 19:24:33 -0700 (PDT)
Received: from guoguo-omen-lan.lan ([107.151.139.128])
        by smtp.gmail.com with ESMTPSA id s185sm63468029pgs.67.2019.07.23.19.24.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 19:24:33 -0700 (PDT)
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
Subject: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding documentation
Date:   Wed, 24 Jul 2019 10:23:08 +0800
Message-Id: <20190724022310.28010-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724022310.28010-1-gch981213@gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds device tree binding documentation for MT7621
PLL controller.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---

Change since v1:
drop useless syscon in compatible string

 .../bindings/clock/mediatek,mt7621-pll.txt     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
new file mode 100644
index 000000000000..7dcfbd5283e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
@@ -0,0 +1,18 @@
+Binding for Mediatek MT7621 PLL controller
+
+The PLL controller provides the 2 main clocks of the SoC: CPU and BUS.
+
+Required Properties:
+- compatible: has to be "mediatek,mt7621-pll"
+- #clock-cells: has to be one
+
+Optional properties:
+- clock-output-names: should be "cpu", "bus"
+
+Example:
+	pll {
+		compatible = "mediatek,mt7621-pll";
+
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "bus";
+	};
-- 
2.21.0

