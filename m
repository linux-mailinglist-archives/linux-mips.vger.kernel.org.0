Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8668063AD1
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2019 20:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbfGISWh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jul 2019 14:22:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42819 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfGISWh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jul 2019 14:22:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id t132so9857948pgb.9;
        Tue, 09 Jul 2019 11:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wVt7vDkLKBxK27+p+bMKsO9KCqlIXLjbeugPNWgziFQ=;
        b=f8WSDY7o/5sPMjIXJqEOMG6R9NQPlFfIniCi3M4OU4JyUaRcKrSjSLDpN6JPBC2cnA
         kJSvgBPi+eVx0kg3lZt9O9e9cFlV2MpRpodnNgKfzglo5Y6TBZZRQHdrOFgzlxCMkPNE
         2GAONwo0qe6lTbV0PJ9xunlxKR5oW4M6FLAZuMOf24gZczsg8RUw590RzMPDG5PqQLmL
         hj/OKmBiaTUesx65vBXtHTmOUwhnRtTSkb5BRpTlMR0e8CQ/iO7cUnVRJybD4VCk4q9S
         E05UkP77+ks8XGNxemJCApxcbSR2/wLACZ2cC8+/hPF5ckJIciLE44AbBMejhNEJBLcS
         +0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wVt7vDkLKBxK27+p+bMKsO9KCqlIXLjbeugPNWgziFQ=;
        b=fQ0N3p+ENUCmTFF5H9L28zgkjIVPWVVv+alPdVYB6Lu2jplV+o0HJI6/EeoHKMWYK7
         DrhlogbbOH2qP6Ill+wMARCmMkukAmwTvwsXZGAU9XffalWkkj3onCJxPlAzBMdjl6E1
         sJ14RwI7GUkaMADEQQJizVX/7nkJGH40mM3Zuk6Z5O3UyqsgtjT8sxSZtctMuZuTQUqr
         CyH69nGS7j4clUZfgXIXkUWWFW0WvECfGwbpOregQ0Sd1tTQpW9DWKpOqrZ2JiObX4YO
         vwr8XvXq3Hovbygw7Uf2oD+hkbWlrq9wM3LwCOhawWYahwxjD0Pux5bpDY6KcEAMBmSg
         EbMQ==
X-Gm-Message-State: APjAAAU9tp/0ESjP1D5hhopB1umoXARx8heIAngodPabz+1N1+PE4xfL
        ljOVIOAhwFeVhgBMeGzB25KqGaOXVYe0Ww==
X-Google-Smtp-Source: APXvYqwEMfl0m9VybVQKwiwyMQTosG/2kwr2VYmQHLAmS8kh4n1FuA9braOlVCY4vKfWN5ENvvRehQ==
X-Received: by 2002:a17:90a:db52:: with SMTP id u18mr1557131pjx.107.1562696556390;
        Tue, 09 Jul 2019 11:22:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:7001:2668:5400:1ff:fe62:2bbd])
        by smtp.gmail.com with ESMTPSA id m69sm21008639pga.11.2019.07.09.11.22.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 11:22:35 -0700 (PDT)
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
Subject: [PATCH 3/5] dt: bindings: add mt7621-pll dt binding documentation
Date:   Wed, 10 Jul 2019 02:20:16 +0800
Message-Id: <20190709182018.23193-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190709182018.23193-1-gch981213@gmail.com>
References: <20190709182018.23193-1-gch981213@gmail.com>
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
 .../bindings/clock/mediatek,mt7621-pll.txt    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
new file mode 100644
index 000000000000..05c15062cd20
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
@@ -0,0 +1,19 @@
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
+		compatible = "mediatek,mt7621-pll", "syscon";
+
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "bus";
+	};
+
-- 
2.21.0

