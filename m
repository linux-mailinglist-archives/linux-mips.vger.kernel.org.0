Return-Path: <linux-mips+bounces-9686-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87815AFE6EC
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 13:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 866E116C32B
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 11:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364B028DB61;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFsrT6hT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE0F28CF6C;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059248; cv=none; b=hGpOGOw72Sa8UDgezq3zw3WY5uYsCdApXd1Lp8GUxj2wj5IOZCPeTJzFMRMK+LKHCbrpY3sFlrLT8xWayVQlWKmDyjdZjrp3Vcu7WbDCr6GflHwPi+RjmrLs7zwcLEWIRBq0+LWNm6NTj3dmuD5ktcvfqUMUcfb6lHJpM0iKwHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059248; c=relaxed/simple;
	bh=sw8LilsBeWM2uoxpUyNOa0qVdBOQkWNfCZs3AbfzpLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfPrHXlqy6+ZdTTRMKJWxToJe1ilARn7td9fu4QeO+tfH1CoQT3S5vbrtxhE/SboJYhZnf7mj5fpFHbT7KhI2/eounCOpjsYNY4Uo9RrVesKUwX9IJ+GMpz0NE/tlT920ON+AT2pMJxzP64zUwKxv7Cp/L1uPHFKP4YHDLq3gWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFsrT6hT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6893C4CEF5;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059247;
	bh=sw8LilsBeWM2uoxpUyNOa0qVdBOQkWNfCZs3AbfzpLw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TFsrT6hT7HL3Z96UPLX/koRk/Yv2Ynrh1oAW6WP6qWNMmun4XKT8Tin02PLDmCDKv
	 /iX97p+ZYRhlObluoiWJ/iuVWNRyysDv/0cvmkIpbiD/ciM11ft77URXZQpj4yMA0a
	 jRvJKq7Q16iSs9Zee3u7DHOjD/DQHoSvSZbIlyJux3fqTTB3AAM3OBoc6wl+bgC9+O
	 TsdLHcESZUCOtFoIIfMbaa5DsRyaQLHzMYG9zRzMVDoOtQxDMEKU59EK0wjkLL1Tx2
	 Md8qgTVpmPOsRD9RzfcYIx4sVT8uPi5X/AFx5ISHxf6xdYfIxRHABBBXlexl6DuPjj
	 cnqOflMtvbvBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FD5C83F12;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Jul 2025 19:05:53 +0800
Subject: [PATCH v2 2/9] dt-bindings: mips: loongson: Add CQ-T300B board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-loongson1-arch-v2-2-bcff6e518c09@gmail.com>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
In-Reply-To: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059245; l=783;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=4UnKtWWBR/lKpvKPk/u0S68OurozbQkpD8iTBCm47UM=;
 b=0pK1mnfNtYwyiRNlPdI32qFp3B/GCl0CfXWiOwNNBujCg0mBx/EkdOymfczQuooGj3BdtCMYS
 9VSlPCMTXYkA67DBa7so5SQscm/QjiIH4yuulnZgP3qK2emqh8pvaki
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Document loongson,cq-t300b, a board based on Loongson-1C.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 Documentation/devicetree/bindings/mips/loongson/devices.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
index 8736eb9fe224..4532b774c0eb 100644
--- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -47,6 +47,7 @@ properties:
       - description: LS1C based boards
         items:
           - enum:
+              - loongson,cq-t300b
               - loongmasses,smartloong-1c
           - const: loongson,ls1c
 

-- 
2.43.0



