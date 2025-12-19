Return-Path: <linux-mips+bounces-12530-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE00CD1EE9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 22:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C75A303E643
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 21:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF591341648;
	Fri, 19 Dec 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHgWn5L3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3721E520C;
	Fri, 19 Dec 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766178619; cv=none; b=HvaCIevVmpj1nRQqK6Gn/4ILeeOmUFA9LM0rXXxRWmuX42Spl+MZRk4BOCAW+2vCYJV9ilfktDfIedHNapDvuRnpPw/Qe2pgMCe0Srrg6RxzbHo2rpiur5+/IGMq4gqZgWkGiblGllnlv9swrAGpRsIe8rnakgVFPPGyvV1VGYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766178619; c=relaxed/simple;
	bh=pSElffqhUXoNWi7Xq9cuand1YUuQxMSn64bOhhVsLy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjEljCg5/vP2qmOG5Ma83hlrw0llr4BC+bLY8S+XpOpwP45qZ8RkTHJvXCMZ/LThGssXHZOSyMPeaE79zCBV65Tx9fk17NaAR0moWfbG5plJmyNZ+ltu5zwHP837sHqWTE7W2f7R+eT1TgSNIIk4G2C0Q0JnNvWFZjrbThFlewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHgWn5L3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA66C4CEF1;
	Fri, 19 Dec 2025 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766178619;
	bh=pSElffqhUXoNWi7Xq9cuand1YUuQxMSn64bOhhVsLy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHgWn5L3SIPEfIN9p2uhk01/SVOJgltoRlYl7pq0bC7Og4dGl1wn3F6T3rWmj66gC
	 YVdgPKiiGUWS8VRDr28si7f02zYGbkWfM0MUiRdXUB1M8zP7KvWt+1RrdiRay7s5+V
	 JFl5PPh8FcmmPA+Prpbs9zmjhB5ARE1qzIN5+9nfs+bx3G1P2SvfQ8/Pdzq6oVZUzf
	 pRkkn20KYZckWaergHdcdOBRNLgy4UC4OGrnJn2nhglgRgZfccwEbVZb1Fr7NDl0pq
	 Layde6II7wetgwb+FavC/2jKf83tbMpuFgj6hWElasO3uNTt6hWLheI1SLq1Sw7N6P
	 jWiBQaiKMShhw==
Date: Fri, 19 Dec 2025 15:10:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
Message-ID: <176617861588.3941955.6842279246230193415.robh@kernel.org>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
 <20251217-eyeq6lplus-v1-2-e9cdbd3af4c2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217-eyeq6lplus-v1-2-e9cdbd3af4c2@bootlin.com>


On Wed, 17 Dec 2025 14:35:52 +0100, Benoît Monin wrote:
> The "Other Logic Block" found in the EyeQ6Lplus from Mobileye provides
> various functions for the controllers present in the SoC.
> 
> The OLB produces 22 clocks derived from its input, which is connected
> to the main oscillator of the SoC.
> 
> It provides reset signals via two reset domains.
> 
> It also controls 32 pins to be either a GPIO or an alternate function.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  .../soc/mobileye/mobileye,eyeq6lplus-olb.yaml      | 208 +++++++++++++++++++++
>  .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++++
>  2 files changed, 245 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


