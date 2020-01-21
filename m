Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC39144593
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jan 2020 21:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbgAUUAv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jan 2020 15:00:51 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37475 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgAUUAv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jan 2020 15:00:51 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so2122052pjb.2;
        Tue, 21 Jan 2020 12:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
        b=P5KYtG59f1k+Yqe22+zjCSiNmrOUvfFutSuM+Nb6W1BwvT+8UmwyeYVhioNj6nsFqy
         Yj34T/5ylDVtZGvmBXfwdp/zw3spki+F2gv8UscDG0CoGS8UO6WVgEYU82yCxNj7XPR8
         0ZsqbISApivCU87Be5eVRw5O37v1pJSyFT32F9kAznVdFcxaM9J9h9seUzf0N73U0O9P
         TSM8gOkyUTqhoephbQIDrWA05//KYOuvqrMST0r1f+vbPu9t5zHSP69FpHS9M/cRpCpW
         S4RYXjSpHrOmCxmvRr/uv7pPtbFQqCLIW5ZhSk7vn2Arokfj5SFUH39hwOCEX2hi0C+W
         nAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
        b=qKhEfzKd/YeHfNNOaKqqjqU165XucJatL2zy1ke94xUOhaV6E7H1RKEoIMFmSwVAXT
         vas65C9Q/RWaEGnQ0Cdv2ehAHge1zz6uZ8/+uS1TIdA8YmnL/QrlftK9/MKvFA1jsEhG
         wp9hRh3XEa0pzzWeRz1As/Nswcs9YlgqJ/jWdbK3VXHl0BLduCKwyDvrd3OO3vZULM23
         klcf7HK1oO5xg+bwcab0z6kteNIGZjUgArkHXW4Yiq/Tt2n/62RMeX7qJWNIxbsa7O6p
         2CPVEn/BFMV4cbslI3nG5XQr+aychYSXdWeBjjpq1pk2Q2qbxPt/X0J59h9o4BhmGtQh
         Z8UA==
X-Gm-Message-State: APjAAAVVgWNNciZ6IYLelSdSEJ41LU8uBe+Z0QL0Z1Q8h0nIhqQXTDGJ
        EbGX0u3wfCUic3iiyo4HGDldUHS2
X-Google-Smtp-Source: APXvYqyv1eUpvO7MITJ+M3cgRICHj72iKltYDNrRQFlAZshLIPuQUQnNPSv2z3H5/XXY4evONk/XIg==
X-Received: by 2002:a17:90b:142:: with SMTP id em2mr145807pjb.4.1579636850683;
        Tue, 21 Jan 2020 12:00:50 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id d2sm261576pjv.18.2020.01.21.12.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 12:00:50 -0800 (PST)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-mtd@lists.infradead.org
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH V2 2/3] arch: mips: brcm: Add 7425 flash-edu support
Date:   Tue, 21 Jan 2020 15:00:07 -0500
Message-Id: <20200121200011.32296-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121200011.32296-1-kdasu.kdev@gmail.com>
References: <20200121200011.32296-1-kdasu.kdev@gmail.com>
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

