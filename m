Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 483AA1605CF
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 20:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgBPTVg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 14:21:36 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.177]:31410 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgBPTVJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 14:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581880866;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=kPUcf/GvZL1nupNS3IZr+BX1pSqIjowqBPh5G4yQp6A=;
        b=sMYcLkKYljzx3CW+K12/ySPKYORsogyLsfboQogkNpay+H6AwI2azhykbL0uia4qhg
        sEQRTMOyyDLg3XsXIb4bFLdC7OR6vaOthPbYAX/xKKdCB25QnYfVVzlBbTxhpS2yTE8L
        h59Yeocjk4SOhO001gQi1nzHTanTYLGR0FpTQ+bsjUH58HqVhfF59hjwSdp4I2P6MATD
        A4ynOl5lBdH/nGuGsmHAFWCG5WJhpslQxTlYjVA7Woxyi5OjjZr55i81niSCGgbQtemB
        yZC1toxlW2A8cAZUPl6aPO+42ifavIz2abIFo+Auc7HpCxY6hdDgS8/WgNQBWG7BA9AE
        x7SA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GJKwJlf
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 20:20:58 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [RFC v3 8/9] MIPS: CI20 defconfig: Probe efuse for CI20
Date:   Sun, 16 Feb 2020 20:20:50 +0100
Message-Id: <c8446d39be45131541a295e9ac7c9ee2553b12ec.1581880851.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581880851.git.hns@goldelico.com>
References: <cover.1581880851.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mathieu Malaterre <malat@debian.org>

MIPS Creator CI20 comes with JZ4780 SoC. Provides access to the efuse block
using jz4780 efuse driver.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 6e613bbb6807..614dc18211bc 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -193,3 +193,5 @@ CONFIG_RC_DEVICES=y
 CONFIG_IR_GPIO_CIR=m
 CONFIG_IR_GPIO_TX=m
 CONFIG_RTC_DRV_PCF8563=m
+CONFIG_NVMEM=y
+CONFIG_JZ4780_EFUSE=y
-- 
2.23.0

