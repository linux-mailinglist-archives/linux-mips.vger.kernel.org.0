Return-Path: <linux-mips+bounces-13444-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCYjAkTbr2kzdAIAu9opvQ
	(envelope-from <linux-mips+bounces-13444-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 09:50:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 998BC2479CD
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 09:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FCDD3031391
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 08:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEDB43C046;
	Tue, 10 Mar 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="O9ZQO2Sc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FE0438FFE;
	Tue, 10 Mar 2026 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132602; cv=none; b=DVdWZpKHSnuU1w9ifu8U9ekpVuFMyxCvcTaII+YKRaJl6Y7W3zBqrvY8iA23ulSSIMUo39JkzaGMC3Fyzl6YIASEGbmFQKSxSrIV4FUHYEZB/O+joolE9+E7VMFNfVVhShmfdQ//V/goSQEDPgNy2saH6bC4YY+CUcx0at5UA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132602; c=relaxed/simple;
	bh=y1ysJD7OcXUPQg4vWSuOKFA/9qcBQzn35Xp/RVmj9VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7+KlC4ewmgh21HKMzUjZyUrpAaqw6Z0vqofDWbSPwSwZ87iX5gimTafg5EGQIqbf2dLAPJvrsR8jJ1vsN9IYwe19ZZL72HYWscw5krBGKjjN6FVuT14YbS1CcQlXhbPRMAf6oKB4UnM6dyho8HqlhBQe5V5vEJfwPjIIaMhW3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=O9ZQO2Sc; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BF9328F482;
	Tue, 10 Mar 2026 09:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773132597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=khzxWHS6TgscUvNmyc8I0F7jSY9IeTFAgK8XNcri5xc=;
	b=O9ZQO2ScTAZMhu5ldgA1bipI2BOqUNnJpi0+xS6/SrlVm803fALQkFuEsdRXmrbTk5Q3EX
	cyJ+i+sPVTl+bePNqCw9xeqTy6Yj1nx+rhPS4K5nfQrb6wyvDNbSBeQk1E5dFWa6W5SLAs
	vZRomvnYElXC5Nc9yFk3HipJJkAc05+716tpWt71k4AkeLRosv0Bgn/uR//z3RkGuRxi7W
	Qn8DvL4KCRl979lSvRGFO92Ea3z45e+0mKaT/2uehqiyrPVP8dU2RW8jHO8i54YKo7YhuC
	dGc2sdNT1YTAFWi8u8eAntHyxUql2MhuO5T0hQjOF61PLylPE4kKzJiE7tyYsw==
Message-ID: <3235796a-4682-4eae-b3de-ca53aa49e303@cjdns.fr>
Date: Tue, 10 Mar 2026 09:49:50 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 5/8] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
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
 <20260309131818.74467-6-cjd@cjdns.fr>
 <20260310-onyx-ibex-of-progress-fdf1bf@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260310-onyx-ibex-of-progress-fdf1bf@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 998BC2479CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13444-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid]
X-Rspamd-Action: no action


On 10/03/2026 09:25, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 01:18:15PM +0000, Caleb James DeLisle wrote:
>> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
>> binding.
>>
>> EcoNet PCIe controller has the same configuration model as
>> Mediatek v2 but is initiallized more similarly to an MT7621
>> PCIe.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   Documentation/devicetree/bindings/pci/mediatek-pcie.yaml | 1 +
>> 	 1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
>> index 0b8c78ec4f91..57cbfbff7a31 100644
>> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
>> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
>> @@ -14,6 +14,7 @@ properties:
>>       oneOf:
>>         - enum:
>>             - airoha,an7583-pcie
>> +          - econet,en7528-pcie
> Patch is heavily incomplete - why do you have variable number of clocks?
> 1, 2, 3 ... or 6 at the same time?
>
> Look at the rest of this file to understand what you need to write.

Thank you, sorry for missing that, will fix.

Caleb

>
> Best regards,
> Krzysztof
>

