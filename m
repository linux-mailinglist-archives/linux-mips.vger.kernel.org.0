Return-Path: <linux-mips+bounces-3185-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FBF8C05A4
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 22:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C34283140
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 20:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E04130AFD;
	Wed,  8 May 2024 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="kg6HtCVG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Hn4JzeGW"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13852130AFA;
	Wed,  8 May 2024 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715200111; cv=none; b=kNC6WKeYLu87Csb/UbVP0cJ6EGRdfBcgPyaJ+w4ATaHelWiiqvSfSMTpYVO2POJmhPpzuxs4MbjyN+gBEgpJwykn866li+sOQ07yDJmfSxhBnzRH2N1hYQ4OeBbCiQMoQFhIHbT0SXVv/tg29RCKKzj7eDBkuseolszvCoMc3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715200111; c=relaxed/simple;
	bh=KKTnYE/+6c0wZB8oPaRYsZ5PxxNQR2AnCTX6BwXaEcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hmEl17QFy+vZmAvIBKJe/4frJtnTSC/jXZZ0EC0FBNiZJiNFPmk80MVcR90ZhdzsEkiM/VwIShFpVIZIpEufi3vt15E2bInhihC3Zt0kDJwIlc6PyZX0BIsh2nRGw3isHJIWgKIayOe9IgN1zDmA0Vvu8F0Nv8OPW1qlEXC1UN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=kg6HtCVG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Hn4JzeGW; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0B42E1380381;
	Wed,  8 May 2024 16:28:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 08 May 2024 16:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715200108;
	 x=1715286508; bh=KKTnYE/+6c0wZB8oPaRYsZ5PxxNQR2AnCTX6BwXaEcY=; b=
	kg6HtCVGRmit3APTNuegMPqvOSBF14gME8ovGNwa3GcOXEmEfGigxWvHpMkcEvW5
	FpJic/56fF0R0814Ppl52ey6XFV/8HyDfNVvjg5FQ9WP8enpl5kC+Gwkljj10cOH
	tb3k0XwSM/7yCeWQdbd2EGBzY7OWYkayuswjYb+hxD08jy5rmtmh+2k4vkpZNTVP
	0CoyM5IFv0QXbpBphHCQbethz/B7DfJRHdzQ7X0cQt0uWNAVh0Rhs47E4AeBJTdW
	i4KVyme8MtS18/VK80LmyOW9/HqoF7Fketk1PyOtxImAZuAn7eZHzdKVr5tCqM+Y
	+PkpxjGv5HNnfOhxgMJxgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715200108; x=
	1715286508; bh=KKTnYE/+6c0wZB8oPaRYsZ5PxxNQR2AnCTX6BwXaEcY=; b=H
	n4JzeGWByG0/CCmHY9T5xWb7ek4zNAKTuqsm3Li/1AQm2bjgpOg6tEbSbWgeAej0
	4NrFFhIbc3xeg5FiIfpn6XVxLIs+C6eufPFB4SICGaPilgXNNyzposjwv8b7APUX
	ldHhmQAw3+DnsCYcnHz/oQHad2U6TdfStPZRGC9kRJKVaGpGzAFOYExfyfMmqX+p
	LxYPikG0dk8tcPGxvuQxjf9ab3xoEmAJYhC3tp/FQT8TvgSNFv6HnADEVglZN6Iv
	rJdpJSSgQuOopZd/1YrJMIcVCXS6ECoaLOcEIvPpJdnjTKM9MNiCzIXdSvQj5X5Q
	zINTqY7fIPXI8LyuWDTjg==
X-ME-Sender: <xms:a-A7ZiKf69YirQTEQnVf00_9nrVOxE4a5DrCFbOtFJ-r4mIUe-SqLw>
    <xme:a-A7ZqJpmarVp7CjWuuRzStvwDinVDqdhmoU57FnWzOVYXmiBFNmhTyQvRnjpUem2
    5Yw5qhzbIsQpTmWxq4>
X-ME-Received: <xmr:a-A7Zive8Uxx76yXZZ_R9RIMM-ijsuMx4VtCz4CdxWnLKTrtlF-dnwqAz96-JGyPRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeelueffheehgeeluedvlefghfeukeejteeuveeuhffftdfg
    uefhgefgueekffeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:a-A7ZnamHW_g9jHQOT55DhrhXNGsDUi37iWXeoaiVjY9QTo3sBsZ8g>
    <xmx:a-A7ZpaoOfgIAtH0oq3HeuL83tJic4fcDNKqIsXLa_vBIEdyzIPKdg>
    <xmx:a-A7ZjAoMn1QdzVWNwVQ_dN8EhvvbczB8fDhrjCqdGT93Vf_5fZn1w>
    <xmx:a-A7ZvbNU31c6AzaaGKIGVpd6_z8SumarXMnJM80_0ZcjEj1vIT4Cw>
    <xmx:bOA7ZrlQYTx9ZxZ1xv-Tvd0JqiYKF_0xrgItAUESNP9dLtA5-u7r-2BO>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 16:28:26 -0400 (EDT)
Message-ID: <42f91b62-2bf9-414d-ad05-6770282637f7@flygoat.com>
Date: Wed, 8 May 2024 21:28:27 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: mips: Document mti,mips-cm
Content-Language: en-GB
To: Conor Dooley <conor@kernel.org>
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
 <20240507-cm_probe-v1-4-11dbfd598f3c@flygoat.com>
 <20240507-jokester-antelope-808b21b957e6@spud>
 <fbb4b8e2-edf4-4b4e-8b71-154a09f24ccd@app.fastmail.com>
 <20240508-puzzle-directive-b6f771f92fe9@spud>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Autocrypt: addr=jiaxun.yang@flygoat.com;
 keydata= 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
 HVO98ZmbMeg=
In-Reply-To: <20240508-puzzle-directive-b6f771f92fe9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/5/8 18:01, Conor Dooley 写道:
[...]
>> So it's actually a register block that can be remapped to anywhere in
>> MMIO address space. DeviceTree usually passes firmware's mapping location
>> to kernel.
>>
>> There are some other similar bindings like mti,mips-cdmm and mti,mips-cpc,
>> I just copied phraseology from them, should I try to explain it more here?
> The description that you've given here is of something that sounded
> awfully like mapping into a location in DDR etc, is it actually being
> mapped into a non-memory address?
It is an overlay being realized at CPU core level so it can be mapped at any
where, but the firmware convention is to map it to a "non-memory address".

Thanks
- Jiaxun
>
> Thanks,
> Conor.


