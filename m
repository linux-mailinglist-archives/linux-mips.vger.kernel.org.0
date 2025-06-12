Return-Path: <linux-mips+bounces-9264-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99853AD6929
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 09:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F83217C877
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 07:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC73C20FA84;
	Thu, 12 Jun 2025 07:34:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6F1F12F6;
	Thu, 12 Jun 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.59.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713694; cv=none; b=ZJtiLqooL1Jw7iKR2TWY9ycPTNWJvMp//jayFmGfSRwva9kz9iK1CLD0kuuhzjbFocCu4takC1REePzY33r3Udb6NbL/urlIxFzUewtkLooK1SFhgWoJTgIjQqteXiKswOuAwTxG9pAPukipGVR8nCHYDsjj1Qj6xEwhhQIPEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713694; c=relaxed/simple;
	bh=aUTVGW6d1ebUufVWtQwzplKdbF2wr0YaCKtnc6eHJzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ARoTiObLV7EgspvXx8bR2iOXSTUPhvGScJazSCwIAf88D/isO2Iicg3ho85gvfRmYtQchazr2Ywn+A0y1ZfvfajZDZbQGW3hQFlkKT6jVUnI1Ks0pWemMOc2/KnNKRaFS0entuvgSToEUHzDka1F15twNFI6xNoqz9sb+KdIdjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=80.241.59.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4bHvS86Sftz9sky;
	Thu, 12 Jun 2025 09:34:48 +0200 (CEST)
Message-ID: <23136f79-9878-4129-833c-98ce6cc12f68@denx.de>
Date: Thu, 12 Jun 2025 09:34:47 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 2/3] MIPS: dts: ralink: mt7628a: Update watchdog node
 according to bindings
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
 <20250611194716.302126-3-ezra@easyb.ch>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250611194716.302126-3-ezra@easyb.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bHvS86Sftz9sky

On 11.06.25 21:47, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> Most notably, add the mediatek,sysctl phandle and remove the redundant
> reset/interrupt-related properties from the watchdog node. This is in
> line with the corresponding devicetree (mt7628an.dtsi) used by the
> OpenWrt project.
> 
> This has been tested on the MT7688-based GARDENA smart Gateway.
> 
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   arch/mips/boot/dts/ralink/mt7628a.dtsi | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index 10221a41f02a..5d7a6cfa9e2b 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -134,13 +134,8 @@ pinmux_p4led_an_gpio: p4led-an-gpio-pins {
>   
>   		watchdog: watchdog@100 {
>   			compatible = "mediatek,mt7621-wdt";
> -			reg = <0x100 0x30>;
> -
> -			resets = <&sysc 8>;
> -			reset-names = "wdt";
> -
> -			interrupt-parent = <&intc>;
> -			interrupts = <24>;
> +			reg = <0x100 0x100>;
> +			mediatek,sysctl = <&sysc>;
>   
>   			status = "disabled";
>   		};

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de


