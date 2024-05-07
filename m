Return-Path: <linux-mips+bounces-3121-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4FD8BDDA8
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 11:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B5A41F23D18
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 09:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AF614E2EF;
	Tue,  7 May 2024 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="DgZ6p/M+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YWmuROvH"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C246B14E2C0;
	Tue,  7 May 2024 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715072520; cv=none; b=mEq5SylLTHbJGAop7Zn9XttR3jrmJH2UE+9ZvzoXAlWkFeDjN5JMCL46tFP+4z7zlbnnrBJc39W6SszHV6/7NdDbXDEGpVsy3uqq406YZNm/yXJMoitp0Rd4VUxDeYyO5r4AaT4+egnFPI0ZDpAV274vT/Pzy21+M9IqWdFNMs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715072520; c=relaxed/simple;
	bh=BYd0z4w2P6361HK8XCnk63d1hg9xPM/ibgUD+fCXqh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuFpO4bRDKzr6QfPy+66vIjsnKKlG735X1Dj8nV1g9m//Fh42ubbLpoDk5s1nL3S6HQeUEEk+h/xR9jhHYhnXOIFohPfXmmmO0xoHZJwlZyAo9Te6nHJFMEuZAaH3GOjdIIOk74cba+sieV50hGdIvsitKN6I1MwAI8BBRBmdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=DgZ6p/M+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YWmuROvH; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id CC6B81380283;
	Tue,  7 May 2024 05:01:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 07 May 2024 05:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715072517;
	 x=1715158917; bh=CzmJQDh0gAqcg7KaggNSSVod9790TdM5EUlS+8Cc680=; b=
	DgZ6p/M+Q/ENmeI8CLR1Xgoc9/tgAB7WIk4YlezaigHXPQDiW3YcuOfkgMQbfn9X
	PNQKJv/nLHgrpLm2FaknfBQ0DBUgdxStUO3BnFVF/dpoEBiOiZtmzEXR1UHfBeDK
	AZzF0Lz8k2Vbkm4hf3Qu4r8A1diKzt3US1zQQuUohMrKQPdoeLCnFHdo6jNioIxC
	+r7aM7FSbmHn9DrRJZQpzbYn+ZfNXwcSSlbEQQxkX6rnkAAokkwV0K8JYTXrO8eu
	LOkAw2X7PbKoi6zOi62my/EdmwrJO3FHWYYcEwpkHxFwMfUTh4LckgfZSFmfjgDm
	1EdsOaL9cbc3oO4zZ/zkrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715072517; x=
	1715158917; bh=CzmJQDh0gAqcg7KaggNSSVod9790TdM5EUlS+8Cc680=; b=Y
	WmuROvHhwLmPjrWxqDpaAfbYxeR390mq07Yvg9WjJ8kiy3XVPrrA2s2s9HaAZFfJ
	8KJgX+7mJhgdWbn8auhHfrR2lLilsdHMwou8wlZ2QbFulLI8Y3NknpH2V5RRZ0kI
	6stUJDUpdNSiiax6T98/tbD0NpUJ8KH74jENBrxDKo3ZYc6MBscKd8E88j+Bxu3T
	qJHsfNkBd5OaxxrSlilVXIVd9uvF4I0w3SBhQXgHV/0Fy/BH7gTE7Dpc13VCou9q
	hA1xs6/PC1O50fuauZyoO5o8wFjmvtVFkuS1ZCGVYh6gf+w60RgjIYjaoqjgzyuM
	8FMYUp1OCVnFN3uWA8ztw==
X-ME-Sender: <xms:Be45Zu-jIKyLHWZlOAVc76Yg2-orGbSx-tE45CEektRsIDVvyrNkbQ>
    <xme:Be45ZuuieEcKXCA8yCZwVIprOKbB8aO-iGhxjlyQl7uNQm5IDzG36QUgl4pVw2Sxm
    3AiCM99--JdhvhowyY>
X-ME-Received: <xmr:Be45ZkDYwMK-mMLhj2V-Zmb7l130VKC0ebh6YphuJ06woy82iY3cHF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptdffudefteeijeeljedtvdekteduvedtkeetheefkeetkedu
    tdetkefhfeeuffdvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Be45Zmf_SE4WIaF1oC60zr7SHmaBBwOnbtZ0Bqcao4AHyq9Nk4hoOQ>
    <xmx:Be45ZjMNw-uqlV62TuN-TJdeCSxC6hQFjOE5F9Xbr9NYEIsQoqgKkQ>
    <xmx:Be45ZgkN04VVcuHvTnImyeEKU1N7-6dg1Tb3Ay9o2IiV4mMLsbO39A>
    <xmx:Be45Zls0fN1Xw_bX5pTTrH85BcaJ3D_5uiHSn5GTdnzbkssSAH8NWQ>
    <xmx:Be45ZurHSOqU1uNqHjAK7z5zHvJNWokd1m1TNNK019KQ5Dr75xcyL5Fo>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 May 2024 05:01:56 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 07 May 2024 10:01:52 +0100
Subject: [PATCH 4/5] dt-bindings: mips: Document mti,mips-cm
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cm_probe-v1-4-11dbfd598f3c@flygoat.com>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
In-Reply-To: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=BYd0z4w2P6361HK8XCnk63d1hg9xPM/ibgUD+fCXqh8=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjTLt/9PvYjtyrwTlmXEtUWy6pZfacGiP7K5145m57GYf
 Zn1Xj2+o5SFQYyDQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACayN5/hr7Ddn+sOSYfLs/Tn
 drwN3ZHhcePgxa98vm/aYoqlZi8s4mZk+Pn4+vGD8t532K4nnmS7xTTXtn127JNSo91L5M/yCYk
 +YAYA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Add devicetree binding documentation for MIPS Coherence Manager.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../devicetree/bindings/mips/mips-cm.yaml          | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mips-cm.yaml b/Documentation/devicetree/bindings/mips/mips-cm.yaml
new file mode 100644
index 000000000000..b92b008d7758
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/mips-cm.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/mips-cm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS Coherence Manager
+
+description: |
+  Defines a location of the MIPS Coherence Manager registers.
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+properties:
+  compatible:
+    const: mti,mips-cm
+
+  reg:
+    description: |
+      Base address and size of an unoccupied memory region, which will be
+      used to map the MIPS CM registers block.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    cm@1fbf8000 {
+      compatible = "mti,mips-cm";
+      reg = <0x1bde8000 0x8000>;
+    };
+...

-- 
2.34.1


