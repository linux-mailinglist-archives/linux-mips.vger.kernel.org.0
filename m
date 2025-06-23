Return-Path: <linux-mips+bounces-9454-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1344AE43BF
	for <lists+linux-mips@lfdr.de>; Mon, 23 Jun 2025 15:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A1247AD2B9
	for <lists+linux-mips@lfdr.de>; Mon, 23 Jun 2025 13:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00441255F26;
	Mon, 23 Jun 2025 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EiPUkA+W"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2225523C
	for <linux-mips@vger.kernel.org>; Mon, 23 Jun 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685507; cv=none; b=UbifE5hw8fsmZsKJIb6FJTovpdTl6C+PWz/LN9Nor4GMAl0TKdvV4ONL8UHbcs46uncRdTywsJdDuXCr1zjv6p61pnAEnS+NNbBeynC+/+7jWJRhpxEDWIXKx4C/BTRhymhLxkGuOJSALvk1L3eNMvkNH0tWMpnn3rR5CjHhNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685507; c=relaxed/simple;
	bh=eeI965bZjLro05LN9x1g2IrBacFgY7A1LEArY7+ur64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0RXX5CJhLqlNq9yjkfqJPbr7E5JoItGgUK/RkgcCISG3QOkJZQv9PHgGaRs8kjf8Nh1XqpSyS+oyqIV6n1Q0vxAHxUW89t36v/SH4i4032KAZZn6t4vJUh/U+rbukMkUE3inAdP1qXkokVBeeA+9yIJpGC5Ez8eqWBtVJTxXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EiPUkA+W; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a52874d593so4160462f8f.0
        for <linux-mips@vger.kernel.org>; Mon, 23 Jun 2025 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750685504; x=1751290304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=EiPUkA+WDAXeRWNUdlerVUk095LN56mFQ77UzQrwtEmfyQLf29XuTNONjW77WoBd4a
         Nn2wWVO1rv2/OPDVUsq6o/KV9trPUtd3Q39T1BzMrdzoIG2Sgz94s4GKysx6uZ7GwLth
         yCOrdhvfBz6RWftkHWwhZvS5FpTxUA4r3wZco9/ckVh/AXSE0NSlzZCTENCEmZqp3HLK
         iEUBy+g2EzVEFmbfHZ+SGNeYPjatGnelUnzBQ6ZNELINhqWqWkAVtmdHmptprby1AKan
         JpqIcU9ONv2T4SJIPZcZfKVkNnrpgrG1eiqpTYldNyFLY6icFIAVrRoxoLy4bQR4oXNa
         2HaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685504; x=1751290304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=Z8D1p3HmXQ42mbPXs37S1jbomS4GNTVJX0ShcS2UwpvkyxsYZsfhgrN1S2gS42WXmc
         ylIieHkmSsTxudzKQmgxH9HXBAHEm+OX0FFHtBgaZ6nidYk2wjQp9A6N4NFwO5LCYycA
         4eWL3jlSdj5m4eTC9duaiIQ9pkMtLEFMfpzqdP4q2ePp4Fv0h0v6TtUpzShED8x1QIzS
         XYe1iNLNVTHopzLuTJq4NCAnt32Ymh3UgRwl+KBAdjufKqD41uNg+W+zRtGk9+IrylOO
         Qp2WTr7o7F4OxqvVNpQxDCxJpQ51/1eG0qau06Dc/EKskshHLtFZKp9zyVGRlr+QVI74
         WBMg==
X-Gm-Message-State: AOJu0YwssrJPqTP0vStrqn0gTBcF4nPpdNpniuyxo8elM0QCCEK+3uGo
	8H6qpxhY3B6CO+O8gHAXVqtDHRIMraelvh1JyOQSnr8lys+qVoQrqY/5GjyzzWa+YxU=
X-Gm-Gg: ASbGncvLEOHCfV/vaxdjjqvyv7MkpeLmoYZx512SIMqbLnDVr2EtBD4OyyhsfeYStCl
	Awsrh5NUr5RG/rx9f4mvTW2iWqKJctdvWd82tjFXOA2MoZo+AoS0+r3g07eCRQ3sz/oYlroJSNB
	lfUdQc/4jGBv0+iXuckg19RvNMaGXjRnAc8DryyLOS4Unwo+HqaiA5hKFhavBssHCZTZRN9pGrj
	hxEjBF1rIXGdtK/TGPe8N1M5XLcm8UXd89KKrgDF3hO87VpK1GjUgS9DsOSWiMqznMzbFAXsNdf
	/W70ThQjsiOlpRDTtqMTZ1Wu/S4IwB2Q8cck0tgY4QGzERW0M4/rFvNGwTApJb7d
X-Google-Smtp-Source: AGHT+IFMA6wLpwWOu66ZBT/Uwcl+XoqhLxK9+V0tMp8/c191NViuqFm+b+1J2RS5eF5XWF43kziHdw==
X-Received: by 2002:a05:6000:491c:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a6d1164217mr12380643f8f.0.1750685504100;
        Mon, 23 Jun 2025 06:31:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1808bsm9401818f8f.24.2025.06.23.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Mon, 23 Jun 2025 15:29:56 +0200
Message-ID: <175068537068.1888277.981802582113061223.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[4/4] clk: amlogic: axg-audio: use the auxiliary reset driver
      https://github.com/BayLibre/clk-meson/commit/301b96e0668a

Best regards,
--
Jerome

