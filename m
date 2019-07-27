Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB5877AE7
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 19:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388078AbfG0Rxf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 13:53:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37314 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388033AbfG0Rxf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 13:53:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id f17so50100323wme.2;
        Sat, 27 Jul 2019 10:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QKAu7GlV1gahhyaDmr+Ho7U9G4uY9EaXZGkev7HG/1E=;
        b=brBStvua6Fmfm55UGtQv/sL/JDxzYpmpbfxh+CKCiDWzdorc3zdwFI/tWEUkKLQLAG
         qpMwfisdsrK6zki4Ex9y0/FxKpJ73t4EVzrores6z/zxHJSNTn4ZVABHrVRo4mQ1joEp
         3gae3mipn7hzKzjrCgwt1N3vde/wZ4IiGkEp77cuAOQ30frLQSPt/9XGXuCJQ1ZCwvdz
         o40Z97c4TNSPGnQ2nXeuiTK7yk748hQwoBU7VyV01bzTkHrvERC7T2EnDVCIzfmTOab/
         WogcpJC2h08bTmcpcxoW2ZP21vaLN1ncRO0u16dDwJPqBFlpjwm6/BVMzsiIwQ12P4H/
         OGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QKAu7GlV1gahhyaDmr+Ho7U9G4uY9EaXZGkev7HG/1E=;
        b=gbAY8l7bAzZB9oOWelWtq8jUJOX6S3N7N/aE3Ei0S5ymyD0xHfVKLxnu7maBVHy6l1
         33RjvhhGLhWugBoEsZPoqPN8bEsnmKkR+zaEUK39UP4poaLdAzacj3mysmyVcX2z/Uz1
         A3EeESGf1eDNmAcwdMDPRNwyqxDv4Vy1rTxg7JxybDUo5HbGcP1vq/7b8wlrAmyVISsP
         DR9iWLoAksl+MV29VSR3G5SLxRnRuaWpnxljFcPmGeIcfjaGW4w2OrQv9GePsu4HYKjo
         qs1ChzYDRSvDbmEaCKoyR7LU7ifoVDBs5rgdHrc56TMBba0H6R2Y5KmhyliB2mKAeuKI
         hWzg==
X-Gm-Message-State: APjAAAVI5LPEe4+5+H1c9tOBRleEgMiAGnKqUKzQcYySe9QYklpxmoyn
        Ytw1iK28zDhSQoiLnzfcL1rRHeZ7
X-Google-Smtp-Source: APXvYqw6azCUz1AfuXEx8MpZAlXbM8T7VoyNdAfa3fChaiZN6UyFYWYhEATpjo9KGCtGyT3zGcZW5Q==
X-Received: by 2002:a7b:c455:: with SMTP id l21mr92220053wmi.114.1564250012600;
        Sat, 27 Jul 2019 10:53:32 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id t1sm67705423wra.74.2019.07.27.10.53.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 10:53:32 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, hauke@hauke-m.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 4/5] MIPS: dts: lantiq: danube: mark the ebu0 node as interrupt-controller
Date:   Sat, 27 Jul 2019 19:53:14 +0200
Message-Id: <20190727175315.28834-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The EBU IP block provides one interrupt line for PCI_INTA. Mark the ebu0
node as interrupt-controller and pass the parent interrupt from ICU so
the PCI_INTA interrupt from EBU can be used.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/mips/boot/dts/lantiq/danube.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
index 510be63c8bdf..0208174b53c8 100644
--- a/arch/mips/boot/dts/lantiq/danube.dtsi
+++ b/arch/mips/boot/dts/lantiq/danube.dtsi
@@ -89,6 +89,9 @@
 		ebu0: ebu@e105300 {
 			compatible = "lantiq,ebu-xway";
 			reg = <0xe105300 0x100>;
+			interrupt-parent = <&icu0>;
+			interrupts = <30>;
+			#interrupt-cells = <2>;
 		};
 
 		pci0: pci@e105400 {
-- 
2.22.0

