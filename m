Return-Path: <linux-mips+bounces-3612-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C8905024
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 12:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC75F281EE9
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 10:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B69C16F82F;
	Wed, 12 Jun 2024 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="wit5tTrb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MxhKOXBv"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DFB16F28F;
	Wed, 12 Jun 2024 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186946; cv=none; b=d0n+8htd901KM6rDK9JKwM6dcg6pSoK0JgKsiB0TgGNLOcbPRFo0SRhm5/IxkRR6HyrpYzuIGp7X0VyQPWNiVhPYVGcLxhOtHljyIXGWien25L0+xKMi9CtI9fP7PGBgATpA6dZcj1f+jIAE1QyR9bT1/ZZXOdRCdKP84/PgDJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186946; c=relaxed/simple;
	bh=sbSJhTfOx3HavJNSfDwxJoXfvXqGiYes3a+DaHL/Wb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0cPnTuftdXavL9rk3kK1hFn0ALw9pz5qbAkjBrSCkf6UHNfYfnA4TDPlIMeX1WtH4aYcKc7Dl50r1hwtRdBP0l/4Dv7OcYlKXVAQmQReO6VwDZh0EPDsQD+spQVDRKGQf7i5Wzxh1wZnHyfst7qjbcZwUiAclGHN5/Jf4vemms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=wit5tTrb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MxhKOXBv; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 253B611401E4;
	Wed, 12 Jun 2024 06:09:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 12 Jun 2024 06:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718186944;
	 x=1718273344; bh=2rMJk1r/7uFHKj3CPy7JrwndMSjqHI/ymmuhV8Pc4DQ=; b=
	wit5tTrbLGCK6x8y2xEgfCeE9cNai0TFqAb7uGM95jBYIRSl4EE2zSd6cyS4KdId
	RJVjwtHlEMzcDEYgFjJbRhlAzPgKiIz1QIPHc4wGxHQW58nAqbiO/9Ixchglu25R
	3Ukd+48MhOMWsXomaH9AJwtPGC5UGs9qOJNUkVm3owcyijl7QVwWBh8JimvXKUro
	zkXaiC2HuBNDjqjWGAlCShFdyQmWxNsNeVzUL9Fx6AzCXnjpLYE1KzaviiASOyVk
	HcrcENd0CPJu8InnsBgAvDD1bBxcKJem76el+KK2UaDkKEfjmog6sfeFl3UTCBmf
	UyM8GIl819vBFc7fzFhfVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718186944; x=
	1718273344; bh=2rMJk1r/7uFHKj3CPy7JrwndMSjqHI/ymmuhV8Pc4DQ=; b=M
	xhKOXBvjprUshOWp2gKZKvqDvVFQVkoP80bZr+U9nqNj0Eyb4NXkqA5fWiFPiegG
	B2WEGBNLqzxLtOBEuE7KTU2yKwejzyNXDfvOT/TCjYijVYBfBrcZ3BbZpTBOUbdr
	EmCSWcqbFn8Jq3aExY+yl8domKhqcBrY4btXmMUm3ohjfLvN1kT01NNrV4X3mc6u
	kI21I+REqkIlSKxnm7hzUdviM4u3d+f3O5WK62+Z//U5tDqEvb2x+6HftMLUmhc1
	sImrqJK9rn8of+gND4iZBayWKh1xgWDwu8dW0AIRI2Snj8eSYqNt2v9h+3JQcQ/v
	CKnjVcEQu49bbXCfzQrww==
X-ME-Sender: <xms:v3NpZmmdL6ZNiIM6oUmPs0bJjaTdkkBg4ir2ha2g-QzeBXeXISkyuQ>
    <xme:v3NpZt13dPzzZW8R8y0uQ6KwM-Jw6qMqu-_hVvovdPQ2Lr7tdTvBvY1iyTJJMjiE0
    oL55yadn_P4FVPScKo>
X-ME-Received: <xmr:v3NpZkrvYz5lDkfbVsDxGp0kOHAhP28pqZoQBSxjuApFYVSorR2CBss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptdffudefteeijeeljedtvdekteduvedtkeetheefkeetkedu
    tdetkefhfeeuffdvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:v3NpZqnKpGKXv6NHcJ5HQONYz57jNOs6OmYptuzI0fEtBLwFfL_sGA>
    <xmx:wHNpZk3kTaxaBVDa8HpvP6_nDmc4_IIFby-_XsaDrUJB0cIUBgUQsA>
    <xmx:wHNpZhv_KRbuVUxs0jA2DQGWxbHKnyGOr2mMLE6X_mMdLpag8shr5w>
    <xmx:wHNpZgVylTQRPXNDbTh67prKD0Mfmhn7qsr6PRmPTKY9Gd5GJsZeYg>
    <xmx:wHNpZtsj2j6vwppV6OjoHfstywcvLD6XRWL-wV4LsSFgO7bg6RiJo_mT>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 06:09:02 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 11:08:57 +0100
Subject: [PATCH v2 5/6] dt-bindings: mips: Document mti,mips-cm
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-cm_probe-v2-5-a5b55440563c@flygoat.com>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
To: Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=sbSJhTfOx3HavJNSfDwxJoXfvXqGiYes3a+DaHL/Wb8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTM4m1aW57M/ajW/juq+GLlnrfNgQvS3rOKNWSuLpVO2
 nN78RLmjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZiIejTD//CXIranRXoUPe/c
 DZy8blPZX23Fc7+rdz5buPPiC0dp1xRGhnlXO0JYFe/fXcfNVSewQU7xk3vR1HWNbS+nTPJruVs
 iwQAA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Add devicetree binding documentation for MIPS Coherence Manager.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
 - Better wording for register desc
 - cm -> coherency-manager
 - schema matches compatible
---
 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
new file mode 100644
index 000000000000..9f500804737d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
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
+    description:
+      Base address and size of an unoccupied region in system's MMIO address
+      space, which will be used to map the MIPS CM global control registers
+      block. It is conventionally decided by the system integrator.
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
+    coherency-manager@1fbf8000 {
+      compatible = "mti,mips-cm";
+      reg = <0x1bde8000 0x8000>;
+    };
+...

-- 
2.43.0


