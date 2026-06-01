Return-Path: <linux-mips+bounces-14850-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF+IEdYOHmocgwkAu9opvQ
	(envelope-from <linux-mips+bounces-14850-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 00:59:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E24626261
	for <lists+linux-mips@lfdr.de>; Tue, 02 Jun 2026 00:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CFE3007F43
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2026 22:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AF9361DAE;
	Mon,  1 Jun 2026 22:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsSONfve"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E932F2E0901;
	Mon,  1 Jun 2026 22:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780354687; cv=none; b=f/89ngvusGqN7Jb36YUKh17LfWRnxqKEVhnMzFV7dvuklnHZK+CY7S7RpoUbtcRXRIgd31XU5YvvDxc+5VIhVcCgnyPdl/vYs2ShbLGduxNA4nG09ydCM73+SCPK4DkeQrlHViZ1h62gG9qmlUUcLMfCaqWeFkTJAPqPtG0W+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780354687; c=relaxed/simple;
	bh=uQy4LbDTBv+X0zGUTvg2hyGGkVlOpzztYoA7miqd+po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOfmIHLA83aekSWrI+FT3pMuWQEKDo8fzjxiOdSzGY3/ED5+X9VKMBcHaRDVix8xF7S+v49QAYG4DVnwcI4HPtcdcIzwDt1vmjrQSTKxMOHrAUWH5n4+37+8g/q13rxIjttQzrzPHwQx60uU7vRAIY7jKzd3KvmRXbjQ9tf7lmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsSONfve; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571081F00893;
	Mon,  1 Jun 2026 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780354686;
	bh=MzlIrZ2xitOElGGvcFl7v9dFMNgCf3mriv86YlPvr/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PsSONfve6OOJYc+tFMyWBx8YeL/z8+OtDwdrC2ic3L9RzBOfRQJYP5R2EU7cQkTvU
	 hcTSdNRgJWGay4ighXmn52Jv3RUOnifIMCvXDROjbR3eHmnCQpTDcuurLP3ARPN1Ft
	 p4jPWvakR1AVlNhZ1IkZyg/wj1JPf9Xe23A5piS8pgg5bQXeIyVH+Q7IOY6os+aw/y
	 I8MTU0bKrUXu+xGf3NiSSanr0vfgnWcGxOqAukOqpGDmquKLvXk35EBRZY85xcBJnV
	 teMxLYCmGKhC/uoA2j7M9TGW8xaXRMSCqtaX/YCWIyZqYvpvSG6jUBj9kwuZPKnH/i
	 tR14u2DAzwWCA==
Date: Mon, 1 Jun 2026 17:58:05 -0500
From: Rob Herring <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: econet: Document EN751221 USB PHY
Message-ID: <20260601225805.GA129257-robh@kernel.org>
References: <20260518141343.401555-1-cjd@cjdns.fr>
 <20260518141343.401555-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518141343.401555-2-cjd@cjdns.fr>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14850-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cjdns.fr:email,devicetree.org:url]
X-Rspamd-Queue-Id: 95E24626261
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 02:13:42PM +0000, Caleb James DeLisle wrote:
> Document the USB PHY devices which appear in EcoNet EN751221, EN751627,
> and EN7528 based SoCs.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../bindings/phy/econet,en751221-usb-phy.yaml | 128 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml b/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
> new file mode 100644
> index 000000000000..a44f59601747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (C) 2024 EcoNet
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/econet,en751221-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet EN751221 USB PHY
> +
> +maintainers:
> +  - Caleb James DeLisle <cjd@cjdns.fr>
> +
> +description: |

Don't need '|' unless there is formatting to preserve.

> +  USB PHY controller found on EcoNet EN751221 SoCs as well as on EN751627 and
> +  EN7528. These devices generally have two ports, one of which is a USB 3.0,
> +  and the other is USB 2.0. The USB 3.0 port is driven by one of two PHY
> +  blocks, depending on whether the connected device has negotiated USB 3.0 or
> +  2.0. These PHYs are also used on other EcoNet silicon in varying
> +  configurations, such as only port 0 (the USB 3.0 port), or only port 1 (the
> +  USB 2.0 port).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - econet,en751221-usb-phy
> +      - econet,en751627-usb-phy
> +      - econet,en7528-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells": true
> +  "#size-cells": true
> +  ranges: true
> +
> +  clocks:
> +    maxItems: 1
> +    description: |
> +      Crystal oscillator clock source. EcoNet devices run at either 20Mhz or
> +      25Mhz. 25Mhz devices require additional tuning in the USB 3.0 PHY.
> +
> +  clock-names:
> +    items:
> +      - const: xtal
> +
> +patternProperties:
> +  "^usb-phy@[0-9a-f]+$":
> +    type: object
> +    description: USB 2.0 or 3.0 PHY sub-node.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - econet,usb2-phy
> +          - econet,usb3-phy
> +
> +      reg:
> +        maxItems: 1
> +
> +      resets:
> +        maxItems: 1
> +
> +      econet,usb-port-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        description: |
> +          Physical port number. Since USB 3.0 requires a second PHY for the 2.0
> +          fallback, multiple PHYs can map to the same physical port.

What is special about this platform needing this property. Lots of 
platforms have 2 phys for USB 2.0 and 3.0 yet don't need a property 
like this. Can't you figure out which phys are the same USB port by the 
USB controller 'phys' property which would define that?

Rob

