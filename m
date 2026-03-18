Return-Path: <linux-mips+bounces-13779-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGx2HEIOu2kSegIAu9opvQ
	(envelope-from <linux-mips+bounces-13779-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 21:42:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3D2C293C
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 21:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 689A1300E5AC
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 20:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4114135836D;
	Wed, 18 Mar 2026 20:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Arf80Ry9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781134BA21;
	Wed, 18 Mar 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866558; cv=none; b=Xpfvb6LfDxV/LNvpo67soGS3Tlbd/6i0oGmunwGJqVYNzQJsKOwCAMUyjH8Q1JHPdVLKEQEDLn6FdQabDJwK+shZxLW7j4wlx3qEn7Gv9XLFxPS2JsLdHLsuqieifubyqiGdrs1GDCT30/ply1mbG1uuA6QDw7hxxxunz+t9KMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866558; c=relaxed/simple;
	bh=ai9SD2jUwdQOksyf4U/NIG4HuMVanA47YcEhB08Ujuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEiwf/FqkUsv/O8HMq7krPIR82hm+A17PfllY7LTdCjxNK8isDAEwOFglYSvhlwbZvUm+4R+IRJxUgMK7Y52tlrODHpDraEct0igZu2H6I72+bXxLZlkdv2rF/K+T/auzG7zAmxAQumpY8QdGSM56vhJaTWYMsb0IVGjwTsowmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Arf80Ry9; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD99D33745D;
	Wed, 18 Mar 2026 21:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773866547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IH7ZfNBkhNS2N1nKFAJ+41w55RSVuCvKMdXY4crVddE=;
	b=Arf80Ry9ZSgdnFL6DMRauRP2TPtgMtqVM+QTGzDI2XtURfxcVdRaGkODDSeSrlvSd2P1Fg
	+lgO+FBApYVN1J2YmOkq7AiEivggJAozWMz6SW4rGz35o4WzPXa7E+7nneIOxbXsQv8F0f
	un/YPCmO367nM+2wbKmqFKn0wqxqpBwQEy0hUv6PaU0WZRgVmylG7kiyIIYXko4wVRHzTr
	beZ6cGeIM9KEu/O0v9U84aeek5kWWGeunkEZkZPFydcFtetgsgo4oULvjGAL8udltgMl9T
	Vez3cgwpUE09wyKEiQl9oQ2a7s6Ye0yzf2edwVXFcbq4sjEPbN18zjBBBUo2+g==
Message-ID: <4d9f4984-3293-47ca-a15a-ceeb53cfabce@cjdns.fr>
Date: Wed, 18 Mar 2026 21:42:21 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260316155157.679533-1-cjd@cjdns.fr>
 <20260316155157.679533-2-cjd@cjdns.fr>
 <20260317-feathered-cyber-snake-eb72fa@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260317-feathered-cyber-snake-eb72fa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13779-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 7FC3D2C293C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 17/03/2026 08:26, Krzysztof Kozlowski wrote:
> On Mon, Mar 16, 2026 at 03:51:55PM +0000, Caleb James DeLisle wrote:
>>   
>>           mediatek,pbus-csr: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: econet,en7528-pcie
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
>> +
>> +        clock-names:
>> +          maxItems: 1
>> +
>> +        reset: false
>> +
>> +        reset-names: false
>> +
>> +        power-domain: false
> Wrong property.
>
>> +
>> +        mediatek,pbus-csr: false
>> +
>> +      required:
>> +        - phys
>> +        - phy-names
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> @@ -436,3 +462,59 @@ examples:
>>               };
>>           };
>>       };
>> +
>> +  # EN7528
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
>> +    #include <dt-bindings/clock/en7523-clk.h>
>> +    #include <dt-bindings/reset/airoha,en7523-reset.h>
>> +
>> +    soc_3 {
> soc
>
> Underscores are not allowed, but honestly neither soc node is needed nor
> the example. There are already 3 examples, it's enough, especially that
> there are no new properties here.

Ok, will remove the example then.

Thanks,

Caleb


>
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        pcie@1fb81000 {
>> +          compatible = "econet,en7528-pcie";
>> +          device_type = "pci";
>> +          linux,pci-domain = <0>;
>> +          #address-cells = <3>;
>> +          #size-cells = <2>;
>> +
>> +          reg = <0x1fb81000 0x1000>;
>> +          reg-names = "port0";
>> +
>> +          clocks = <&scuclk EN7523_CLK_PCIE>;
>> +          clock-names = "sys_ck0";
>> +
>> +          phys = <&pcie_phy0>;
>> +          phy-names = "pcie-phy0";
>> +
>> +          ranges = <0x01000000 0 0x00000000 0x1f600000 0 0x00010000>,
>> +                   <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
>> +
>> +          interrupt-parent = <&intc>;
>> +          interrupts = <23>;
>> +          interrupt-names = "pcie_irq";
>> +          bus-range = <0x00 0xff>;
>> +          #interrupt-cells = <1>;
>> +          interrupt-map-mask = <0 0 0 7>;
>> +          interrupt-map = <0 0 0 1 &pcie_intc 0>,
>> +              <0 0 0 2 &pcie_intc 1>,
>> +              <0 0 0 3 &pcie_intc 2>,
>> +              <0 0 0 4 &pcie_intc 3>;
>> +
>> +          pcie_intc: interrupt-controller {
>> +            interrupt-controller;
>> +            #address-cells = <0>;
>> +            #interrupt-cells = <1>;
>> +          };
>> +
>> +          slot0: pcie@0,0 {
>> +            device_type = "pci";
>> +            reg = <0x0000 0 0 0 0>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            ranges;
>> +          };
>> +        };
>> +    };
>> -- 
>> 2.39.5
>>

