Return-Path: <linux-mips+bounces-11021-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEBEB4370A
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 11:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F310548B7E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 09:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDEF2F28F9;
	Thu,  4 Sep 2025 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwA1vCuV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900732F1FDF;
	Thu,  4 Sep 2025 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977925; cv=none; b=kGpC+A968+8r/kB/g1hUIQ98000CEiXWJolnnozDspBmkgHJf7uZYhOyyB8DFXg+wfxXlQgVF2XJ8sMuOOWWN+NvVfh25PNlxgOE9WyzTuVo4lPW6kLVTDgYJtyYJrzwkeWj2utO6VnArBDjB1rEhnGSkd0tbennYTU2/r+FwGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977925; c=relaxed/simple;
	bh=hwRTKCdL66HqwgEbowScvq2KPYC+KLHro4EzaKow1fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GiBIuyIYLX9J5AlMYZ4LwdqdSRRC2BGJflOWnbvTRA000X7DEP5mS7zZR1dc1izOMdeB8z9+bpZytRC7Sfavxum+XmJY7+wWVadoyMck2MQWZqdhLLCI2HMRlyAcNBxv5Tk6TzUlORoZ8XmqPs2lsFC4kqwsmJldl24mA8Q4pV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwA1vCuV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6EBBC4CEF0;
	Thu,  4 Sep 2025 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756977925;
	bh=hwRTKCdL66HqwgEbowScvq2KPYC+KLHro4EzaKow1fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwA1vCuVEoTL7+ORmbKtHKFgEqk/PcT3FOmScnEpArXau1CYIqFQ9ek5uemOZZdMu
	 PBka/05eHRsIJeb5mhpluLuCub0kf+qOfUwk7d2k0RJA7UGh+Np0CVUHpePbSRqiG/
	 9NtRGkj/7wMXCzIzrjlxhmlF6QVqbUuwEZSpLe3Zs8rT+JWujk/A44pryJYTSc8DtT
	 IrIp6b6rVQ8pv7dnpb7bKT73z9A/iiA7qs/sRAvGP0ZFzE8tBqOlbRwYXcCeTnq5kp
	 /vlYQ9RnsdFim0vkREDJWppOfUEjUzZcNCKT2l1HlwNOuhSsJamP8TQYU9mNBEBqnq
	 vVYB1A5tme04w==
Date: Thu, 4 Sep 2025 11:25:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Sari Khoury <sari.khoury@mobileye.com>
Subject: Re: [PATCH 05/19] dt-bindings: reset: add Mobileye eyeQ
Message-ID: <20250904-muscular-witty-catfish-9c4676@kuoka>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-5-3f5024b5d6e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-5-3f5024b5d6e2@bootlin.com>

On Wed, Sep 03, 2025 at 02:47:12PM +0200, Beno=C3=AEt Monin wrote:
> Define the indexes of the reset controllers present in 11 of the OLB
> found in Mobileye eyeQ7H SoC. The define names start with EQ7HR, which
> is the abbreviation of EyeQ7H Reset.
>=20
> For the OLBs with multiple reset domains, the domain number is in the
> define name (DOMx) and should also be passed in the device tree:
>=20
>     resets =3D <&olb_south 0 EQ7HR_SOUTH_DOM0_PCI_CTL>;
>=20
> For the OLBs with a single reset domain, only the reset index is needed:
>=20
>     resets =3D <&olb_periph_west EQ7HR_PERIPH_UART>;
>=20
> Some reset indexes are common between two OLB:
> * EQ7HR_PERIPH defines the reset indexes of OLB periph_east and
>   periph_west.
> * EQ7HR_DDR defines the reset indexes of OLB ddr0 and ddr1.
> * EQ7HR_ACC defines the reset indexes of OLB acc0 and acc1.
> * EQ7HR_XNN defines the reset indexes of OLB xnn0 and xnn1.
>=20
> Signed-off-by: Sari Khoury <sari.khoury@mobileye.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  MAINTAINERS                                     |  1 +
>  include/dt-bindings/reset/mobileye,eyeq-reset.h | 75 +++++++++++++++++++=
++++++

That's not a separate patch. Binding headers go with bindings.

Best regards,
Krzysztof


