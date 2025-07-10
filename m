Return-Path: <linux-mips+bounces-9718-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC716B001BB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 14:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29250168077
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jul 2025 12:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B771255F22;
	Thu, 10 Jul 2025 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS/NKbbb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD2F2512D5;
	Thu, 10 Jul 2025 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150541; cv=none; b=sJT6G1F8vK50JkYJoDkvpbu8/ssigGuFptReLC1oVFxKqUlNBHism+mzuZOInARuBAtWMyWHNxe5OhgL9oSR84g06BcBa+gkhq58SpSSt4fanw75TsFv20mtfo3haNZUpZcvaLYhEz5pR96j2xlSYwISaJGJ8xSuS68TgH0C4cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150541; c=relaxed/simple;
	bh=sQOPnAhrIqk/YUMrmud2PgUHpRCtjjpsm87CkFOSb3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULIhl9/jd9WeVHNSWNndAZsPPNvuwy8keXS5v1iByDHohoBgkiao/rQLcm5TQtPfA4eLBPiZuZJwzLtu9DTHgM6GesoZUfhGSt3eGQ970YbXAdU2LgmyYEec4l9Z9GGSFo/lHvhLSRJaLfQfXCxvM0zLsF0PaSVLWxVthRVEpeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS/NKbbb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12773C4CEE3;
	Thu, 10 Jul 2025 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752150540;
	bh=sQOPnAhrIqk/YUMrmud2PgUHpRCtjjpsm87CkFOSb3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gS/NKbbba8qGPeZvO1nIdW0K/nyVlK/OtONpk6V/osVM2RIywQatZqlBTmQIkUOor
	 YFVCutViFWGp9IG3KPTMkdPR047oSQJ9/ZmepoP2BiykIVK8GP3oL114wRTHwSAA9E
	 lUZBwbFfOIdf6sA3groal+nnVZkHz37CXibUszm3uDTn+uqBZ3SZZVw4Z2ED3rJXmL
	 R6xmZN7MtoumI5KX5EIy4H877CZXu3HGdoFetXgECBbHr3qID0gZ9FS1sHPwyWQS+B
	 LBdf2dp5DxcC+vkiktG3MpDTaWSI4xiMKPQSK/rZvnuI4cMe9P87oZaemDUUAvtY3+
	 wwjz8mpkp4i5A==
Date: Thu, 10 Jul 2025 14:28:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] MIPS: dts: loongson: Add LSGZ_1B_DEV board
Message-ID: <20250710-wondrous-copper-bonobo-b11dcd@krzk-bin>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
 <20250709-loongson1-arch-v2-4-bcff6e518c09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-loongson1-arch-v2-4-bcff6e518c09@gmail.com>

On Wed, Jul 09, 2025 at 07:05:55PM +0800, Keguang Zhang wrote:
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		serial0 = &uart2;
> +		serial1 = &uart3;
> +	};
> +
> +	chosen {
> +		bootargs = "mtdparts=ls1x-nand:16m(kernel),-(rootfs)";

And if someone wants to partition differently? bootargs rarely belong to
upstream DTS.

> +		stdout-path = "serial0:115200n8";
> +	};

Best regards,
Krzysztof


