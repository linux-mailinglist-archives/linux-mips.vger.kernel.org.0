Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B68D4B3BBB
	for <lists+linux-mips@lfdr.de>; Sun, 13 Feb 2022 15:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236504AbiBMORN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Feb 2022 09:17:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236479AbiBMORM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Feb 2022 09:17:12 -0500
Received: from 189.cn (ptr.189.cn [183.61.185.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 141915F262;
        Sun, 13 Feb 2022 06:17:05 -0800 (PST)
HMM_SOURCE_IP: 10.64.8.41:34274.536114013
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 37A9C1002B5;
        Sun, 13 Feb 2022 22:17:03 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id 825d0711674547fb96723e997e5ed85f for mripard@kernel.org;
        Sun, 13 Feb 2022 22:17:05 CST
X-Transaction-ID: 825d0711674547fb96723e997e5ed85f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
From:   Sui Jingfeng <15330273260@189.cn>
To:     Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>, Li Yi <liyi@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v7 7/7] MAINTAINERS: add maintainers for DRM LSDC driver
Date:   Sun, 13 Feb 2022 22:16:49 +0800
Message-Id: <20220213141649.1115987-8-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213141649.1115987-1-15330273260@189.cn>
References: <20220213141649.1115987-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: suijingfeng <suijingfeng@loongson.cn>

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..766cccdf7f73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6453,6 +6453,15 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/lima/
 F:	include/uapi/drm/lima_drm.h
 
+DRM DRIVERS FOR LOONGSON
+M:	Sui Jingfeng <suijingfeng@loongson.cn>
+L:	dri-devel@lists.freedesktop.org
+R:	Li Yi <liyi@loongson.cn>
+S:	Maintained
+W:	https://www.loongson.cn/
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/lsdc/
+
 DRM DRIVERS FOR MEDIATEK
 M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
 M:	Philipp Zabel <p.zabel@pengutronix.de>
-- 
2.25.1

