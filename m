Return-Path: <linux-mips+bounces-3730-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE290D6C2
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A3511C245C7
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB494D8C1;
	Tue, 18 Jun 2024 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="L12e9d9v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OweWD5gq"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C34D8A4;
	Tue, 18 Jun 2024 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723483; cv=none; b=Vm7eeYAXVgCJ7Ett1C4eqeygTdTSRlNyhqMpnZDDRiUXUQ+UNV90YPOL0Qx6t9Z3BFaREhBvaLRKYaxiopZVjXopknUBLehWKzeVSnLnn4XdQomVugSFa2qYJRQ7o7ypALLmSrVpVB7uB8LpOrMiij2OMw3MOZNHgORVg+CRXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723483; c=relaxed/simple;
	bh=F2TD4mszBgigQRbhyzvnjzH2xkRPNWFTZ9s+AQRQnTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgFvSwHYHUO1eKT7vbNTzW8FvFaWbGQ67sw1+5SA2136u8bQigPPeN61kI22qQF45yib0zzMc9X6U537WLw/mWT4XldK5dlOV1Dx27DQrzd00o+JFp5Wzgp8m6xk7XaEWDh4jETu50CwhMdVs8i7zNLcaF5fl2XApMJr57TcQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=L12e9d9v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OweWD5gq; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 6121F1C000EF;
	Tue, 18 Jun 2024 11:11:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 18 Jun 2024 11:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723481;
	 x=1718809881; bh=OCcIhFVMFP430Vp41BSqtkburDXhlBI4JVgZaybbPUY=; b=
	L12e9d9vgvgaJHWUCOIxd2keArfSVhbGbMhRb3VIljUV8csicYs9yw2aj+Rsp3fI
	dphC8fMhXWVbLItrHgNCbKyX9Zk+P17NFr3hg8L7vcoiPY650kAUQvV3ZpzcZ+yB
	op2wlSF9adZaoZpIHQQUI5o+uMny+UKCdL+L4LEUeuT7T3yHBmDIzTorLMEskV4/
	fOPVXw+BLh55FG6YXwTAAqwZIE7TXJL5ArwsYq+5TcW44SJnxyfi8iN1w9pH0yMs
	05VBE80MZ2zOJgS7tv/kEQwG8kUxBt4niaBGx3EjbWD3vLaMIr10vPwKZ76s5Qen
	nm2CGb9l1T99mdg2RJE1iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723481; x=
	1718809881; bh=OCcIhFVMFP430Vp41BSqtkburDXhlBI4JVgZaybbPUY=; b=O
	weWD5gqQPf2B6jlgje+WKDk1bKQio6Y7mRN/Lz8WmbWT+nQ19b2k8+HnaBJ0zOPp
	CwYXDH7NOjKWVRUHsWzutnUrPnzxYTihNH/2/z0ZW8sYk6lHCyohr+P3LRnkECxF
	0ITVPdv6QfJ0XXcV7fpy2mO8CW+zdoFKyeM5e/fh3m4eKKCUjbHn5ooHkwTqbV1T
	6feV7it7y3dLxgQqROg1kgLvL2Y/05DCNkU5C6w6jWIqJXMG5du8UajkoTHaPJfZ
	T8x2Kx9OcQ9tzZOV2Dg9k+BEXHV22GSJvdi/zs4sgGSn1AJ/OKZ6qy20p7xqFFJP
	HNfV1UV7gRUtukdqYkPYw==
X-ME-Sender: <xms:mKNxZj3HQLgEwE-_gdmRzeAOHH6kGOHGgfIuohgTA2sJbBsnJmrWCg>
    <xme:mKNxZiG_x4D6EA6cpv1vIjxd5v-TMtvnTmJokaElDNBNAc88zHzOS81kIKVSCe_PF
    t441BZR-OVTcs-sa9o>
X-ME-Received: <xmr:mKNxZj5fkBIISrm4sJTrY4R4OTbWhUEK-Lx3-NgWuoZNJ0ehHkhg3Q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:mKNxZo2tFXOtayMhdJ_tPh96nUdxdpce8RVMcxcpgXNm1Q_0uz2ASA>
    <xmx:mKNxZmFXZ_oMI035DC3wyfEbPX_Qt1wTiGNaFyGvzgp5Goh4cxs59g>
    <xmx:mKNxZp_206KuQwBflXq-QJ2jdFH71fh0K94syNGjhHjg3OmLJSLlNw>
    <xmx:mKNxZjltBHO2uMbizw7eTzwsUKuIujl3behqewpiyCtpFAEgoZpkLw>
    <xmx:mKNxZu-DRuvfmnzSR19NMfrhrzIWMpuoTKIH9hEniJwMwObtNdUyGGkQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:19 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:04 +0100
Subject: [PATCH v3 4/8] MIPS: dts: Boston: Remove unused #interrupt-cells
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-4-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=F2TD4mszBgigQRbhyzvnjzH2xkRPNWFTZ9s+AQRQnTU=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxb3pQttjG6/YJB9XOPVs7VlJB3keZcN94ZKXuoPSm
 D7Fnj/eUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABN5+IuR4WJPbaLne+2EJW/i
 nn3hYKp4aidrHfl1quenOoncUgl7V0aG6dfTCj/G2/Qd3VOv2fvOt+BgvPC1aX80lbbON8t8X3+
 YBwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

There is no reason to have #interrupt-cells node for a
pci device.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 337dac462e6a..3863a7bab03b 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -131,7 +131,6 @@ pci2_root@0,0 {
 
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <1>;
 
 			eg20t_bridge@1,0,0 {
 				compatible = "pci8086,8800";
@@ -139,7 +138,6 @@ eg20t_bridge@1,0,0 {
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-				#interrupt-cells = <1>;
 
 				eg20t_phub@2,0,0 {
 					compatible = "pci8086,8801";

-- 
2.43.0


