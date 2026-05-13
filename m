Return-Path: <linux-mips+bounces-14575-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF0jFMamBGogMQIAu9opvQ
	(envelope-from <linux-mips+bounces-14575-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 18:28:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C15370C0
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 18:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 818EA330A374
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 15:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7CE494A19;
	Wed, 13 May 2026 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="L012HT/t"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3D5481FCE;
	Wed, 13 May 2026 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687004; cv=none; b=Vfxe+/NHVWdRgJEjWVgnfkAAnBsy5+vXm1wtI3YHy109aHGSbJM2yu+baZ8mwZkPvXN5MgZN1ytSKYUDGmz7zw9lsU11qKYXDjY8FmbXEerQg7Wyw8A4HuKQIXaw84tT4gp5733rWJuAjcH7kooRNMDvmw8tQQy5tQR0A54x5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687004; c=relaxed/simple;
	bh=4348Bg4OX8AmIIgZS2UacQbwCc9cgmpFgCKy3RODCc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5u7UIZgX7+H1+/Zjgsr8pY9Q8vFVkppIAeYKPHHJ/2l+vc4pC/GIiNp7gbXYHniqtZM3wlRbaoPXXAVlVjMLJ0e/6/pqXWButYo+1vkq0/Yl8Q0/49AxSm/f+gL58wJilTs7feFf1iiqVR6oTT4Thy5QbQ/Emd1/J+GmXZmllA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=L012HT/t; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC2FF3BDE5B;
	Wed, 13 May 2026 17:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778687000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Nfdnbqd2LxVZhZX0Pup+3P9y4kLutFweTWOYtAxVc84=;
	b=L012HT/t1T1chI7dzvaKSbn2KnTDs4x3NUTNN49HvRDNpQh6uj72wLpX1s73kgfcsd/QVL
	JVY8h3M4oq/y30hakAa9HFd5nDwrgpWb3yYJXsgquv0Ra+yLE8dw4sZPs0wnslKKKN2R8n
	FQx+Jo7DhdUPxSRRQpoJMHCuSbjUaCV0M8uDKANY4gcUmYVdmAAxLn3zaPEtMtrRll1PYw
	E0A3WIzC9oUmiT4aPNMmg2pvzD2eOpihbtq9GQQMIi0b8IYx0BgscJE3V6zGP7mzsuGyH8
	2mrwP/KUnNAWU0sl6zgpaIHqfAZZ6Ln6g9tcIGjMsPKIdY6gyowicWjGAGNuaQ==
Message-ID: <b0756d38-cf8d-47fa-8c9c-4840af9736f5@cjdns.fr>
Date: Wed, 13 May 2026 17:43:14 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512165530.GA228087@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260512165530.GA228087@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9C1C15370C0
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
	TAGGED_FROM(0.00)[bounces-14575-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cjdns.fr:mid,cjdns.fr:dkim]
X-Rspamd-Action: no action


On 12/05/2026 18:55, Bjorn Helgaas wrote:
> On Mon, Apr 13, 2026 at 02:03:39PM +0000, Caleb James DeLisle wrote:
>> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
>>
>> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
>> require re-training after startup.
>> +#include <asm-generic/errno-base.h>
> Looks odd; why is this here?  There are basically no other drivers
> that do this.


Whoops :facepalm:, must have been coding in my sleep and I wanted ENOENT.


>
>> @@ -1149,6 +1234,46 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>>   	if (err)
>>   		goto put_resources;
>>   
>> +	/* EN7528 PCIe initially comes up as Gen1 even if Gen2 is supported.
>> +	 * The cannonical way to achieve Gen2 is to re-train the link
>> +	 * immediately after setup. However, to save a lot of duplicated code
>> +	 * we use pcie_retrain_link() which is usable once we have the pci_dev
>> +	 * struct for the bridge, i.e. after pci_host_probe(). */
> s/cannonical/canonical/
OK
>
>> +	if (pcie->soc->quirks & MTK_PCIE_RETRAIN) {
>> +		int slot = of_get_pci_domain_nr(dev->of_node);
> I suppose of_get_pci_domain_nr() is sort of an implicit way to
> identify the Gen2 ports?  Worth at least a comment about this DT
> connection.  Maybe it could be replaced by using
> pcie_get_supported_speeds() or similar?


The explanation for this is here: 
https://lore.kernel.org/linux-mips/20260413140339.16238-1-cjd@cjdns.fr/T/#m6d893b861425378c0d094a142e6191d59dcc5192 
- and please do weigh in if you think I ought to change the logic there.


However you raise a good point about re-training Gen1 links, currently 
we're attempting to re-train everything. All of these hubs self-identify 
as Gen2 so we can't short-circuit with pcie_get_supported_speeds(). 
Re-training will remain at Gen1 if either the PHY is a Gen1-only PHY, or 
if the actual card (e.g. wifi chip) only supports Gen1. My feeling is 
that matching on the PHY DT node and short-circuiting is not a good 
idea, but I can improve the comment a bit.


>
>> +		struct pci_dev *rc = NULL;
> s/rc/rp/ to avoid confusing "root port" for "return code" or "root
> complex".
OK
>
>> +		int ret = -ENOENT;
>> +
>> +		if (slot >= 0)
>> +			rc = pci_get_slot(host->bus, PCI_DEVFN(slot, 0));
> Instead of fiddling with pci_get_slot(), which adds refcount issues
> and artificial device/function number dependencies, I think it would
> be better to iterate over the devices on host->bus, e.g., with
> "for_each_pci_bridge(dev, host->bus)" as in iproc_pcie_setup().
Oh great, thank you !
>
>> +		if (rc) {
>> +			ret = -EOPNOTSUPP;
>> +
>> +			/* pcie_retrain_link() is not an exported symbol but
>> +			 * this driver supports being built as a loadable
>> +			 * module. Someone using this on an EN7528 should make
>> +			 * it builtin, or accept Gen1 PCI. */
>> +#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
>> +			ret = pcie_retrain_link(rc, true);
>> +#endif
> This looks like a confusing user experience if built as a module, with
> no hint to the user about why the link is slower than it should be.
> I guess "failed to retrain" is a bit of a hint, but it's not really a
> clue about how to fix it.
My logic was that the person whose going to configure a kernel for one 
of these things is pretty advanced - probably an OpenWRT developer - so 
they don't need that much hand-holding. But I guess it doesn't cost that 
much to add an `if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK))` with a warning log.
>
>> +		}
>> +
>> +		if (ret) {
>> +			dev_info(dev, "port%d failed to retrain %pe\n", slot,
>> +				 ERR_PTR(ret));
> This is basically an error path and there's nothing else to do, so if
> you return directly here (especially if you factor this to a separate
> function), the "normal" path below can be unindented.
Indeed, and if "not a builtin" is handled separately then this is truly 
an unexpected error so it's quite reasonable to goto put_resources.
>
>> +		} else {
>> +			u16 lnksta;
>> +			u32 speed;
>> +
>> +			pcie_capability_read_word(rc, PCI_EXP_LNKSTA, &lnksta);
>> +			speed = lnksta & PCI_EXP_LNKSTA_CLS;
>> +
>> +			dev_info(dev, "port%d link retrained, speed %s\n", slot,
>> +				 pci_speed_string(pcie_link_speed[speed]));
>> +		}
>> +	}
> Maybe factor the retrain block into a helper function.
Makes sense.
> I'm sort of squinting at this whole link retrain thing to begin with.
> After the controller is configured correctly, the hardware is supposed
> to train the link automatically by itself.
>
> Did something change between mtk_pcie_startup_port_en7528() and now
> that means the link will train at Gen2?  Whatever that change is,
> could it be done in mtk_pcie_startup_port_en7528()?
Per the comment with the misspelled "canonical", the reference code 
finds and pokes the re-training registers immediately during setup, but 
doing that manually is a fair bit of code and it's nicer to wait until 
the registers are mapped and use pcie_retrain_link().
> What happens when the downstream device is put in D3cold and the link
> retrains after power is restored?  Does it train at Gen2 then, without
> assistance like this?

I just tried pulling the driver from the wifi and then unbinding the 
bridge, then re-scanning. All throughout the process current_link_speed 
remains at 5.0. You're much more knowledgeable in this than me, but if I 
had a guess, I'd say this was a hardware bug that was fixed in 
subsequent versions (MT7621) and the workaround was to do a retrain once 
immediately after setup. But I don't want to warrant that as true 
because it's just me guessing...


Thanks,

Caleb



