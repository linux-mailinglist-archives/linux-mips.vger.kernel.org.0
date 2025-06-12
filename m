Return-Path: <linux-mips+bounces-9266-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F54AD695B
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 09:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7165E7A670F
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 07:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E12217704;
	Thu, 12 Jun 2025 07:43:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F412147E7;
	Thu, 12 Jun 2025 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.59.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714227; cv=none; b=PXAVlAn32siuykS9wpqChlg9HfndYGP5ildpN5w2GSzREmpNNBh3FyFDPZVhsL7Jxf+VH/SLGn5Iycuenlt8uo49GAouT/HD7rUtGS6AZ2xpGjZw9C67wxvMXy2AwbIxj9oXCaYaTyOzO4+mfJfwX62EeGtBcnjJdO+FJeBUDtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714227; c=relaxed/simple;
	bh=vnCbR/HzZbgU5wNd8mKc20nhhKPSaZCgt9Y3cvhubt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZJ3VBX19fiAfTUG8fiSMJidEYHiZA7p7tTETXNPQhvLxD1cg2FkmrQFEeTLazCqim+OzbNiAsC0Lp0IbfkX0tIV+a9nE+khemwSrTUILaiVnXLhgzHZ8OmHWwwRddsmLOOK+to1AP5tBo82ACvncxHOCqybzU7ntwTQwXVbS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=80.241.59.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4bHvRw1nNcz9tf2;
	Thu, 12 Jun 2025 09:34:36 +0200 (CEST)
Message-ID: <d81d54d9-1e22-4895-9700-c4f4a50026a4@denx.de>
Date: Thu, 12 Jun 2025 09:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 1/3] MIPS: dts: ralink: mt7628a: Fix sysc's compatible
 property for MT7688
To: Ezra Buehler <ezra@easyb.ch>, linux-mips@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Rob Herring <robh@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org,
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>
References: <20250611194716.302126-1-ezra@easyb.ch>
 <20250611194716.302126-2-ezra@easyb.ch>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250611194716.302126-2-ezra@easyb.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bHvRw1nNcz9tf2

On 11.06.25 21:47, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> Otherwise, the MT7688-based GARDENA smart Gateway will fail to boot
> printing "Kernel panic - not syncing: unable to get CPU clock, err=-2".
> 
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index 0212700c4fb4..10221a41f02a 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -33,7 +33,7 @@ palmbus@10000000 {
>   		#size-cells = <1>;
>   
>   		sysc: syscon@0 {
> -			compatible = "ralink,mt7628-sysc", "syscon";
> +			compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
>   			reg = <0x0 0x60>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de


