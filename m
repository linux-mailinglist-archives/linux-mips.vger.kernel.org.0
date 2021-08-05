Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71EB3E1672
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 16:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241870AbhHEOIc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 10:08:32 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:36044 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239887AbhHEOIc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 10:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628172480;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=alBm07GUiG3xNvu0vvm1f2ekdmy6obwUH/alNSW6LLY=;
    b=gKxNkYuBqiH+B3Hs1+vQcFCat751wWL0wv6fryCajlGyrhxosChYkzt8RjThegbVXd
    NSHhAhlXcj0BO+vNtVxV46gdZMyz3mGjnLsJgADP3n8kFBhPUzbU6+B7uUc/1VSLTxxU
    NW1lZXqFdo+pVJ8Os7eVHCLcMTXNsbXE5C2DuiscxcTxFdRDHdJ1U4HJI469e9qT/mhS
    hp2/BstIiW7l2h8OTjVtIC34dQy7ojIm2XAlkhJe+He8b7P+4EdDSxzMhZEtl0ABYJ08
    JW7vjABO4uhlIyHcnM3hIvxPcsz74THKDbmv5mzxLPH+ltJ0bj5RrZQv1bwzXyXhAjaV
    q6Eg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdbLzk="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x75E7w77z
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 5 Aug 2021 16:07:58 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/8] MIPS: jz4780 HDMI
Date:   Thu,  5 Aug 2021 16:07:49 +0200
Message-Id: <cover.1628172477.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series adds HDMI support for JZ4780 and CI20 board

V2:
- code and commit messages revisited for checkpatch warnings
- rebased on v5.14-rc4
- include (failed, hence RFC 8/8) attempt to convert to component framework
  (was suggested by Paul Cercueil <paul@crapouillou.net> a while ago)


H. Nikolaus Schaller (2):
  MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
  [RFC] drm/ingenic: convert to component framework for jz4780 hdmi

Paul Boddie (5):
  drm/bridge: synopsis: Add mode_fixup and bridge timings support
  drm/ingenic: Add jz4780 Synopsys HDMI driver
  drm/ingenic: Add support for JZ4780 and HDMI output
  MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
  MIPS: DTS: CI20: add HDMI setup

Sam Ravnborg (1):
  dt-bindings: display: Add ingenic-jz4780-hdmi DT Schema

 .../bindings/display/ingenic-jz4780-hdmi.yaml |  82 +++++++++
 arch/mips/boot/dts/ingenic/ci20.dts           |  64 +++++++
 arch/mips/boot/dts/ingenic/jz4780.dtsi        |  45 +++++
 arch/mips/configs/ci20_defconfig              |   7 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  16 ++
 drivers/gpu/drm/ingenic/Kconfig               |   9 +
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 163 ++++++++++++++++--
 drivers/gpu/drm/ingenic/ingenic-drm.h         |  52 ++++++
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     | 156 +++++++++++++++++
 include/drm/bridge/dw_hdmi.h                  |   5 +
 11 files changed, 585 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c

-- 
2.31.1

