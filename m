Return-Path: <linux-mips+bounces-5804-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E599994501
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 12:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D164286B6F
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 10:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6137B18CBF1;
	Tue,  8 Oct 2024 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZspKtVr4"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FAC18C93D;
	Tue,  8 Oct 2024 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728381811; cv=none; b=uy+arYzv7WfD/DbxBvhi1Ch1YHQlGvqP9YPR8PLFUO53sTZFw6d0J57XXfftUcEjSad5j8dToqfcr086K7psnZFZq6yHrvQdwxu6xdO4BwXdAYiSPx07+6PrVWbmGaPir9gNuXW25JzQaNj2pX6or3E0lo+gu4kmxIf6gEHkSLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728381811; c=relaxed/simple;
	bh=G6UPXBCWZIToUxidHOl2NxFaDb6t5b8R/d+rhgiKuDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ifS5nn6em/7vocNUrGJj+1VzQTuisB8yLBAi+4rd8y5KiIvmJyvjgGhR56cPzLRT6N0vxV2MzC2p/H5IIk3fb7tj3eVqXXcWkgrIF/4KM84kgX6n4cUzG35mZDjPjXQTVbCoaSjw/pd1fKmvppyZ6nH5YgQD9QsxO2UN6RMw6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZspKtVr4; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAD254000C;
	Tue,  8 Oct 2024 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728381801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVxPJv4WO7g3wfRjUaiplqBDEDVJijQhGxNVEhWUWKs=;
	b=ZspKtVr4RYm6L/twttTXteM7haghR4dHWe1qpzjiDWjXI9J0A7iVVY5IDeK8CoSKMDzEJ0
	vrYFUsKfFBIb9yl0gtsFRkx42TWsK8Q6B+cS6rIig4+kfHlxPBY/XzDMGRFpJyD5upCPv5
	BOd4TTgsFvh4HPn5dPIex1KAVvs5dPJ0Kom52eoa5q116Kq0feyJYrljv51OEGuEjCyXMD
	4+c2PuMONvsCE/4lemyIwfkBePWUmRJ+B480GrPq5/6kS0xJNsGuCKtb9VUbQ4EJfTI7K5
	WOLGZe+3zJLplSj8/CNnHJmhdMcKYdIKOvv9V4McRlfOnxVP8lyfb0FVtqQoCQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] MIPS: mobileye: eyeq6h-epm6: Use eyeq6h in the board
 device tree
In-Reply-To: <f7f6e582-6e68-4f45-b486-43132b896856@kernel.org>
References: <20241008-eyq6h-dt-v1-1-b8a4df1e6a6c@bootlin.com>
 <f7f6e582-6e68-4f45-b486-43132b896856@kernel.org>
Date: Tue, 08 Oct 2024 12:03:20 +0200
Message-ID: <871q0qewt3.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 08/10/2024 11:18, Gregory CLEMENT wrote:
>> There is currently no eyeq6 compatible string defined in the binding
>> documentation. Only eyeq6h version is defined, so let's use it.
>> 
>> Note that there are actually no codes relying on eyeq6h; the purpose
>> of this patch is mainly to be coherent with the documentation.
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>
> That's a new platform, so you were supposed to make it warning free. I
> think that dtbs_check were never really run here...

Yes my bad. Sorry for that I won't do it again.

>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

>
> Best regards,
> Krzysztof

