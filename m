Return-Path: <linux-mips+bounces-13363-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LSbGmT7p2mtmwAAu9opvQ
	(envelope-from <linux-mips+bounces-13363-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 10:29:08 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0A1FD910
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 10:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 41CE43008630
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 09:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4603976A0;
	Wed,  4 Mar 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ncHzYAwC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAB73976A4;
	Wed,  4 Mar 2026 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616543; cv=none; b=AQAfQW1erjD8u1rWnXJKmkrzXEhcEq7iLzFIBkSVhZOlaofVlrVSjpZ9X6Fl0NzwRYBM7PGX6g5MFIgDfqAMsbJwBwD132ZLhDVwBELNnR+AVhbhMvFSksYqj0T5BImqd8FHrfVv7GKAXHxPWcsUABlJatgUTP8VWGA3+lYQ7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616543; c=relaxed/simple;
	bh=Jcr0tn3DZiSPoeHfUwIDLAFM+lK8CgOCHgpZwOJ4tVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPRy2JIq9f4PdG8DL6BimQ7G4Cb/0bYp/EoZewn7Abuk8C7uSlHMMfGDHQz5cUqZOUiE3TiMxI4Rm88SQ64r8ZQRPsAcnL2VWkPXjulydkM6ABkQoWCkS+LKRG6UrRnVaLSdqFkLLSj5eXGYFbCiQ0Ka2Vpt47hZsMZV4Ul1o+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ncHzYAwC; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F58322A039;
	Wed,  4 Mar 2026 10:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772616537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xn/i0N8EgAKuwuM15FDiV4PZjdt7rsAySJLonN4COK8=;
	b=ncHzYAwCogixHNVPZGRZuZBlCM11hw7NxKf1wlD/bw1xMbPi831jWfcgUfJU1SGpwp0cuN
	Rx2yqoJ/z4sL4VfWI0kLPehzjMcSF8eyL5zN2dHW7EJs38wYdXg7tYbpKLoccnxYqVBrO3
	rXGLP9iEhH2S+4/L2Q9mtYc8JR6Kj2LgowV0a0KvCrQ0sGg5HuYtoBhLpnzCb5PR0Zy+1C
	OCqlAhCLilI7JHL3nlXFdGJZsZruj//g7V1c9fs+C4s8N7lIRnhtTNAiQCNgu8RFvY38zP
	BtHLrE155jwkaELLPVa+tjzFSXjFq9YJJ+z2qaKnJvb8zr2xNEx4Kt/bixTrqw==
Message-ID: <63cd305f-e76f-4ed3-bb4d-d6b1dec8c92e@cjdns.fr>
Date: Wed, 4 Mar 2026 10:28:50 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/8] dt-bindings: phy: Document PCIe PHY in EcoNet
 EN751221 and EN7528
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
 <20260303190948.694783-4-cjd@cjdns.fr>
 <20260304-proficient-coati-of-lightning-df2cab@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260304-proficient-coati-of-lightning-df2cab@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 67B0A1FD910
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13363-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid,1faf2000:email,1fac0000:email]
X-Rspamd-Action: no action


On 04/03/2026 09:44, Krzysztof Kozlowski wrote:
> On Tue, Mar 03, 2026 at 07:09:43PM +0000, Caleb James DeLisle wrote:
>> EN751221 and EN7528 SoCs have two PCIe slots, and each one has a
>> PHY which behaves slightly differently because one slot is Gen1/Gen2
>> while the other is Gen1 only.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../phy/econet,en751221-pcie-phy.yaml         | 57 +++++++++++++++++++
> Why are you mixing multiple subsystems in the same patchset? That's
> like three or four different ones. Don't, just make it difficult to
> apply pieces and understand the dependencies.


Please pardon my ignorance, I was under the impression that a patch 
should be specific to a subsystem but a patchset should accomplish a 
goal and avoid introducing unused code. In this case the goal is PCIe 
support. If you prefer it, I can resend as a PHY patchset and a CLK 
patchset, and then after those are merged, send the PCIe patchset to use 
them.


>
>>   MAINTAINERS                                   |  6 ++
>>   2 files changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
>> new file mode 100644
>> index 000000000000..8e1d3c791c6e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/econet,en751221-pcie-phy.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/econet,en751221-pcie-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: EcoNet PCI-Express PHY for EcoNet EN751221 and EN7528
>> +
>> +maintainers:
>> +  - Caleb James DeLisle <cjd@cjdns.fr>
>> +
>> +description:
>> +  The PCIe PHY supports physical layer functionality for PCIe Gen1 and
>> +  Gen1/Gen2 ports. On these SoCs, port 0 is a Gen1-only port while
>> +  port 1 is Gen1/Gen2 capable.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - econet,en751221-pcie-phy0
>> +      - econet,en751221-pcie-phy1
> What is the difference between phy0 and phy1? This must be explicitly
> explained in the description.
>
> If phy1 means "port 1" (although first sentence disagrees, because it
> says that THE SAME phy supports two ports), then the names aren't -gen1
> and -gen2? Or what are other differences?


In practice, port0 is gen1 only and port1 is gen1/2. But I suppose it 
makes sense to specify them as gen1 and gen2, so that fact is documented 
in the DT.


>
>> +      - econet,en7528-pcie-phy0
>> +      - econet,en7528-pcie-phy1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#phy-cells'
> Use consisent quotes.

OK

>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/phy/phy.h>
> Where do you use it here?
Whoops, I think I daydreamed that it was needed for "#phy-cells", will 
drop.
>
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +
>> +      pcie_phy0: pcie-phy@1faf2000 {
> Drop unused label.
OK
>
>> +        compatible = "econet,en7528-pcie-phy0";
>> +        reg = <0x1faf2000 0x1000>;
>> +        #phy-cells = <0>;
>> +      };
>> +
>> +      pcie_phy1: pcie-phy@1fac0000 {
>> +        compatible = "econet,en7528-pcie-phy1";
> Drop node, same as previous one.

OK


Thanks for the review.

Caleb


>
> Best regards,
> Krzysztof
>

