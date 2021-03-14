Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05FB533A6BD
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233894AbhCNQoV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbhCNQn4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:43:56 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47D9C061762;
        Sun, 14 Mar 2021 09:43:55 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id d191so6724293wmd.2;
        Sun, 14 Mar 2021 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfOjFyDGtIdshAQfWcv71Eun/1WNG6VID4FSDjM59qk=;
        b=K4mIVR8CsRmJ21MjOmpueRCEBTL5xwjtxTWsbtSY5A1Pg1QD5Ayh6UnXaX+QOI32T1
         fAoWqgGLIGhrc4nQuLIy9I3eoZ2CYvqms9QIaD7x5QKdaJjooaJw/0u+rR/ddevV304g
         H5b2fwRhO5hhH/e5yZ5bLPjngwgCTZlnTz8qPwMxgZu2U1JDWSeS+XGIs8fL4rBB7PhT
         azaS8U9a1rg6440Qsh0pCYnMqAmwfxaMGcDy6ETRcoAda55deswBm8MK65ia6/6XvwEU
         w1MZwjN6IpC/JicMiv3J824+ZBpfGZohf+TsFVw+yh/k+AEV1Rlm/gegDYqs2Nv42lio
         24+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfOjFyDGtIdshAQfWcv71Eun/1WNG6VID4FSDjM59qk=;
        b=IhP2peIwgN35v/qDmp6rU4GtA36BeoOLGFSRju+Phof/jrTeolfvMDRBotvgoGVaHD
         jlmhnATeFRNQbSkL1qBZA3llABjq1IUyKOVh2j4ChwdS/b9G7KyGkkdxqavpylsUDmD0
         V8Db6SeogOIBhQQLGS4bUlZJk29x6PLifAIHwc4/P9lhKcawG92goGb3bOcWfOQo0pPi
         mSjgsRf6nfZPawzy5pRBDyktJorwpET+O4TdsiRPCReAW83LwAHDnkucxfEXuVRNU7A2
         eszrPxMjFG55WpCja06JAD9WK8SG3iwBXdNuwVmGI50bTXYMWU+3Q+PeWdsVTdlK6ZqM
         GYsg==
X-Gm-Message-State: AOAM532MIOXwfv9prO84kZkK8dshsKxFZ27M5kSXLB8PIVg/FmcIpHQE
        rGnM8rdmL9bczeLq80HooQk=
X-Google-Smtp-Source: ABdhPJwqs1Fa5G+sBjX2qlYzgfDPJg8DqzQ2xjShI3cYRPxGbB23qlYoPnsz2JGJpD9yCPDi3xoLYA==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr22698781wma.16.1615740234615;
        Sun, 14 Mar 2021 09:43:54 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a12sm15146071wrx.5.2021.03.14.09.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:43:54 -0700 (PDT)
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
Subject: [PATCH v2 1/6] mips: bmips: fix syscon-reboot nodes
Date:   Sun, 14 Mar 2021 17:43:46 +0100
Message-Id: <20210314164351.24665-2-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210314164351.24665-1-noltari@gmail.com>
References: <20210314164351.24665-1-noltari@gmail.com>
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
 v2: no changes

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

