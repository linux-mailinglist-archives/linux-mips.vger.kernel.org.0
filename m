Return-Path: <linux-mips+bounces-9265-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBBAD692C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 09:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E1E3AABF8
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jun 2025 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8FC2036EC;
	Thu, 12 Jun 2025 07:35:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E51F12F6;
	Thu, 12 Jun 2025 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.59.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713709; cv=none; b=AtGq0h+Z7vTdPCJjawsMdCBSPvr3bGkuSIYNdiHrDljEn04yBGbeKztnW8La3Qn/vYocMfzsTfQcyMggfqB/8uf/4D7NsaDWP8P6spG19bT8ow/V97/XFD1V2+AgxeQiak33knGH9v/dJf001burFE/eHiPkgyiD9NvQODPh/wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713709; c=relaxed/simple;
	bh=p1j9QOtPk3ZIlPqNiNr1tiipGrWDfoJ3dSSpP2dPRV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atdRaYZsI7rtURuPxRtNgc3Jxfy8ReuCgbtO742a7Bzxv0FExRjzWfhHM3rEOkfrB2Yhgd6RaMRN3ulDHGmS7snEgm/g0xvGnGMte9ufaFJD4v+gNkC0yAvPlOldmnBfIBBCUYXw3LQOs3H8SzO1f6L9Dvfqf2U5PE/YLfnr7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=80.241.59.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4bHvSR3yhhz9tgy;
	Thu, 12 Jun 2025 09:35:03 +0200 (CEST)
Message-ID: <7db61610-890a-480e-b74d-3565d0e9ba16@denx.de>
Date: Thu, 12 Jun 2025 09:35:02 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1 3/3] MIPS: dts: ralink: gardena_smart_gateway_mt7688:
 Fix power LED
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
 <20250611194716.302126-4-ezra@easyb.ch>
Content-Language: en-US
From: Stefan Roese <sr@denx.de>
In-Reply-To: <20250611194716.302126-4-ezra@easyb.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.06.25 21:47, Ezra Buehler wrote:
> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> 
> When starting up, the GARDENA smart Gateway's power LED should be
> flashing green. It is unclear why it was initially set to "off".
> 
> The LED frequency cannot be configured in the devicetree. Luckily, the
> default is 1 Hz, which is what we want.
> 
> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
> index 7743d014631a..0bfb1dde9764 100644
> --- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
> +++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
> @@ -56,7 +56,7 @@ led-power-blue {
>   		led-power-green {
>   			label = "smartgw:power:green";
>   			gpios = <&gpio 19 GPIO_ACTIVE_HIGH>;
> -			default-state = "off";
> +			linux,default-trigger = "timer";
>   		};
>   
>   		led-power-red {

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de


