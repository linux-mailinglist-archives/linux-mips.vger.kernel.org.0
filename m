Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E6B173F5E
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 19:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgB1STp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 13:19:45 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:28986 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1STl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 13:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913978;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0KwFWogrkYd3WbP4B9tFSDqdj5/ZkSqbBbEVxlZwGEA=;
        b=r1fDhr3PrlhUpA/h4ecGvTJu2H7ZTNYbh7UhbHNd5/9DH3NsGK0zIiVx78/WbpOp2E
        Fr1IMItHGhPEQh7YNMueezzz1JljrUU6jM9jFNcsXgqbftOwLDfJXq6ZvwLQvpddGkbi
        ItxlRWSH5TNf3ObG8mr1JdK+M5/+rtJkOWbOhche7RtZOjfqRdLjHFtoUtJT8O8ku/8R
        Qmf16WD2ZMzoWFz6pg+h0Xxci+UYuB86Z+gClFz+hub6qPQwanZd5vEymgIDtnaK45iK
        vsY3rH3mTpO7ZFLUw+ed+Yxchhk6TM2vjVwrQBYYs4xdRE0YfnVNUJhbCgqoywp/dh18
        XLCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SIJa2Lp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 19:19:36 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [RFC v2 3/8] drm: ingenic-drm: add MODULE_DEVICE_TABLE
Date:   Fri, 28 Feb 2020 19:19:28 +0100
Message-Id: <c1b214f88840309c0d05162d59f666c0f7375b95.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

so that the driver can load by matching the device tree
if compiled as module.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 6d47ef7b148c..d8617096dd8e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -844,6 +844,8 @@ static const struct of_device_id ingenic_drm_of_match[] = {
 	{ /* sentinel */ },
 };
 
+MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
+
 static struct platform_driver ingenic_drm_driver = {
 	.driver = {
 		.name = "ingenic-drm",
-- 
2.23.0

