Return-Path: <linux-mips+bounces-14584-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLM/FKP4BGpyRAIAu9opvQ
	(envelope-from <linux-mips+bounces-14584-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 00:18:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C261E53B5C1
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 00:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEEF5304F41A
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 22:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14AC389469;
	Wed, 13 May 2026 22:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="fe/S48NX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA5E38A71F;
	Wed, 13 May 2026 22:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778710662; cv=none; b=sZ14spCnvjQrh0LUTHBB+os7PJeCGlfqgPMVz45heN+nFFyeFUELMM+jkXajatUVrKEqyMjcdKpJQ6i+a7PWdrKnQS0Mo00tzt600ocduyjEt+OfWeI+re5gMfXcGbsvYvA9Iyai3DCqKpQIASuB9VPU0bW/9tJjVjhS2PBaL0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778710662; c=relaxed/simple;
	bh=DM5wkCIvvuKASVggBvkbZnE+/JqP1QkZQRpsXhaqRqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAWuEIfsM2sz5kEBgJgeai1XhMy/y87KpBFJ7ZavxrOugXiqATsGE1oQDgleGQ7oknvB6y9iFTNHAdXNiDjvDh71n2L0vIOmh7NPO1bCHfraPi23/tRdhToiUoOjvyNyuG+jokeFY9snJkCERmI9LN71zUKSpiPPGfPwWnwSeoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=fe/S48NX; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 459783C8F22;
	Thu, 14 May 2026 00:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778710657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rDpeY0azgQhPIjMW6FFMgw4pOGnlBJkPZ7F8T8UR+wU=;
	b=fe/S48NXC9NYKwChLEwX2ExRJRHkb/3N6Q7wdjxH/mS4vhdNVQUVRVTFFFR12Ii0UZSmQI
	6zUZPj6aY4WwNVZczx0x0UvRJtvShWe5U6Gj3JVBKlVNdDsO1bkuf+uUAKNVGZkzr7NSSC
	YOG+tGwsWAl0WRqx/idbRUUuWaAB9PZHLG0ItZJmfBM/He6KAQQySJ0NqAEc2g2JnAp8a1
	jPeDtXchccYB1U5nSQPmmST0MvNy91a0iXH1IRr2mgvxJOgCi/xY7fdlTe8lHaOgutq7r9
	W4tq0E9umhZmxyB5WTjiDe48fO14sRdHwWpHUzzsH23GkZTOkTiJ6y2i+SDqog==
Message-ID: <64d29cc5-8021-402c-b6c4-47bcf4c4f814@cjdns.fr>
Date: Thu, 14 May 2026 00:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513220610.GA341225@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260513220610.GA341225@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: C261E53B5C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14584-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On 14/05/2026 00:06, Bjorn Helgaas wrote:
> On Wed, May 13, 2026 at 11:39:25PM +0200, Caleb James DeLisle wrote:
>> On 13/05/2026 23:07, Bjorn Helgaas wrote:
>>> On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
>>>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>>>
>>>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>>>> require re-training after startup.
>>>> +found_port:
>>>> +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
>>>> +		/* Let it go because the device will work as Gen1 */
>>>> +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");
>>> I suppose this will cause a warning even in cases where Gen2 is
>>> impossible, e.g., the endpoint only supports Gen1?
>> Correct indeed.
>>
>> I imagine in most cases, if the port is Gen1 only then board integrator uses
>> a Gen1 card as well, so I could try being fancy and probe the card to see if
>> it supports Gen2. In OpenWrt the PCI driver is always built-in so I didn't
>> really consider this something to worry about.
> Probing the downstream device sounds like overkill because it hasn't
> been enumerated yet and there's no good place to check after it is
> enumerated.  I would consider just logging one message as "info"
> instead of "warn", maybe in mtk_pcie_startup_port_en7528()?


Works for me, worth noting if anybody adds a startup for another device 
which has this quirk, they'll also need to copy the log line - but it's 
highly likely that no other such device exists, and duplicating 3 lines 
of code is not the end of the world.


Thanks,

Caleb


