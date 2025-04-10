Return-Path: <linux-mips+bounces-8535-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C2A83A65
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 09:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F62C189A372
	for <lists+linux-mips@lfdr.de>; Thu, 10 Apr 2025 07:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298972054EF;
	Thu, 10 Apr 2025 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIdOdnh5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D1A204C23
	for <linux-mips@vger.kernel.org>; Thu, 10 Apr 2025 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269069; cv=none; b=fQp688guGMZ4bKvxVd50PN40hrBEnNFQkv5NS+dGrISqPtj9XyVlg9hgoa7nIvwV9NBxopWqTz5Pkhh+8AOFQuqShIaa3y3T6Ho6lyRkvIGcmaGSiPPIKQq5LPMFmiVPWmvVb2iowOINIEQ5g5nKgEeC2urE32Zyx0uIiuNgwP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269069; c=relaxed/simple;
	bh=dvCmIESeU+0C8gMiKn7xzTjU+gOvecKI17trA15juLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOquWnhPZHuAT7q0TkLfIv26B2puZGFtNFyvKeL/K/AupIPQCDzr+UWsRdTrGLmyqFJOHag2y+Li6oFc47doCBcCqIThXqkLksGUUoEZe4GxOzk9yHXcvCnmRVL6f7wJAKdL0qaH7yWGZIiFV9LCvSQ3MeKu6awdf8/Sf4xrsbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIdOdnh5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac289147833so94265866b.2
        for <linux-mips@vger.kernel.org>; Thu, 10 Apr 2025 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744269064; x=1744873864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3OcYzRuci4DVDvTV5wL2NFanwr7+BVH3bP+rdckE45M=;
        b=tIdOdnh5oAZhGDM7uWD7RpFi4PXKOpQH6bh/n6RPVExFaUig3IrrpAlmLffcoAUVEU
         MX014UXDe4T40u/EftWo4s5x7Tfbl6ddorAyUyFoojwWXHNZPXzCUVvJ0BKuLt2Zln56
         a9ZaXziLlH5zb79VpOa4J9zfhPBr5SL1YX7Gq/Nb66faCX0wibrTNMCRCeDleyom/yMp
         MeUi6X82iteHze09A2ldUfnKq+mbSGsEF/6uHwsfp3dBGY+oM0HYZ5aGwa5pOHDHc8Ay
         CK11lSEjbcHMJzrXDAILKdg1PmRsd1ujsrGNBAswtbvAcRded3p4H/9/qzWLloQS36HJ
         Kqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269064; x=1744873864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OcYzRuci4DVDvTV5wL2NFanwr7+BVH3bP+rdckE45M=;
        b=Ghfvqy4lKC9xirfZhKMXc8WnZBgcoaW/x6xIArkguaS8ZsJ8uMF49O25t8A8+722eD
         gqwBt8CdYbUNvsB4yC2MUVtmxrjRxCcuOrtbk8EQ6TsEDqpUsjQiFLq/V1snYU37bp4K
         hZ1ZxQ9I3ALpgvrKNnSXsq0WAjBgKVlLns85GbIAFkrwu2PNqikaRuk3f7HKfd41wOi8
         AlSiXzEhLHvKcGpgqjQxScHAsmuRws7jPwuyfI6BrW5t1Ayknw/KO1GTKuoR+Y7q11Kh
         w+0r33rL9MU51V1X5n2xTWZxW1W38hJi0keQsoZX8J48QjdBgNrjdoBDipuZDLIX9RFm
         QScA==
X-Forwarded-Encrypted: i=1; AJvYcCWwpRdrwe9ITnJQtGeiYv5ADrtWptQnff+XaRHC8jZTZBQ9QkcnDKb7PZOEFBvlTdbfeByJlxtqF1k0@vger.kernel.org
X-Gm-Message-State: AOJu0YwGCys9TpHTooilYyur3WRfE/gwi+9LpJfGnxTuDkYaQ3vHQnyJ
	UWtgkwDj4DkjJtwhYKslN60wez9OjAbp9HpUOH9KvEPecspA3AJt8lRHZs0l4fc=
X-Gm-Gg: ASbGncs8bUawkTCTysyl9LO6ijcDz61IoF1vozL1TThWz0MVy03RxbGuZuwwQ1OYufn
	BpfEy/RRVNQkfoeWeUryK07EEZtC7XDmEhsR4iK+lu7b51zJ7lMj77sNX/onyy/hBSv2GpXykOe
	EuVMS+axIL66Ip+Tx+MF0lNdaTZTE1MxsmPZdbrf4uxSk59kOLHUuOzLoKBy4U4Uk8eNGXsDLkm
	QvyLxm8IjnSmvm2tkrr203bKm+eakdWHe2runDLrN8yfaJWtsZX2RgtVOD2sNqcyajXLPSmS5Ws
	OHoubZ9NHnbFn+xakQyzzBL8le/bvnVSlxG4qSDzw8KdWXq98JM=
X-Google-Smtp-Source: AGHT+IETfspJRi9jQhAHy7G+NAIq/HN8GQhfewV/oWn/J+Tx4X7F7gfIyNI7Jkc9sjEejt3cHqWuJA==
X-Received: by 2002:a17:907:da0:b0:aca:a1d7:a830 with SMTP id a640c23a62f3a-acabd185e69mr120878666b.13.1744269064280;
        Thu, 10 Apr 2025 00:11:04 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ae8a:4fb8:9c71:6be])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3fcdsm219989266b.107.2025.04.10.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:11:03 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:10:57 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	linux-renesas-soc@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
Message-ID: <Z_dvAT7LdR7xbH45@linaro.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
 <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
 <CAPDyKFoZ7NfN+pkCPnusvTOEaxbQhr=1FJqzdDGrLcKAzBpGyQ@mail.gmail.com>
 <66f8d957-f7a5-4aec-b8e7-5bcc7ff7f569@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66f8d957-f7a5-4aec-b8e7-5bcc7ff7f569@oss.qualcomm.com>

On Wed, Apr 09, 2025 at 08:35:29PM +0200, Konrad Dybcio wrote:
> On 4/7/25 6:27 PM, Ulf Hansson wrote:
> > On Fri, 4 Apr 2025 at 22:41, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> >>> "rpmhpd" is not documented nor used anywhere. As the enable-method is
> >>> "psci" use "psci" for the power-domain name.
> >>>
> >>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >>> ---
> >>
> >> "psci" is what we want here, but these platforms require some more
> >> massaging..
> > 
> > So this isn't for CPU performance scaling?
> 
> Nope!
> 

Huh, this is definitely "perf" (= cpufreq) and not "psci" (= cpuidle).
If you run blame on this line you get to:

commit 0ec7bde7b590f8efa5823df3b52b32dd373060ff
Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Thu Apr 8 22:34:45 2021 +0530

    ARM: dts: qcom: sdx55: Add CPUFreq support

    Add CPUFreq support to SDX55 platform using the cpufreq-dt driver.
    There is no dedicated hardware block available on this platform to
    carry on the CPUFreq duties. Hence, it is accomplished using the CPU
    clock and regulators tied together by the operating points table.

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ec7bde7b590f8efa5823df3b52b32dd373060ff

The OPP table looks like it's supposed to set SDX55_CX performance
states according to the chosen CPU frequency. MSM8909 has a similar
setup where the CPU is supplied directly by VDDCX and we describe that
with "perf" too [1].

What I don't understand is why the name "rpmhpd" does not appear
in any driver. The MSM8909 setup goes via qcom-cpufreq-nvmem, where
"perf" is directly assigned for cpufreq scaling. I can only think of two
possible reasons:

 - The power domain is implicitly attached to the OPP table(?), because
   there is just a single power domain defined on the CPU, or

 - This was never working correctly.

For both cases, I think it would be best to change the power domain name
to "perf" like Uffe suggested.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-pm/20231018-msm8909-cpufreq-v2-0-0962df95f654@kernkonzept.com/

