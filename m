Return-Path: <linux-mips+bounces-3731-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3190D6C6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5EE1C246A1
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD8F56B8C;
	Tue, 18 Jun 2024 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="S7oJKGre";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="We1Wa/yZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC150A6C;
	Tue, 18 Jun 2024 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723486; cv=none; b=jMsLFZ9PzLJF+MZ0ycx1eyO1pDU8G3zvVJrkJms5fFbjnR3OpHHw6PioTeGr34nwWgGUgmDQ+8knlypfnC3a94QbbuKWXdKMmO3Tq7uaF1vVtjyHQEvVIlzD/ErKo2enPDzSX8GW45d74WQiNFQH0OlneK89uc4uev4/mCFb8cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723486; c=relaxed/simple;
	bh=ORTLv+565yoYWYi6d128Rk7j6n1W+glX47lvS/ZArGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyPuVXTzbI+RYF4j4y/aMW3W844n4+imWI6qIvRoGOZsdLgm1rdUt+rztrqJ+UEjjfm9B24F+ObubUBInZtYxrBW02+5xsuGuRX5AZ+P7SDUbbZIZ2uHlI1Z7K/L98VkRFtcu3DMlMh73QY3WWDpZ1VOniqnqmIRXwhMHZ5fzIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=S7oJKGre; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=We1Wa/yZ; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id 19B44180009E;
	Tue, 18 Jun 2024 11:11:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 18 Jun 2024 11:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723483;
	 x=1718809883; bh=GAhNrru2spEuKKE9kAgQbjxJpyW+H6svL1FVXG1BfmI=; b=
	S7oJKGre031PfJWw2HsMoHFD2I1FfDXlmxmHiQI/VJlI1h4HvJN9tLksQ1vD/nth
	MF9Ioh5/sfql0FH2mqc0fELSqrcrr+At/BUHfVXahYNA2+HXBh7zx6WghgD/iYAQ
	1Tv3Cpy9Vt5MUaqxqeKQtdWdi+mJ9/jPKvNgcxBX28J1asMCk8LdEaT6T6rTi3t9
	EmAX/QCHUY9wPASL31GOIt0Qv2RzeZW9ihsLxBcfLrcZPV3KkXYhnxj1onUUuRkK
	oeRPV7wnANmKCKpwrlzYjloHg6DwjVH/bq8Q25d0sm/UyLrO1sHP5rvU5jpl4/JW
	mhT9ePnZMcleMU3MtfUqgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723483; x=
	1718809883; bh=GAhNrru2spEuKKE9kAgQbjxJpyW+H6svL1FVXG1BfmI=; b=W
	e1Wa/yZUQM3q2RTCxO86SY7aUk67J5rCUhkJihqV++a1bJx66YExES2PqHuC/ktP
	MtOrzEVgKVo5xQniPVii2vDLvbS3ttVLqlm+aKOp+BQkSt0b21lBwDMTjyX4IvJi
	s2ownZ+JjtrB9cToogN27+oJgO94RQUgjEwosT4nOo1mQaaUH6YzElr6jEYGIQ+t
	ItyE95+P4EwS+5MZmG0WfZQ2Tqv9SXkU9JQJM6ZbSr6o/0Af79XK/y46uL/HyYiS
	xkTa309JxVoQAry6qJ8Mg9BfN3W38vnTSsX9MyDiNnZiIZqfHreg8fvFPh52j1qq
	YuoiCw3GSKn7HCSoAmEPw==
X-ME-Sender: <xms:m6NxZlHpqt9atI9DyxkqHGGafjlU5ATrGjcDHm7Lpc7Dj8pQFGfS4A>
    <xme:m6NxZqU5Bma_2xqImTz-CCRvxDN3W12_HEY6L7SI2JY-T4yLTK_mpGFROmIeuWp5Z
    f-k8NHvr5vkdYhuqVg>
X-ME-Received: <xmr:m6NxZnIh7Tn-A9ruq-W3fBcQps9PezGlsddPVkGSwSujT3vcvoj-n8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:m6NxZrEV_6uIUYAXrF11bN9xddiJS1vjE5ZJiVx_UAU37Raa7bnvLg>
    <xmx:m6NxZrUGiSJsbH-CRyM-WeRuO7cGrbXrNxqJ7n2N40gmPsk3n5hSsA>
    <xmx:m6NxZmMVIXZ-FuQqY_oNkVcQ_KkRo00CUImGXR98QuhGDoAhH_3spg>
    <xmx:m6NxZq2eLgnKxEXzRqyM1vwc8K4oUIq_W7LxJA5G2JBn3BiqMPX_wg>
    <xmx:m6NxZkOwQlFaSfVUquoJhzjQ5pE81ytP4CypOtIbgOj0dRpm3_UZk-fl>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:22 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:05 +0100
Subject: [PATCH v3 5/8] MIPS: dts: Boston: Add model property
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-5-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=575;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ORTLv+565yoYWYi6d128Rk7j6n1W+glX47lvS/ZArGo=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxb1bPwXPsv4V5DeR6cftuR/e3Jj76dJBuSsRW1rl2
 dJ8X0Zt6ShlYRDjYpAVU2QJEVDq29B4ccH1B1l/YOawMoEMYeDiFICJmDMxMrxWSftt/DY+f8Im
 PaFrmfbPXZ9um3XkreA1jomiakbpcecZGbquvZmjKTrz6S6viVVvCpwkzW9PO8a4SqDJSPr78ui
 /bPwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Using string "IMG Boston" from bootrom.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/boston.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/img/boston.dts b/arch/mips/boot/dts/img/boston.dts
index 3863a7bab03b..5e825f34fcfa 100644
--- a/arch/mips/boot/dts/img/boston.dts
+++ b/arch/mips/boot/dts/img/boston.dts
@@ -10,6 +10,7 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	compatible = "img,boston";
+	model = "IMG Boston";
 
 	chosen {
 		stdout-path = "uart0:115200";

-- 
2.43.0


