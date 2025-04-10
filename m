Return-Path: <linux-mips+bounces-8537-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FCCA84346
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 14:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B718C5D98
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 12:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41863284B53;
	Thu, 10 Apr 2025 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygoG7ksq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518B1284B50
	for <linux-mips@vger.kernel.org>; Thu, 10 Apr 2025 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288577; cv=none; b=ihXeXqe4wsD72uoLX/xD6cWOr+LUqIIq0ryLMrjgQwsUHLVR5iR/Bxkgdq4vc1TL+O9oqgvYrDG+3mQ0TfBeZNztOoJeaA5r5YBqoWnUgLG2dhrRjDSJz74bXuXsOMjMyfpM9zKUA0D1aR4O62ovDvFosR++PNlNczyLYPYJRDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288577; c=relaxed/simple;
	bh=H2rAYnbGeFgX5saZ/b7X46QHeJfq5kinlY6BpgEnd3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QsCmEVqz78QG7+mMJkSjXGwJwW4+roJ5IXDfpD7GJivmkjnRqA+yDMim6iK2TFVS4lmvYIPVB7T4hnUHTQnddpUjzZfbEdwWbP0/XR/utSRVzmYtHC02QTguzJYkFwjbw/m+5oJeSJqr61IqfX3Ga9XdNwUAbSrSNjkY2OhJ21c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygoG7ksq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so609809f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Apr 2025 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288574; x=1744893374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=ygoG7ksqWNg5LSepdZfB/g+GufHjgHmLbB8kRtXYFazeG1EQ3GAs58DYd41HbC4Msf
         v1iNSbVmc5xO6lBOIWnTCRlJWkcgRpmt5QeV9BiPNPNsMtcYBgTYGsphaDyJfbmTlKYx
         OMpfQRnGgVRDKAHzsMoyN25N7RLLB1ecXlr8g8Jg/ZhRGFzxpfsZCT/6bimq+2srOxzH
         z0TYCHmGdssVtMlbzsZa96s1IzN5jZ9C8wrgW6wOmUqjg7bcAkgEqR1sakAYSyUOIdwD
         nTeNLTql2k00gDCHDEwNOhrI4IDG2r/8HIMXola1w5WpOriOqWJ+Ym//XOVvxNzE/v0n
         C6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288574; x=1744893374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=lORWw+sds7G+r7W1M7zLJpIvfeCs0zGoaU0vAHdLom6d+9Rb7OoEyNMdMqFPSIgSTb
         b/Znkgu96ASc6DpZGoVPW+M765i70QiBT68eoovqRJiuJn5ogyIS4VrtMDCQ77+xrUvI
         nE2D7PEg7ERNdymWc3jp0JqOMcJBJkcJGNWT9pdE12+auDBF8lyjA/n2DPyWdoj2UZgO
         oZEVYDXrXAvdfgR4iNS1uALZVS7Vf9a8+ZgI0MlG1dAsJbRUMh4tqL8mjIkOt0RYhMov
         7W1Qp9agEPYfmvG+A2bwxv3biPZZlQtzW+Aym0MLPSZDaYAOza3N6o/Hr/2vIAYTII3A
         JBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfRgT4S/WflU9Fz79F1vT2OSdsiK1SutX7hUt6Op65BS9EQ+t121oN6itz8mijVfBE1NOnAyGdgiqz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqznytjc/SSwgXq38E1QI0+fgBEzG4zLzvWcOwD5PsM/QQGU7U
	hBv1+3oNtPxxCI7LDu/+FmxthGFmx62w44uJS2bwNiBxjkE+h4/YTG2NJ/T4yGM=
X-Gm-Gg: ASbGncu18chtOh4FreoEmiPiW4eeef8ZrOzdx1BieOl6a+sJvLogytGPVsjAUpvv3Qy
	xG6yy/7/EXfpuZ8iRpAmHYnkCkFntGgM8YCyUtXLt3QXdk6So6sHDx5hbO1AiIZKirC3N5suHoj
	WrB58YRw9GTZO56Fhzaw9k6On/eBl/mkVBy+ac7b59BgN1HAh0Zgd4g9Nm1/FEq/njJKHLj/rtl
	nDUvWJqJHYbVQo6+HZXS47HTzL3tK3f+8NX4238ac0qL13aCmp8y2n8+gr4UZNV1BiZ31qXNVaD
	o1CTPsebPc4pHuyvPpG00/e69orR8yXQ2XS989FagqRCivS4aN4+3UyDUFWHJLAhVr79xt4IsfU
	/j/CZKScpGTSsew==
X-Google-Smtp-Source: AGHT+IFetWy1yp/dwylC0fW3Xc3rkEsOkh6f7DWozfmMsr0xNplY7KcWpRd6urR6Mieq6r6/8yNM9w==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d8f498980mr2285415f8f.31.1744288573720;
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4624182f8f.91.2025.04.10.05.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Message-ID: <17b9ff87-899e-44ca-b902-ab965cff0879@linaro.org>
Date: Thu, 10 Apr 2025 14:36:10 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] arm64: dts: broadcom: bcm2712: Use "l2-cache" for
 L2 cache node names
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


