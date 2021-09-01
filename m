Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14493FE3A4
	for <lists+linux-mips@lfdr.de>; Wed,  1 Sep 2021 22:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhIAUVd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Sep 2021 16:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhIAUVZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Sep 2021 16:21:25 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A860DC061575
        for <linux-mips@vger.kernel.org>; Wed,  1 Sep 2021 13:20:26 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y17so711698pfl.13
        for <linux-mips@vger.kernel.org>; Wed, 01 Sep 2021 13:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+u2QuOkRRMX/DqMZWfX/UVRQi9noRYZC06sr4Cz0Hp8=;
        b=ZMMPana7L7vTDCgu/jp5FKD2Lrbrz0jK26GBO0aS5kFqX8ZWAwDd8LGVRgMmKIW4cy
         pM4/1N42XKs3Esi1gnR1zGqKA++SzJlDvfQrVg5j28Z5B5k6XohhNOknkTV7aRkmINrK
         CmPERtsKo0Rsb/rb2L17uz6Xg8W52l6oAnoOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+u2QuOkRRMX/DqMZWfX/UVRQi9noRYZC06sr4Cz0Hp8=;
        b=O597vxTRXmuez4Mw6+m4PgGdf1l+6cr3KBWUDVVQPJ6FhpPuYsP4iacwvQB5pTdYbV
         PW35R9q+8h23JoHcpFSvLHrpspL87gLbWndjdp8VbU+Zsnoa2DrwWD4PsMy0sKY+UXG1
         RR3K1CLsXl9MDvGyicYqUblQsB4CVz4zm01hsyeeKuHSvDjyZrtkiFSBPWpD9GU6ZiAE
         estiM4ikVSebi6ardbz1hObO+IG3mVsYlHluhIjFnycBAznSwyEtSPNcIrGTDLF6igMX
         yIgRfflI3BPuD/ztQW3w4TZKcVfhmO8IJTCiYQtLXLqaQir4tIVFKBeBxYm78D9rHTs7
         y9eQ==
X-Gm-Message-State: AOAM531GatajFl+w90wxIkRFfetzPMATpkoeTgZfhAjapWUya9pwepXM
        ZrvNqbeHBOiuLRKWZVRTRHmHbg==
X-Google-Smtp-Source: ABdhPJzep5JI+YTg6jYwfIvOqV7EJbMgqrs4tymTqpHRzn2sts2yu7nyKA3inirB5PAxwEJh4dOyVA==
X-Received: by 2002:a65:6642:: with SMTP id z2mr790331pgv.240.1630527626154;
        Wed, 01 Sep 2021 13:20:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:958b:b561:a735:e774])
        by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:20:25 -0700 (PDT)
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
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Fabio Estevam <festevam@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Michael Walle <michael@walle.cc>,
        NXP Linux Team <linux-imx@nxp.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nishanth Menon <nm@ti.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Olof Johansson <olof@lixom.net>,
        Otavio Salvador <otavio@ossystems.com.br>,
        Paul Cercueil <paul@crapouillou.net>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Razvan Stefanescu <razvan.stefanescu@microchip.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tony Lindgren <tony@atomide.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v3 00/16] eDP: Support probing eDP panels dynamically instead of hardcoding
Date:   Wed,  1 Sep 2021 13:19:18 -0700
Message-Id: <20210901201934.1084250-1-dianders@chromium.org>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The goal of this patch series is to move away from hardcoding exact
eDP panels in device tree files. As discussed in the various patches
in this series (I'm not repeating everything here), most eDP panels
are 99% probable and we can get that last 1% by allowing two "power
up" delays to be specified in the device tree file and then using the
panel ID (found in the EDID) to look up additional power sequencing
delays for the panel.

This patch series is the logical contiunation of a previous patch
series where I proposed solving this problem by adding a
board-specific compatible string [1]. In the discussion that followed
it sounded like people were open to something like the solution
proposed in this new series.

In version 2 I got rid of the idea that we could have a "fallback"
compatible string that we'd use if we didn't recognize the ID in the
EDID. This simplifies the bindings a lot and the implementation
somewhat. As a result of not having a "fallback", though, I'm not
confident in transitioning any existing boards over to this since
we'll have to fallback to very conservative timings if we don't
recognize the ID from the EDID and I can't guarantee that I've seen
every panel that might have shipped on an existing product. The plan
is to use "edp-panel" only on new boards or new revisions of old
boards where we can guarantee that every EDID that ships out of the
factory has an ID in the table.

Version 3 of this series now splits out all eDP panels to their own
driver and adds the generic eDP panel support to this new driver. I
believe this is what Sam was looking for [2].

[1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/
[2] https://lore.kernel.org/r/YRTsFNTn%2FT8fLxyB@ravnborg.org/

Changes in v3:
- Decode hex product ID w/ same endianness as everyone else.
- ("Reorder logicpd_type_28...") patch new for v3.
- Split eDP panels patch new for v3.
- Move wayward panels patch new for v3.
- ("Non-eDP panels don't need "HPD" handling") new for v3.
- Split the delay structure out patch just on eDP now.
- ("Better describe eDP panel delays") new for v3.
- Fix "prepare_to_enable" patch new for v3.
- ("Don't re-read the EDID every time") moved to eDP only patch.
- Generic "edp-panel" handled by the eDP panel driver now.
- Change init order to we power at the end.
- Adjust endianness of product ID.
- Fallback to conservative delays if panel not recognized.
- Add Sharp LQ116M1JW10 to table.
- Add AUO B116XAN06.1 to table.
- Rename delays more generically so they can be reused.

Changes in v2:
- No longer allow fallback to panel-simple.
- Add "-ms" suffix to delays.
- Don't support a "fallback" panel. Probed panels must be probed.
- Not based on patch to copy "desc"--just allocate for probed panels.
- Add "-ms" suffix to delays.

Douglas Anderson (16):
  dt-bindings: drm/panel-simple-edp: Introduce generic eDP panels
  drm/edid: Break out reading block 0 of the EDID
  drm/edid: Allow the querying/working with the panel ID from the EDID
  drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
  drm/panel-simple-edp: Split eDP panels out of panel-simple
  ARM: configs: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
  arm64: defconfig: Everyone who had PANEL_SIMPLE now gets
    PANEL_SIMPLE_EDP
  MIPS: configs: Everyone who had PANEL_SIMPLE now gets PANEL_SIMPLE_EDP
  drm/panel-simple-edp: Move some wayward panels to the eDP driver
  drm/panel-simple: Non-eDP panels don't need "HPD" handling
  drm/panel-simple-edp: Split the delay structure out
  drm/panel-simple-edp: Better describe eDP panel delays
  drm/panel-simple-edp: hpd_reliable shouldn't be subtraced from
    hpd_absent
  drm/panel-simple-edp: Fix "prepare_to_enable" if panel doesn't handle
    HPD
  drm/panel-simple-edp: Don't re-read the EDID every time we power off
    the panel
  drm/panel-simple-edp: Implement generic "edp-panel"s probed by EDID

 .../bindings/display/panel/panel-edp.yaml     |  188 ++
 arch/arm/configs/at91_dt_defconfig            |    1 +
 arch/arm/configs/exynos_defconfig             |    1 +
 arch/arm/configs/imx_v6_v7_defconfig          |    1 +
 arch/arm/configs/lpc32xx_defconfig            |    1 +
 arch/arm/configs/multi_v5_defconfig           |    1 +
 arch/arm/configs/multi_v7_defconfig           |    1 +
 arch/arm/configs/omap2plus_defconfig          |    1 +
 arch/arm/configs/qcom_defconfig               |    1 +
 arch/arm/configs/realview_defconfig           |    1 +
 arch/arm/configs/sama5_defconfig              |    1 +
 arch/arm/configs/shmobile_defconfig           |    1 +
 arch/arm/configs/sunxi_defconfig              |    1 +
 arch/arm/configs/tegra_defconfig              |    1 +
 arch/arm/configs/versatile_defconfig          |    1 +
 arch/arm/configs/vexpress_defconfig           |    1 +
 arch/arm64/configs/defconfig                  |    1 +
 arch/mips/configs/qi_lb60_defconfig           |    1 +
 arch/mips/configs/rs90_defconfig              |    1 +
 drivers/gpu/drm/drm_edid.c                    |  121 +-
 drivers/gpu/drm/panel/Kconfig                 |   16 +-
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-simple-edp.c      | 1895 +++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 1100 +---------
 include/drm/drm_edid.h                        |   47 +
 25 files changed, 2293 insertions(+), 1093 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-simple-edp.c

-- 
2.33.0.259.gc128427fd7-goog

