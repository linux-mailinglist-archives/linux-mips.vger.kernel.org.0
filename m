Return-Path: <linux-mips+bounces-3262-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D858C4745
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 20:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 484BB1F22DDC
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 18:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B554656;
	Mon, 13 May 2024 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="g/pB59Bd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P5vUuSbR"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212145014;
	Mon, 13 May 2024 18:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715626697; cv=none; b=ZWICaV2iB9hbV9h4E04qXy9ekOvjWNXSyZX3N4ofeNdmBe8D6T37FaG6rGgSBOdbhJ+0JqSBEZOP6oHU//OAUG0L8ZPdsuAtQJj59OYr7yn8X5/Zr302UR6L1r+a/BcKN/TDUpF5CxHFuerJ7O/kKV+/mWcw9idvnNWSjcXP5QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715626697; c=relaxed/simple;
	bh=qu2Ea7/LSXXvVzXlIpzjmu8Cb8NhYM1NABuWG3jCFmk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CLFZVdyUu8CRaf3XhyPHy59p2AE3FoM28k6R53T3qnJetXah5eA5Iz23j5xESerFpRvI3C+KTarn/WPVlkM2q453K5paaJH+ecFX6zQC1hsmIzcmcq/KIOK13NaAS15VYxy5gNsmWjfAqtLOSOse3vKoBtka816kRlquAawphzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=g/pB59Bd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P5vUuSbR; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4D7A3114014E;
	Mon, 13 May 2024 14:58:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 13 May 2024 14:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1715626695; x=1715713095; bh=eu
	By1XyEq9PKhM9EjMcv/PS7V33O30zg/FBOb0ToDZI=; b=g/pB59BdsYhioMfZLF
	SoDHA8O3PF/w5Ajte9JNZwgQZOocA7uBhU1QBdf82t75EEhpGDReugzc++LMUgoZ
	sdOZ/PvkNKfhDZm7L1/aWfvAfDEt8jgomm+0fPYsV8Nmuir+Uihlv1a89gLFxbqy
	ZgbQ7ajRlH7aY8OvSDoIrmAyoMO+n4igBcl72o+DTPNvnNXEbzyK6NSln1xBUd/z
	BqQLCmn+OGZVQfQG3VfS5Ts0V53fGoVPgUomXw2tNLsIiFF1Ng4nnfOqnuRSuyEH
	JUInCmPwG6WGFoEQGA+zjlyaaxEkWB0OYPuyZks1r5x61ueU9116vGkNk+5dH2oJ
	tMdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715626695; x=1715713095; bh=euBy1XyEq9PKh
	M9EjMcv/PS7V33O30zg/FBOb0ToDZI=; b=P5vUuSbRV1xrETq8myE/LnAe7/KQy
	122nnKQIyad2lJ/naEFf2srDzyDuh98BU5tE0rFqJHcBObWy/F1CyOKtEi5U7a7I
	dfd4DrpdHRycN757hmbTlc92anHSDZ9Tr+a6KfC5Lwec8P8J6/XzKfwikO30csOX
	EVbwda4VlG90I5CEhSoFKwzKwMzO+ML995aCbndFGAxpaRwdODr3M0pKI9zoTKXu
	e+Cf+GRPq8hy0Gzv5TRPIOlX0Uqxir5e3rSFlr1tJoZLpiSk9YeWKvZ7nLfScJ+Z
	tipkxl9tRbpvDEXhliQXLMscTxdOA8ReRGh4UJA9SR/UWcRtuCWzOGZnA==
X-ME-Sender: <xms:xmJCZmroyt6Vf5_QHrEG5M8JKic0if_cteIBSQ76ZaQT5nG52zY7Fg>
    <xme:xmJCZkpN4p7DxQCPUk3Y04vcOy8K42CLQlIXfE_gkHG6Y9vaJVAOzSUe1KIO4Vx1Q
    8IqrDvnZ4isKgsdDDY>
X-ME-Received: <xmr:xmJCZrO8Y1s10HcMboeA2VGasUGIGuCNSqaKdf4wdSbvRFExF0wZNY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeggedguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedufffffffhueehvefhgfelveekueegteefgeeiieejheefkeeh
    keevudevieegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:x2JCZl6W5_jkFGLSWhelb-ha7-JJYj1BjQwAxFDg8LmsS0-n2qDRAQ>
    <xmx:x2JCZl4-n2oHDvbDp-66PoBgwsfSveqpAK2PSZp7corV_e5fsEbS_g>
    <xmx:x2JCZlieZPtoR9Gw6yH6jWa7Fj2lk6f3Spy8PvJUKdQJwBjVOGMPrw>
    <xmx:x2JCZv4M2CuDsNwwLXvIdlELQSAtTKXqgMBJlMGprRTqB7r4AepNFA>
    <xmx:x2JCZiwk6mO4U5ZGxlvuuDpFx2NYe-lUTLOi4eqDjmhnBKyu7NbH6fYr>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 May 2024 14:58:13 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] MIPS: Boston: Fix syscon devicetree binding and node
Date: Mon, 13 May 2024 19:58:13 +0100
Message-Id: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMViQmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU0Nj3aT84pL8PN3iyuJkIGWRamxommppkmhhaaIE1FNQlJqWWQE2Lzq
 2thYAhROtNl8AAAA=
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=529;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=qu2Ea7/LSXXvVzXlIpzjmu8Cb8NhYM1NABuWG3jCFmk=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjSnpONXmDd/1BS0MSn55Xk436SnruDsXLWriwxb7Te8O
 /f+0DTTjlIWBjEOBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZhIXjAjw7+dcZef32gsKz0V
 lSx1453xv8xzv8S4ZrH2e9QysLJMnMLwz3jfku+L7ZS/cGl3lOgz/uZji2KZ1rH8HJOjsOk+iXX
 uXAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Jiaxun Yang (2):
      dt-bindings: mfd: syscon: Add img,boston-platform-regs
      MIPS: dts: Boston: Add simple-mfd compatible

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 arch/mips/boot/dts/img/boston.dts                 | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 6ba6c795dc73c22ce2c86006f17c4aa802db2a60
change-id: 20240513-boston-syscon-8e315e94a894

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


