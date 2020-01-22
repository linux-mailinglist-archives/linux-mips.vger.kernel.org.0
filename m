Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD9B8145D3B
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 21:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgAVUms (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 15:42:48 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:55052 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgAVUms (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 15:42:48 -0500
Received: by mail-wm1-f42.google.com with SMTP id b19so129686wmj.4;
        Wed, 22 Jan 2020 12:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
        b=nQW4OgJgJdFK02hYEBEPwRrR8a6caN8r+4w7uFVz6FctUW898Gk1vZXp3DoONgY4c8
         9K2Fif9a6xzg3HKh+eCJObqZ5Cok7NihJ5uzLhrkkDyo72h7gTnQ0KpPCxeBKy4P//k/
         gUDzyEh0aLM1IxYCbgLq8p3kqqD7+TNz6GpQFUvU6N3qIABU77REq13g9SYATmOluUZm
         ismOTp2Li+XseVYdvh4A3H/SZaN/GWHxBG1YVFmVQb/PlytzNR/9cN+cDU8pbMCi83Jy
         pnjk4r1uFNNFjp6qwUbFnxYps0XuJJTRu4U3aBC2je5LJ8Prb6FYYKAI28ELmuiFybtW
         QnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
        b=tt0AcafdQyFou7Qgh1H98S4JCH0GmsJRrF88pg6UhHO8f2NxBNni5K4PodGzemY7T8
         14308yGRhh4yb/XTOxnK4kESGdKsnE0QA7VfN5X/WBZIOnZRk6Jfto1CVZ9BtX0evhQZ
         YYUfAFWVDQts3aj2ziJ2nqkaE0PxI/DPhLAPTyESqEJAMqQyefO+JI20qDMlo0V3prFx
         2/fVK8/I/G1j99/uGagjtQTrRlos4GsdvbuU2QLlf3whhQvpfcQMDtyTd8YaM4HbKu63
         PbdVuT0snyyNXKGfVI4w3sEX5aIx9g3Eoz5plAH+8AZQU/IyhwW04a5XYaPmb54bLt3g
         ADHg==
X-Gm-Message-State: APjAAAUuC3zLeu86STV5n8bUC5MGD3vrjNOI1DwkXMkt2xWzD0dn2uFV
        73b5tr5iKyjVKN1JEaNj5Pe3tN5f
X-Google-Smtp-Source: APXvYqx00aXRlsFjF/mPoddK+NBD1e722qnLI6u3HAZnDCluwpoUZfbl74On5lKVD+3qSpp/n3nikA==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr73172wmg.16.1579725766305;
        Wed, 22 Jan 2020 12:42:46 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id x132sm6216302wmg.0.2020.01.22.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 12:42:45 -0800 (PST)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH V3 2/3] arch: mips: brcm: Add 7425 flash-edu support
Date:   Wed, 22 Jan 2020 15:41:10 -0500
Message-Id: <20200122204111.47554-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122204111.47554-1-kdasu.kdev@gmail.com>
References: <20200122204111.47554-1-kdasu.kdev@gmail.com>
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

