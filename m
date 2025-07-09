Return-Path: <linux-mips+bounces-9688-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EFBAFE6FF
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 13:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD1E3B30A5
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 11:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0A128DEFC;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpvmX43U"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF028D8E4;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059248; cv=none; b=kTk3I9jkZXnc8zGNknqCX62Uy4uY2Aow65G0ijgOo4HXXjXpYtyPnWm8cnQ4AwW++wTpUDE3mqkZFqJuPHd3fbbqoUGjaFuuyBv613CtUfOTbYqMpUSBpN1sCkMpj0aPtIURIelJY+8D5k2oYA48GjnpXAyQRip9bmWbkezhq90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059248; c=relaxed/simple;
	bh=uUaVvedXcDxjsky/eJaAAYzpAKJ/lSVaLsNmur6GzKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQ9G+j+ZTOtSh/OWf0gXj03JCg5rIQyXhISUtL41oMryUvneF7njtCoDqkjCZEstxE1TGDQBAnfsmk9m9yQUUX4KmXJ91VnwEYGSH/8bYhd49WmJASfPOg2WjS74xKtDnjXOZV1+5XcYACJHd3QDgy2zqze5pAS2vE8UAb//HnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpvmX43U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 968C7C4CEF4;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059247;
	bh=uUaVvedXcDxjsky/eJaAAYzpAKJ/lSVaLsNmur6GzKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PpvmX43Uc1mmi5zL5qL7IabtIDT73l4XREc71RqaG7TmUIesiv4TpZyNbskOH800J
	 lHpyL99QiUDnMxFjInIiOUwtIPK/OxA/2kvJf6I2v9MgkFvrl/MlheiUuJ/4n9Q2UI
	 vj/WuFtaTj7RI6ZcE8W8w9eO7FPVFa5gDqNgNACdLubMcQYHqdF0yZKjTfdKoK2pxY
	 fNZxVy5m+LYWQi7acQRB5L19/D5Y772+v/fAi+UxXaQA1idJiGibmiRT4095HzrFrA
	 FnWx9RufXpjIjn05RAfP181Uq8XDXo8wH6s+XgVfOO1lCvSEEqVA9o9F0eoceAFQaj
	 syze+LXifuTrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CCDC83F09;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Jul 2025 19:05:52 +0800
Subject: [PATCH v2 1/9] dt-bindings: mips: loongson: Add LS1B demo board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-loongson1-arch-v2-1-bcff6e518c09@gmail.com>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
In-Reply-To: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059245; l=780;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=a0j9vy3+NQEGotdsDECWGxL/pwdxlHQjjCW2egT2QVw=;
 b=Htc3m2YzyEGebXWNYyqRvTq034ikKfHNn+tSyoJTWaTKJbHjs7MsWIWPtbi2Lo29oisdIuMkt
 tpigow9am1nAMj6OkXPOzybf20e2+Lca5MoVEafVtnTjJ92hOWGKotQ
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Document loongson,ls1b-demo, a board based on Loongson-1B.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 Documentation/devicetree/bindings/mips/loongson/devices.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
index 099e40e1482d..8736eb9fe224 100644
--- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -40,6 +40,7 @@ properties:
       - description: LS1B based boards
         items:
           - enum:
+              - loongson,ls1b-demo
               - loongson,lsgz-1b-dev
           - const: loongson,ls1b
 

-- 
2.43.0



