Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD2840883B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 11:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238315AbhIMJbD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 05:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238056AbhIMJbC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Sep 2021 05:31:02 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFDFC061574
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 02:29:47 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id bg1so5383771plb.13
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mHnLIBXGNUEZkqs59OKrFyHzl1NEWUd1+Arb1Qw33g=;
        b=DVeUJFkoyZHtWKMceC4CgFcY7Dk36xb3RiZqgbK2nFIPKcxHK9+Gw+DvL+zV/oJFq3
         UmUI9R8hLecu8f8DvTrkHi/wwUBR3e0iDzbSJPbobmeY23+fkPeKaSSGFDg+GV/JjpS0
         v17igJBcgjl5ZkJrhi3vFrkZEDEmVzK5Ru9vfQc+R37YwhcxbLVFEEhCuXWeTaDRy8VS
         6Ac1ETrjIhc9SnGeZlk76lF2ZmI+WLgIdvQ8+o3Bmj2cW9s4EV+AqBOiUdu744szLkJq
         xTcywJwt4yC+3FhDTaix4q4KU9+ND2UETHHg20Plg95+KB8Jy8o/MrZ9QtVDpcLB6CuC
         tcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1mHnLIBXGNUEZkqs59OKrFyHzl1NEWUd1+Arb1Qw33g=;
        b=Hy/hIeFisx8EjnZWO8Wk4KlmVOWerKJ2syaTic8Pf/FPUfIGY3X1lZaQwFfzVIT/0D
         DFgMX2gME9eKsgKjNcwzJJvOr7CnyF4QCucmjCG+FsXdBKqYeQvSHgFN8rfoZrj6OThU
         bFc0WRx3cxnH28rStUAz/5lNmSV6XFctM9ARgMmGnut/3F/+qasHiuk2DD3ZdM6WCi/p
         fv6pCkqTDGuyhE3RoJryBgoEmHGklmdspQcaqzUrtcOQS55ncK3EI4ueknhiv2VDYNCR
         Iayfl6ozikcQxpWUk5fV1rsJcH5EJ28o8RLDGnHZbU1yeKhPe5xNyyOyYeZbSGAOagwT
         R9xg==
X-Gm-Message-State: AOAM532Ah2ZLXQAW2N7B1agUewWBrE0Cm2o+rkt0Mv/cxy2RzbTpvAx8
        Ho9/cD1AJX+JBNgASwioNZqLQPOZyow+P7tHsCZioeuj
X-Google-Smtp-Source: ABdhPJzxtP932YcfjO77e1w8v2vTS+H1TbHMeyUp7LFb9eRvaV6IJ5Mq+/DHMVCAyDF2H4qpNc2v5w==
X-Received: by 2002:a17:902:708b:b0:13b:8d0f:9b4d with SMTP id z11-20020a170902708b00b0013b8d0f9b4dmr5552103plk.27.1631525386836;
        Mon, 13 Sep 2021 02:29:46 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.162])
        by smtp.gmail.com with ESMTPSA id q18sm6535960pfj.46.2021.09.13.02.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 02:29:46 -0700 (PDT)
From:   Wang Haojun <jiangliuer01@gmail.com>
X-Google-Original-From: Wang Haojun <wanghaojun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: loongson64: configs: Update loongson3_defconfig
Date:   Mon, 13 Sep 2021 17:28:56 +0800
Message-Id: <20210913092856.3204631-1-wanghaojun@loongson.cn>
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

