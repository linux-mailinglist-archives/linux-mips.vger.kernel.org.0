Return-Path: <linux-mips+bounces-13443-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAzXMU7Yr2kLdAIAu9opvQ
	(envelope-from <linux-mips+bounces-13443-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 09:37:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAEB247633
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 09:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B912D306E85C
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 08:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABFD40B6EE;
	Tue, 10 Mar 2026 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="NCVHHLXk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02F23EDAD9;
	Tue, 10 Mar 2026 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131849; cv=none; b=b+4CrssuQdszJ0/bWNI2U5W4dhJau+l1k7JTIs6j07s+HYdf6naTr+y0chNxzSUzzqVgIXP0pDLClSaaSkX81/QMQW14PCPxE0N6QT00M/vnrrFBStu5LFWBJl5gSSb5V6DsOuRCWgY0GaRvVVivC0pWy4N3rc2PfS2/vkdLXK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131849; c=relaxed/simple;
	bh=OAxX6czWbVx/4TS/Mj6srg7ZYMuLMoW4a0EyQKGFXVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eef8dIlrugBU/k9z9Axa9ilE/sLOoFW9WtZaVWupJK5YNndLnK1PFs6jle0dj+uJD2Nla7NWyCxgMfkWt7TwwNQ/nNY+pqcKYs2QcWuLiPpeJWMLPQa7eHUHujPDBdLQUczF+wou8/jf1e1Nqdl5/dhOSHB5ByJSkrnZOIcfr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=NCVHHLXk; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E00E28E78A;
	Tue, 10 Mar 2026 09:37:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773131843; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3mJ/CYvCoKAhjgq3TEcyM/swsRMxPmDTwW0efuIyeRM=;
	b=NCVHHLXkxVQcDwHTu/vDFaqUVetQCoT3BFuouIh0MF/MLd4WD2OsYQUHFaWStkYwheyvte
	BRie/DzNTPKkWKINkU7ePX5+svGm1nLMMlPC4ryuA+b3BaTzKYAHQ1HrEvsL+fGWCVjOdz
	/cXy+9OxtoDVe1VNCl6m6bFts9ohIciioWRRdBYdrUH6y6R1QoRAm0nHm3SicfPMmt9ZoA
	n5b/qT4BEl+ksmXRIDeyNem79+sjGmzqNrZdOMcmpuf0ANdyHrZX44CGnNVpeFo4aOEGkN
	OVVUltbzrcA0VcSmYOii5z933zM0OUFQNrZFriu7DpJt2jyPTy1/46FS+A67iQ==
Message-ID: <b48c07a8-3bc0-401e-9085-fc7030187db0@cjdns.fr>
Date: Tue, 10 Mar 2026 09:37:13 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/8] dt-bindings: clock, reset: Add econet EN751221
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, nbd@nbd.name, ansuelsmth@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-2-cjd@cjdns.fr>
 <20260310-rousing-tacky-catfish-fcba60@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260310-rousing-tacky-catfish-fcba60@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 2AAEB247633
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13443-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,baylibre.com,kernel.org,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On 10/03/2026 09:21, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 01:18:11PM +0000, Caleb James DeLisle wrote:
>> Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
>> an additional regmap that is used by the clock driver as well as others.
>> This split of the SCU across two register areas is the same as the Airoha
>> AN758x family.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/clock/airoha,en7523-scu.yaml     |  7 ++-
>>   .../devicetree/bindings/mfd/syscon.yaml       |  2 +
>>   MAINTAINERS                                   |  2 +
>>   .../dt-bindings/clock/econet,en751221-scu.h   | 13 +++++
>>   .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>>   5 files changed, 72 insertions(+), 1 deletion(-)
>>   create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>>   create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> index a8471367175b..91abe7716fce 100644
>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> @@ -32,6 +32,7 @@ properties:
>>         - enum:
>>             - airoha,en7523-scu
>>             - airoha,en7581-scu
>> +          - econet,en751221-scu
> 751 < 752, keep alphanumeric order


"econet," after "airoha," because e > a, of course I can order by number 
if that's really what you want.


>
>>   
>>     reg:
>>       items:
>> @@ -67,7 +68,10 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: airoha,en7581-scu
>> +          items:
> <form letter>
> This is a friendly reminder during the review process.


My apologies, I missed this one when I was collecting notes and 
updating. Will fix.

"Drop items, it's just enum"

Thanks,

Caleb


>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
>
> Thank you.
> </form letter>
>
> Best regards,
> Krzysztof
>

