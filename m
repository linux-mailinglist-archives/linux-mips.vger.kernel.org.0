Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A551615EB30
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 18:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389755AbgBNRTK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 12:19:10 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:13620 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391605AbgBNQKx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 11:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696640;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3bosFD/maVT7s0PxPwS4PL1iP9bgaYLTqR2vJvqzmIk=;
        b=Ys4CgBNhZwV+Ktwgs1/SWm7SlnuXl0jUdYYSHJf/C20OuPIdPY3Ek9zJ0/majsiWo2
        ZZHhtJTyWvvRUH8zRcq36W3UqIMA0TdUwsR8uYbEAEOPg3J8hsh5TB7YMx2O/SBQSHbk
        qb7uXloWhNtOz6a3mBeg2Wx75RzSrfm4D9/PUv+wtm2P9WTko8zUwsi48MMWKsKHfAXF
        q/6TzCCkKmHpG0jv1w1M8thivMs2L5KWfiCz+1JliDqmwPgteLtT6ntpn/LKHBU70UA2
        0FVPt4VfXJC4ncjeNaiD8+aUO2MXWXTTMjO9EA2LLVvjcCC3Xs1yS1k4bJ8Gwp2zVKE9
        8WvA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1EGAVFl4
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 14 Feb 2020 17:10:31 +0100 (CET)
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
Subject: [PATCH v2 09/12] MIPS: CI20: defconfig: compile gpio-ir driver
Date:   Fri, 14 Feb 2020 17:10:21 +0100
Message-Id: <e754e1cbb4504123a97fcf044e892afd2ed8abc8.1581696624.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The CI20 board has a gpio based IR receiver.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 74e5775b8a05..0458ea4d54e8 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -181,3 +181,8 @@ CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_LEDS_TRIGGER_TRANSIENT=y
 CONFIG_LEDS_TRIGGER_CAMERA=m
+CONFIG_LIRC=y
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_RC_DEVICES=y
+CONFIG_IR_GPIO_CIR=m
+CONFIG_IR_GPIO_TX=m
-- 
2.23.0

