Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F37432FF64
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 08:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhCGHFA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 02:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCGHEg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 02:04:36 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F472C06174A;
        Sat,  6 Mar 2021 23:04:36 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h98so7796679wrh.11;
        Sat, 06 Mar 2021 23:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=ZkK7FWrJfuSpUq6/z7zUYaLAQfToKIzzuh1PSitIK4/mVsPE3pER/rXpbaYLVzCs9r
         SfpfktaLW3bN0oa0wWAX2jQCfVAbG+ZqQAxQhr8SR/zvcMl/R0SXmgr+IUjmlzEfkQl2
         dzmIo0f/2iCV/396qZTq/maXPk0vZNmTOekiU1q5vlzOevWRyBvoCUY/s/xL8wnxohYN
         OJRzonA7Liv9o7tLFNDcNWm6RTbVssgVgrLw7ih19z2INkbBf1igNoT0KefFrs/kqG1C
         NWM+18bDbOCYX0YpUmbAPVmRbDaFvn9IH0VouHBHUzg4Vqtlrle71OMa6FDPcA5qkJop
         6zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=jT1Et54pss7QY8o1Qu0PbUuvxAqx2uvHSHy89eLrkpiSGCeXperFqsby1FGR0FdfSO
         tKEPkmWktYQr2PXblSFFzz164Ad/rHlWabHUAUqK2LBkEDpDrinLNwc29INnqoUTCsvH
         dZAVwgBvAbHVSBDcLz6iesh/snTFFv+kk6X9K0ATGIYgG0cuMsaKz01UuIlS8HZLJx4N
         uykKBK9Mrny8/HVupizhEPoFrdoVFgxN9v3gmTi28yObdMyxQRU25NB56aBqjKoE416n
         3LpZGer4PHvaoKR00Kk3rA1etKuzT4miJeY3VYv4sWfpwjPO8gGAdalBRvnDlC4t6PDR
         pW3g==
X-Gm-Message-State: AOAM532BsVkRbGAu3cYTMO5xXNpRK9PzL+Xcx3qiSRhnsnYbmD+cniNb
        hTdN/ybp5UXX4TmpOdjPylk=
X-Google-Smtp-Source: ABdhPJxBBivX7xNbxARtmrY+iRTQFW5/37DA2r3euj8VFCLaVfgR+Xx5MFMm2jAqGyNyXi/5ciEQOw==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr17603895wra.288.1615100674931;
        Sat, 06 Mar 2021 23:04:34 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id j9sm12162533wmi.24.2021.03.06.23.04.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Mar 2021 23:04:34 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Sun,  7 Mar 2021 08:04:26 +0100
Message-Id: <20210307070426.15933-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
References: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
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
index 809a68af5efd..be5ada6b4309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11288,6 +11288,12 @@ L:	linux-wireless@vger.kernel.org
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

