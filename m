Return-Path: <linux-mips+bounces-3622-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 295839051D6
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B16A1C23858
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4F017CA1D;
	Wed, 12 Jun 2024 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="eVEegoCh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="je75aGZ8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301B017C206;
	Wed, 12 Jun 2024 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193421; cv=none; b=iUPnvouXQSxhMwokEvnfdDLEt+awORFSvJtFA/GWYQo8m1Unpidwx2BY1xxQLnT7Nb66RWsTz/o6M4X1Cj02NyhpD0D2DHM8DeRsX9SpN0FOqPgPepB59tcOSD/ZXs4R0ajIA/HG22iFxJ6TlFuFJB3scGd3/he3R95492GpjH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193421; c=relaxed/simple;
	bh=FqYFcbHWrq35Q20DJGtu08zhvYZISHWayM6Dshw2k94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/abcaj/jiy7hhHGuXD5PybXl98imC0qmstXV+aj0vnwDmVg9YDH87NtigjhEz50tskTP/NjdF68tFF4o99CC3nbWNGCYhCwaZZoKE+/OmpjlkydXjzG3iF12BMLsM+aB06tRB9Ze4gbSMCezOPYtZz83E/LQFKFUvnXWKvyz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=eVEegoCh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=je75aGZ8; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 489DC13801C8;
	Wed, 12 Jun 2024 07:56:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 12 Jun 2024 07:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193419;
	 x=1718279819; bh=dEkQj1pEyhcYOVI2l79QHwfWgHUy/egfEwBVNSft4zY=; b=
	eVEegoCh9hQ3BjI7EsYqCQmYZbFh923aoJxBynMKJ1FF84gJAN6Vn5MO1wKxAcZM
	6UFOnRw799gE0KBlf5XruDPHFq0oW7fOjuXD0kAKovP3XmYadYUT6o2yA241sSwR
	x4QaR5pB/uWCJTBeBMoiuATZLuMxklJgk8VPwGyIZY14dnpRRVO+5d+sSXrE1hFF
	M7KramaojSfb9nUM1xNECiP56DAdhtXpOkgBVXjfpZEGyiaez446/tiF2W/DZ2Av
	2hVYyut2I/VQcCagV3yYNsl3spbwgtN7kfB9+UpUZH7oGX8djeXCqVpJpoN7FmDA
	8ADFNDadT5/z/+dCbDURSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193419; x=
	1718279819; bh=dEkQj1pEyhcYOVI2l79QHwfWgHUy/egfEwBVNSft4zY=; b=j
	e75aGZ8g09uTzmtYolyYKG+vG4Xx6SVJuw2Twy+f3wmw7ZkYfsMJuuyNTAJuIzcK
	bKwxOPu9/04OOj+dQumSDQam2bNOZC7QXBc2j1nLbvJocv4IDpqjX/1WAbKbOkt1
	91SAr0/UR2vvWJqWCQORpNmumTCoJ7PRXi7KRzAeKMVZPdnF+HUW2z2i37aAwwRM
	H74TT5q3IFBwQAt52TcTczN2f5YNGB3x5rtEdGRqxkrvKCtH8LaA0EEJQjZzAqqd
	kIrh69YyQ31xJCxtgm2QeAK3vQ1AEYckP5ilr/D5U2yA3X8O8j1pxjrBNWuYWWDI
	kRUDw7pp7aLIgG0kSOvdQ==
X-ME-Sender: <xms:C41pZr578lEHSs-Er_rny-SN-Fd2kOirScvHW8A4lImNu3_3Ol70Iw>
    <xme:C41pZg6Aid7Ll5gCxICeketjH3oPzCXL9icuO29udYHKB9b6-cpfovjVYu_S2nEHe
    7rp5qRwC7e3sxnmm6c>
X-ME-Received: <xmr:C41pZidy4HE2meX_Cyzn-KDtxNnt6937Vw7c3Psxn04BFbLnuGtzk0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptdffudefteeijeeljedtvdekteduvedtkeetheefkeetkedu
    tdetkefhfeeuffdvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:C41pZsIQ93Whj9XUPBXmSXFLns4TXlzcTdWu5uXwQnHLLqjjOiuUWA>
    <xmx:C41pZvIyXB61Ve616igc6RCjsoUiv97wYLYemNMBr30jeOzM5ErRxQ>
    <xmx:C41pZly5BRerneg_CjXjIY97leSgZpygeacWkAcyYgj90TJrvIVfEg>
    <xmx:C41pZrIlZg0cx3RQzPkvIR7H5vidRzIKcAhEh8Ne-fcdNsjp0NTn3A>
    <xmx:C41pZsBl3dPCIP0mhdZaU0wNjli3NOs9mYtdqT1JdpgPdE-OSTKjHlWy>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:57 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:27 +0100
Subject: [PATCH v2 8/8] dt-bindings: mips: img: Add devices binding
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-8-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=FqYFcbHWrq35Q20DJGtu08zhvYZISHWayM6Dshw2k94=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj8/Loavfi4+j+PEhbtxpbUX1Voa69tFRW0OFZsnC
 TYEnNvQUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABNxNGH4Z/XXyuLoeVtTG8vn
 jGVMP291TJtaM1/ubgTLlSbtGY88zRn+ac0oXZQjncK/NaZy0bPewFlKk4zSe4tj1s1T0izh81z
 IBgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Add devices binding for various Imagination Technologies
MIPS based Platforms.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../devicetree/bindings/mips/img/devices.yaml      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/img/devices.yaml b/Documentation/devicetree/bindings/mips/img/devices.yaml
new file mode 100644
index 000000000000..460ca96577ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/img/devices.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/img/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies MIPS based Platforms
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: IMG Boston
+        const: img,boston
+
+      - description: IMG Marduk (Creator Ci40)
+        items:
+          - const: img,pistachio-marduk
+          - const: img,pistachio
+
+      - description: Imagination University Program MIPSfpga
+        items:
+          - const: img,xilfpga
+          - const: digilent,nexys4ddr
+
+additionalProperties: true
+
+...

-- 
2.43.0


