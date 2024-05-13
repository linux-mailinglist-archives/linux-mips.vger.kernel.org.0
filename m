Return-Path: <linux-mips+bounces-3263-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B393A8C4748
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 20:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACAC285DFD
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 18:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5967757C8A;
	Mon, 13 May 2024 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="gSCzSbWi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bIVHrdJq"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD22F54BE7;
	Mon, 13 May 2024 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715626699; cv=none; b=oCrRd4c/u8jrQI3+Q8XherMZE/OB3TR21s5VRP+eib/UH7APxKQhLEQpBtEA00YspLtKpNEWMokis41tVgxh3NfnM9ChnO0/HRvnHXeFm92lPI4Zi6+OVf75id3o+n22Shjwxnri4zBSx0wPAj3gK9YkBI6zRhYNzEBlrQBevi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715626699; c=relaxed/simple;
	bh=t5eCBQ5M+n7brnGGMkhGl+ht9oOAYb6+C4AhuQKxXiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/8tFMtK7/8S/jRY+SkBCt2fcKhHih3SKmu6kAPBm/LXqnCuJ34l1rqeKZBdnj2I6UiD91CIk153FAo7cWqJhs1d/S4ZGN1UoQUg9Ben++KTU7agVwm1rsdTh0BwOUA5Vqh4468RKTbEzexQtOZ5lG66YNYFLkAcQs8phoat9dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=gSCzSbWi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bIVHrdJq; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id D76C51380282;
	Mon, 13 May 2024 14:58:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 13 May 2024 14:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715626696;
	 x=1715713096; bh=rnH2iga0qXVi0UpBbHDam/6Q6T1MPWwYJ+YNIiwXV6o=; b=
	gSCzSbWi0KUMOwc707C73s+iCtxcWB1AXtb5t4tPevHN0IZbXLmP8Kcu+qI0RGMP
	5XhwjXvDatJhRpLgFOIxU0A08pZskMBGNwPvHfODiO28DmH2SSlFip7tOkVrJq5R
	ieJ5QXZ7eDauwADF3poQF7XKPxZbBG2kv/ghHXn11jvsd5lwzlw0cuhXZla9aI6M
	qht23V9yaxcgvYUkLAGt3TdqALnAZ7v+mWzGP8WAKlDE6MBdh33gjoSMURksiYGZ
	Fn6cPdASWq28ouk7KehWGkqamEABQfWxm2eDHdVmdiXdNk+ABJM+ZMDqNukAKt8m
	WoHyuCTyvPfocljK2831GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715626696; x=
	1715713096; bh=rnH2iga0qXVi0UpBbHDam/6Q6T1MPWwYJ+YNIiwXV6o=; b=b
	IVHrdJqlZqTR06faCjfiwPXODnfiKwp/Sv+rshwk6MTOIghHDf1sqiDXJJ7tJko0
	M/nUVybBceHATTUDAC3tV3OB4RJoMQPSN9d/q9IF3zELYadVBAdqWEpdh30d9Kyp
	auTVWImFtvrold8MNVpJ/49sZORDWwtTujuzuO23ugygHT/9r6vCBYMGRhJc8yAy
	WouzcCPBSmnw0ABEVf1jWsx9UEar454UClkf09d/ej25/nr0iNlz5mqC/rmlgRT0
	LntOfzN69lbJLDvecynYuaVZhoDfXmlZi+gfjytdDUioZ4cY5vQaAvQ00Vcm/vmO
	kGN3bVUblKLURmJmq+CwQ==
X-ME-Sender: <xms:yGJCZmUN2fyc2vblQs3pcYyRe0njpab8X_Jf2WkQPglOqID_TRG0Cw>
    <xme:yGJCZimOheHwBdW4Boxe4YgzwkjfYS9jRqPOEmi7QBrZ5PMW7adT35N1QJevNul9b
    TV3ouAqGrK7jTnxWIk>
X-ME-Received: <xmr:yGJCZqa1wpYAJ8qXJu7MxHwRp5zqSNI4I7eSiZ807N5fIif3H1b0Wu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeggedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefh
    ueevgeffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:yGJCZtXnBc7KH9U5UgUuv6p0ZaAW9CE9Ul2o_WW4j7ycdzwViE9Z5A>
    <xmx:yGJCZgnYbLHn7xNEyhZXVxGLzHvGHbVv4YW1lwYasFnRGTN2zr07hw>
    <xmx:yGJCZieuosygieEIKnNs5ksX3GiAYyD4qcFSFgFxhYRXH7jXemdWEg>
    <xmx:yGJCZiHCTBpZg3zV2b1ckiRVAbcOlo8646e0DnpdepaAWT-fJTR2Jg>
    <xmx:yGJCZpd-zbp1sK8WD48v3022pp1Urs2KVRabiwNJ2oH4UaQYbqJZmya0>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 May 2024 14:58:15 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Mon, 13 May 2024 19:58:14 +0100
Subject: [PATCH 1/2] dt-bindings: mfd: syscon: Add img,boston-platform-regs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-boston-syscon-v1-1-93ff557d3548@flygoat.com>
References: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
In-Reply-To: <20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=894;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=t5eCBQ5M+n7brnGGMkhGl+ht9oOAYb6+C4AhuQKxXiI=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhjSnpOParWmPZjt6cOvv2DthYtG5GUxMa5LbY8TlHuW6C
 LtKNbl3lLIwiHEwyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwESi5zH8dxQ69r7A/vXO3y6f
 exotXvbkp64SEt4d/O7qLxHvlcfXbmVkeHFmG1tU6Xq+Gf/Kdlb/kbgyc6uZTPH8s9ymFozeb3I
 mcAEA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This compatible has been used in arch/mips/boot/dts/img/boston.dts
for a while but never documented properly.

Add it to simple syscon binding.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 7ed12a938baa..034765e6a37b 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -57,6 +57,7 @@ properties:
               - hisilicon,pcie-sas-subctrl
               - hisilicon,peri-subctrl
               - hpe,gxp-sysreg
+              - img,boston-platform-regs
               - intel,lgm-syscon
               - loongson,ls1b-syscon
               - loongson,ls1c-syscon

-- 
2.34.1


