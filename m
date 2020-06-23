Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37376205A70
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2020 20:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733184AbgFWSYy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jun 2020 14:24:54 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51670 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732549AbgFWSYy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jun 2020 14:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1592936684; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ITvD9mmuKfY68Q7XYzYsHbbyiuTuUxzWr+ANwSKk9sI=;
        b=VM7M9iGfJTdYAjzAFEyiROauyPDgXKDUjgQ00jl6PWF04mnygkemoVIktVTwvoHKWVi3/J
        izdx6L8JRIEVjb9XuuMYQAN+E2oh0Mo/udQZ2C9uIWi98Qnu5Mwaa3VvTY1Xply2v1Taws
        t+M6srN62+LIjEcnb4taCSBZ2vEueGI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/7] dt-bindings: MIPS: Add entry for the YLM RetroMini
Date:   Tue, 23 Jun 2020 20:24:27 +0200
Message-Id: <20200623182432.187843-2-paul@crapouillou.net>
In-Reply-To: <20200623182432.187843-1-paul@crapouillou.net>
References: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add an entry to ingenic/devices.yaml for the JZ4725B-based
YLM "RetroMini" RS-90.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
index d1175030781a..07d8550a9b49 100644
--- a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -22,6 +22,11 @@ properties:
           - const: qi,lb60
           - const: ingenic,jz4740
 
+      - description: YLM RetroMini RS-90
+        items:
+          - const: ylm,rs90
+          - const: ingenic,jz4725b
+
       - description: Game Consoles Worldwide GCW Zero
         items:
           - const: gcw,zero
-- 
2.27.0

