Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E0D447028
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 20:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbhKFTh4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Nov 2021 15:37:56 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59322 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbhKFTh4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Nov 2021 15:37:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 46CE12171F;
        Sat,  6 Nov 2021 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636227313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=5D/EvtfQAj4wvspwPbd79LEEeiKkU4WNjg4xKiX4H7E=;
        b=0BQpqv/Fi8WEKJvFjOf9j7KsG30YsKsa6cB8ZQrSoAka66ebVbfwjPWz4LpoylYsf1pt38
        PAjHVusD8As2XaVCz+0tSM18TtQuAY5L/mCNQf/wZpXeVeMcN2azIKmXpaoYo9fqn05md0
        lwLRK1ORaMdobbTaNU6/PgQxJplIEt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636227313;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=5D/EvtfQAj4wvspwPbd79LEEeiKkU4WNjg4xKiX4H7E=;
        b=iP9aR7b9xMeCarp9AXAxmYxCWo3zJywkz2IqvlcT0H0gyznyTsnDvfoXybyE3TI/0ITSKd
        yamf/sq6e4ntsFDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E539313A1D;
        Sat,  6 Nov 2021 19:35:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id cBLSNvDYhmEdLQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Sat, 06 Nov 2021 19:35:12 +0000
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
Subject: [RESEND PATCH v2 0/2] drm: Small CMA cleanups
Date:   Sat,  6 Nov 2021 20:35:07 +0100
Message-Id: <20211106193509.17472-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

(no changes; resending for kernel CI)

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


base-commit: c2502072fe2bd823d59749dca7fde064b345e61c
--
2.33.1

