Return-Path: <linux-mips+bounces-5642-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21889985521
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 10:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9990B1F23A4A
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 08:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C46157487;
	Wed, 25 Sep 2024 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dk6uyNFM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09414D2BB;
	Wed, 25 Sep 2024 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251719; cv=none; b=Nte8GfNOo2gHf5hgyWZkhuNsAP8rrQ43IzJYRVoB7/npotcRQ510d0zdP65EhMMHoam/glbvtMaM3ojyGG5M75v1esEIJnrI36kxv/RMDW5NK/3EQI5dvLrrViIGX4H5sYBPn7k6WLPCS7kKUVRQRI2ijodnjR/xANPeCLxd9HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251719; c=relaxed/simple;
	bh=kZHlyczoTae1617UfOzxvyjNVygRKs3NoAFumKHc8jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBSV5Jzy3daaP/RzvMkvW4KKARBbCWgPgAo8zwQRejUhW1eLZU2MzRLBn9bHXB28ElIlxlCt5BBXDG6+4aWXVLV6ErVqTCOchTtrTqHP197HwbnzWGlWn+8Ctr4EqOVWjz1RzmCTLgQe4Suc04unD/sJLg9HSCYyUlhruyDNDN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dk6uyNFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCEAC4CEC6;
	Wed, 25 Sep 2024 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727251719;
	bh=kZHlyczoTae1617UfOzxvyjNVygRKs3NoAFumKHc8jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dk6uyNFMkwFqRDxDt9oKYB7BfMznfJay0WpaL1u08oeJ3MBl5ISJDJJFdV+dWHhAc
	 zTIqUJxpiscVl/VKOEnSrG4vec48q7QGZWixVur5DhgJxjqZPnsocFTvkMU+zwJVV4
	 cEShWLT4BGzjjKeZ4/ZHxaoRkODX58ID4mw+/0/K4If2Rbl8ScsLP5+arMmXdkhhbU
	 zc+wW0zrxqXW6+QhnjPIIAgC0cWhwyCJxb4bsVWLJgcNFHjmamWEVhmTmn5MOBlnt/
	 904wWCR2O1OwEwQv/JdpPNp2CDOKgJoMUKuvc+F68+qAeS7x3nz05CjlwBBID9XXG3
	 3UDDGT1i8StyA==
Message-ID: <bc1355d0-c516-4a5a-9a8e-d4bd46343e1c@kernel.org>
Date: Wed, 25 Sep 2024 10:08:34 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: Add Realtek switch
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
 <20240923225719.2999821-2-chris.packham@alliedtelesis.co.nz>
 <jdqmrbjngrcmxtow2khhplvhhv6oh4msts4lggogfbgjj7fyfn@dve6dxeijywz>
 <1c19de70-abab-469b-afd0-f585cc807e04@kernel.org>
 <9abd5e65-da40-4283-b60e-46be5f89e858@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <9abd5e65-da40-4283-b60e-46be5f89e858@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2024 22:56, Chris Packham wrote:
> Hi Krzysztof,
> 
> On 24/09/24 20:51, Krzysztof Kozlowski wrote:
>> On 24/09/2024 10:39, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 24, 2024 at 10:57:17AM +1200, Chris Packham wrote:
>>>> Add device tree schema for the Realtek switch. Currently the only
>>>> supported feature is the syscon-reboot which is needed to be able to
>>>> reboot the board.
>>>>
>>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>> ---
>>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>>>
>> Unreviewed - it is incomplete!
>>
>> No, we said multiple times, you must send complete binding. Sending
>> pieces for review does not give us full picture and hides parts of the
>> controversial decisions. If you want to go this way, next time you will
>> get NAK when adding i2c@0-7 to parent binding.
>>
> Fair enough.
> 
> I did already get myself tied in knots trying to juggle two dependent 
> series. I thought I was making things easier to review by sending them 
> in smaller chunks but obviously I'm holding things back that are 
> relevant for context.

Pieces of chunks works fine for drivers, but bindings is an exception
here: if possible, we want to see entire hardware description.

> 
> So just to be clear, one binding in mfd that covers the reboot and i2c 
> for the 4 variants? That's about as much as I can actually test driver wise.

This can be multiple binding files, multiple patches (organized in
bisectable way)... Not sure about what you ask here.

> 
> I could add the mdio and switch ports but I'm not at a point where I 
> could really test them properly. I know the binding doesn't necessarily 
> need code to be able to describe the hardware but it does run the risk 
> that I might miss something in the binding that I need when I do get to 
> the driver code.

OK, MDIO/switch ports can be skipped. Skip anything which you do not
know how it looks or works yet. But in the case of MFD and I2C, you
already had everything available.

> 
> I also did want to say thanks for your patience. It may not seem like it 
> but I really do appreciate your feedback and I do try to take it all on 
> board.

No worries, you are doing a great job, I appreciate it. I probably sound
harsher than intended.


Best regards,
Krzysztof


