Return-Path: <linux-mips+bounces-11020-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64FB43706
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 11:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C7F41C275FA
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 09:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DB92F0698;
	Thu,  4 Sep 2025 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHrg2EZo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9882F2F067A;
	Thu,  4 Sep 2025 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977865; cv=none; b=eCaSjwUzHjZQPf1JzY8nngHXLhVF4mcIl89uxLJuqh0pJLbmCIZV3P3ekcj0+MZU02X2hxaigm1MoaNW3q6Y0TH2zPCKGKrYEBdmN3DmptE94jBJwFzaWiMtbdJTYlfmRipY+LCyVFsWewMj75EAay/hgZg1MX/UfGVJ3Z8p1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977865; c=relaxed/simple;
	bh=5Q3OayVDVqzXlyskz8GyLR+ndFKddFlfagj1uDzSKjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYfoOnuxnOhQ+Nzjq4qKGFQAaiOynx7cWFOlyDtCw4OKxgFlFlACaRVlGViuIaK/G3AZYVAB3v3SXt36rUsEh0bklHOVIGVf06E3gkUJbZ82vBUdf+DXTxKlb2w0cLme69YanMRNd3ptEMiPaCEM6yIvVOQeKC2M/nfuatCsAbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHrg2EZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C17C4CEF0;
	Thu,  4 Sep 2025 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756977865;
	bh=5Q3OayVDVqzXlyskz8GyLR+ndFKddFlfagj1uDzSKjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHrg2EZoJW2MILTSEzfWgSOLJvcMo/ermhVsR3FO3+IRuGTdIYWBqwjKSjRJYkVYG
	 /KuktPyrP9AwNrs2EweRAhQ+rxPk94oaqq0+He5qvIpWAgW9Itcy3jJM/oC52LFXwc
	 4/I84kdanOMxUAXMo1kxa9ejMxMpP7/AhR2Us2ncmEl75IBEQyiOce02JJxUk/23kS
	 Toy0Ki0eFW3mXBB/ep02/40ANqKeJIt5ueJzqKhXI5G+UDxuKbPkhIgNzMgLt4fXOU
	 Mfs31AZj7XLJwTmXn0vVSpaBhPkUqCgbUgbporEQjxo//zN2I1w4Xg+PDUXamBWw78
	 YT2Oj5t0D+AmA==
Date: Thu, 4 Sep 2025 11:24:22 +0200
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
Subject: Re: [PATCH 02/19] dt-bindings: clock: mobileye: rename to eyeq-clk.h
Message-ID: <20250904-warping-literate-myna-f6d633@kuoka>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-2-3f5024b5d6e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-2-3f5024b5d6e2@bootlin.com>

On Wed, Sep 03, 2025 at 02:47:09PM +0200, Beno=C3=AEt Monin wrote:
> Rename the header from mobileye,eyeq5-clk.h to mobileye,eyeq-clk.h as
> it covers more SoCs than just the eyeQ5, but also the eyeQ6L and
> eyeQ6H.
>=20
> Also changes all includes to point to the renamed header.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  MAINTAINERS                                                           | =
2 +-
>  arch/mips/boot/dts/mobileye/eyeq5.dtsi                                | =
2 +-
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi                               | =
2 +-
>  drivers/clk/clk-eyeq.c                                                | =
2 +-
>  .../dt-bindings/clock/{mobileye,eyeq5-clk.h =3D> mobileye,eyeq-clk.h}   =
| 4 ++--

NAK, stop doing such renames.

Look how other well upstreamed SoCs are doing this - you want file per
SoC variant, so you want SEPARATE eyeq7 header.

Best regards,
Krzysztof


