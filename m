Return-Path: <linux-mips+bounces-8563-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF6A856C1
	for <lists+linux-mips@lfdr.de>; Fri, 11 Apr 2025 10:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1791BC0A4E
	for <lists+linux-mips@lfdr.de>; Fri, 11 Apr 2025 08:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA8C29615B;
	Fri, 11 Apr 2025 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dy+fjYOl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C028F936
	for <linux-mips@vger.kernel.org>; Fri, 11 Apr 2025 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360678; cv=none; b=nOGb+m8kByAYkatc8r3SOyB8vOu0LOkkm2+DvBgG439hcZxSc/B9LsBkTt5DmV3mWlW94ZfFlTVjI6LKYJtYi/vQw1ZF7Q1scBq3Fb6UGuRQEMdKyGxWQF7qKh5ZBvuWcVtR6NTSdZuvkguGz76/Nmxby4w+QF1XJcUTFmkc8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360678; c=relaxed/simple;
	bh=5kt3MWtin3KNwdzDbJU//7Uxuz+S1QGZ/maTZ/hrbSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BWkaJAMJYeL8RMIZsGf8Wg7FmCSHRGFrJUObGralL4zkBBneid1jrhn4kiEeZiPpHzLYSTjvmZcWUo2zF5P8VCMyrXSr721ZFnIaF/75DkVRHYhzcrlq/EXQDH467LLaYy/FPGq9XgF5oi25D14+MZnxwqobQtIpHHRBAaaXU0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dy+fjYOl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so12793095e9.0
        for <linux-mips@vger.kernel.org>; Fri, 11 Apr 2025 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744360674; x=1744965474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH2ZPuzfR/sU9gtELQf1xx9ouW+DErODBwUT5LwG1mM=;
        b=dy+fjYOl2NWtqXJHHd4H+Tpo9L+/m3lsuYvwRfy7cD+16NN+q8tvv5gyAlQ0ra23IO
         0C98gB9Qk4qsQXQfsD3sRaiVfwIoa64x0I/ZKzJsNADmHD9OfLWgy7apo4hEn2PEWWg9
         zJ/s2Ceme8nWBZ4R6ljHMBWREuI5HZqI/Z00u20fltn6RwNN64mweBGMGSThN4Goureo
         aSwEoq15ptQnQZ6pwArHiL4cz9QwxQbPuYz2J1dg+V8q4Cgt8bPcj20M7gH7pGlbSbVU
         /olenrBVqU5Smru3g91jmBiFa9msCGO+1nblQGmsJKojRvQLNUorj7flEXND1KBhwNJT
         S46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360674; x=1744965474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wH2ZPuzfR/sU9gtELQf1xx9ouW+DErODBwUT5LwG1mM=;
        b=eze3V3l/mxndkTaOAZxSjm82a0LxQnDofJHJudM4Cp1jK19EXtvXg4VL0Yy9PBk9MA
         D0c8y27hRdqwE63l4uxUCTx3QYqij5A/ChLnsKBN6L2PlN43oQhUiB6mt4yTL/xxLzI8
         Pxsz9/KmKn4yfq6vCVw5WeBFJMoGP8l/fgX2m6353Bi4pggndHGGcRjh2uT0xRFqAqCf
         dxrhZBSL/UYQOH4I0h2vQDBRvK70pHJTGkwPLEBW+iTDAQ7ivu1jTWpIjjcF/eO2C3Gl
         rPxifPqKlrrtyBgf0HNB1xyc8V59tAW0C9T+GrsgKoMk0NRAvoEIFcv+sYNHwFoBQlTF
         AIuA==
X-Forwarded-Encrypted: i=1; AJvYcCX0fbJpz+ncCcjscwzk98uKRASc2eRs1OZXBK1HXhAraFJL/oaVI6vrKt/Nw6L63GAFEiotximisDFF@vger.kernel.org
X-Gm-Message-State: AOJu0YyJsjmOoaateUOiTiX8z35UjSZn1tzly86r6gPS86krX29yMiPh
	j/03w/BACMn9XOgo96pvpGc1B+umwRrQghTVOwVxLjW4btWioFl88/GmHmZpPEg=
X-Gm-Gg: ASbGncub6lkkJug1dNt9bDTj+BGDLE+mMA7D/nzNqztfxI5GGZ1h6P8yrAGhZ8cOrUM
	6336jig7skLaCJmEzt+IwFnREvue3kubwPEUNGYUW0aBhDRboFz972ultvUx4W9WXtcCYCLnWNb
	/uQE6p3bmN8CiVIg56I2SzeAkuk6j7AqkWD3bpjTNh/VFagj4574BoER0/I8zjO3dTqhyVGU1u4
	pydCXco4IMtizvz+f5MbM4ey5DlQmsxO+uIqKCc57bK/vQ/CrjbyACXWIIZgSFPcxZbcPMFpQuc
	pe+H2M0ZTMiuCUp+GZzmOuMVGw6hPbayU/AfWNQv2rq7f0oVXOzM6lhnodS9Ow==
X-Google-Smtp-Source: AGHT+IESQEmfqjjVD+jC6dd63FDfAGrpItTMGFb0BJ+4OP4VGIDucBWUqxZDD69YlSOe5qeibdfp9g==
X-Received: by 2002:a05:6000:2c5:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39ea51ecb8bmr1357243f8f.5.1744360673907;
        Fri, 11 Apr 2025 01:37:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9777a0sm1326282f8f.43.2025.04.11.01.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:37:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
Subject: Re: (subset) [PATCH v2 00/17] Arm cpu schema clean-ups
Message-Id: <174436067236.3436338.6767561918297500530.b4-ty@linaro.org>
Date: Fri, 11 Apr 2025 10:37:52 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 10 Apr 2025 10:47:21 -0500, Rob Herring (Arm) wrote:
> The Arm cpu.yaml schema fails to restrict allowed properties in 'cpu'
> nodes. The result, not surprisely, is a number of additional properties
> and errors in .dts files. This series resolves those issues.
> 
> There's still more properties in arm32 DTS files which I have not
> documented. Mostly yet more supply names and "fsl,soc-operating-points".
> What's a few more warnings on the 10000s of warnings...
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[11/17] arm64: dts: amlogic: Drop redundant CPU "clock-latency"
        https://git.kernel.org/amlogic/c/4bc28af2da876531e5183d25ae807e608c816d18

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


