Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9AD4144866
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 00:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgAUXj7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jan 2020 18:39:59 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40210 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgAUXj6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jan 2020 18:39:58 -0500
Received: by mail-io1-f67.google.com with SMTP id x1so4707413iop.7;
        Tue, 21 Jan 2020 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=+0w0WKBbwoy+XHZlM6lmViUu1mqZ/+HAGtiGqaTaIuI=;
        b=vQaOL5ypyYqibKrxTRJ1DIlI3ObFeunrEHK6faoQWsn2oc7jQEb/2lMjtDXyPTlKts
         HmdaRAunY6FbLVwcHL/W2GWYIeAMsP1sC2fbiyu3CRyc3wImiJANJTIhmaX8CC+lIJiL
         xvqzpynHPUt6mR5Woquv9//SSHs31nDKwkVVE4SPW2fGYSPAU9IaWT2FOkNQLwYYCL6h
         n+mkgvoiMcHKjTPK+wJbbsMgCdXhdmoX0efhZr3orQEdGxf8dFGgHtGTXdVrGsYW5KPQ
         HtWMYXJ4CSHlAZ358TPDGSoPh1P0b4gFehISZcAekgFi/XCzzl7fG1yYDSq+1tu3q5J/
         iV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=+0w0WKBbwoy+XHZlM6lmViUu1mqZ/+HAGtiGqaTaIuI=;
        b=iW93dueMtvE3+DHn7qcdp767MsAG2zvQK6EG/lNsBUoYub+9muh3DFs5nZj0hYEquq
         KdcJBDdjAONv1bluo+6YwHfijc/lXtpTvPIrxFElVFbtEL6wGgaENEDtFdx7Q1HabEVI
         3Ts3ep3Nl/sP5Uk5Yi4iWQkrc2w+RF0UsJeQDakWCuZZ6qgLIoho0oA2ZD0x7mL/kAWn
         C1jMzJjy5CZP5dNQDZm+grmmRIaM2yAQFEE6IAZJZwLSaFMrySkEjfda+o0XZSRdAQ8r
         JuEKY61EckgMwlIaiU+Jp1kIB+m1BNx/anQ0WawsanEd6eegKhJ2koAgN5XIb0VHYg6z
         4hLQ==
X-Gm-Message-State: APjAAAXgjGbmQU91Mnh5nye6E9Mw34URJtxsA9PKsCE34mWN8RcDwqXr
        osZmXYXBjfP2Ixz+Di1AJS3xA0F5uUAuRy6C/1Q=
X-Google-Smtp-Source: APXvYqxMwm+o6kpQ7E3FtGM/j1tZv6HR59Iykl/uIbyim1ncw2zYMANSJKLNwGvJJtRTCF+vcbp9SEeyDdHxsRwstno=
X-Received: by 2002:a5e:8e4c:: with SMTP id r12mr4835156ioo.119.1579649998005;
 Tue, 21 Jan 2020 15:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20200121200011.32296-1-kdasu.kdev@gmail.com> <20200121200011.32296-2-kdasu.kdev@gmail.com>
In-Reply-To: <20200121200011.32296-2-kdasu.kdev@gmail.com>
From:   Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Tue, 21 Jan 2020 18:39:46 -0500
Message-ID: <CAC=U0a3DN748sO+Ea51ak=KZG3xQPtNr=4fiWNDLs8PoPMSqXQ@mail.gmail.com>
Subject: [PATCH V2 2/3] arch: mips: brcm: Add 7425 flash-edu support
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
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

diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi
b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 410e61ebaf9e..aa0b2d39c902 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -403,8 +403,8 @@
                        compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
                        #address-cells = <1>;
                        #size-cells = <0>;
-                       reg-names = "nand";
-                       reg = <0x41b800 0x400>;
+                       reg-names = "nand", "flash-edu";
+                       reg = <0x41b800 0x400>, <0x41bc00 0x24>;
                        interrupt-parent = <&hif_l2_intc>;
                        interrupts = <24>;
                        status = "disabled";
--
2.17.1
