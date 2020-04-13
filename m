Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD041A68BF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731001AbgDMP1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:27:49 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40286 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgDMP1s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791633; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PM73Jz2DCirYQzF4P/qNEUCm+/GFIlfa4jqb8rqtShU=;
        b=Zl/2tIXNqdt5bmNcVu0PT4l5d52zeCsbv60n1HdNAKuBrImkCuKr4BvzdUdCZJ/y54+MnF
        8ozUm3u5v5xm0hjdEDea91ZT+ltI3T4ySa9TNerp4IiX5k/wnNQVe1IiwXSUIE3xAw3vsI
        RxapN9qvvvqHKPV9vpH1NZY4aRKnW5M=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 05/13] dt-bindings: MIPS: Require SoC compatible string after board string
Date:   Mon, 13 Apr 2020 17:26:25 +0200
Message-Id: <20200413152633.198301-5-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

All devicetree board files list a compatible string for the SoC after
the compatible string of the board.

Enhance the YAML format so that these SoC compatible strings appear
aside each supported Ingenic board.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
index 78dcf6ef3883..d1175030781a 100644
--- a/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/ingenic/devices.yaml
@@ -20,16 +20,20 @@ properties:
       - description: Qi Hardware Ben NanoNote
         items:
           - const: qi,lb60
+          - const: ingenic,jz4740
 
       - description: Game Consoles Worldwide GCW Zero
         items:
           - const: gcw,zero
+          - const: ingenic,jz4770
 
       - description: MIPS Creator CI20
         items:
           - const: img,ci20
+          - const: ingenic,jz4780
 
       - description: YSH & ATIL General Board CU Neo
         items:
           - const: yna,cu1000-neo
+          - const: ingenic,x1000
 ...
-- 
2.25.1

