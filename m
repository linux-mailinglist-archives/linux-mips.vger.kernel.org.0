Return-Path: <linux-mips+bounces-3621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCB39051D3
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3991F26381
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BB017BB2A;
	Wed, 12 Jun 2024 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="iDsqp/x/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j0r0TO/O"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B8017A938;
	Wed, 12 Jun 2024 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193419; cv=none; b=C7YDKyj93nHQItbfVDb047u0PliUGGZjKvxHUz2UCyMlI3+7Y9E/JTq/+Y0ZhgtQdkUkNVOuVKZlwgrfz2lIPFbGbWzdVExxdLXUcS3/4biChMcMu1aB/VLf299hkFV/dA93sxp9kOm0y90raS6UtPAQPZvTyv/Exow0dcmVEWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193419; c=relaxed/simple;
	bh=jkqxI6PbI0hUQw47CPV9RIjGp8vijtIrG9xlbAho1TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4emHrRil0cxj1u0FBYovLiQiHHsQzzNuPCfT1GqKYcS3kvKrc+Gl/5lV+KJ+B/r0o1N4c0elRQVoEehmMLBE47v6KfcY9FTc5Ncqq7kdFHzxKpC+E8Leh/6jHXOEnjn3Eg/L1NuYGLxmWxSCC/ctDLvTxTUyBWvhftdfEcp3Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=iDsqp/x/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j0r0TO/O; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id A262C1380117;
	Wed, 12 Jun 2024 07:56:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 07:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193417;
	 x=1718279817; bh=XIwMv/JMo9KCDBO8sLopAav1EVkrxT/f9KRd242gTwk=; b=
	iDsqp/x/cOZB0J5zJ/uvvfjXlLmPgl2tDhXUz5r3wexhmtWvNpjJ2iDVptFAe8wU
	g688UVJwUa1hC6Y4BnvkXEGkg9J09qCGZpSJ/VnVYFjiY+l1ctGWvP75H1xXQbd5
	nW3nrNkQ9fB9oarVZ5v0wQ3mKwqL5j+AuABwUvnJqTFQvRC1o9r86X3DjnwUGzbH
	IaVX7IWqUz59VRomvb6XB8z6VA4A8lnj3fwGxkdyIzMSJPOPINo1wwPFZ3Sbdnvz
	sUSn73g2UG1JmGhNK1EOcLsX0i632D+q3qNlVtSrvIYMNh6rTaEDHIbGVeGiddJS
	63ipN1nYZ5jlZj8gfZLAPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193417; x=
	1718279817; bh=XIwMv/JMo9KCDBO8sLopAav1EVkrxT/f9KRd242gTwk=; b=j
	0r0TO/OHWSS6BaQjieVSmfZQaqSQlnrf+tJThzrHQsfMvj/3/Y3Bs+EVm5d9Bh0k
	1Dn7O5umt82vH3bRA/OpNxSqSiSCz4nHqH271ENDFMwHOuBuzlyTI5hq5k4PXbkS
	HxrXKjvmiI1T8VpMa5gWNtHBX5KgYuYYw58pmt+EYViV4DwxWp9hLWx5Aq382v1L
	pkT8E0nXIYbV1ldgfMw1V0joXAFusJnZbUwEe7LJ9gjXLshAoDgh3xSgoLOdpGbx
	DhG/Tr0o1kZ0H0X2GzF3NfHycN3tDeHfdz1WF2C30UW8CN1L5Ci/ryP3mE28ZjBU
	the/TY8ZAgOfeqIqboJNw==
X-ME-Sender: <xms:CY1pZifCtTFIFKOeoczlTY31EmPQidmZyi0CYWABUGRrDL3Wl3SeWg>
    <xme:CY1pZsPQvIz-hzfGA3EuYHpqadJsUinzjo_yh8tX6xjaT_XerfCC73YJVFAkwXYbu
    PLBx0jfE8Baw6XdmbA>
X-ME-Received: <xmr:CY1pZjhtGBWZh-hORL7VGugxkMHbwLRC3Gc23ZdOUTKbz2sHPXtGunk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:CY1pZv88CnJdYEwDXaS79ccQVYM1F5iJPcxTpqAJNsQXrDi1s0UVng>
    <xmx:CY1pZuvWgFoa29kfZHO-rWLiGZ8JGISPb869d95HIoN_WqOMShIiEg>
    <xmx:CY1pZmFAfbUmyPnKHwP3uuN-_TdjfuIihCxBC8qx7WD1WStEpQIYgg>
    <xmx:CY1pZtMgNbjIwMljXAo16JsEgEqEkSeO1UMW15RBOZx_lIJlqpN6SA>
    <xmx:CY1pZvn5Rg_MNTU8I27hu3qqkY57_KwM8q9pAtoqtfmd7N5USnudbOyh>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:56 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:26 +0100
Subject: [PATCH v2 7/8] du-bindings: mips: cpu: Add img,mips compatible
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=jkqxI6PbI0hUQw47CPV9RIjGp8vijtIrG9xlbAho1TU=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj+hE/YG3axdW7bvx2Pp3lhODs0/+nWq7363RLeJ3
 /kwrVuno5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACYS0cPwm/1p5MQInr8ZB6r3
 7O64sWKTyaKQw9Lcwm0bBD/IND/Pm8PIsP/Hjm06U/rTC/ocrzx87HvktNH7Xw2zr7UHhrJ+Tea
 JZQMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This compatible is used by boston.dts.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
note: This is a wildcard compatible for all MIPS CPUs,
      I think we should use something like "riscv" for riscv.
      Should I add something like "mips" or "mips,cpu"?
---
 Documentation/devicetree/bindings/mips/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mips/cpus.yaml b/Documentation/devicetree/bindings/mips/cpus.yaml
index a85137add668..7f9513f2a540 100644
--- a/Documentation/devicetree/bindings/mips/cpus.yaml
+++ b/Documentation/devicetree/bindings/mips/cpus.yaml
@@ -24,6 +24,7 @@ properties:
       - brcm,bmips5000
       - brcm,bmips5200
       - img,i6500
+      - img,mips
       - ingenic,xburst-fpu1.0-mxu1.1
       - ingenic,xburst-fpu2.0-mxu2.0
       - ingenic,xburst-mxu1.0

-- 
2.43.0


