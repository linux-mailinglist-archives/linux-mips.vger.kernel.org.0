Return-Path: <linux-mips+bounces-9748-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC62B02A2E
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 10:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61D001AA080F
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 09:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C5827380F;
	Sat, 12 Jul 2025 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="WKjhJ3Md"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDE26B755
	for <linux-mips@vger.kernel.org>; Sat, 12 Jul 2025 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752310779; cv=none; b=HOq91CvlUwg/+9UAAdUBJ3945YCjGdoVfl4avy6DdOZF1ofR23aRFTKJ5IVPuPHIlkVFop8y44APfBBoSPUW86VWEkpCqR3JClVZ7AKh8xHk2lXwd54Bw4SU1oiyrffd86brK1W5EojS1IzU0Z1zIq1iaJ79s4+wH8C4RRIYge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752310779; c=relaxed/simple;
	bh=6RREnLfBr6vaToFnee4iQdKCEbQ4E+5QoB/pAJOaHzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrPhzEnOQ2cuxMm55hWTJswo4kDlu+cc6i4dHzq7gtkXpEHdomlwpsVgYRuLGIx95/Q/ZfkaQZQ1+8sRaHt6A/lkL+YY2uBdDAW/uQHlhhzwLj30z8srTIuVh9uobOkXfdKAyu0rXXsha5z0JjaozCIHwKiq45nWKgFyiV4S+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=WKjhJ3Md; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 13802 invoked from network); 12 Jul 2025 10:59:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752310767; bh=eSJuXP2Tn8QwaAeo4iI9YXDlY+NdjeXSDkoE+IE9RBA=;
          h=From:To:Cc:Subject;
          b=WKjhJ3Mdixt+XahfZtVpGIKxNl6vwCFnCrUmv1nrBUwefTsoSFzzP4njmWdxKBG/H
           4bffCe3DN9oy8hanhud3aXVyt8L2o9/zJgSVjtZ+Wy2K0vJkYBn1cvX25Q58jiafFR
           8k5pziuwtMYlyodb8k4SJA2EHysbLGfP6EjZtUA8B+hNcosbxLonJDC14OSgwNa8FT
           NEWO9CosPdk7R0ibPT6gBZdd9xRGwUgQUcst0ilt6SBq/+sKBlt79iHxBDNwvu6N0F
           WrVINziE9wyjtoNtxYpqnm5Wv+o9QAqEMkInOBskZnEe+VVYbumVWup7ki+AiFIZBs
           kCltJzhUOGttQ==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 12 Jul 2025 10:59:27 +0200
Date: Sat, 12 Jul 2025 10:59:27 +0200
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
Subject: Re: [PATCHv3 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
Message-ID: <20250712085927.GA9845@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-2-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710200820.262295-2-rosenp@gmail.com>
X-WP-MailID: fa94b3e93e05bf3e9316b9cc31b4a93a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [wTOh]                               

On Thu, Jul 10, 2025 at 01:08:14PM -0700, Rosen Penev wrote:
> While this driver is for a specific arch, there is nothing preventing it
> from being compiled on other platforms.
> 
> Allows the various bots to test compilation and complain if a patch is
> bad.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
> ---
>  drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
> index d1fd66d44a7e..3a32ceead54f 100644
> --- a/drivers/net/wireless/ralink/rt2x00/Kconfig
> +++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
> @@ -202,7 +202,7 @@ endif
>  
>  config RT2800SOC
>  	tristate "Ralink WiSoC support"
> -	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
> +	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
>  	select RT2X00_LIB_SOC
>  	select RT2X00_LIB_MMIO
>  	select RT2X00_LIB_CRYPTO
> -- 
> 2.50.0
> 

