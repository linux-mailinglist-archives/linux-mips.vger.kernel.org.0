Return-Path: <linux-mips+bounces-3742-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98090F16C
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 16:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02742281C83
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 14:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AA6446AB;
	Wed, 19 Jun 2024 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DeO5eaTa"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C141D54A;
	Wed, 19 Jun 2024 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718809061; cv=none; b=d5K2SYUQ03HLWb6Y45zDrppCLimVGm2xOa7GjroGRrxrLpQObx0YVQZQLVrN5ve0L5hW9WaHTjHlDKf0rrszFe3259mPzALWeDj98W7mMjrt0EwM1NK2jXxEqFPn1t6/4Uta5rYf8+j+RZdM7gN+1lAb+DRpj61dCdmF5GcxSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718809061; c=relaxed/simple;
	bh=iZbm6EdAbJzUiVO4UtD9tGvM+sfX52gde6b5TpOe++k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZsG3j2+QwsNmkSZjEAdKCrV5upaLYZFkD2CBfwIV5Sw39LNDxTDFP2PrAZ1UJa3pt/3FQSkAEiNrnBYPWX4h0TPUwmIXuRdI/0Md20OCPKUGRUvkjIubrDZTUXxfSRuuh2WtHVYRNQnsmA8ZvOn8WoPw9waI5TironcDxitnYQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DeO5eaTa; arc=none smtp.client-ip=192.19.144.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AB7DFC0000EC;
	Wed, 19 Jun 2024 07:48:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AB7DFC0000EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1718808507;
	bh=iZbm6EdAbJzUiVO4UtD9tGvM+sfX52gde6b5TpOe++k=;
	h=From:To:Cc:Subject:Date:From;
	b=DeO5eaTaP/IqjtEVHu6D/Jn3oveijOQfNlLsWIqsuRN7nhkd+h4aDCZsf2sGzM1H2
	 pVGZLgtd9GzaFxTZAcz7T/41Vmb/74cfkIo/V5WJlS9vq6ammieC/s3dkmJCzvM+xW
	 sbL5fTI1UjsKRzRFie8rG4TsDSG/TmCzABQjXZ3M=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 763BA18041CAC4;
	Wed, 19 Jun 2024 07:48:25 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: stable@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH stable 6.1] MIPS: dts: bcm63268: Add missing properties to the TWD node
Date: Wed, 19 Jun 2024 07:48:25 -0700
Message-Id: <20240619144825.4052589-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

commit 24b333a866a10d4be47b9968b9c05a3e9f326ff5 upstream

We currently have a DTC warning with the current DTS due to the lack of
a suitable #address-cells and #size-cells property:

  DTC     arch/mips/boot/dts/brcm/bcm63268-comtrend-vr-3032u.dtb
arch/mips/boot/dts/brcm/bcm63268.dtsi:115.5-22: Warning (reg_format): /ubus/timer-mfd@10000080/timer@0:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
arch/mips/boot/dts/brcm/bcm63268.dtsi:120.5-22: Warning (reg_format): /ubus/timer-mfd@10000080/watchdog@1c:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
arch/mips/boot/dts/brcm/bcm63268.dtsi:111.4-35: Warning (ranges_format): /ubus/timer-mfd@10000080:ranges: "ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)

Fixes: d3db4b96ab7f ("mips: dts: bcm63268: add TWD block timer")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
The Fixes tag was partially incorrect which is why this change should
have been applied to the 6.1 stable tree, but it was not.

 arch/mips/boot/dts/brcm/bcm63268.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 8926417a8fbc..87c75faf4a3b 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -109,6 +109,8 @@ timer-mfd@10000080 {
 			compatible = "brcm,bcm7038-twd", "simple-mfd", "syscon";
 			reg = <0x10000080 0x30>;
 			ranges = <0x0 0x10000080 0x30>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
 			wdt: watchdog@1c {
 				compatible = "brcm,bcm7038-wdt";
-- 
2.34.1


