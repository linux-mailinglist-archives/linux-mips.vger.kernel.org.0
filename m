Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3143015A9
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 15:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbhAWOKu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 09:10:50 -0500
Received: from aposti.net ([89.234.176.197]:60806 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbhAWOKu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 09:10:50 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     od@zcrc.me, Christophe Branchereau <cbranchereau@gmail.com>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] dt-bindings: sound/ingenic: Add compatible strings for JZ4760(B) SoC
Date:   Sat, 23 Jan 2021 14:09:56 +0000
Message-Id: <20210123140958.12895-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the ingenic,jz4760b-codec and ingenic,jz4760-codec compatible
strings.

In the process, convert the previous compatible strings to use an enum
instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/sound/ingenic,codec.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
index eb4be86464bb..97d5f3819b27 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,codec.yaml
@@ -15,9 +15,14 @@ properties:
 
   compatible:
     oneOf:
-      - const: ingenic,jz4770-codec
-      - const: ingenic,jz4725b-codec
-      - const: ingenic,jz4740-codec
+      - enum:
+          - ingenic,jz4770-codec
+          - ingenic,jz4760-codec
+          - ingenic,jz4725b-codec
+          - ingenic,jz4740-codec
+      - items:
+          - const: ingenic,jz4760b-codec
+          - const: ingenic,jz4760-codec
 
   reg:
     maxItems: 1
-- 
2.29.2

