Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE7533A665
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234512AbhCNQfW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234060AbhCNQeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:34:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54976C061763;
        Sun, 14 Mar 2021 09:34:50 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g25so6721855wmh.0;
        Sun, 14 Mar 2021 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2TnKHjrEZiuelE3Ui49VfacWOqQUhvTdnSpyFks03cM=;
        b=JBzf8gnkEXHFblO9EDqUwjHa0bzTtt0FyEdUocwpGSZoOYfz7CjMhQdgJlziH0L3Fn
         sTguKCl/Vh3+SHA8j+liu4KbDapZ9DCyq2jUpTcRYMEtxBpOcwQ6S5+EV/GkjyDwubrn
         gOvuZVEQzwVAEyzi2deL397yzxeCPaPK+/wexI1FDrCUVNzU7+Z97KmHMeGQPCpofW8X
         NSDeOJuMMv9w80fdpVXOe/B6T8B2fN3B1VxaPF5CeGg3y+kt8t7N5xe7HPZHaSyQfNhM
         DAjZt26APja8B2TFCWZKSJTZNtr4Ef3WgN7I8yKWfuBq/7jTGmEJcln0EeHw3YqXT8Xm
         i6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2TnKHjrEZiuelE3Ui49VfacWOqQUhvTdnSpyFks03cM=;
        b=tpJ+igP+rZfnRsAcn5q317bni7/fpWNu+vG4uf0VKwjiggbTjflpfrc29d7D/EAjrD
         /823NCJmUFgg1kCXCjZSMw1hos5IVUGCtVX0LUBRZJisrHINdng5Qt0B7PrAxTuUfxQY
         AZZ21an0ya6SELlcxIHtGBZA7k4A5UYxb38eeVKqTAISwGJb3Xbbv9FmS+GMKLUkW/OQ
         4DlUz0No+nk9nI2MsS42Cjwu+KX44+ThTclq7Wgemd5W6GrrOrbaasik51sQHYWlVQZb
         MmhUD7M8Kr+iBnZuZO6gU/rK8Y0/0vfknZVPJRDmOoaYkqO8+ol+D1b3Tn9verhrlH3r
         d/Tg==
X-Gm-Message-State: AOAM5327HAIhaottE8UXTnarWXHkLbFITkGXG7eRCEZcnJzK5XxHx8U5
        MSh4MKC2ctugQ73trukmaMc=
X-Google-Smtp-Source: ABdhPJzjB+GrJ2Qs6h8kVrMLmamdOj8B8vLN3+Ih/pW6zEI3a18rrTFZmoAviBMZ7EH1h50i97nmLA==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr21677507wmb.173.1615739689012;
        Sun, 14 Mar 2021 09:34:49 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id h62sm10547804wmf.37.2021.03.14.09.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:34:48 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/5] mips: bmips: fix syscon-reboot nodes
Date:   Sun, 14 Mar 2021 17:34:41 +0100
Message-Id: <20210314163445.6976-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210314163445.6976-1-noltari@gmail.com>
References: <20210314163445.6976-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit a23c4134955e added the clock controller nodes, incorrectly changing the
syscon-reboot nodes addresses.

Fixes: a23c4134955e ("MIPS: BMIPS: add clock controller nodes")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm3368.dtsi  | 2 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 2 +-
 arch/mips/boot/dts/brcm/bcm6358.dtsi  | 2 +-
 arch/mips/boot/dts/brcm/bcm6362.dtsi  | 2 +-
 arch/mips/boot/dts/brcm/bcm6368.dtsi  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/brcm/bcm3368.dtsi
index db7e801dad55..883ca8bed8e7 100644
--- a/arch/mips/boot/dts/brcm/bcm3368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -62,7 +62,7 @@
 
 		periph_cntl: syscon@fff8c008 {
 			compatible = "syscon";
-			reg = <0xfff8c000 0x4>;
+			reg = <0xfff8c008 0x4>;
 			native-endian;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 575c9d3eb4c8..052d2032d4e4 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -64,7 +64,7 @@
 
 		periph_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0xc>;
+			reg = <0x10000008 0x4>;
 			native-endian;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index f8753becc164..f5549a056bff 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -63,7 +63,7 @@
 
 		periph_cntl: syscon@fffe0008 {
 			compatible = "syscon";
-			reg = <0xfffe0000 0x4>;
+			reg = <0xfffe0008 0x4>;
 			native-endian;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index a2dbbf062cd8..50c287bedc37 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -64,7 +64,7 @@
 
 		periph_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0xc>;
+			reg = <0x10000008 0x4>;
 			native-endian;
 		};
 
diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index c4eb4b67ecbd..4837b1436714 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -63,7 +63,7 @@
 
 		periph_cntl: syscon@100000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0xc>;
+			reg = <0x10000008 0x4>;
 			native-endian;
 		};
 
-- 
2.20.1

