Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D88408A82
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 13:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239700AbhIMLwB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 07:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239699AbhIMLvz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Sep 2021 07:51:55 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED418C061574
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 04:50:39 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id v123so8550333pfb.11
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 04:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mHnLIBXGNUEZkqs59OKrFyHzl1NEWUd1+Arb1Qw33g=;
        b=okVgUWHivzhRxkpWwY2Vo5haJ0OXh8mZxYpqgobphUDWx49SI4C9/d6tsUeOhWmpyY
         RV6cKMqk6c2Zzvw8y9rU+HQ1uNav+0MYnjE4Ckov/4+romP6XI2JRPwL2Y8vJumCamxa
         v476MNkbmDY0Pnc5zNmOcMzA1xH1+0Z520dDJRFmqIKcTpNKgnnm8HqblMVaJkBq3Mlz
         7Jhct9Ttc7bBv5OuWz9TFTyI3R40bwsfOF/lhQvE3yrWjsCynIdZp+EmclZW2Cla7JKC
         gF28R8rmoJFLf+NVeQXHcJX/6+2NJw57Kwp139DWEaktLKtd/MtNM42UL3KY2JCD6VCN
         C5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mHnLIBXGNUEZkqs59OKrFyHzl1NEWUd1+Arb1Qw33g=;
        b=vpuK3gkF9oinKK86GX+bu3gkj5NzQFgrUd2dr95uhgqw73wK3nmdnU0jruLmcKwkWD
         mYpdJfzx0tGaW3baLImdHZVLCzt/pzKYWMpG/qvuC6Q//Tg/Fu2H9Yo7bRNsBhpYffGl
         PUuDGO3FkjiIS5wzA001P+VlWc3k6YtyKBZ5fPK1r5ew34lTiuKRudL8XCeR3qK9m3dm
         F/AJtfJPCOGhNYU/MooFkbU+rgWKu6vVPaIPlD/LoHphlsKsAK4xrtWylF7+TGsRnP0C
         9X1HRa0j+A8V3LsjBxSpdBIPlN9+h3J8V70r9FMDXbVCcp0Vb/B48ELl8mNoUKmRMOjg
         Lezw==
X-Gm-Message-State: AOAM533qLseOZ8zcGOBzHLZ5/jn7ymLDVczqasrYGoOtygBNrdsmbfWA
        orfJ6x1f2znDYbnYncuVShQ=
X-Google-Smtp-Source: ABdhPJx9xgkTz8SHz6y0pn25tXOlff368haWF7Hl+w0zSvXDf56003vftN2IIr+W0JXJxjMo9xP6lA==
X-Received: by 2002:a63:f80a:: with SMTP id n10mr10787418pgh.303.1631533839468;
        Mon, 13 Sep 2021 04:50:39 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.162])
        by smtp.gmail.com with ESMTPSA id i1sm6797857pjs.31.2021.09.13.04.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 04:50:39 -0700 (PDT)
From:   Wang Haojun <jiangliuer01@gmail.com>
X-Google-Original-From: Wang Haojun <wanghaojun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH v2] MIPS: loongson64: Fix no screen display during boot-up
Date:   Mon, 13 Sep 2021 19:49:45 +0800
Message-Id: <20210913114945.3497762-1-wanghaojun@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Framebuffer CONFIG_FB needs to be explicitly selected or we
don't get any framebuffer anymore. DRM has stopped to select FB
after commit f611b1e7624ccdbd495c19e98056 ("drm: Avoid circular
dependencies for CONFIG_FB") because of circular dependency. So
we should enable it in the default config file, otherwise there
is no display before Xorg.

Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
reviewed-by: Huacai Chen <chenhuacai@kernel.org>
reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index f02101ff04b3..25ecd15bc952 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -282,6 +282,7 @@ CONFIG_DRM=y
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_QXL=y
 CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
 CONFIG_FB_RADEON=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
-- 
2.27.0

