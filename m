Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A013810433A
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2019 19:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbfKTSWZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 13:22:25 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39808 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbfKTSWZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Nov 2019 13:22:25 -0500
Received: by mail-wm1-f67.google.com with SMTP id t26so717945wmi.4;
        Wed, 20 Nov 2019 10:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
        b=SnQMCFO2/IL49vHRpz/dxgzfpuTcw0d7WNJIwKN4npFfzvpk0VPBHK4Zf0SU/XPdbt
         qRujFXrwp6jpgk7vfBrfU8itNyC560k0+bL+fyT1iqB2sdffaoOhJnvo87yPoom5ApuT
         dd9C4Wi3sM0O84RU/fRcz1bX+Czns1B4cmfQARrAe8GRDbtHN3qR4hjxS04mplQlKj2c
         gnvuUgSxfAQ+X2XqInwDpV9/BWNpgpA98dUcE9Q1MIHxtN3z+1Gwy9xujCLR80GLDw1F
         lOuFwVTORdFFvCuO0iCZnC/1lmR14/X/KlUb8Ptby3T2LURrTATJYRg+GAQEuBHm5i9P
         rsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
        b=A1kIx+nGxi1rgEpinU4eT5MV813Cq9lpc1tbsJ+FWVruBNyvySGa00Dd4LleW/6AR5
         QKilxkaL45Xx7eHEOEIwKi2BkRg6IyxyPBZKEL6DsCXQ7cX7FuaGJKEBdY9Lhr0J2rs+
         7BGl6aY3tcxztt6oFXguPQbJ1zT9/w9NVa3geIeYN5K4GTLZWmNL3UDQ89+L4HoK7CZB
         +d5Gh7y2HHqnyrB/2Ux1uIWCKWRKGnhJoznOQMVNniWuxYjVewABSmaNPZ740WH64Gu1
         ReHzX45/LYzNejwwTk8JQ9/kTzYy/C8N2SmQijQUiUrLxZ7SXzwFtPteIwkwaYPIPXP+
         6EcA==
X-Gm-Message-State: APjAAAW7eQv7dWYsEJJlEGd9hfPo2Tk1/Xbg+83ZyMd3J5FTJxql7p8H
        E/H4iJbkvYMu1rBQ/pPU6rA=
X-Google-Smtp-Source: APXvYqz3eG2xTl37gXsceUkNr8q+XgQZyURIW79GwEq+1+sKKxqalz7YBLE14Ldh+mq/AyQqighQrA==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr5078168wmb.102.1574274143317;
        Wed, 20 Nov 2019 10:22:23 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id x205sm151153wmb.5.2019.11.20.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 10:22:22 -0800 (PST)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-mtd@lists.infradead.org
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] arch: mips: brcm: Add 7425 flash-edu support
Date:   Wed, 20 Nov 2019 13:20:58 -0500
Message-Id: <20191120182153.29732-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120182153.29732-1-kdasu.kdev@gmail.com>
References: <20191120182153.29732-1-kdasu.kdev@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Nand controller v5.0 and v6.0 have nand edu blocks that enable
dma nand flash transfers. This allows for faster read and write
access.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 410e61ebaf9e..aa0b2d39c902 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -403,8 +403,8 @@
 			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg-names = "nand";
-			reg = <0x41b800 0x400>;
+			reg-names = "nand", "flash-edu";
+			reg = <0x41b800 0x400>, <0x41bc00 0x24>;
 			interrupt-parent = <&hif_l2_intc>;
 			interrupts = <24>;
 			status = "disabled";
-- 
2.17.1

