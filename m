Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268851A982C
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 11:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635974AbgDOJPf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 05:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635968AbgDOJPa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 05:15:30 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0720C061A41
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2020 02:15:29 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q19so2829602ljp.9
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2020 02:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=69T9ZGqlIy7aImGgwrs75/hfGvsilwincFfwWiQFobg=;
        b=QmYfPFaxi91fzgnYBmzUnbNLZxOG0Qvv9XHtQXYm/D+sTky/Yc25iONfxBlY/7wqsB
         fRtQYUCgyxgK4p3vjoCdR1E4K1nsTfSz3bWGNyVBA7FGlzJ7W7xAZUor5i5MsgsA0hU6
         1sVmcbUlUP1cDxtb+3jC+HIaRfadnrNzRFcNUoV22EicSEE5dlVf6RJieO6E9yC3PemP
         qMb4hRiVMAXxE1MiwCuSopLulXmT+VCKUbpRSEH+BCrvLMZ4tKOYKabhdtdCWnXgNuRk
         9lpcy+vti6/lVgJJk2gVDZg/BOarCjaD0Ak6NlGy7RcdUdyYk3SImWtP+7AMtEZqo2NA
         +piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=69T9ZGqlIy7aImGgwrs75/hfGvsilwincFfwWiQFobg=;
        b=PfQlXDCnLdJKB/I7n4odrgSd52e0xivlHCx4mvr8PYxKyX7v76X+NNdknM0jiYb36/
         y+uopESvoG3bIdKHymcZpXZ9ebKJSOYiFxCtTLKbH7XIbxV0eCttTFHRPMetZb0igVvL
         GGSPbasi+/bTaATL9uaEQ25RNcM9HmG5KqMd2yvTPdpT7kdQk1VcsnFaPiQxa873Jhkw
         dWx7pW1didpG/cTEVAobW7cDMI0TQhSDU/07+3ETVrEvrQwHv9ImzdS52EK5r3QM9jKp
         D1eSJAmlWUrkVo5UDjH/JfEzmkRBqRbs3MwEdkYmPhJqFmOvTGvFVhH2uuY3oPP2qMuX
         OVRQ==
X-Gm-Message-State: AGi0PuZox6I50Rx9SuinYBbyPlL37kighaDBW01xCoAMndnIKj9XBXFU
        R5PqhePe239KBtHxTwW/Wa3u0Q==
X-Google-Smtp-Source: APiQypJt4bgg1yrZutHX1jnCNUTiEGk5PA6dcO1xYRoqGEwzcnoywOgKJNgJRfEssnCyTOQijG6tmA==
X-Received: by 2002:a2e:6c0a:: with SMTP id h10mr2542581ljc.195.1586942127891;
        Wed, 15 Apr 2020 02:15:27 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:81b:6e8d:a1dd:9870:4166:dead? ([2a00:1fa0:81b:6e8d:a1dd:9870:4166:dead])
        by smtp.gmail.com with ESMTPSA id m13sm12192031lfk.12.2020.04.15.02.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 02:15:27 -0700 (PDT)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Jonathan Bakker <xc-racer2@live.ca>
References: <cover.1586939718.git.hns@goldelico.com>
 <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b6ffa74a-acef-f329-0d9e-981483499e16@cogentembedded.com>
Date:   Wed, 15 Apr 2020 12:15:17 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 15.04.2020 11:35, H. Nikolaus Schaller wrote:

> From: Jonathan Bakker <xc-racer2@live.ca>
> 
> to add support for SGX540 GPU.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
> index 2ad642f51fd9..e7fc709c0cca 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>   			#interrupt-cells = <1>;
>   		};
>   
> +		g3d: g3d@f3000000 {

    Should be named generically, "gpu@f3000000", according to the DT spec 0.2, 
section 2.2.2. It's either "gpu" or "display" TTBOMK...

[...]

MBR, Sergei
