Return-Path: <linux-mips+bounces-14853-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Ho/AGnPHmqRVQAAu9opvQ
	(envelope-from <linux-mips+bounces-14853-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 14:41:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D962E1AD
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 14:41:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cjdns.fr header.s=dkim header.b=MNReIQGn;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14853-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14853-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=cjdns.fr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E33330091D6
	for <lists+linux-mips@lfdr.de>; Tue,  2 Jun 2026 12:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23333CAA59;
	Tue,  2 Jun 2026 12:40:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26A385D6E;
	Tue,  2 Jun 2026 12:40:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404016; cv=none; b=Z8//+ZXRWfahhN22Xc/gGTpgNg6EMnIvj38VMaYI1djcTHnhyZczoHkId65A1UIa7+31Pdk28g/7bO/owNpWYq7UHXBvxecj3GwRyRYuXxQ+ySLyYSxmxFlw6C4jjEp8RpZC9jjRMZCy/VuDDExt2sJZ18JDGgj6v7z6Sz1Z6lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404016; c=relaxed/simple;
	bh=uj0wvH/x+kf/1PkMN1Ix8AhaMS/I5Rn0IwRRA14b7F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHIq4HiG7lU1tSumpLBUqkR9ZCtx9brjJR3R0mSmfvu9JDUxf9FFlACyGGnMynnLIiQD2odjd2u/FT3y9D7GQriOcRSp1p3JptHyc025H/fgdBi2VCtq1ThWvjiTeocWPISmPVwMINB0cpS3tsvTXls2giJWpiuWDq1HN5DWbic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=MNReIQGn; arc=none smtp.client-ip=5.135.140.105
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6D5250B5AE;
	Tue,  2 Jun 2026 14:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1780404005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=R2nfexBzeT3y69ffHG5mi+zUFQP+2uBFKJLddW+7WaM=;
	b=MNReIQGnhOFsrTtxcvpE449+11XiJa5LVLE+tlgqpLGvVrd/T97k7T61/85DLXXvTzy9kb
	ctOPnuJsFG8OrKYZi0Zpa00HuLCwpCP2LMhXAAL6Ee2FEXZRlMWUshFExHZbg3CnNDmjyO
	gh9aI7w2n/QyOxHpcRAp6XCj9/2l/1HOhImQKYComSkAenB8KLAH7PE87DnwxvJcUhvryn
	nFYvhWXnFYbfOOSIcoU8g8be5uph6cBbl0IECPkABQ2BFUBf7xHo8MqZAz/fPg6INBCrKy
	VjL0+1ajfp+P2P7OaFmZamgK3Fq/W5Nu5544gspLeKWhWboInmWigbbVPXoqaQ==
Message-ID: <373aaeff-ca95-4e45-8e1a-ce7e79e91f42@cjdns.fr>
Date: Tue, 2 Jun 2026 14:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/2] dt-bindings: phy: econet: Document EN751221 USB PHY
To: Rob Herring <robh@kernel.org>
Cc: linux-mips@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518141343.401555-1-cjd@cjdns.fr>
 <20260518141343.401555-2-cjd@cjdns.fr>
 <20260601225805.GA129257-robh@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260601225805.GA129257-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14853-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:linux-mips@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,cjdns.fr:mid,cjdns.fr:dkim,cjdns.fr:from_mime,cjdns.fr:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F36D962E1AD


On 02/06/2026 00:58, Rob Herring wrote:
> On Mon, May 18, 2026 at 02:13:42PM +0000, Caleb James DeLisle wrote:
>> Document the USB PHY devices which appear in EcoNet EN751221, EN751627,
>> and EN7528 based SoCs.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   .../bindings/phy/econet,en751221-usb-phy.yaml | 128 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 134 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml b/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
>> new file mode 100644
>> index 000000000000..a44f59601747
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
>> @@ -0,0 +1,128 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (C) 2024 EcoNet
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/econet,en751221-usb-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: EcoNet EN751221 USB PHY
>> +
>> +maintainers:
>> +  - Caleb James DeLisle <cjd@cjdns.fr>
>> +
>> +description: |
> Don't need '|' unless there is formatting to preserve.
>
>> +  USB PHY controller found on EcoNet EN751221 SoCs as well as on EN751627 and
>> +  EN7528. These devices generally have two ports, one of which is a USB 3.0,
>> +  and the other is USB 2.0. The USB 3.0 port is driven by one of two PHY
>> +  blocks, depending on whether the connected device has negotiated USB 3.0 or
>> +  2.0. These PHYs are also used on other EcoNet silicon in varying
>> +  configurations, such as only port 0 (the USB 3.0 port), or only port 1 (the
>> +  USB 2.0 port).
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - econet,en751221-usb-phy
>> +      - econet,en751627-usb-phy
>> +      - econet,en7528-usb-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#address-cells": true
>> +  "#size-cells": true
>> +  ranges: true
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: |
>> +      Crystal oscillator clock source. EcoNet devices run at either 20Mhz or
>> +      25Mhz. 25Mhz devices require additional tuning in the USB 3.0 PHY.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xtal
>> +
>> +patternProperties:
>> +  "^usb-phy@[0-9a-f]+$":
>> +    type: object
>> +    description: USB 2.0 or 3.0 PHY sub-node.
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - econet,usb2-phy
>> +          - econet,usb3-phy
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      resets:
>> +        maxItems: 1
>> +
>> +      econet,usb-port-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [0, 1]
>> +        description: |
>> +          Physical port number. Since USB 3.0 requires a second PHY for the 2.0
>> +          fallback, multiple PHYs can map to the same physical port.
> What is special about this platform needing this property.

For measuring the frequency to set the slew rate, we need to know which 
port we're working with. Also the hardware revision has to be set 
differently on port 1 than port 0.

> Lots of
> platforms have 2 phys for USB 2.0 and 3.0 yet don't need a property
> like this.
I copied the idea from google,extcon-usbc-cros-ec which uses 
google,usb-port-id.
> Can't you figure out which phys are the same USB port by the
> USB controller 'phys' property which would define that?

Unfortunately the Mediatek driver handles all of the ports and only uses 
one DT node. I suppose I could encode the information in the compatible 
of the subnode, something like:


usb-phy@1fa80000 {
       compatible = "econet,en751221-usb-phy";

       ...

       usb-phy@1fa80800 {
           compatible = "econet,usb2-port0-phy";
           ...
       };
       ...
};

I'm not really sure which way is more correct. If you have an opinion on this, let me know.

Thanks,
Caleb

>
> Rob
>

