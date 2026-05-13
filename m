Return-Path: <linux-mips+bounces-14582-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBQ0BJzvBGr7QQIAu9opvQ
	(envelope-from <linux-mips+bounces-14582-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 23:39:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 651AA53B1E5
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 23:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FA9B3024A62
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 21:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703FD3BC68D;
	Wed, 13 May 2026 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Lc/WHbHo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9023BE623;
	Wed, 13 May 2026 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708376; cv=none; b=LCIXCUdDUCfflZUcEL6RtSD71xe3x3oRZBdXa+OebhOwGTHK+lgP8Bl1B3saH3FpmS2yUqpQI2eGlN91pXLvzujC1rtkoxDAWsDGaQDxRW22vl0o2vX+dKFflizC6aZta6XlUQ90/6JHFDDiYLXchOBcqYDHuuQUSB6BY4EsVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708376; c=relaxed/simple;
	bh=6RVOmCpQqd6bhxaLMGhb4U6J1qkZVEls47foBVVVlWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aemCg32OMzEeATg6CvXX+SD3e/WK6ibgYFFVGahtUII9kNX6hO48HS4QyjQy5xWx4XXjk41pZs5bnexbWCFQ1RsBzTzY6JInJkyFVJg6ixTja/MdUYI7i0SgxotPBx+HMj0AixAQSYvfDl+FPmoJz9nAErFfBqpVB6cuef+E7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Lc/WHbHo; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F6DB3C8C8F;
	Wed, 13 May 2026 23:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778708371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1AX2j8H+A9JJ6yxGxOWqpensFj//EnHL/7eUxAjSl/I=;
	b=Lc/WHbHo6a9u6xmgYh9JFLTTLxmnZik9YBZLUFRc57EWchl2Eg4uXIQCWY7k+OnBLTjdwu
	qxjHsclPdRzQqAuCjpi7pk8KISVj2Zc5/siysgyuBSm6/urCAWjQQcQq+5l8bUAQrH+pgZ
	C4irwC4MDy2qO2WlIHaMj7AcMOOO/EAty83qcFnMBSV1Mt0hBvRCM7rmgSoOhUkdBKzpvQ
	1YRyUymTm5n2s38oZw/GL3J8YadgMbiIxQXB6OQfu2lQTRYMkfbRmCkyghGAbVP0FH10hd
	JxruONLBXC9OKB+N2laE7YjZv4OuT5NsszQj3P2HBw8t5PUc/NoKNEVDFUfj1g==
Message-ID: <65792ada-5e9d-4e3f-aa79-bb4a8ffd9161@cjdns.fr>
Date: Wed, 13 May 2026 23:39:25 +0200
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
References: <20260513210759.GA331283@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260513210759.GA331283@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 651AA53B1E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14582-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On 13/05/2026 23:07, Bjorn Helgaas wrote:
> On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>
>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>> require re-training after startup.
> s/re-training/retraining/
OK
>
>> + * @MTK_PCIE_RETRAIN: Re-train link to bridge after startup because some
>> + *                    Gen2-capable devices start as Gen1.
> s/Re-train/Retrain/ to make this consistent and more greppable.
> Also more instances below.
OK
>
>> + * as Gen1, and must be re-trained once after initial configuration in order to
>> + * only Gen1 capable. Therefore it is most convenient to re-train every port
>> +	return dev_err_probe(dev, ret, "root bridge not found\n");
> "Root bridge" is not a term used by the specs, but in common usage it
> refers to the host bridge, i.e., the RC.  In this case, you didn't
> find a "Root Port".
OK Thanks
>
>> +found_port:
>> +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
>> +		/* Let it go because the device will work as Gen1 */
>> +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");
> I suppose this will cause a warning even in cases where Gen2 is
> impossible, e.g., the endpoint only supports Gen1?

Correct indeed.

I imagine in most cases, if the port is Gen1 only then board integrator 
uses a Gen1 card as well, so I could try being fancy and probe the card 
to see if it supports Gen2. In OpenWrt the PCI driver is always built-in 
so I didn't really consider this something to worry about.

What's your preference?

Thanks,

Caleb


