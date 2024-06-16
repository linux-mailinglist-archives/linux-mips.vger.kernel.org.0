Return-Path: <linux-mips+bounces-3695-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C9D909EE4
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 19:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906161F22BDA
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2024 17:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464F129428;
	Sun, 16 Jun 2024 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="xzeNotwa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jmP069pS"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout3-smtp.messagingengine.com (wfout3-smtp.messagingengine.com [64.147.123.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BBF17C98;
	Sun, 16 Jun 2024 17:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718560475; cv=none; b=C3DXqE4ojy9+h4LXdyNpQSp+ZzsyGL5t2JDNsHTmRq0LWYIZTHCKfhyED01PrLlyth3ZWv+rg8JMFV/TX9flumogfyfK2AqZLx/aQalWDKq/4CGzsCMYduiF0C7qR25znai/wPoXer/Z+xgb3Cw+vCiJzGyjx9gbr7zFMh+K16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718560475; c=relaxed/simple;
	bh=E/Cx5Rf8a6UHn1OwmSeZLEn9AOP4WmqErj2Q0myvfb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LnTix58m6OCdKDTPSw0vUQTB8ytlzJqF8dKhfRO+BI9JZlHiJOquXHS2vmnYJ9Y6ioBoMZEvTz3/s64nazTNgtuwXCfL7/huXtgDQGoWF+cI92aPSjSqTMG/a26o2MBda4HNTCvRzchtM82+I6nQWnNkM8AgOlfEKvlB5/oywEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=xzeNotwa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jmP069pS; arc=none smtp.client-ip=64.147.123.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 40D341C0008C;
	Sun, 16 Jun 2024 13:54:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 16 Jun 2024 13:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1718560471; x=1718646871; bh=z/
	31P7zfEbv+0pHgdaZZDTGL+oEAX1p7zwNAKWVmPJM=; b=xzeNotwajivtWE9DHm
	uh8JTDUJLOzr07mFxBdMTqg6iFqW4XPiB0dgqtyhejlWXeAVNB9i410a+wOcm3xD
	9gBQFahDrUxrEOkhQG8i896WtMjEWggneAZCG6amxf+vLPUp9078jQeOfVnPGign
	mYboEkz6qM9Oa6yvLK8hnTM2qjIxLUc2PEgytzdP2c1r7aHnrnM74/eAX3BPi8qC
	S3fR4u6vY6iSzx+afvT/4X6HqNOTCn+oimJ80w80VlVVSLcxn9pKUfQpWIkaLGJM
	J0RadYqUOIARfBMG0LHwd7rbNFt4FVLOp34Ed4G9AbUVPm5H8ZTepLJye5krLGUM
	DnqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718560471; x=1718646871; bh=z/31P7zfEbv+0
	pHgdaZZDTGL+oEAX1p7zwNAKWVmPJM=; b=jmP069pSES3RArlYyStGvkM2wZGPx
	8DlKamUgR14gvvPMR98L89pA2+B75HU6OgFNdX/ht142PtWK22i1e96OroPE1WxF
	HysbkwQOiiWnFNDlaauolx2qoybAMMZ115TUL4tSonMkoQUOnOhsJWkd0w30Kt8f
	GH46it8mWyOzwosceEcYdw5r0oalNH0DzvHtLxlqIyVnrSZOHlstpAO967GyJcet
	2J5X/ZV6vurg0OXbpFiz72+W4Z9t5Ktb6zFEhsPO8jNk9z19bvF0SNxrnSmF16fv
	igG8NMs41gaWA72cAI7X0v+JcQTx79V5CWVXrj45moJzO8WDkR9BhnKRw==
X-ME-Sender: <xms:1yZvZhlt7hJUkqUHIjt4tbDLUMEfmNRWh5Q_lSYgPSC5PtTuFIMK9w>
    <xme:1yZvZs0Fi86UMTgJ0hM9LTRlImi7b9-YD1OrqskpqyplEZ981fguMNjp5IoJeXDHu
    KfNxwcfW6zeokONnMU>
X-ME-Received: <xmr:1yZvZnr-w-591EQEBFR5735mJnAhTnrUEP1eY4vRDXS0GaWb016sYrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvfedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeekhedtteekfeduieehtdejueeiueehgedugeefudekgfeutdev
    udektdehhfegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:1yZvZhlicGmiGVTp6jX-sCM4VBEbN829dH7S3U1Zr1xzUIDOcjwrNw>
    <xmx:1yZvZv3-SzaCQj5VRef-3BQxhxB4ji-TaFbPeV7wRWwCC9cB_hFUIQ>
    <xmx:1yZvZgt8lV3-kJ08mgg8swnKHN9UHVgACJzqO75KAeO_XD6rEhUOVA>
    <xmx:1yZvZjVE2XydQJPhKxk2U7FjDP5QUFeDJfNWyTvNH-UHq4zyYrctkg>
    <xmx:1yZvZv-HRmXtyv86TC8FnxkypKlmbWopktqIQQ4e8tUnyF3hRQzBvN45>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 13:54:30 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 16 Jun 2024 18:54:24 +0100
Subject: [PATCH fixes] MIPS: ip30: ip30-console: Add missing include
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240616-ip30-buildfix-v1-1-0ab2b9aec9f5@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAM8mb2YC/yWMUQqAIBAFryL7naBbLNFVoo/KrRbCRCmC8O5J/
 c0MvPdA4iicoFMPRL4kyeGL2ErBvI1+ZS2uOKDBxpAlLaE2ejpld4vcGo0jXNCRbQnKJkQu+fv
 r4ach5xehH8KHZgAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=E/Cx5Rf8a6UHn1OwmSeZLEn9AOP4WmqErj2Q0myvfb8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrR8tWs65n8f9ST1bFS3f2KUYsrGfe1LpbD7/mN3nZX3f
 PZyZP3XUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPZx8rIcOVN6jpL1iiFzmDh
 a0eYbuftZo/aMjv5WoR8nJcfg5v8GkaG9Upp/XpHtq1cFRbYeVV6ysfdG65/94jbsu/K0rRJGrI
 z+AA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Include linux/processor.h to fix build error:

arch/mips/sgi-ip30/ip30-console.c: In function ‘prom_putchar’:
arch/mips/sgi-ip30/ip30-console.c:21:17: error: implicit declaration of function ‘cpu_relax’ [-Werror=implicit-function-declaration]
   21 |                 cpu_relax();

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/sgi-ip30/ip30-console.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/sgi-ip30/ip30-console.c b/arch/mips/sgi-ip30/ip30-console.c
index 7c6dcf6e73f7..a5f10097b985 100644
--- a/arch/mips/sgi-ip30/ip30-console.c
+++ b/arch/mips/sgi-ip30/ip30-console.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/io.h>
+#include <linux/processor.h>
 
 #include <asm/sn/ioc3.h>
 #include <asm/setup.h>

---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240616-ip30-buildfix-20d62f2d6186

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


