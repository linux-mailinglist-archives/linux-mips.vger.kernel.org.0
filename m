Return-Path: <linux-mips+bounces-9432-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF256AE0EA9
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 22:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2A81BC6779
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 20:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7683725D210;
	Thu, 19 Jun 2025 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="QJKey7/j"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091C235360
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750365313; cv=none; b=NyoiayIagPy8CJaKD9GKIZxXJqDfqkiF3M+OwbiD2zWBju4mt3QO5U22e46Q/yLVVWfeqzTWOGGrnro0vEC4dTlKyTRbja4lUfVn7GpWdfD1c269qGPxR7qo1sXawVhK2KN3i4kYeIqrdDH7VEP0t9S0XqPfFS1vOZgir3MNGzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750365313; c=relaxed/simple;
	bh=TrO2SFjGKBK1TwkijXcscyMw/RsP3DJJ4iYMXoLZjYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2Z41AJeN6L468oJ/rhdraL6Uqm51TQ0xE5AzKo6DHoNyY5i85Sjbbz6gm75qeATUrR+p6b2SqucjL1xoEw5ZBEvTG8L6nwJ18A9hgKjV6yCzGW9pq64h0uuI2FiFdECKVWOU/Rduu1fT1gn21Lf1QCiKlfLhJ5LcGfoCQAu+Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=QJKey7/j; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so772040f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 13:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750365310; x=1750970110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EIhw+Rvhc6cZiuD+svHBrLE+9XGVyIueYFgEdxmfoI=;
        b=QJKey7/j5hmUB/NIvIfMlaq/KRjGiETL8swYiU+5g96vggXfZG47/yR40/PwJgqgZV
         xMa7CnS81mwyCg85CO4Ut5qPNcCnKjFbRkeg7zaj3RyX/rDpCiJRxW6ykzwzYtE5HD+y
         KBZqaarjz2JenkDnFbktktgpDn2xADp5n/ZDE/M8/qkFpg0Tj127vT+6catM88AZVfZf
         b5xes9eZHDXUPb68rAeoxsMis14GenObd8EYRDAA3EPO12TGFxXpddTE/DNxFcnDl5NY
         f43HsQAkfbKpNob6Lh0dDVcAwCtwkcSDK37YpwJdth41DUhQ1AvZbspn1UI2sSiKewcq
         Bpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750365310; x=1750970110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EIhw+Rvhc6cZiuD+svHBrLE+9XGVyIueYFgEdxmfoI=;
        b=EcIUDzSAPPwL+vzwGBPJmiHnzrRf9nS3sMWY4RBlZDj9p4ll2+PP/1yg4JRm1hjG5e
         3n25Dqjow/lRwQj+xSyFIiMZOvPu2jwY2GNLlfdl2jcmWDX9wyPQ+mXBhEaornVpQ7rn
         zWT65P0FTg5evNQgj8dYPZ277uWbULB4E4LsCoxZuiE6Wl40V/PyX1Jk97GKJsIfRJMJ
         iBa8pUjxUvq5wyZpUFoI/9dxkSDgrLvO0Dm85aFrBXUpvLEKT9DwxPsXMlEGebprsYeJ
         uf5h4+jLWZ56mmpqIi20+qkeLR1jK5pE0okZW3mUVKPhiaJlCkQaLHrTURyoJW1c8Ovn
         ZKLg==
X-Gm-Message-State: AOJu0Yw4nB9s7Jey3MkorZx1ifIC4hs1Jq7PohqQU9+uRLH+SbmeOPi9
	gG3m+cKCzyHamOnGXSsg6bQ2dFdG8KxUzqeelYEAxNCtYKpln/SIlecCymIu3Q8eqYS4IU6uG/D
	6bdXI
X-Gm-Gg: ASbGncu+/jOZVwORzZEqCwn7UzT7CMVqDazbVwUP9Ampv+DBvMBd0JXjShRM81QJF64
	jK5al5ckYy45n9a6UhcGfEv7DHb4YdR1oXwXJWuzFrkRPKlxSADZPzMXR1UGfVbSpGUVGtQCoUM
	I6ts7kVhEAZ64F0L5nvYJJgdMdacbDcHkw+6PGFdgRTxPxciPc/qFQPYxwDiHZd8jqOh00eLRVd
	r7L0pM7R2aChF5Wy4LXM0NZR0/0FO+yIt2pCCCfjj/uJDw9Y4H8DzM+b3geTVK8Vu/hOgDtVF6D
	Aep+M2g33XfAjiPWHUnFSeSP5iItmsWN/ZijZQeruM4R1FrxDJ58499xPbOGt69SlXrpmMY=
X-Google-Smtp-Source: AGHT+IGJ1FrjwXgIPpZKq//ytcCmpdPAVFWG3nWjw0PBHri12OXqaLTMvq+ey9k1PsjBloAJ8N54hw==
X-Received: by 2002:a05:6000:25e5:b0:3a5:27ba:47ba with SMTP id ffacd0b85a97d-3a6d12e2680mr291561f8f.44.1750365309855;
        Thu, 19 Jun 2025 13:35:09 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:a60c:e454:f09e:79d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d91bsm288495f8f.42.2025.06.19.13.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 13:35:09 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v3 4/4] MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED
Date: Thu, 19 Jun 2025 22:35:02 +0200
Message-ID: <20250619203502.1293695-5-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619203502.1293695-1-ezra@easyb.ch>
References: <20250619203502.1293695-1-ezra@easyb.ch>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

When starting up, the GARDENA smart Gateway's power LED should be
flashing green. It is unclear why it was initially set to "off".

The LED frequency cannot be configured in the devicetree. Luckily, the
default is 1 Hz, which is what we want.

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Reviewed-by: Stefan Roese <sr@denx.de>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 7743d014631a..0bfb1dde9764 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -56,7 +56,7 @@ led-power-blue {
 		led-power-green {
 			label = "smartgw:power:green";
 			gpios = <&gpio 19 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
+			linux,default-trigger = "timer";
 		};
 
 		led-power-red {
-- 
2.43.0


