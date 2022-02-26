Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5216F4C5703
	for <lists+linux-mips@lfdr.de>; Sat, 26 Feb 2022 18:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbiBZRN4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Feb 2022 12:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbiBZRNx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 26 Feb 2022 12:13:53 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39751029E5;
        Sat, 26 Feb 2022 09:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1645895583;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=dX8jEg+e21ChR95yKlcg++koHvY0KVaNAmBQEWlNZ3k=;
    b=SyHQUZAYMtTkmAAG2SNPJdaig5+N+GjQzRVpNPh6Ml1BfO3gAPEyBDJdhu6Q4lLmiX
    WYR89OtX++Wf8dk6/Cp/lgBeAXWqmiaYMg3nBsdq+0DNJgn1Cv1pDCUZnpBiL9g6y8iv
    ddizYVtytn3ZTnMSJ7FAxAUbTMDtTSNmAAleswi4IMpvT1xNhb6R+eoRsrAkuuQaNujp
    SPV95eXdwd+64If6JJjyA7o83o5fAioMcck+B+0k5Sx/luV8y9fTMU3fNw7o69GcmRI7
    str2V0vJoNY4fqnSC7SNmWocCAc9HH9Vclws2NhqXl+bsJUKegJbWED4Rk7scCfKf6fz
    89Zw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcK1D0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.40.1 SBL|AUTH)
    with ESMTPSA id V41e6fy1QHD3E1w
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 26 Feb 2022 18:13:03 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <maxime@cerno.tech>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: [PATCH v16 0/4] MIPS: JZ4780 and CI20 HDMI
Date:   Sat, 26 Feb 2022 18:12:58 +0100
Message-Id: <cover.1645895582.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

PATCH V16 2022-02-26 18:13:02:
* fixed and renamed dw-hdmi bus negotiation patch (by narmstrong@baylibre.com)
* reordered and merged HPD fix (suggested by paul@crapouillou.net)
* fixed MODULE_ALIAS for dw-hdmi-ingenic (reported by paul@crapouillou.net)
* dropped some already merged commits from the series

PATCH V15 2022-02-12 16:50:54:
* remove already (elsewhere) merged commits (suggested by paul@crapouillou.net)
* clarify commit message for (now) 1/7 ((suggested by paul@crapouillou.net))

PATCH V14 2022-02-12 15:19:25:
* make compatible to c03d0b52ff71d5 ("drm/connector: Fix typo in output format")
* move "dw-hdmi/ingenic-dw-hdmi: repair interworking with hdmi-connector" before
  drm/ingenic: Add dw-hdmi driver specialization for jz4780 (by paul@crapouillou.net)
* split introduction of dw_hdmi_enable_poll() into separate patch
* explicitly mark plane f0 as not working in jz4780 (suggested by paul@crapouillou.net)
* drop 1/9 since it is now in drm-misc/drm-misc-next

PATCH V13 2022-02-02 17:31:22:
* 7/9: remove call to gpiod_set_value() because of GPIOD_OUT_HIGH (by paul@crapouillou.net)
* 4/9: replace ".." by "." (by paul@crapouillou.net)
* 3/9: remove old hdmi-5v-power in the example (by paul@crapouillou.net)
* 2/9: disable handling of plane f0 only for jz4780 (by paul@crapouillou.net)

PATCH V12 2022-01-31 13:26:54:
This version reworks how hdmi ddc power is controlled by connector and not
by ddc/hdmi bridge driver.

Also some patches of the previous version of this series have been removed
since they are already applied to mips-next/linux/next/v5.17-rc1.

Fixes and changes:

- repair interworking of dw-hdmi with connector-hdmi (by hns@goldelico.com)
- fix JZ_REG_LCD_OSDC setup for jz4780 (by hns@goldelico.com and paul@crapouillou.net)
- adjustments for ci20.dts to use connector gpio for +5v (suggested by several)
- to add control of "ddc-en-gpios" to hdmi-connector driver (by hns@goldelico.com)
- regulator code removed because we now use the "ddc-en-gpios" of the connector
  driver (suggested by paul@crapouillou.net)
- bindings: addition of "ddc-i2c-bus" and "hdmi-5v-supply" removed (suggested by robh+dt@kernel.org)
- rebase on v5.17-rc2

PATCH V11 2021-12-02 19:39:52:
- patch 4/8: change devm_regulator_get_optional to devm_regulator_get and
             remove NULL check (requested by broonie@kernel.org)
- patch 3/8: make hdmi-5v-supply required (requested by broonie@kernel.org)

PATCH V10 2021-11-30 22:26:41:
- patch 3/8: fix $id and $ref paths (found by robh@kernel.org)

PATCH V9 2021-11-24 22:29:14:
- patch 6/8: remove optional <0> for assigned-clocks and unintentionally included "unwedge" setup (found by paul@crapouillou.net)
- patch 4/8: some cosmetics
             make regulator enable/disable only if not NULL (found by paul@crapouillou.net)
             simplify/fix error handling and driver cleanup on remove (proposed by paul@crapouillou.net)
- patch 3/8: fix #include path in example (found by paul@crapouillou.net)
             fix missing "i" in unevaluatedProperties (found by robh@kernel.org)
             fix 4 spaces indentation for required: property (found by robh@kernel.org)

PATCH V8 2021-11-23 19:14:00:
- fix a bad editing result from patch 2/8 (found by paul@crapouillou.net)

PATCH V7 2021-11-23 18:46:23:
- changed gpio polarity of hdmi_power to 0 (suggested by paul@crapouillou.net)
- fixed LCD1 irq number (bug found by paul@crapouillou.net)
- removed "- 4" for calculating max_register (suggested by paul@crapouillou.net)
- use unevaluatedPropertes instead of additionalProperties (suggested by robh@kernel.org)
- moved and renamed ingenic,jz4780-hdmi.yaml (suggested by robh@kernel.org)
- adjusted assigned-clocks changes to upstream which added some for SSI (by hns@goldelico.com)
- rebased and tested with v5.16-rc2 + patch set drm/ingenic by paul@crapouillou.net (by hns@goldelico.com)

PATCH V6 2021-11-10 20:43:33:
- changed CONFIG_DRM_INGENIC_DW_HDMI to "m" (by hns@goldelico.com)
- made ingenic-dw-hdmi an independent platform driver which can be compiled as module
  and removed error patch fixes for IPU (suggested by paul@crapouillou.net)
- moved assigned-clocks from jz4780.dtsi to ci20.dts (suggested by paul@crapouillou.net)
- fixed reg property in jz4780.dtsi to cover all registers incl. gamma and vee (by hns@goldelico.com)
- added a base patch to calculate regmap size from DTS reg property (requested by paul@crapouillou.net)
- restored resetting all bits except one in LCDOSDC (requested by paul@crapouillou.net)
- clarified setting of cpos (suggested by paul@crapouillou.net)
- moved bindings definition for ddc-i2c-bus (suggested by paul@crapouillou.net)
- simplified mask definitions for JZ_LCD_DESSIZE (requested by paul@crapouillou.net)
- removed setting alpha premultiplication (suggested by paul@crapouillou.net)
- removed some comments (suggested by paul@crapouillou.net)

PATCH V5 2021-10-05 14:28:44:
- dropped mode_fixup and timings support in dw-hdmi as it is no longer needed in this V5 (by hns@goldelico.com)
- dropped "drm/ingenic: add some jz4780 specific features" (stimulated by paul@crapouillou.net)
- fixed typo in commit subject: "synopsis" -> "synopsys" (by hns@goldelico.com)
- swapped clocks in jz4780.dtsi to match synopsys,dw-hdmi.yaml (by hns@goldelico.com)
- improved, simplified, fixed, dtbschecked ingenic-jz4780-hdmi.yaml and made dependent of bridge/synopsys,dw-hdmi.yaml (based on suggestions by maxime@cerno.tech)
- fixed binding vs. driver&DTS use of hdmi-5v regulator (suggested by maxime@cerno.tech)
- dropped "drm/bridge: synopsis: Fix to properly handle HPD" - was a no longer needed workaround for a previous version
  (suggested by maxime@cerno.tech)

PATCH V4 2021-09-27 18:44:38:
- fix setting output_port = 1 (issue found by paul@crapouillou.net)
- ci20.dts: convert to use hdmi-connector (by hns@goldelico.com)
- add a hdmi-regulator to control +5V power (by hns@goldelico.com)
- added a fix to dw-hdmi to call drm_kms_helper_hotplug_event on plugin event detection (by hns@goldelico.com)
- always allocate extended descriptor but initialize only for jz4780 (by hns@goldelico.com)
- updated to work on top of "[PATCH v3 0/6] drm/ingenic: Various improvements v3" (by paul@crapouillou.net)
- rebased to v5.13-rc3

PATCH V3 2021-08-08 07:10:50:
This series adds HDMI support for JZ4780 and CI20 board (and fixes one IPU related issue in registration error path)
- [patch 1/8] switched from mode_fixup to atomic_check (suggested by robert.foss@linaro.org)
  - the call to the dw-hdmi specialization is still called mode_fixup
- [patch 3/8] diverse fixes for ingenic-drm-drv (suggested by paul@crapouillou.net)
  - factor out some non-HDMI features of the jz4780 into a separate patch
  - multiple fixes around max height
  - do not change regmap config but a copy on stack
  - define some constants
  - factor out fixing of drm_init error path for IPU into separate patch
  - use FIELD_PREP()
- [patch 8/8] conversion to component framework dropped (suggested by Laurent.pinchart@ideasonboard.com and paul@crapouillou.net)

PATCH V2 2021-08-05 16:08:05:
- code and commit messages revisited for checkpatch warnings
- rebased on v5.14-rc4
- include (failed, hence RFC 8/8) attempt to convert to component framework
  (was suggested by Paul Cercueil <paul@crapouillou.net> a while ago)

This series adds HDMI support for JZ4780 and CI20 board



H. Nikolaus Schaller (3):
  drm/bridge: dw-hdmi: introduce dw_hdmi_enable_poll()
  drm/bridge: display-connector: add ddc-en gpio support
  drm/bridge: dw-hdmi: fix bus formats negotiation for 8 bit modes

Paul Boddie (1):
  drm/ingenic: Add dw-hdmi driver specialization for jz4780

 drivers/gpu/drm/bridge/display-connector.c |  15 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  |  19 +++-
 drivers/gpu/drm/ingenic/Kconfig            |   9 ++
 drivers/gpu/drm/ingenic/Makefile           |   1 +
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c  | 105 +++++++++++++++++++++
 include/drm/bridge/dw_hdmi.h               |   1 +
 6 files changed, 146 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

-- 
2.33.0

