Return-Path: <linux-mips+bounces-11019-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0077B436FF
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 11:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5017C24E9
	for <lists+linux-mips@lfdr.de>; Thu,  4 Sep 2025 09:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603892F361C;
	Thu,  4 Sep 2025 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWrkVtqF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B262F28FB;
	Thu,  4 Sep 2025 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756977806; cv=none; b=swa0nvY7a0UOWn1eYta72dvj4wYyHXas6xHElBD4AeU/utHFeG6uP3FfYSkiCLHG4KnqV/veqf8O9aKVUNMdfcxqm+9XhJKD2f3hZVUzJLnVRu29jXGrE4m2qOmcmL/tzjVPasQ/Hn1mbq/21G9L5BrPyj7AghkyBZANXl+EQjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756977806; c=relaxed/simple;
	bh=48A8fZ+V/JGLMfvPCJyuTIOZDOI04VyCgo6NPuPDezw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTFvcxd9HgBZTaNJTsnlm1PkU0/JnqOYYGxbn8sQzLfOK1RrIqFPmFVP5Zj3GQRlUdgM++rNBHbULIgbGA1cP+BsrmhOPvAbYULFqxrCbuEjz9CDriyrS6KUKHiL2zBQ7QatGVOmzuV8CCeNFNYxMSJ5rDSkgPTVwtSSRDhwIOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWrkVtqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DF3C4CEF0;
	Thu,  4 Sep 2025 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756977806;
	bh=48A8fZ+V/JGLMfvPCJyuTIOZDOI04VyCgo6NPuPDezw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWrkVtqFpOEn/vqcXv69R9Y8VyJAv55HJC8uyjEL6Jv7YH5nLGwbFoL2FyJS2zqKI
	 boqxquBRITYGUUyam4zTN3CKdCVB4B8lQN0eWCnmw6XUX7NBHL3qvk3QoZ27y/rX82
	 e2f1hGPZEws7JdHy+AbxXrQqJ1H7pnnOqann2WOt7wyNRTuzJO64C5A9V6N+8TxJ5x
	 hzN700usY/PkrFX9COW2nDCllCtxu/QgHEEzMD2g/hAw4bv5bJn0ZFKAHLUiAK0Z1y
	 Djjuh3GkwUozJkafo5uooueXEZpFy1ocIN0wAbbhBaEVukx+C9C8Ef/b3fN1lNI5K1
	 XNGUt4Ojklz2A==
Date: Thu, 4 Sep 2025 11:23:23 +0200
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
Subject: Re: [PATCH 04/19] dt-bindings: clock: mobileye: add eyeQ7H clock
 indexes
Message-ID: <20250904-gainful-thankful-frigatebird-65beda@kuoka>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-4-3f5024b5d6e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-4-3f5024b5d6e2@bootlin.com>

On Wed, Sep 03, 2025 at 02:47:11PM +0200, Beno=C3=AEt Monin wrote:
> Add the clock indexes for the various OLB found in the eyeQ7H SoC.
> For some of the OLB, the indexes are common between two or three
> blocks:
> * EQ7HC_DDR defines the clock indexes of DDR0 and DDR1 OLB.
> * EQ7HC_MIPS defines the clock indexes of MIPS0, MIPS1, and MIPS2 OLB.
> * EQ7HC_ACC defines the clock indexes of ACC0 and ACC1 OLB.
> * EQ7HC_XNN defines the clock indexes of XNN0 and XNN1 OLB.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  include/dt-bindings/clock/mobileye,eyeq-clk.h | 110 ++++++++++++++++++++=
++++++
>  1 file changed, 110 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/mobileye,eyeq-clk.h b/include/dt-b=
indings/clock/mobileye,eyeq-clk.h
> index 8424ec59a02d037ddd5b049cb4b7f26764ae2542..0fe9b98c940cbc479ce46fc83=
fc651101bf1b86a 100644
> --- a/include/dt-bindings/clock/mobileye,eyeq-clk.h
> +++ b/include/dt-bindings/clock/mobileye,eyeq-clk.h

This is not a separate patch.

Best regards,
Krzysztof


