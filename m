Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A26161748EF
	for <lists+linux-mips@lfdr.de>; Sat, 29 Feb 2020 20:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbgB2TqB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Feb 2020 14:46:01 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:32620 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgB2TqB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Feb 2020 14:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583005559;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=9aj0iNXW9sT+vgaHhh3H7qCB3K/FWvtt+HP6Njt4Sik=;
        b=CD5kPTYGuf0p1tRtJTfE7tOAplcBITiGhzsCCxR3stN/7TgFJwBwF3TUYvfuTnYYU3
        n3RJgqXYtTxSxppxR6jKgiUp72EZ4JJ5+I9hXEe4eoym3P+c0zCV1YJjpEjrEDADoA2Y
        8lvjzdtGyt0SQm3vitkqCmoRwkzAUTGZL6yJdw7VnNRI9OvflHR3ffem3CEJ8bsJ0UVk
        zqwOPf3nA5Rdkxu3NcojuSWrk1ogW3MlKFPGClGlt8/TbKoKOBtmkW4RoCj6v1OCEE3P
        0pfo3C+4o1WRKqRcIFvgCPSPwznLk8wfSXtfvSfdCfwIDD4Eg204vSARUFc9NGpfDpef
        3ACA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6HGqvi2w="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1TJjo6m2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 29 Feb 2020 20:45:50 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, Alex Smith <alex.smith@imgtec.com>
Subject: [PATCH v5 1/5] MIPS: DTS: CI20: add DT node for IR sensor
Date:   Sat, 29 Feb 2020 20:45:44 +0100
Message-Id: <b058cb1aadbc63eb8c0c35abc6366f552263cf1b.1583005548.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1583005548.git.hns@goldelico.com>
References: <cover.1583005548.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alex Smith <alex.smith@imgtec.com>

The infrared sensor on the CI20 board is connected to a GPIO and can
be operated by using the gpio-ir-recv driver. Add a DT node for the
sensor to allow that driver to be used.

Signed-off-by: Alex Smith <alex.smith@imgtec.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 37b93166bf22..59c104289ece 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -60,6 +60,11 @@
 		enable-active-high;
 	};
 
+	ir: ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpe 3 GPIO_ACTIVE_LOW>;
+	};
+
 	wlan0_power: fixedregulator@1 {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan0_power";
-- 
2.23.0

