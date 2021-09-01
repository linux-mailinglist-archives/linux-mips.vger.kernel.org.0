Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D4C3FE3C5
	for <lists+linux-mips@lfdr.de>; Wed,  1 Sep 2021 22:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245274AbhIAUVn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Sep 2021 16:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343812AbhIAUVk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Sep 2021 16:21:40 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406F4C0617AE
        for <linux-mips@vger.kernel.org>; Wed,  1 Sep 2021 13:20:43 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 17so660840pgp.4
        for <linux-mips@vger.kernel.org>; Wed, 01 Sep 2021 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WM1bi4Camo4x38t+lOpl/85fschHMfokf9rT4eUa3DY=;
        b=f+ybnhpuTQ57f3nJIk1Jq6u2MAVamT1UtJdAKIxnQ768VSVBgqG6Rgpu/cw1Utc6sS
         /bMn6sOsWMrckKWPdEB26mmvkyIodgTuwS/D48gj83/BMDRgnzcEwm2ggv/v4v6DHE2j
         0GxUuSg95a57DDbsxzg/NLj/O5zWdfa38OmFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WM1bi4Camo4x38t+lOpl/85fschHMfokf9rT4eUa3DY=;
        b=brM1Lxq499InLsUga6CfakPbBtT4KJOzoNUnCJMrlPRYZnAswBXWF8VLSZzll/OJpT
         yeUlJN2Qc3Lr6XRponwmuTdqmg5Cjh9YCJyJ/tCQW8UQJq7j1S/fT8fqBomtqgJH5aPF
         5ruxV6uux8QC7FIdG13z0lBGEHOODEZtMZyrrzTvoyv6D9IQxjc5X3plnmBP6xFKXpp6
         yLTzhwUB3BXchWtuMmNTKUoVJTiTIK3GW8L98Nx/Cfk5K2kYQW9B4tPh40FaTcPNJwEv
         vDYiqmf2rmHe5hE81vlExnzhRNw5mlrQaC7m/HtDsavk/yzrBm09vAs5uT79kbKBx5vG
         uSQw==
X-Gm-Message-State: AOAM533QrDSM/JK582QQFBtHUEyrNtdhogReaaddixI1PvumvjFd6yVc
        rU9xSM6LMKlILVGKH4HO7+cM/Q==
X-Google-Smtp-Source: ABdhPJydT+Tqv+gWUMHLSx9OUkDrer4gbLtZdgIdTopu2ejfGNW+Ki6l+q5vwHDM20EqiwpPRfWvug==
X-Received: by 2002:a05:6a00:796:b0:3ed:989b:f0c3 with SMTP id g22-20020a056a00079600b003ed989bf0c3mr1117119pfu.9.1630527642834;
        Wed, 01 Sep 2021 13:20:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:958b:b561:a735:e774])
        by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:20:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v3 08/16] MIPS: configs: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
Date:   Wed,  1 Sep 2021 13:19:26 -0700
Message-Id: <20210901131531.v3.8.Ic7a6e3f8dd4760a302c91320843be5a00206bd63@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the patch ("drm/panel-simple-edp: Split eDP panels out of
panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
give everyone who had the old driver enabled the new driver too. If
folks want to opt-out of one or the other they always can later.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/mips/configs/qi_lb60_defconfig | 1 +
 arch/mips/configs/rs90_defconfig    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index b4448d0876d5..3e99e223ea02 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -72,6 +72,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_OVERALLOC=200
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_INGENIC=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_VGA_CONSOLE is not set
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index 7ce3b814fdc8..42b4f621cbfa 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -94,6 +94,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_OVERALLOC=300
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SIMPLE_EDP=y
 CONFIG_DRM_INGENIC=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
-- 
2.33.0.259.gc128427fd7-goog

