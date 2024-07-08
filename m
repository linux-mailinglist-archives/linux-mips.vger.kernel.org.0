Return-Path: <linux-mips+bounces-4192-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F042A92AB33
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 23:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5F3282B66
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 21:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B15B44C93;
	Mon,  8 Jul 2024 21:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="OdJ3PfWK"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E281EB44
	for <linux-mips@vger.kernel.org>; Mon,  8 Jul 2024 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720474238; cv=none; b=p9o8Vm9vEQotJwfp3SxzVqQ7tfH62B8EA/Hqorr7Xs6WEaUCWlyyi/PFM+rWtIBi+axIidp1pGJBtpB/1bbkNd45psCIo8pFBKRyMCOfWzHdpOOtkI4MeDJJeRiKjNiJX3pUEMFkR6a4lx5sOCQfHgEzOCS+W/VPSEID8mlbyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720474238; c=relaxed/simple;
	bh=eQR5axUpTAdGh9syX9YUqZPQl6EhiJyQH6XlvMUkHNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/p/77HEX/HY+vBJULbHUGJlSYYFzqpg7ael9GM0g9M5HwSppvaJ+ck9WXGy9ToPBcvC4HxS1jRTZCyzkHtUZlGf/V5xFVApRPxkfKT8uwAbLqM45zSJ95pDVRSJqE/DxlDF440xEUS9bUW1rKhQ7rzxNKstx0KhROhcpW3c00U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=OdJ3PfWK; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 00E792C0372;
	Tue,  9 Jul 2024 09:30:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720474228;
	bh=RdE/nXV2kkfEKNFCcw4XTrJ6VmXMy27pCPDHgOnLEqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OdJ3PfWKPlnMKIHv8b4OgjJ19wTkHCvagYzJdMCIf3EMKSrwkVHSUyB4EsHZXZsit
	 EbRseEv8Ib0wk8zhkQg4XZMbvWM25diLSHNowtbuiSm0no8kddgL4CdP6qY2HGEBie
	 hcRIcgXxSTbn+aNWGk6gnAWLtcr9kzzshgLA1IzMdcgaFrCkODpRlYWUMLz5KBAm0M
	 Xas1GKUc7XbmzW/jokf1jjbd6nROmVOY7qFkA9yIvbXpfwB1pePChyo0NFDr8PlFmQ
	 njRaN01OCSCzYeTl68ZX/b1oHuaN4MBf7siIuhDzsGi8nbaCm9lLzT3197Y0Q+SQpv
	 8SpoCft1lRDrg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668c5a730000>; Tue, 09 Jul 2024 09:30:27 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id CBF8113ED5A;
	Tue,  9 Jul 2024 09:30:27 +1200 (NZST)
Message-ID: <6b4d33cd-35b5-4f34-8ef5-14fb34b2ceaf@alliedtelesis.co.nz>
Date: Tue, 9 Jul 2024 09:30:27 +1200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 7/9] clocksource: realtek: Add timer driver for
 rtl-otto platforms
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, paulburton@kernel.org, peterz@infradead.org,
 mail@birger-koblitz.de, bert@biot.com, john@phrozen.org, sander@svanheule.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
 <20240705021520.2737568-8-chris.packham@alliedtelesis.co.nz>
 <1bd8c455-567c-4523-8d8e-0e7cbc8210fd@linaro.org>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <1bd8c455-567c-4523-8d8e-0e7cbc8210fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668c5a73 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=PgAc0EJtaM13PuN1H-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Daniel,

On 8/07/24 21:53, Daniel Lezcano wrote:
> On 05/07/2024 04:15, Chris Packham wrote:
>> The timer/counter block on the Realtek SoCs provides up to 5 timers. It
>> also includes a watchdog timer which is handled by the
>> realtek_otto_wdt.c driver.
>>
>> One timer will be used per CPU as a local clock event generator. An
>> additional timer will be used as an overal stable clocksource.
>
> Does the mips arch have a local timer per cpu timer and a broadcast 
> timer already integrated in the GIC ?

I'm far from an expert but as best I can tell no. This SoC doesn't use 
the mti,gic it uses realtek,rtl-intc instead.


