Return-Path: <linux-mips+bounces-13336-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNIkGzNSp2lsgwAAu9opvQ
	(envelope-from <linux-mips+bounces-13336-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:27:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B51F77D8
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 382493019CAA
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 21:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718B13E51E6;
	Tue,  3 Mar 2026 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="HrJmbjez"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AE235BDC7;
	Tue,  3 Mar 2026 21:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573229; cv=none; b=l26u3L0E0dU8/X0Ln/xR3qElYWCd7DIhM6fF4WH77j37TmzafRC5K8wby+z15vT6eVDPqHFVf0GxF0EkhYtexr00Zi5oVdit1nmJfrkENem7RHsCe2ROavDzI8cah1yNYUi83nX9TIz4neNC+/8utnP6QFZyoEjFv/JzlMU+3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573229; c=relaxed/simple;
	bh=DfxRairEiAeEDlegfHNpYVrpkLIN16gWG1jFmoGD6/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxYBVwxMfXeb7xK1dSbQLR/kpc6yOMzEzdMIHY00yNzvqVLKoKpLV8ol+22nSC/B2DmG/w48zC3zbkKaZQyJ+6C7JkpyDIbwrV8GhduHDivlqbCpS+r3XSRJvWlTO1M9mnbYSHpaHJzKrYxzQi2bCyKjBt110LlR4jZtV4619DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=HrJmbjez; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFAB3210772;
	Tue,  3 Mar 2026 22:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772573224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2/q+M61ThWrUL9W5bwo/JApl1XxHEem/u8YUfZWLSNw=;
	b=HrJmbjezSP6ngMfLTAW0SZoHsU1ydwVeUVW9DpzOxL2USyUX9peUd9ro1Q0whJ7ehiehTE
	KJPS7hvnUUarvoDQT7wiyKPJcKYcGPohyqBkKf57c6M9yNaSP+DVzMVVizVCk+GFVLm9W5
	BrM33FTnTx8ggqS241jZKafXutuS51bwgO8YV0ReVZAqzQf0gC8+I+kmZGbhIjVDpTMTzZ
	pyk5rtJhvIFiUZiua/qZ+NjfpoylEWzjdb+aN5WD6zJbc3p42S6iBP1yvDAubOeI1NvELN
	4CK03mzH7WLTgPU4fEyG4gQsuJ01aCzl022oLqo3qgNYIO8Tcz9FaG9QyLYHxQ==
Message-ID: <cf24fd8a-bc73-4d30-80b1-460bbb860bfd@cjdns.fr>
Date: Tue, 3 Mar 2026 22:26:56 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 7/8] PCI: Skip bridge window reads when window is not
 supported
To: Bjorn Helgaas <helgaas@kernel.org>
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
References: <20260303212345.GA4074959@bhelgaas>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260303212345.GA4074959@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 2A6B51F77D8
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
	TAGGED_FROM(0.00)[bounces-13336-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action


On 03/03/2026 22:23, Bjorn Helgaas wrote:
> On Tue, Mar 03, 2026 at 07:09:47PM +0000, Caleb James DeLisle wrote:
>> pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
>> registers unconditionally. If the registers are hardwired to zero
>> (not implemented), both base and limit will be 0. Since (0 <= 0) is
>> true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
>> gets created.
>>
>> pci_read_bridge_windows() already detects unsupported windows by
>> testing register writability and sets io_window/pref_window flags
>> accordingly. Check these flags at the start of pci_read_bridge_io()
>> and pci_read_bridge_mmio_pref() to skip reading registers when the
>> window is not supported.
>>
>> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> I think this refers to the conversation at:
>
>    https://lore.kernel.org/r/20260113210259.GA715789@bhelgaas/
>
> Can you include that URL for reference?


Sure thing, I'll resend with a Link: (I guess that's the appropriate 
method) after a few days.

Thanks,

Caleb


>
>> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
>> ---
>>   drivers/pci/probe.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index bccc7a4bdd79..4eacb741b4ec 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
>>   	unsigned long io_mask, io_granularity, base, limit;
>>   	struct pci_bus_region region;
>>   
>> +	if (!dev->io_window)
>> +		return;
>> +
>>   	io_mask = PCI_IO_RANGE_MASK;
>>   	io_granularity = 0x1000;
>>   	if (dev->io_window_1k) {
>> @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
>>   	pci_bus_addr_t base, limit;
>>   	struct pci_bus_region region;
>>   
>> +	if (!dev->pref_window)
>> +		return;
>> +
>>   	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
>>   	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
>>   	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
>> -- 
>> 2.39.5
>>

