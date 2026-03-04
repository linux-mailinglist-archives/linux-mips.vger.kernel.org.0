Return-Path: <linux-mips+bounces-13362-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A/EEl74p2mtmwAAu9opvQ
	(envelope-from <linux-mips+bounces-13362-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 10:16:14 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE31FD6A2
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 10:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEFE7308C74D
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 09:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838B8394781;
	Wed,  4 Mar 2026 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="d5U8vb6p"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA64139184B;
	Wed,  4 Mar 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615374; cv=none; b=OVuhpzkaSj8XGWHvZkyNhuSSI61wL4Rw81JB7KajB3jREai+5oIgbZQ9KWZ6L4iNey90PyNX+I6mfI1Y4UZ5LpBcswSSFIVrlNgtUVkZ8jLiuGsuTGY5NE1qeQqFPYBcnDo2DZX7iJI2HwJaRPScjM2/+mOp9KG0CdbmVxpWgSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615374; c=relaxed/simple;
	bh=yftRdM8nyWQsdJ2/EVnd712szefjtMJ1WAaLClGC6a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pagGXb9kjdSqHUo3ycPtJls1a23YbVscC5YxOway7o5DFzjBMTnfxvNe18P//J0I5OGOUrvig438TG3oQ6iF60OC/9BHuzpsDPsuRMSbmcM1hyTZqsm34or7UEVE2eUQe37Bsxw8A6TUFx+jZ1qDY2xwT2ChUztTK1VbO2ZUbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=d5U8vb6p; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6471B22953A;
	Wed,  4 Mar 2026 10:09:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772615369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0QOY3SwlDPrGm+6EJVdxOMdbUCm/cndSMZI5zzeh0dI=;
	b=d5U8vb6pBn5ABOYJsTtCnPXgqoJsbhO0uLtdRutCR/zeXaC+BKOEY1MZg+X7cB00LZyYD/
	tvls+YGM9G4/i15SovrHmKK1Ikt3mBp74ZiRxlqgP3qHBkfHoSyOWFrwghYZBtpA/Toc13
	0JxoAEscHkZYZjS7H8KC05CD1oe2Oth1w2lNxtCGmrH7e3FJYRhDaqPYEMR39Y/EgT4rJ+
	How3mchqTzXemRlWZO/2TEax9ylq46DxosIW80V8jvyRuSpff48d0/WpVVq/cDjHKfehlC
	K+/DzLb4pbYKJFIWkec2nvS7YUVsQgGgC5UuYMpPHcoCqyJR7GoBKq+3Rm+MXQ==
Message-ID: <7888e449-fec9-4a23-8133-ad0c9651a354@cjdns.fr>
Date: Wed, 4 Mar 2026 10:09:20 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/8] dt-bindings: clock, reset: Add econet EN751221
 bindings
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
References: <20260303190948.694783-1-cjd@cjdns.fr>
 <20260303190948.694783-2-cjd@cjdns.fr>
 <20260304-accomplished-helpful-orca-5d6b81@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260304-accomplished-helpful-orca-5d6b81@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: AFEE31FD6A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13362-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1fa20000:email,bootlin.com:url,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid,1fb00000:email]
X-Rspamd-Action: no action


On 04/03/2026 09:39, Krzysztof Kozlowski wrote:
> On Tue, Mar 03, 2026 at 07:09:41PM +0000, Caleb James DeLisle wrote:
>> Add clock and reset bindings for EN751221 as well as
>> a "chip-scu" which is an additional regmap that is used
>> by the clock driver as well as others. This split of the
>> SCU across two register areas is the same as the Airoha
>> AN758x family.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
OK
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
OK
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/clock/airoha,en7523-scu.yaml     | 19 ++++++-
>>   .../mips/econet,en751221-chip-scu.yaml        | 41 ++++++++++++++++
>>   MAINTAINERS                                   |  3 ++
>>   .../dt-bindings/clock/econet,en751221-scu.h   | 15 ++++++
>>   .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
>>   5 files changed, 126 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>>   create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
>>   create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> index a8471367175b..e60e54273393 100644
>> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>> @@ -32,6 +32,7 @@ properties:
>>         - enum:
>>             - airoha,en7523-scu
>>             - airoha,en7581-scu
>> +          - econet,en751221-scu
>>   
>>     reg:
>>       items:
>> @@ -67,7 +68,10 @@ allOf:
>>     - if:
>>         properties:
>>           compatible:
>> -          const: airoha,en7581-scu
>> +          items:
> Drop items, it's just enum
>
>> +            - enum:
>> +                - airoha,en7581-scu
>> +                - econet,en751221-scu
>>       then:
>>         properties:
>>           reg:
>> @@ -98,3 +102,16 @@ examples:
>>                 #reset-cells = <1>;
>>         };
>>       };
>> +
>> +  - |
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
> No need for new example, especially without any differences. You already
> have there two.
OK
>> +
>> +      scuclk2: clock-controller@1fb00000 {
>> +        compatible = "econet,en751221-scu";
>> +        reg = <0x1fb00000 0x970>;
>> +        #clock-cells = <1>;
>> +        #reset-cells = <1>;
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>> new file mode 100644
>> index 000000000000..7c7c8cf8d2a5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/econet,en751221-chip-scu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: EcoNet Chip SCU Controller for EN751221 SoC
>> +
>> +maintainers:
>> +  - Caleb James DeLisle <cjd@cjdns.fr>
>> +
>> +description:
>> +  The EcoNet chip-scu block provides a configuration interface for clock,
>> +  io-muxing and other functionalities used by multiple controllers (e.g. clock,
>> +  pinctrl, ecc) on EN751221 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: econet,en751221-chip-scu
>> +      - const: syscon
> And it does not fit existing syscon bindings file, because ... ?


If you're asking why it needs to be named "econet,en751221-chip-scu" and 
not just "syscon", it's because the actual clock/scu searches for it by 
compatible. This is patterned after "airoha,en7581-chip-scu" ( 
https://lore.kernel.org/20241023-en7581-pinctrl-v9-1-afb0cbcab0ec@kernel.org 
).

I could drop this file and use "airoha,en7581-chip-scu" in the DT and 
clk driver, but I do not think it is identical to the actual EN7581 chip 
scu.

I could also drop the file and add "econet,en751221-chip-scu" as a 
compatible to airoha,en7581-chip-scu.yaml, but that file lives in /arm 
and this is a MIPS.

I chose this route because it seemed least hackish, but I would defer to 
your judgement on the matter.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +      syscon@1fa20000 {
>> +        compatible = "econet,en751221-chip-scu", "syscon";
>> +        reg = <0x1fa20000 0x388>;
>> +      };
>> +    };
> ...
>
>> +
>> +#define EN751221_MAX_CLKS	6
> Drop, not a binding.
OK
>
>> +
>> +#endif /* _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_ */
>> diff --git a/include/dt-bindings/reset/econet,en751221-scu.h b/include/dt-bindings/reset/econet,en751221-scu.h
>> new file mode 100644


Thank you kindly for the prompt review.

Caleb


> Best regards,
> Krzysztof
>
>

