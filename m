Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD45395202
	for <lists+linux-mips@lfdr.de>; Sun, 30 May 2021 18:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhE3QvW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 May 2021 12:51:22 -0400
Received: from aposti.net ([89.234.176.197]:33404 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhE3QvV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 May 2021 12:51:21 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/6] dt-bindings: clock: ingenic: Add ingenic,jz4760{,b}-cgu compatibles
Date:   Sun, 30 May 2021 17:49:18 +0100
Message-Id: <20210530164923.18134-2-paul@crapouillou.net>
In-Reply-To: <20210530164923.18134-1-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add ingenic,jz4760-cgu and ingenic,jz4760b-cgu compatible strings for
the JZ4760 and JZ4760B SoCs respectively.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
index c65b9458c0b6..6d6236e02c22 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
@@ -22,6 +22,8 @@ select:
         enum:
           - ingenic,jz4740-cgu
           - ingenic,jz4725b-cgu
+          - ingenic,jz4760-cgu
+          - ingenic,jz4760b-cgu
           - ingenic,jz4770-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
@@ -49,6 +51,8 @@ properties:
       - enum:
           - ingenic,jz4740-cgu
           - ingenic,jz4725b-cgu
+          - ingenic,jz4760-cgu
+          - ingenic,jz4760b-cgu
           - ingenic,jz4770-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
-- 
2.30.2

