Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A04F15EB2B
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 18:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391658AbgBNQKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 11:10:54 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123]:32030 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391604AbgBNQKx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 11:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696641;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=87P0OD8XaKZo4miCqHORxCklVwyh7VqETa9wtLbJ/YE=;
        b=CgPlTloSD00Bc5lbHigNX4xl7PUfSiSfWjbPmb3Ar2SjsBXvLvuNjKJUR5ynPUO6Mm
        WD90I9BTBdgbNmlaHWASBcGfcu5mUROyy2v9JXMhuDohx7NjcvFgcQxDimTDXxfFZ+zn
        IEkoqgRoZnooVel36Ejy0epG+fWj3nzqvGhrnn/yDtOscO3UPxyQ0ONV1MbORLd/TyqG
        xoxMzyhOlG/lO9Uvcobrckb7yCtjO6KCjK72LPVsuKsSXn7BSU1zd4mCctIZON/PnNBC
        BlPfy9R6YWvd+yVIxV85FZ1+bU2KPCLCJWWa4rHUFlMZjbJZJfOO/2xO0otFdMpa+X+q
        ys5g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1EGAWFl6
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 14 Feb 2020 17:10:32 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: [PATCH v2 11/12] MIPS: CI20: defconfig: configure for CONFIG_KEYBOARD_GPIO=m
Date:   Fri, 14 Feb 2020 17:10:23 +0100
Message-Id: <7f4bd0fa642e6a1d2143787a0452889297a888de.1581696624.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The SW1 button is hooked up to send input events.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 0458ea4d54e8..0db0088bbc1c 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -89,6 +89,7 @@ CONFIG_I2C_JZ4780=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
+CONFIG_KEYBOARD_GPIO=m
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
-- 
2.23.0

