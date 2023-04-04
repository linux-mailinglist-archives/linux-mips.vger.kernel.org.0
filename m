Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD516D5C08
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbjDDJeb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbjDDJe1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:27 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF8F1981
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:26 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 63A985C0097;
        Tue,  4 Apr 2023 05:34:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 05:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600865; x=
        1680687265; bh=Dga0XFQjOnp5oFVRQdEM7oIrrbrPylYnjxZf7ttb1D0=; b=c
        B6vmQ2pr3JgTBKGXFQfDatDUrSEyGcNefLhxu0T92yV0eSLnO+2KX6hT5T6+TlXc
        1+ym2GS/JvenyVF6qceHN4OKUQtjIYtTWEX0KPS1J6stSEgOqDy/lHO+CaPvX9P5
        FBDSBwjzfJ54/Y+7VYhxZq91Nf38UceA+3weIy59XVxiJPDcjfwMRbNC+fOASJXa
        uCiEazbGndz2VJXsoUZuLAIXMN53nJHytbPKSSVe11SaescT7k6F0NIF7uur33we
        L510G2oejLsYSucq2KL7AXiw7+OICeMFG6pl8EcRFwGf5F9tiAh+e7QWP1TmpGM/
        ePF3U3ZIWh+oqsdXC/n2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600865; x=
        1680687265; bh=Dga0XFQjOnp5oFVRQdEM7oIrrbrPylYnjxZf7ttb1D0=; b=c
        Ih4hBq8WEa5q/pOnfYPHTd3yW9X343CiGBOJMMkzTG3RB0vGm+lPfeuBkG/rwZ6r
        1vPGm8ea6rtmNYfm6RrWQSHToz5+SrnooVRr1qXYVsOSRUay0+iDsuMkH11rkH3R
        8vVsNYVSn5LOaODliokPWe6+k4wtrwnp4Uz6iG51/5I3ZaKGQwKk6qoUlXOy3H3d
        UIqLcrv3dSmBmkHJdeahAv4VRR/xgxFz5UQ0Eq9fjWi9l3x4MLlJ1kZ4/eCI8KHl
        6pTKgrWqP1W+J/tZqz0a4bBKEWzlvBYY2GpWjFZ9KklNVg9MGAB1v45wyQ7xgz4u
        uEUpiIISDfTyw1/0K1tzg==
X-ME-Sender: <xms:Ie8rZKoPwvH0xnUcQTHPYDftVRAXOmvtx1P0H55HiDSABbx3SxYxcQ>
    <xme:Ie8rZIqDYW5XFxWVxOswRK9sl2AaVuVJdUbLtM2giRiOfRVO7NMVJn6CyjzStpTYj
    WSZw3WGaPLzuXzGGAU>
X-ME-Received: <xmr:Ie8rZPNVS4JIr8pmHNCBQRnXJsrUfQa6jT1vYecBewQFqmaYcGJnCauPfL-2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Ie8rZJ5WM2RDrGPA89IJN_HMgPGswIbvdUsyLOyGmMziwOhfowtBTg>
    <xmx:Ie8rZJ6ZmeMAqobQKD84OjiLYwRkPwrw6jeL9cS49-Ds1ghiiafD1A>
    <xmx:Ie8rZJj4-AoR22-c8rx6DWkZ3unMxnmLOYd7fW-_fa8J1FNqkW9y-Q>
    <xmx:Ie8rZM1Sa_PodBLKk_AFT38dyU3dGpHVIKVp7JYLNCXtOOxBW3xe4Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:24 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 10/12] MIPS: Octeon: Disable CVMSEG by default on other platforms
Date:   Tue,  4 Apr 2023 10:33:49 +0100
Message-Id: <20230404093351.4233-11-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

QEMU can't emulate CVMSEG on generic platform for now.

Just disable it by default.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/cavium-octeon/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index c1899f109e19..450e979ef5d9 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -14,7 +14,8 @@ config CAVIUM_CN63XXP1
 config CAVIUM_OCTEON_CVMSEG_SIZE
 	int "Number of L1 cache lines reserved for CVMSEG memory"
 	range 0 54
-	default 1
+	default 0 if !CAVIUM_OCTEON_SOC
+	default 1 if CAVIUM_OCTEON_SOC
 	help
 	  CVMSEG LM is a segment that accesses portions of the dcache as a
 	  local memory; the larger CVMSEG is, the smaller the cache is.
-- 
2.39.2 (Apple Git-143)

