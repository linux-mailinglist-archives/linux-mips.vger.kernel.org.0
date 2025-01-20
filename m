Return-Path: <linux-mips+bounces-7544-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7310A1694C
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 903113AA3EA
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819A71B6D1E;
	Mon, 20 Jan 2025 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYjcGIWA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24681B423E;
	Mon, 20 Jan 2025 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364921; cv=none; b=NlcYX1iskx3mAK5k8yDuelxtcAVSMqdG2YN9ZnO5V0ja76iTxDIn2Fm/5EMMwUow0SWYKl96dfKUwT2ym+OMeNrvrnudgbp4TkPuE7Lba1Oh0AkBDH92NS6FPKatCIZtX/5pt474nCf7KdgTnF74UgzuDAD4U/KNBGvbeezISxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364921; c=relaxed/simple;
	bh=j1bB0LohY6Q4ZWswaHmpsEMNIOAEiiDhiYORQ5U0qBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fz1UXR4HqLHK4H/n9stDWsaZMgw8hf8oBiVt/cAYVMmCRBrkZuoxaKE07WTe+XU5yJMagDiLPpPUUs2iItezQcm0E3Y9COmgXZ+SEfKFbmeN3/oZqEQI6hRyPm+CERIb107cxUJgAAm8VWemtUShIlHZVSCydMQHB/+EIEseyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYjcGIWA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso26375955e9.1;
        Mon, 20 Jan 2025 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364917; x=1737969717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MK30M1/4LGOcL0ZrPE9gPryc2MA/RdOwp1GOptQnIo=;
        b=IYjcGIWA2WuXo6hRNzqRbFVuknb7QsW+Q5lW5XB/vb8kB/xGz/UgoPU3aAxJsiRxha
         PljYZtKXSjW8qgN+MD1pFAR9EaTKaUitadyVqTEJ9h8FqAOv7RnF2uZU1yB1upR2kGK7
         Xs3DeXoEW0bHcWps5Hu7xM7Zot4C/jNgl97KY+MXrre3h/tlCuCMPcF1SnNtuuXhjMK/
         uHjy4CnrmYm9l84MbigifGQihl8HMb+koSvOWYB6jw0tzZG/rqHXoZo/amK9SqnlJy14
         jTw0+03PXzFJF89CI1EEYmeku/+tLgqm8uMIOrHGXgMVNpcRTie6nXflzDTHo9Hpdzix
         vMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364917; x=1737969717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MK30M1/4LGOcL0ZrPE9gPryc2MA/RdOwp1GOptQnIo=;
        b=hGil4vKOD5nrF/VHEtmfkLaTujg0awtinCjC73e0N/ex/wybnskpb9XbjodnT4bB4J
         Sj9WFmgpBrcwS5dJlsaW7RTMYheUWmfrpLE6V0W7SrcciBrKkka07PtpAcB5nDs1YGdv
         5QF3PfVwXeSlM9QCDvFTw2cTPl+DfJtxn+xRS7Ov+drawK3cuR1IJsxcjRIRf3xvwKzj
         D/1mA/KGGiUirBoxZBE7tDUZazzsmIaPv+hLSYXP2DLW7fl4m5pCzoodT46FDP7a0q1l
         m4oJ5oHxFjW9CfRKR3M4STAFO4iadDhYYKCx+xYyuPU8It/DVS2Gtzo4GIUTZ4Xzo2jU
         9xuA==
X-Forwarded-Encrypted: i=1; AJvYcCUI8ISmj7Zqbe6q9nVIbXeFIcvG/qmYoZlaVJkNQMTT6y7Wn0hlZDKMMss5zjdu2sE02SOEhqxMeIpd@vger.kernel.org, AJvYcCVJEn3v3JgrpxD8wIJyG6lz88OzTua5QHiuVCgapEp2NbGhANnO6cOsxezMfXrJ8n948nunRmUiESdXPPg2@vger.kernel.org, AJvYcCXiY7/MRPojQ15lBkcbVerwuj7ti3ZDRIq8C8ahvQUs8nva1W14pUYEjLBpht+mIAAjMD2LuDE9Hdp5dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrX0BNhBnAi1A7hpLMYtF+T7L2wAKcZgFxVfTVNux19gm5zt8
	MfbCWjKIPJ7QjsQrGkkMiqlMutxueb5obwURDFYLBz+Jym18CU8HVJK+AA==
X-Gm-Gg: ASbGncvQV7n68UzPKbaCZLN7iR32VfDfMzfCJXlH2mJ6c090TUaHrpZ8C+cNH4JCTVL
	V/Qvhc3EtBZtX6IGCjVNU3OoRTrZKqYNlaiRWkOkb9TrDb484J/f1IrQqiSaFEpPQL+Yt5sU+2K
	3idnuxqS6CZALkQb6neMlEZSTYEuCswBS1JvERxCBB2Y6LHVKfutw+RM/I4SbmK28ks2qqfAj4s
	40Tk7VX1UVheMRcyo6xF3bJdhcvxNaDbaLe0v60EfYqpfJLwJAVlhuCjT+UEHTr7wSbq7y1q3UO
	DWYLNZquAnA6u6R1IoeioNID0osBVzrjL4ZAenDGzRJ5yf7zYV0SsxMoqJ71
X-Google-Smtp-Source: AGHT+IGCrq/0Abvy7xsVDyj14gE/VqJh0WqMtO/RzLZDTzW09lbb9I+ejRB5GAx3SmfPOx0BPhqP1Q==
X-Received: by 2002:a05:600c:5cc:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-437c6af202cmr174066615e9.4.1737364917418;
        Mon, 20 Jan 2025 01:21:57 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1ec39a3sm80680175e9.16.2025.01.20.01.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:21:56 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] mips: dts: ralink: rt3883: update system controller node and its consumers
Date: Mon, 20 Jan 2025 10:21:44 +0100
Message-Id: <20250120092146.471951-5-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current RT3883 device tree file system controller node is wrong since it is
not matching bindings. Hence, update it to match current bindings updating
it also to use new introduced clock constants.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/rt3883.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/rt3883.dtsi b/arch/mips/boot/dts/ralink/rt3883.dtsi
index 61132cf157e5..11d111a06037 100644
--- a/arch/mips/boot/dts/ralink/rt3883.dtsi
+++ b/arch/mips/boot/dts/ralink/rt3883.dtsi
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -25,9 +27,11 @@ palmbus@10000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		sysc@0 {
-			compatible = "ralink,rt3883-sysc", "ralink,rt3050-sysc";
+		sysc: syscon@0 {
+			compatible = "ralink,rt3883-sysc", "syscon";
 			reg = <0x0 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		intc: intc@200 {
@@ -50,6 +54,8 @@ uartlite@c00 {
 			compatible = "ralink,rt3883-uart", "ralink,rt2880-uart", "ns16550a";
 			reg = <0xc00 0x100>;
 
+			clocks = <&sysc RT3883_CLK_UARTLITE>;
+
 			interrupt-parent = <&intc>;
 			interrupts = <12>;
 
-- 
2.25.1


