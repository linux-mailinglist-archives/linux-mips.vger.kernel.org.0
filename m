Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29276196ED5
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgC2Rik (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:38:40 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:8321 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgC2Rij (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503517;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rqANm04pE1KQf5F40TrJl3kMNAdz2dL493kE5AqgxPc=;
        b=MuR7VUjpnsza0i9p8jWuyPg7fL9Tl34rUiJcA4pIbTMHQZa9HOXMkOq4o3aZnJSjPz
        6R6KHSitqrTQM5Vu1lZmlT/zw/ulPS44xd+XaEH1bahwY5vNDSXTUx38TD4vY37KAqdQ
        X7hPR9aMmPdzYiA0L0kSU4dAiuy5YLq1euMfPndsVNeqc8juq5/d8iy4VB8Mpas4SJAY
        xXUifdAacPxAxuPUmXS7uL6133oELrh0wLXGUgbrPhs3c/dlksPZ32fPs1cC4GAhkv+o
        sIBj0Xc+Kwz3nGZT3+ShcBOUqoQpWR5FwubQeGb6K/RyR8euc1iram9UI+QjecXQhR+1
        d91A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THcSBMl
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:38:28 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v5 3/8] ARM: DTS: am3517: add sgx gpu child node
Date:   Sun, 29 Mar 2020 19:38:21 +0200
Message-Id: <defec319176fec632c64b37fab6733167a218e02.1585503505.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503505.git.hns@goldelico.com>
References: <cover.1585503505.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add interrupt.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am3517.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index e0b5a00e2078..3fce56a646d1 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -138,10 +138,11 @@ sgx_module: target-module@50000000 {
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x4000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,am3517-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x0 0x4000>;
+				interrupts = <21>;
+			};
 		};
 	};
 };
-- 
2.25.1

