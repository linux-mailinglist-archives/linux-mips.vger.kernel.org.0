Return-Path: <linux-mips+bounces-9750-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF96B02A63
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 12:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36062A411DE
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 10:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315E4274FDB;
	Sat, 12 Jul 2025 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="a36fHUXO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87123273808
	for <linux-mips@vger.kernel.org>; Sat, 12 Jul 2025 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752315265; cv=none; b=uO4zbrBXpFktzXDXvjm+QKuMcmGKYmDRoYTKEt4mKMYTcGnBf8jHYJo/IM4x7iXDXqYbum/tl+GpBZkVLjA77xhE6x4wJzUYx0A9Zx4yAh8u8DB1IESAm7tNqwg6h2uHsJsIOBeCBmXpaMLoqgb131Bl6DR/nll0CubCLVy5zW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752315265; c=relaxed/simple;
	bh=N6gqSrwpU3YJUqSkFSWbqKkZODHn0WVNd3fQsNo4eIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFJuVzQNexBuFREaPdKQM89u6jnrs3nQWHK0peA9NFCX8BoVA+9Nl+cr7Hzjr2quGPcg2A2ShxvHX5oF0Yn8+I6CJqE06NLSkvotNRfpQaLn+PhvcRv7TNVbyN26QVCiU8MirD5fRA+go3lwfhnmios7NmoZDrqR71sUTbWWUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=a36fHUXO; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 15256 invoked from network); 12 Jul 2025 12:14:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752315258; bh=mzg8lO5KIWEU08V15rBSRsSDmVdIeTgHnB50TvY1vOQ=;
          h=From:To:Cc:Subject;
          b=a36fHUXOcNPRuUSP7ZQrGd2Vf6g1xWubJpz4W2LR9PcwCuFR7cK6+UhiSmrCE6hJ9
           N5pGQJlvvec5Vwwxsh9agFmMe4kPrBSZoIf/1x0Dk/7wl5+Yvp5fxb8z4pDVG23293
           Vzs9R8ELkvaWQii0UVwYkY++9+T1u8SS7pqqiNdVUOqr+y4iJ6PL6J8q5DIWp4SOZm
           qKoZru5BVAbp2SCrosRxKtUPNPMTtEWGfzz5tLyOAf/TGj7B3Xjf9juc/YO3ajCfwY
           kYQkhwP6EQFZXDvEZAreMfrsSKS0MlJ+mLw4r2hkiJlFG6J3Z3qKBOcGP9UAjur5Ds
           6+j5ixi+Pws6w==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 12 Jul 2025 12:14:18 +0200
Date: Sat, 12 Jul 2025 12:14:18 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 3/7] wifi: rt2800soc: allow loading from
 OF
Message-ID: <20250712101418.GD9845@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-4-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710200820.262295-4-rosenp@gmail.com>
X-WP-MailID: d2a620c7c6ee0186a70cc98c7227ea22
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YQOR]                               

On Thu, Jul 10, 2025 at 01:08:16PM -0700, Rosen Penev wrote:
> Add a single binding to help the already present dts files load the
> driver. More are possible but there doesn't seem to be a significant
> difference between them to justify this.
> 
> Use wifi name per dtschema requirements.
> 
> The data field will be used to remove the custom non static probe
> function and use of_device_get_match_data.
> 
> Added OF dependency to SOC CONFIG as adding of_match_table without OF
> being present makes no sense.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
>  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
> index 3a32ceead54f..a0dc9a751234 100644
> --- a/drivers/net/wireless/ralink/rt2x00/Kconfig
> +++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
> @@ -202,7 +202,7 @@ endif
>  
>  config RT2800SOC
>  	tristate "Ralink WiSoC support"
> -	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
> +	depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
>  	select RT2X00_LIB_SOC
>  	select RT2X00_LIB_MMIO
>  	select RT2X00_LIB_CRYPTO
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> index e73394cf6ea6..db8d01f0cdc3 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> @@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
>  	return rt2x00soc_probe(pdev, &rt2800soc_ops);
>  }
>  
> +static const struct of_device_id rt2880_wmac_match[] = {
> +	{ .compatible = "ralink,rt2880-wifi", .data = &rt2800soc_ops },

Why do .data = rt2800soc_ops here and use it via of_device_get_match_data()
in patch 5, insead of just use rt2800soc_ops directly in rt2800soc_probe ? 

Regards
Stanislaw

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rt2880_wmac_match);
> +
>  static struct platform_driver rt2800soc_driver = {
>  	.driver		= {
>  		.name		= "rt2800_wmac",
> +		.of_match_table = rt2880_wmac_match,
>  	},
>  	.probe		= rt2800soc_probe,
>  	.remove		= rt2x00soc_remove,
> -- 
> 2.50.0
> 

