Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F5331CB4A
	for <lists+linux-mips@lfdr.de>; Tue, 16 Feb 2021 14:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhBPNh4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Feb 2021 08:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhBPNhm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Feb 2021 08:37:42 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8B0C06178A;
        Tue, 16 Feb 2021 05:36:26 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id x4so14519158wmi.3;
        Tue, 16 Feb 2021 05:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=dh0TVcFk5TipZh+je3Yb1saPAbf3bXpgLvSW/RGqK4JrroyTmw3zMbAj8I1BJWA5Zv
         HlzbFBGp7ACXr+lRXPasomLMIToJAhfnI+kue64Cy9rD8sDBKzyYiuRVmpOTioh54Dcp
         IF86skOMDZ/UyF+ZIPvW1EyaIryJDnYqpv9ncNoWP+OTZcXZfgcjXhHooAqFOdI/7Unu
         SwFBRPH5ayZ8frAy9JduLtvCioBYlaoh88vcTdf5kMOPYUNHpufTJwFcQ9RQEnecELu7
         TDGD8HlLds6n7vQElDnHmO57dnKMQfJomo8Hp1x8O08SQkV7fXH252XjaZ2jU3dzOUNt
         wCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=iUJM4m6YEX883+PGuYkh7BKUJKJmH9R4h1URNn6+FFYr9OXR9L1agapwGFvoCkhaL2
         nS8VzcDsrVO4bla4Qk217RpYoHCkntjrpgn2SL/mFC/Nck4QkQKcVAemJhIIfsftkI5R
         oKVgLo05ZgLuvklVFivSN64HoZrCsweKIr4YYboHh+zBbNo9U8E1xMBwTZp00piUDQCf
         acXSuiQWehBADK1dkKf7UfiDSJivtDVT/Wkr9k2V1xfRQEjcjddX+Wmh8IF0GhJA0IDz
         splJcWr0RmDqtV08gIaxMMiKiw+fzejD1x+0rdrzB2gHdgeyIG0iNkpchjeJkTQvKn/l
         5vzw==
X-Gm-Message-State: AOAM531ZelyhVTXSdR9xHiC1KMfFyToxEqjW8q0/eQ5bpgh4VWwVa3Ff
        mOfl0Z/d+8tC6q80YAoSsTY=
X-Google-Smtp-Source: ABdhPJxvZl5N1RQSXEvtJw2P035XT2xAYee21rE7WC7JbYEQs20JATwlQuPzFedpn1HJ1rgx2XNaZQ==
X-Received: by 2002:a05:600c:414b:: with SMTP id h11mr3373384wmm.125.1613482585467;
        Tue, 16 Feb 2021 05:36:25 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id l7sm28032530wrn.11.2021.02.16.05.36.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 05:36:25 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Tue, 16 Feb 2021 14:36:17 +0100
Message-Id: <20210216133617.22333-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216133617.22333-1-sergio.paracuellos@gmail.com>
References: <20210216133617.22333-1-sergio.paracuellos@gmail.com>
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

