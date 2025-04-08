Return-Path: <linux-mips+bounces-8520-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AEEA7F47B
	for <lists+linux-mips@lfdr.de>; Tue,  8 Apr 2025 07:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78393B3C8D
	for <lists+linux-mips@lfdr.de>; Tue,  8 Apr 2025 05:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2570125F798;
	Tue,  8 Apr 2025 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5rDNOzu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68533215168
	for <linux-mips@vger.kernel.org>; Tue,  8 Apr 2025 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091844; cv=none; b=mNVLuZouzEQKqsvOkYOev4d9GZhPSJ8j4qTtOFQFriItrwdcD/sHWXSjmZ4ptiwmFs5NlmaaFkxZ80FJSvhN9YbkUiuz/f0f9pyIkHZvYIR1TcnRnNPf3NOVITI9nnAou6GuwH1jaUjNA7vfJTJuvoVUfWzdgwiYhHz9gCU+dz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091844; c=relaxed/simple;
	bh=8doy6BPiTFR/YKQpo3lR/yUwQX15c/frOMlav3ozNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkskgR3mog/aKFtM90RZ05McAXvsx1oSCWAL+dkbWRfq8zJ38J8NuizCvciiSbiHQaSZrd1o7mNNkW1fvi1fItI0eTZA5polITPGa2J0Hl+WUREY3JwFw4GcprtAOOKwgol/xYGVAR9FaNAFxgHa4D77Bx8ZDBa1y+phR2cFaks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5rDNOzu; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so3852448a12.3
        for <linux-mips@vger.kernel.org>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=Z5rDNOzuBQvyuDNrKy2P269s0ejKtK6vbzQo/y23vsVY9AKPkpowPYhA5tFknWCqAY
         B7sIQZbDXW05/zjt4SfDYqDz1DliHNyGLxRkqzUYO2EXT2DHol2D4VRapZR1bP2cTDne
         p2MydcPR29d1bIxXN1VKP+QVnfX6iuFhiwcQRDU9HGImPXbSMJPU8b/Ps8V7U7IafxCf
         B2DsQWdMj54gu7EKUVF+FxdAwOGYzsjPEVNVfQtiMf9cuaVNeQhEdEiBEd5u+9/IIVDu
         caPXVsvTU9x5gFQ/tRuIoQpLZIeKmG9SFRvxS4U53laRJmLiGpq3lMNg6oVJ+u7Xyb3k
         T5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=rJzgLfLUFR/7TK7ru0MGUqQj7/kk2KWSyMD1PxL08LQSMQzsjUsYaubkrIftml6kPH
         wFWROsRtW9emtdEECLixVxoJPNY1SCwJ031zroX/sTuwFwlS7XaiwwknVzzbw7Y7sf8f
         24vQook2iRiy+e5QRHFf9gat4II0+PXGJZzxJIseFe/PeKN1+Lmko5JcOGH7R+LV6Xim
         5OTpFnypEtl/fwWYEPSRMY2VlIaaHcU665GKywPePC+q9QbSO1jtuPDLw1WAeNfh+i2N
         s0D9EEIciT2WEeDIsxf6XbLFjEh9bd51h9JXVDQ60v4jU/qEzbQ+6nbNjFgjawyxuH35
         Sdzg==
X-Forwarded-Encrypted: i=1; AJvYcCUA/O25iDbTdp4c8+7oLjR7HNgmuaHUcf2W+L+7hE9/om+1JR8/O7mVZKXQzSUgZ+/QK9ZcqyXv+6aT@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3wJ4x+jHbgYA0lCwfMZoagwHmLtJA87Pj7RTAlcjgI/RmbLX
	sW8jLe6SY3axq/7XJOMS+Nflih9X9js1ho4LLnBghWPHOKkT8uJKn9PsRMZNXqI=
X-Gm-Gg: ASbGncsRQDPtJqiHKkt8akSITyfX3TwYg9i1weigPUjb8hgmO2zoehj+brKwiR031ox
	wpv/VOaMK+CAamga1KdNTPwvbOSGv2Ey05n0zRaq53LVakiurfyhXWjHrAgKMNs7azkjanAvP39
	ZT32p5IFc8JCcZ9o3NwAi/+fNdf6/skI3/FMu4Izq1R6H/mO5XrLoWYkWy1OnVoEgbRmkIDoV+2
	1+Oik7xkn5mjswdHImSrYk1ip6FUtvNZPked8SQ2+RVvhb+eDq7K+TR/heu81XRABWSW2wMChqt
	IdJcKF8l5Ig9ZF6ks7nDYEeHLEdiyDaTaWG2XqvzbseulA==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

