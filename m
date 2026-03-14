Return-Path: <linux-mips+bounces-13628-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNEEIuq9tGkZsgAAu9opvQ
	(envelope-from <linux-mips+bounces-13628-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 02:46:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A4428B497
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 02:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 526DF30B0A64
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 01:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049BE23BD17;
	Sat, 14 Mar 2026 01:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="QHLQOx4I"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82B40DFD5;
	Sat, 14 Mar 2026 01:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773452773; cv=none; b=vFuNTns6mnzuMy/Ogqaa+0hpCtkslV/MHbUuDPOYop8WsRen36CSG3T3bu7pvPK+Pn6Xzu1eQAswJtG8A3MKgHVaRcPfUzg+7OptCjyU5Q/hRFlRYsTQIS12RXSQfZkBF0Cx4tGOV2kt5CHmFGnSW9QsBPMFnZPyq7ieTrJbyE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773452773; c=relaxed/simple;
	bh=zU3FCtfZ1QFtOp5yJZf7EQClalelpjM8TstXkxLSOuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAxw07c+6uC8ui6z6CjtYMC2iUpvz/lzOhscPMHOhWgIyswMvEgFSumW8O204h8BJPD3bPD/+MO9GmQ5yLsQhqAZuxTFFWI9Z9QhDZSEWioObrmTiW/bSR+PfBsu/UKRPf/RTUuI8U1BH2FwbvbUqwFbpT4g9o0QQGpsFss+Gxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=QHLQOx4I; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75D3F2EC937;
	Sat, 14 Mar 2026 02:45:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773452762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jBA0k/WkRlwSfHgjnfRBPk9Oeqz6D8/YvAO+6qXGtBA=;
	b=QHLQOx4I0bTPsKmUrqz2FPI+AXa36IzlTxhTEnD12E+RNKhufr+/isWRaYNAgkQvz86//Y
	veriQwTJ+dbRwlv64LP8JD0Gb8vWLakal708SCb7oMHcTDajiUeR/NgJYOgn3OK6ku8MhB
	PVPyxGVryvc7VUka62UYtVFBm15Jc/ZvVGXBMegkyQ0J3RRZCdsh+lYeZ1BCBF4xmyP6w6
	Pe0LyQ1Kjl8d5rPbOUdyo9j22wYIYCLnhEO5kWkQrVgRHbpK+U3lvBgpUnskKKAm7RfKTZ
	+efH9hS1rjmCy8JIkca7GcHRDug4EzawvM4Vb9Q+6Am5HGiAr8QRlKkzxHwvhQ==
Message-ID: <3b2108fa-6cb8-4125-b046-c7991361fd41@cjdns.fr>
Date: Sat, 14 Mar 2026 02:45:55 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] dt-bindings: clock, reset: Add econet EN751221
To: Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, bmasney@redhat.com, mturquette@baylibre.com,
 sboyd@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 p.zabel@pengutronix.de, nbd@nbd.name, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260312162449.569359-1-cjd@cjdns.fr>
 <20260312162449.569359-2-cjd@cjdns.fr>
 <20260314003802.GA3735730-robh@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260314003802.GA3735730-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13628-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,baylibre.com,kernel.org,pengutronix.de,nbd.name];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 33A4428B497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 14/03/2026 01:38, Rob Herring wrote:
> On Thu, Mar 12, 2026 at 04:24:48PM +0000, Caleb James DeLisle wrote:
>> Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
>> an additional regmap that is used by the clock driver as well as others.
>> This split of the SCU across two register areas is the same as the Airoha
>> AN758x family.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/clock/airoha,en7523-scu.yaml     |  6 ++-
>>   .../devicetree/bindings/mfd/syscon.yaml       |  2 +
>>   MAINTAINERS                                   |  2 +
>>   .../dt-bindings/clock/econet,en751221-scu.h   | 12 +++++
>>   .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>>   5 files changed, 70 insertions(+), 1 deletion(-)
>>   create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>>   create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> index a8471367175b..eb24a5687639 100644
>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> @@ -32,6 +32,7 @@ properties:
>>         - enum:
>>             - airoha,en7523-scu
>>             - airoha,en7581-scu
>> +          - econet,en751221-scu
> AFAICT, 'econet' is not a vendor/company but a family of products. The
> vendor is still airoha.


EcoNet was a vendor, they existed alongside of Airoha (both were 
subsidiaries of Mediatek). They ended up being bought out by Airoha in 
2021 and the name has been retired from usage. They did share a lot of 
technology between them, but Airoha focused on ARM devices while EcoNet 
only ever sold MIPS devices.

Airoha currently lists one of the old EcoNet MIPS SoCs on their website, 
and may have offered more in the past - but all of the Linux / OpenWrt 
support for "airoha,*" so far has been for ARM devices only. I've been 
promoting the idea that anything MIPS should be called EcoNet and 
anything ARM should be called Airoha.

Thanks,

Caleb


>
> Rob
>

