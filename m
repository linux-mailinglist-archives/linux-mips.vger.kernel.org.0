Return-Path: <linux-mips+bounces-7529-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19AA164C9
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 02:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82CD1188607F
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 01:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47194ECC;
	Mon, 20 Jan 2025 01:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="1aYANt67"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6E7CA6B
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737336085; cv=none; b=RP52GUxY+DcBe+SKcf7/HzbitZT4zmyL126LtH5RFrj2a9R8l7OhS5/CiDV+nFfHVkIgalyIcUacFMoEKJBFIZDXiCo7CXnDe+3UYJcSuBefwrGuFW8qwMDG4cvCZTcV7RALYRaV2vjlrRnEWPzjiQZMmkTMgt3XQy5w6MKrmzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737336085; c=relaxed/simple;
	bh=qRb1CdzoGjgfZDTUVPthhnCJCTa4a/xgiWmZKN84E7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeWG1LYgc8RkfHpM7NyKNn6gS35VR+juFDJ0smOoUSKwiL897Fa/poWeVGyuPUy1n1GcIircrX0RsvjZGxuVniLyZaQWJXRynMjNoFQ/xULEeWutCvMTt8JIkA/JJ4HhBImaIEsg/V57c5IeTEiZpKjXJyWWZU7WGMnR6b+Vib4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=1aYANt67; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4FCCF2C00BF;
	Mon, 20 Jan 2025 14:21:22 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737336082;
	bh=AJc8wv5nelhzOuRm3tx7BmCwwFbrkATugWKV4LuMI5s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1aYANt67fcOyb6fRZsCdSHLFRY6UoS26GRPZmMjm5WFE56aGb0ea+sc77OuzxIq28
	 BwH08W/sAH/5+d4k5+38vkEP9/lSrxc3uTTTO8sLzZwhz2zhjd9kUA8LGQfdcvZ9RC
	 FUR7/cmOOVRHu17K6uszru+t/IFkymdgfD9nRKW6SyYABga65wEUh70ft+sthKnhs5
	 1+E8gZCsRZmWj4hcWXJ1++thpcYanpD9aX9VfKcwuDGgpIoRhSVTxWxH/7z0mU3Vdo
	 cGna7aXqRARY8Fj5cYH0E2JfhneDinr7LKO2V+9g0ZIk+J/p97pL52aWyyX15yOi7a
	 9mktbOs2CQFxg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678da5110000>; Mon, 20 Jan 2025 14:21:21 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3120A13ED5A;
	Mon, 20 Jan 2025 14:21:21 +1300 (NZDT)
Message-ID: <44dd0df0-90d4-401d-bf13-3d51188118df@alliedtelesis.co.nz>
Date: Mon, 20 Jan 2025 14:21:21 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 2/9] mips: dts: realtek: Clean up CPU clocks
To: Sander Vanheule <sander@svanheule.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250119183424.259353-1-sander@svanheule.net>
 <20250119183424.259353-3-sander@svanheule.net>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20250119183424.259353-3-sander@svanheule.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678da511 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=jU52IrjdAAAA:8 a=17Lssa-Y1r_eypPUbaAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=udjdHy_fWrGJRxLc5KTh:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Sander,

On 20/01/2025 07:34, Sander Vanheule wrote:
> The referenced CPU clock does not require any additional #clock-cells,
> so drop the extraneous '0' in the referenced CPU clock.
>
> The binding for MIPS cpus also does not allow for the clock-names
> property, so just drop it.
>
> This resolves some error message from 'dtbs_check':
>      cpu@0: clocks: [[4], [0]] is too long
>      'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # For RTL9302C
> ---
>   arch/mips/boot/dts/realtek/rtl838x.dtsi | 3 +--
>   arch/mips/boot/dts/realtek/rtl930x.dtsi | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
> index 722106e39194..d2c6baabb38c 100644
> --- a/arch/mips/boot/dts/realtek/rtl838x.dtsi
> +++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
> @@ -9,8 +9,7 @@ cpu@0 {
>   			device_type = "cpu";
>   			compatible = "mips,mips4KEc";
>   			reg = <0>;
> -			clocks = <&baseclk 0>;
> -			clock-names = "cpu";
> +			clocks = <&baseclk>;
>   		};
>   	};
>   
> diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> index 67261d6fcaa7..f2e57ea3a60c 100644
> --- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
> +++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> @@ -26,8 +26,7 @@ cpu@0 {
>   			device_type = "cpu";
>   			compatible = "mips,mips34Kc";
>   			reg = <0>;
> -			clocks = <&baseclk 0>;
> -			clock-names = "cpu";
> +			clocks = <&baseclk>;
>   		};
>   	};
>   

