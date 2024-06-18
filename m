Return-Path: <linux-mips+bounces-3732-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CA90D6C9
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB4951C2412A
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FEC74BED;
	Tue, 18 Jun 2024 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="XFQnrVk4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nY/UHzJS"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027DD71B52;
	Tue, 18 Jun 2024 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723489; cv=none; b=i7AY7t4LcnPddis3+f2KknxLYJI2SLMgF1r89DeLU6aV2OJ1mmsUieug9+4OiSbT6c8ERML6qRpmGeJCtXVAaeZKxlpYe0g0MSiCBfUCyX8dkl+fQqUQs+5wQKShc77cKW7y4Hw7tP23Fd/4F0uXoNwd8wLbSTvcpOIP/Yh6LvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723489; c=relaxed/simple;
	bh=GTs3xUvMVWMQcggQZdK/s+o1gK7ylJ7eAFnNQ8w1A14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpoAfSUgmDtZLsNBZ7VVohBkqjjFimHVQS56o8rB0YArh99omJ7YjpKmL1t7EZbgcYwDJGAx4aLp3eIPjhjgTNVFUjD4IG4/eznV+rQpw0e8czexfnC16oBTVzU3tn8cncF1RdNsHEkIwZ9ZCNioFfxWyODAW9K/ybIAdnhYbME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=XFQnrVk4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nY/UHzJS; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id E7256180009E;
	Tue, 18 Jun 2024 11:11:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 18 Jun 2024 11:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723486;
	 x=1718809886; bh=6LDEwodi0lPCVIfEXLWQtTsjj0zwgTlEnrcMF5kAbgM=; b=
	XFQnrVk4yVCsTY/OaODDpo1/yqibrH8HJrXURZcV+rgbKBjcoyg/w4Ox3Y6Nh466
	Dh1Cy4NswSMByWC0J3zO6YzSUvYWX4wNXOZDiAYZlemysBK3mWil5khBcgmSH6Sr
	ddP/OoZ4ZEZL9tvZPJFLe7GuGybwnfvl3DmDX3jXlNfJ2DBy5nllWQT11UUoxKR0
	4PoWZD/7GpMgBObUAwlA24niE/ghwp39pv/YD9FuRVkfENiq9pE65hGUQyJrg6rr
	9SzhuHPHKZ6u9X5cDpdzgNMUiGCRqmDevERKtiuW3YE2nJf1yg3wDMbIJWApjM/O
	MAMr8kb/0i2H96eI9pnYyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723486; x=
	1718809886; bh=6LDEwodi0lPCVIfEXLWQtTsjj0zwgTlEnrcMF5kAbgM=; b=n
	Y/UHzJSG4RaWSBS7+bD0bk12TejPr+2oXL06YpMc/RgkzeUGhekBRdUbYAM6aESP
	By2dfml6+jF8KXEa4AlmmdRfVzaU+VE3KW/lVQkRybEJq1u+JHb8F6wyeJes7hMC
	9a+ZzWxvEFH+MQZMXCl7OIDp7atynFWTYtkHh532C7X278ywjb79mAk2QftOmtGL
	kPPdQJyKEDoVGVol9tgIqiS17zjqvF53Afe2DDts0bJDhspkT22cpaADNOVoVQ4W
	0UfxktJ7JpIB1uDtx0yvWUWRJwSp/APuDpVbfn/wYAdTVO9EvChSqo5BsjOOUaWx
	2eLs+PmT6s/pfqnQd9AAQ==
X-ME-Sender: <xms:nqNxZixEP7KMzwRhwpzS4trCC9kkROn8FpG0GH1kxat0aW_uqt2o7g>
    <xme:nqNxZuSqtQR_rzxiQyaYXWkCLUpRh2ANPV_4VVcT8225G-KW83GaUkMd4hjvwW8Vy
    e-LQo4dywU9qcvEm4Q>
X-ME-Received: <xmr:nqNxZkXzcnKpQCgTaZ9NOtfhW60ShjVYYLt0yjjT744N7v57fE3PUeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:nqNxZoj-AGBUPxAGj_WPJXzW4xUiTpmxsPXcSmbKBj5yzDxkL07Kjw>
    <xmx:nqNxZkBUvpbuFgF9fmLLir3saEHY4jwwkSuBZ52nLVblp8TduGAEPA>
    <xmx:nqNxZpL7odokh4urpllWR5zPxncHRZizDm2lQng_lNHR8rjk9G74QA>
    <xmx:nqNxZrDaMpgA_JjNdXA6EX9Xi2IR1SzQGZ5UtJeS-KHIr8Oq-3GQ4g>
    <xmx:nqNxZo52YoAKXPaV6FvczmclzwopKxYbvxadg8jaAXJn4fHeuWSwuwP6>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:25 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:06 +0100
Subject: [PATCH v3 6/8] MIPS: dts: Boston: Rename uart node
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-6-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=816;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=GTs3xUvMVWMQcggQZdK/s+o1gK7ylJ7eAFnNQ8w1A14=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxb2b6rmm6LNOnBezVtJ6Bg//9qQslVs7y15vXZ2pf
 THwduHyjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIv0WMDDuK1+288K6l0tjW
 IKDu9pyfT+IFFyis7quXZ2fY9Y5Tq5zhn3l2x9fPDiZqqZ8NMu0UZ2d6zPvq3Bzspii5ajfzxAk
 cLAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Remove it as serial node.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 5e825f34fcfa..7d1870aae47f 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -13,11 +13,11 @@ / {
 	model = "IMG Boston";
 
 	chosen {
-		stdout-path = "uart0:115200";
+		stdout-path = "serial0:115200";
 	};
 
 	aliases {
-		uart0 = &uart0;
+		serial0 = &uart0;
 	};
 
 	cpus {
@@ -218,7 +218,7 @@ reboot: reboot {
 		};
 	};
 
-	uart0: uart@17ffe000 {
+	uart0: serial@17ffe000 {
 		compatible = "ns16550a";
 		reg = <0x17ffe000 0x1000>;
 		reg-shift = <2>;

-- 
2.43.0


