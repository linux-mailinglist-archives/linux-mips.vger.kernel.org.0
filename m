Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2A2441527
	for <lists+linux-mips@lfdr.de>; Mon,  1 Nov 2021 09:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbhKAIU1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Nov 2021 04:20:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:42494 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhKAIU0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Nov 2021 04:20:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E76C1212C7;
        Mon,  1 Nov 2021 08:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635754672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=froXKkwnXcE09hCLAbIHSihJ/nL3UBMsXPk/fd1O4Cg=;
        b=Ofrd8rLNErIfwlciDlpg7G4g2oRWnuCd/EYLyZo4l1Tf+J5KSJmNLbB8/jRtq9pP87Mngi
        u/GZA5CCRgRERoUS8x+iPkf3p6tPki631VOLLVpn8i9d3ZMXyHx1K1jMctj6KsitYD3qjI
        Mz7yB1cf1nLDJSAaOYEvKkYiXzfox90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635754672;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=froXKkwnXcE09hCLAbIHSihJ/nL3UBMsXPk/fd1O4Cg=;
        b=19E+Jk2zifLgLxkjMjIKZ6k4BeftOIiScpU3DtesQB4m4QWycwzbz0A6jFfElB0XbIDyqr
        JcD2/xC8RLfXENBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92C9013AA1;
        Mon,  1 Nov 2021 08:17:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id /SfQIrCif2EIIAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 08:17:52 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, noralf@tronnes.org,
        marcel@ziswiler.com, naresh.kamboju@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm: Small CMA cleanups
Date:   Mon,  1 Nov 2021 09:17:49 +0100
Message-Id: <20211101081751.24613-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove CMA dependencies from MIPI-DBI and replace the config
symbol DRM_KMS_CMA_HELPER with DRM_KMS_HELPER. This allows to
link drm_fb_cma_helper.o into a helper library.

Thomas Zimmermann (2):
  drm/mipi-dbi: Remove dependency on GEM CMA helper library
  drm: Remove CONFIG_DRM_KMS_CMA_HELPER option

 drivers/gpu/drm/Kconfig                 |  7 -----
 drivers/gpu/drm/Makefile                |  2 +-
 drivers/gpu/drm/arm/Kconfig             |  2 --
 drivers/gpu/drm/arm/display/Kconfig     |  1 -
 drivers/gpu/drm/aspeed/Kconfig          |  1 -
 drivers/gpu/drm/atmel-hlcdc/Kconfig     |  1 -
 drivers/gpu/drm/drm_mipi_dbi.c          | 34 ++++++++++++++++++-------
 drivers/gpu/drm/fsl-dcu/Kconfig         |  1 -
 drivers/gpu/drm/hisilicon/kirin/Kconfig |  1 -
 drivers/gpu/drm/imx/Kconfig             |  2 +-
 drivers/gpu/drm/imx/dcss/Kconfig        |  2 +-
 drivers/gpu/drm/ingenic/Kconfig         |  1 -
 drivers/gpu/drm/kmb/Kconfig             |  1 -
 drivers/gpu/drm/mcde/Kconfig            |  1 -
 drivers/gpu/drm/meson/Kconfig           |  1 -
 drivers/gpu/drm/mxsfb/Kconfig           |  2 +-
 drivers/gpu/drm/panel/Kconfig           |  2 +-
 drivers/gpu/drm/pl111/Kconfig           |  1 -
 drivers/gpu/drm/rcar-du/Kconfig         |  1 -
 drivers/gpu/drm/shmobile/Kconfig        |  1 -
 drivers/gpu/drm/sti/Kconfig             |  1 -
 drivers/gpu/drm/stm/Kconfig             |  1 -
 drivers/gpu/drm/sun4i/Kconfig           |  1 -
 drivers/gpu/drm/tidss/Kconfig           |  1 -
 drivers/gpu/drm/tilcdc/Kconfig          |  1 -
 drivers/gpu/drm/tiny/Kconfig            | 20 +++++++--------
 drivers/gpu/drm/tve200/Kconfig          |  1 -
 drivers/gpu/drm/vc4/Kconfig             |  1 -
 drivers/gpu/drm/xlnx/Kconfig            |  1 -
 29 files changed, 40 insertions(+), 53 deletions(-)

--
2.33.1

