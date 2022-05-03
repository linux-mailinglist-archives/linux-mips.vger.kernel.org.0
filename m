Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71E7E517E66
	for <lists+linux-mips@lfdr.de>; Tue,  3 May 2022 09:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiECHTa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 May 2022 03:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiECHT2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 May 2022 03:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D2082B247
        for <linux-mips@vger.kernel.org>; Tue,  3 May 2022 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651562151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Fcdc52RHnyOtW2Ji8ao5Mx7dAO83bo9+YY00o6q0qI8=;
        b=aRZueLxFl9+y35c9fTIveLmmf1Txw8bccLMNdSQcGbxmWC/Xb/m3si9fBVH/ePvfPPWUex
        njFlNiccGcudA5y8/1eETsEAeuw502H5m0Fu60ZtqGxq5i0gDfgEUQKIfkBIfl9fo1Ap0m
        RadiRRbi3ROSiqiaWPldLT/ncaPS9cY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-kSTE-C4jMwi90Vocyz8RyA-1; Tue, 03 May 2022 03:15:50 -0400
X-MC-Unique: kSTE-C4jMwi90Vocyz8RyA-1
Received: by mail-wm1-f69.google.com with SMTP id v9-20020a05600c214900b00393fedddf26so417909wml.1
        for <linux-mips@vger.kernel.org>; Tue, 03 May 2022 00:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fcdc52RHnyOtW2Ji8ao5Mx7dAO83bo9+YY00o6q0qI8=;
        b=C+5OXaNindvoGOMFpwX9t9pDMsmnXEuNy+Tqb7my8PR40VqrbysKO/csnxV6R08gxf
         fLPY2tGzg/IlkOLsmwN9LkPCU6Btlgvb1eR8tbG7bVop1G3hufJSwRzIi7M4UPmn2vKj
         ky/JhsjzdoxBqDyUsb9LT8tW9qd8/KRlbTT+cnJI0H7tGAltD2XioCsltZwiTyh1cBR/
         CPiqVw+MP6m8ANW/VFmmhR+ujkbFcXS3q4cScpu1YJisy0JI/aLpKl8cBNz/dsLQ2OfI
         g2Y4HeuwBKfX8hJSTBD0GqZjPsFJ/KbRs6DJw07tkRcUBZ+fhs0gELo+/vgONJs+rhnc
         XPiw==
X-Gm-Message-State: AOAM531UadjkRfYRZKJNhVwI3yhomRqXvy4Y7JLyUug5Zu9Z4DcDXLGg
        cHcjd9nyAADPS6iBzIMf4mtdrsHi22tpYxks7f56H/tdo056h1QcEyYa8IGWNiPe9bkVVwgM5aa
        IEgOsH+L9mHm8pdDXT9fCfQ==
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id v5-20020a056000144500b0020c731cc1d4mr1856904wrx.76.1651562149329;
        Tue, 03 May 2022 00:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvXXP0f4w1nXpXqVVOb+Guc+0Jj2Rw1NklRnskTnVt1GV+W8d6q/MLtZExFVKZCb9QVoENKA==
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id v5-20020a056000144500b0020c731cc1d4mr1856886wrx.76.1651562149040;
        Tue, 03 May 2022 00:15:49 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm1035387wmp.12.2022.05.03.00.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 00:15:48 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, spice-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v3 0/3] drm: Allow simpledrm to setup its emulated FB as firmware provided
Date:   Tue,  3 May 2022 09:15:37 +0200
Message-Id: <20220503071540.471667-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

This series contain patches suggested by Thomas Zimmermann as a feedback for
"[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
drivers probe" [0].

Since other changes in [0] were more controversial, I decided to just split
this part in a new patch-set and revisit the rest of the patches later.

This is a v2 that addresses issues pointed out in v1.

Patch #1 is just a cleanup since when working on this noticed that some DRM
drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
the value that is the default anyways.

Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
'options', and make this a multi field parameter so that it can be extended
later to pass other options as well.

Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
so that the registered framebuffer device is also marked as firmware provided.

The patches were tested on a rpi4 board with the vc4 DRM driver built as a
module and either simplefb or simpledrm built-in.

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/

Changes in v3:
- Drop the preferred_bpp local variable (Laurent Pinchart).
- Add a const qualifier to options parameter (Laurent Pinchart).
- Drop the firmware local variable (Laurent Pinchart).
- Use DRM_FB_OPTION() since DRM_FB_SET_OPTION() got renamed (kernel test robot).

Changes in v2:
- Rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() and make more clear in
  the kernel-doc what this macro does (Laurent Pinchart).
- Fix some kernel-doc issues I didn't notice in v1.
- Add Reviewed-by tags from Thomas and Laurent.

Javier Martinez Canillas (3):
  drm: Remove superfluous arg when calling to drm_fbdev_generic_setup()
  drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup()
    parameter
  drm: Allow simpledrm to setup its emulated FB as firmware provided

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 ++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 34 ++++++++++++++-----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
 include/drm/drm_fb_helper.h                   | 24 ++++++++++++-
 36 files changed, 85 insertions(+), 45 deletions(-)

-- 
2.35.1

