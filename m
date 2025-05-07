Return-Path: <linux-mips+bounces-8952-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0EAAD61A
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 08:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77802503523
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 06:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811D5211A31;
	Wed,  7 May 2025 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGKKe5JG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09626211A27;
	Wed,  7 May 2025 06:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599540; cv=none; b=Ka+jCfx5JaI9Y39ilSIDENjkfa8fYB/+uXBsXPay6NON4fMSpzzBkKVkvBOnjK2m/eY+6FIL11s5tNyfDd0EV5Zaxjk74iOoFt0QC585Yd9xz/zCMrbTcx8/UWkonFqfFeS5XcmxPz+bGq9/C4zcdq9LXTJwXo+T8hEZMU44qwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599540; c=relaxed/simple;
	bh=vBx+GuAXyWzQ6qNDkd7Rdz12PxdDy8wQOV2BLHz8xMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjdYVl13bNBTxl8Ngdyj31xdl93hsSUhG/EstWhKHap5unkL906IK35x1IcbYe0WkwFpaH9yVq+8n4Qsh4D+YBTo8NkvE4GwadEoBXjXUUvQWfJONDiuR/q9qGUFhDcGfYYZaPImxmYCM1HHPiHACMPzxbQZb3E4zchpu9Ct/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGKKe5JG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e661313a3so2822625ad.3;
        Tue, 06 May 2025 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746599537; x=1747204337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjN1Rbd4f0TS6CnLmUQCBx8JJK0qhdT/2216qY9XJPY=;
        b=LGKKe5JGP/GsrKZ7NbkTtUUeE758gXnlbGp61KsA0ANTFtA6Hws3PW9w3AP6+o1mEN
         Y4QfilztxeKql3+Z/DkgLXlbHpv3un4h+SdTjmHZJY1kHSOZCRMEB51iqXiUaZHOZv2X
         Va35PztoO5xjVMyVWv/Zp/VsZVdJHfyVg4bHp/YUejs64NjtIvZircnPwUCuY8jkCtAg
         HZ+dQJJqPCA5giP7jCcRb5yAutjNgR0XBstssy8lgq4NMOpRvQAcF7oLX//bLX9pMfDX
         RoVBpE9r2dZqS38HQ8KmrigqdIYx0VDmXvF2dwjtY3Th9PrJ8IOez+hKMV1X52+sHejE
         9OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599537; x=1747204337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjN1Rbd4f0TS6CnLmUQCBx8JJK0qhdT/2216qY9XJPY=;
        b=W6a8rRz07hWnL6GH9fTv9zpDSQkFG/2WT9TIYXb6LQJaIbCpcEc5htI9F5IQY5j9bE
         H38c9ACY9GJRgi2Wvy/3abseo0kmUl7QQZZIrWa74MvNPiLm182NhOvzrou/brQjSAam
         +HMyClgcUV7rAHkYRerpBXPxMAmUL9fjT0SncU7SoxBXRwEKDC8ijha5BcL02EwqcSIo
         uzwqFhFbSudKrMBJGYPdSkP1beaF8B83tpViChJiGHPrkKlD+8fAm8vTFN0iAS9sAAV0
         +aeSqczarEb5r9Vq80qkRAdiDr4toh9q6+l8RQi1OeXnW8f59nOd6gKboEh3nlKt4VYH
         F8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx2wnRuK87QKwiYriLOD6EywHdO7yXCPNx7iATIA4/URfRllHps0x5JgUKPTfO8G83xJdU89Qde/XZ@vger.kernel.org, AJvYcCV909YNogOgHZ+SZoSNkULHtyEzDSt82eqMI02DgVTaPvNC6sWWRSc/vnwRKgm95I7ZJydWCpcyUN6R4tw=@vger.kernel.org, AJvYcCX4V/QBsn12DTjRegrLLRTN0MyMH91IDDEfwbrCdp9ymyfHeYWuzst675Gqrd88ZL8IVwoVdgGQI63+AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhIEF4TluqtrSIluar57FxNFaS9+Fl/Ac1r2VA2JsaSebTCte
	1JfL6VzqqGdO7MkbDSDx+H4OmIHuv+PY1M2z2v4HRd9+NGqQWL8t
X-Gm-Gg: ASbGncvwNZK7/d9wJ3k0itlElHi3QDWunQT9UCurhN51Vnokaw5Y8Uq+J3t1QrNxgBS
	iXBRT3PEmNkdUNtDj4IXMOZncTU4fsdnuz94XV1McjhJkv97vdAh686jxTre2qAkXGtGT3KUnev
	p5Yb4i+wqVK0VgaZqK/Pbp7FpKjjDdbJjzNYroE5m7cjOOodY261r9u++SSFYtpZ75Zt7YB+lNu
	kiwBGRbU4IUcfnrg9oW/aut2ZnVlNZ2xwLGROHvjd8USHreLIYT+pb/dY0es/IWX/+ZnwsxDN7X
	QV8NwWPr1B1UABdQQuGrhn/IMydXrks1uSU2GrdQZyNCI0RsYz0=
X-Google-Smtp-Source: AGHT+IHRAwKjxPInT12jh9buW/BDfXkK/uojXmY82dgIzp+7cbf8jzhitTsmXEHqE9b8oGHqpwleSw==
X-Received: by 2002:a17:902:e78b:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22e5ea71235mr36358335ad.19.1746599537206;
        Tue, 06 May 2025 23:32:17 -0700 (PDT)
Received: from Black-Pearl. ([122.162.204.119])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e15229384sm85805295ad.206.2025.05.06.23.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:32:16 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Wed, 07 May 2025 06:29:35 +0000
Subject: [PATCH 1/2] mips: dts: pic32: pic32mzda: Rename the sdhci nodename
 to match with common mmc-controller binding
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-mchp-sdhci-v1-1-ed29de05295a@gmail.com>
References: <20250507-mchp-sdhci-v1-0-ed29de05295a@gmail.com>
In-Reply-To: <20250507-mchp-sdhci-v1-0-ed29de05295a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Rename the sdhci nodename from "sdhci@" to "mmc@" to align with
linux common mmc-controller binding.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/mips/boot/dts/pic32/pic32mzda.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/pic32/pic32mzda.dtsi b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
index fdc721b414a88a12050497cd2ddf98ae2fbce035..feca35ba56a47adac0e2a906f4fe9c7a4e89cd4f 100644
--- a/arch/mips/boot/dts/pic32/pic32mzda.dtsi
+++ b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
@@ -225,7 +225,7 @@ gpio9: gpio9@1f860900 {
 		gpio-ranges = <&pic32_pinctrl 0 144 16>;
 	};
 
-	sdhci: sdhci@1f8ec000 {
+	sdhci: mmc@1f8ec000 {
 		compatible = "microchip,pic32mzda-sdhci";
 		reg = <0x1f8ec000 0x100>;
 		interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.43.0


