Return-Path: <linux-mips+bounces-9749-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2459B02A32
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 11:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839E61C23E23
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 09:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFD92741C6;
	Sat, 12 Jul 2025 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="d0rXqUdY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6427380F
	for <linux-mips@vger.kernel.org>; Sat, 12 Jul 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752310786; cv=none; b=TPHWBIHgVvcVG7fHMz2u8ZxDST5u4cqAmG19hIxZNQLEKjXu2YEmjh1ZAT8ihRXUlIW9G00RB1eQIWqp9WMA7k7beDr7twinkSr7wDaCt6oQaukxww8XTJkco79zPHQhRJchkA7oq3oLE0IIiMKBqiyztF287SuaU5dTd8m1XWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752310786; c=relaxed/simple;
	bh=4Y8ARVgt7Yk3InHf3Nkv9y0+W7JipJUKyhk5X/wdssA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAn5qTRN/+2a1qYyMbi4mcMnJID3bEXwbU72MEQtA/fqbBQ2HzWCT1DhpJtRP1VFBbxxm85GyJFPF7ER4BfYu9RxV6NBK1aBVRZgpE7Mfxy8xpQBZLIF/F3p0dhuww/LlOoQ79icXJmK7nx2fiNskV/7UPoM+t6NXCnhfHBEtGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=d0rXqUdY; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 2408 invoked from network); 12 Jul 2025 10:59:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752310781; bh=Bs7C3OuDjp8spBtZUebXmMmqp+JNJ8zM38bJKoNTVC8=;
          h=From:To:Cc:Subject;
          b=d0rXqUdYYP7ojvHs/CPxFw/4wkiV3jgKjUvitOGmuGyTOVXo3TgNlAvsjIKDj4vJ/
           wLz5GCCHYkDeoi1cDltI232JmOSal/H1F1pkTpv3zc7NJykmyUzNupX24ZVLwVLAyJ
           rDj9EfYv6iExMx3c9U6tBUuXXFZEYLfZbk4L7TrAsE6JtTA2oqQdJUB6g5OjMEDep0
           0+zl5eWAA2YJhSJJbRbtUUSdM+Yu0qZl2DBeAgVbr1HU5Mf/NS7xDvn/cBDg1tqqUR
           EHZGUJYEcMR7zCAxQkGPjUsS6qFvoz9pDJS6sII2cZnwZ60ZttrG/q1dtu7xqTogBF
           XNwtDKxW+fbfg==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 12 Jul 2025 10:59:41 +0200
Date: Sat, 12 Jul 2025 10:59:40 +0200
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
Subject: Re: [PATCHv3 wireless-next 2/7] wifi: rt2x00: remove mod_name from
 platform_driver
Message-ID: <20250712085940.GB9845@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-3-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710200820.262295-3-rosenp@gmail.com>
X-WP-MailID: 78faf179404bc1cccf11415900ca8dfc
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [4eIB]                               

On Thu, Jul 10, 2025 at 01:08:15PM -0700, Rosen Penev wrote:
> mod_name is a legacy debugging feature with no real modern use. An
> analysis of the underlying MIPS setup code reveals it to also be unused.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
> ---
>  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> index 701ba54bf3e5..e73394cf6ea6 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> @@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
>  static struct platform_driver rt2800soc_driver = {
>  	.driver		= {
>  		.name		= "rt2800_wmac",
> -		.mod_name	= KBUILD_MODNAME,
>  	},
>  	.probe		= rt2800soc_probe,
>  	.remove		= rt2x00soc_remove,
> -- 
> 2.50.0
> 

