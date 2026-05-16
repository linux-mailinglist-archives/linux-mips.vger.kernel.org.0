Return-Path: <linux-mips+bounces-14614-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h4u3Htn8CGrcDwQAu9opvQ
	(envelope-from <linux-mips+bounces-14614-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:25:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE755E454
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 01:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 296B3300B628
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2026 23:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350BF39DBFF;
	Sat, 16 May 2026 23:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="epkM/a4D"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37F33559CA;
	Sat, 16 May 2026 23:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973910; cv=none; b=QK4eY8LA+K8EoJsy+Qi9cz9Uz+PBSEuVWwhiV+ldvMNaEMQsKxbLVzofAHsdDuGzDH2f/34F19q7Wg9A2eNkGKGC/R1Hu3yl+T+YppziwukVYfp+dLr91GQ8gKaBjrNGPVoXSkVwhX1ygefa0Pk0SHxXH/tBw6OxO34nbIKOBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973910; c=relaxed/simple;
	bh=BoX7Bjxgkv0DtjyHAdwDPEqs1Z0uHcMJwD03OXrXloE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eITZq31AvAMKPGdwER75Yo0LOuVnuDk9S3cLLoB1rpfQUxIboo60qYI2K9dFoVS2xoh0DbFG0UMUpo7n/zMrpx3qzZ9YiHvgNk5LVPW6IIOE/fSZ+izVQTOeAlXYmZ2jGn2s1iYm1rrimQoCYJfbdwTxBdLjW4jSnkz27yyI168=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=epkM/a4D; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5305F3FA931;
	Sun, 17 May 2026 01:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778973905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=RgPs7DV3NYwWxx5nTmHFD9YIVmzPjzwGC1KjUZS7lWw=;
	b=epkM/a4D3RKPLg7eiM7K1I6IKrdkZHowzCKL82AbalTZocztTp6v3Zv8wkjZIaAOmR/ph4
	NT4meHO6/z5/mNwL6s9E5gAU4KNSmgDuq8m/mK/JmjSz/LgCr5vjjj8Nb6lMU39ppKxdj8
	VjWN4yt2cnx/vsdghVPDHHcatO47hWwQqcm48hSKu+wPa2Otl0XXDoy+5mTtRDiZEoK86b
	/6UeSbjjMzwjnYYEhxPU0j5XWEs3ftTZoOFQ7ZoWlFgtxLTOjThTgwtPj0v5dnNXj6CfS8
	/KrOnaSsS5VtaA4r/2I/FvmEWlF9yDImAwxvB7IZ9qTNjSN9O5MldZtQcg2pPg==
Message-ID: <d2298749-07e7-4a07-b04d-a19a24d0101a@cjdns.fr>
Date: Sun, 17 May 2026 01:25:00 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: econet: Update EN751627 for
 multi-IRQ
To: Conor Dooley <conor@kernel.org>
Cc: linux-mips@vger.kernel.org, conor+dt@kernel.org,
 daniel.lezcano@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, naseefkm@gmail.com, robh@kernel.org,
 tglx@kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260516215720.4160831-1-cjd@cjdns.fr>
 <20260516215720.4160831-2-cjd@cjdns.fr>
 <20260517-cathouse-spiral-6a56c30ec223@spud>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260517-cathouse-spiral-6a56c30ec223@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: C1FE755E454
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14614-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1fbf0400:email,cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim,microchip.com:email]
X-Rspamd-Action: no action


On 17/05/2026 01:12, Conor Dooley wrote:
> On Sat, May 16, 2026 at 09:57:17PM +0000, Caleb James DeLisle wrote:
>> This hardware is found in the EN751221 SoC family as well as the
>> EN751627. The former uses a percpu IRQ for all timers while the
>> latter uses an individual IRQ number per timer.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   .../bindings/timer/econet,en751221-timer.yaml | 23 ++++++++++++++-----
>>   1 file changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>> index c1e7c2b6afde..16f32741473f 100644
>> --- a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>> +++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>> @@ -12,8 +12,9 @@ maintainers:
>>   description:
>>     The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
>>     EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
>> -  count/compare registers and a per-CPU control register, with a single interrupt
>> -  line using a percpu-devid interrupt mechanism.
>> +  count/compare registers and a per-CPU control register. On EN751221 it uses a
>> +  single interrupt line using a percpu-devid interrupt mechanism, and on
>> +  EN751627 it uses an interrupt per VPE.
>>   
>>   properties:
>>     compatible:
>> @@ -28,8 +29,8 @@ properties:
>>       maxItems: 2
>>   
>>     interrupts:
>> -    maxItems: 1
>> -    description: A percpu-devid timer interrupt shared across CPUs.
>> +    minItems: 1
>> +    maxItems: 4
>>   
>>     clocks:
>>       maxItems: 1
>> @@ -52,21 +53,31 @@ allOf:
>>             items:
>>               - description: VPE timers 0 and 1
>>               - description: VPE timers 2 and 3
>> +        interrupts:
>> +          description: An interrupt for each timer (one per VPE)
>> +          minItems: 4
>>       else:
>>         properties:
>>           reg:
>>             items:
>>               - description: VPE timers 0 and 1
>> +        interrupts:
>> +          description: A percpu-devid timer interrupt shared across timers
>> +          maxItems: 1
>>   
>>   additionalProperties: false
>>   
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>>       timer@1fbf0400 {
>> -        compatible = "econet,en751627-timer", "econet,en751221-timer";
>> +        compatible = "econet,en751627-timer";
> This is not going to pass dt_binding_check.
> Please remove my ack until this is fixed.
Yeah I saw the bot message and I'll be re-sending in a minute.
>
>>           reg = <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
>>           interrupt-parent = <&intc>;
>> -        interrupts = <30>;
>> +        interrupts = <GIC_SHARED 30 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SHARED 29 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SHARED 36 IRQ_TYPE_LEVEL_HIGH>;
>>           clocks = <&hpt_clock>;
>>       };
>>     - |
>> -- 
>> 2.39.5
>>

