Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5FA67E0B
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2019 09:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfGNHNo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jul 2019 03:13:44 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25452 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfGNHNo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jul 2019 03:13:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563087513; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=kguB6JxfqtlnhUmhR1Nb6MDJjeMxV1Dw1jwJxW5BbIt3EvxcTnZTnXa9/q0bC2/+KqWiKQzvn/Z6yCsbN1jpx/FzL6IEZ4hIGWqWsI92NPhiZ930NSmgAwRiDrs6dyZOAJpndf1UlOHIbrkCt7b2Cvc5CoXX5kVG+2CaW4VPX7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563087513; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=G6QZl0yzswQY5OpXi5R+jneFKyyMKM0a1rnMjMmyboY=; 
        b=TLcHWw8XWGRRd5eKWG3qJk0MBpg14JfpzVBY6MlQYVqdb6wy0YECUsLsUHS1z+PhYO1NMIhdptyi7OShXolHdOXKyMAILau9Yt0mAOcl2lF66WgYBtKYxl4DpzTwL15b28T2MUK73HxhFSABypat5DmfTg/tzGLX0OIWut6DhWA=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=Gpz9h7K4r9vor+1DdyPFNrdHkjTbG4cznS7MGY+4ja8D/rsgAYJuIEWdTxCPE15W8tUFRw+Drt6W
    5Qht/AZKJd5xyh7ywQAkAFEDivF5cC2090JmmgDRaY7Xzfc0WrgK  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563087513;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=748;
        bh=G6QZl0yzswQY5OpXi5R+jneFKyyMKM0a1rnMjMmyboY=;
        b=gYBDppZ3+ygLODyqht3EzZD5JoeSd8UFNjKd+vqXw25NLZBY90L/ih1h7hCv88L+
        EIcXV+LpaSP6oKmPrRZ1J0UR1/jJ5w531b6GP4NsNcON6bHVp7p0U/LcCwHJCbFt6R3
        b5jVDg19ADLf8IISgJCdwxDOcR/4CUyzB1AMHqPQ=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1563087512516142.16015020040902; Sat, 13 Jul 2019 23:58:32 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 5/6] dt-bindings: pinctrl: Add X1500 bindings.
Date:   Sun, 14 Jul 2019 11:53:55 +0800
Message-Id: <1563076436-5338-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the pinctrl bindings for the X1500 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index 7e2ee46..0014d98 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -27,6 +27,7 @@ Required properties:
     - "ingenic,jz4780-pinctrl"
     - "ingenic,x1000-pinctrl"
     - "ingenic,x1000e-pinctrl"
+    - "ingenic,x1500-pinctrl"
  - reg: Address range of the pinctrl registers.
 
 
-- 
2.7.4


